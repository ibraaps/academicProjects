library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU is
   Generic( clk_divide : STD_LOGIC_VECTOR(11 downto 0) );
   
    Port (  clk          : IN  std_logic;
            reset        : IN  STD_LOGIC;
            i2c_sda_i    : IN  std_logic;      
            i2c_sda_o    : OUT std_logic;      
            i2c_sda_t    : OUT std_logic;      
            i2c_scl_i    : IN  std_logic;      
            i2c_scl_o    : OUT std_logic;      
            i2c_scl_t    : OUT std_logic;      
            ROM_data     : IN  std_logic_vector(8 downto 0);    -- bus de datos para las instrucciones: 9 bits
            ROM_address  : OUT std_logic_vector(9 downto 0);    -- bus de direcciones: memoria de 1024 instrucc.
            sw           : in std_logic_vector(15 downto 0);    -- pines de entrada (conectados a los interruptores)
            led          : out std_logic_vector(15 downto 0)    -- pines de salida  (conectados a los leds)
         );
end CPU;
    
architecture CPU_arq of CPU is
   TYPE ESTADOS_CPU IS (STATE_BOOT, STATE_RUN, STATE_DELAY, STATE_I2C_START, STATE_I2C_BITS, STATE_I2C_STOP);
   signal   estado_s, estado_c : ESTADOS_CPU;

   constant OPCODE_SALTA          : std_logic_vector( 3 downto 0) := "0000";
   constant OPCODE_BRINCA_SI_0    : std_logic_vector( 3 downto 0) := "0001";
   constant OPCODE_BRINCA_SI_1    : std_logic_vector( 3 downto 0) := "0010";
   constant OPCODE_PIN_0          : std_logic_vector( 3 downto 0) := "0011";
   constant OPCODE_PIN_1          : std_logic_vector( 3 downto 0) := "0100";
   constant OPCODE_I2C_RECIBE     : std_logic_vector( 3 downto 0) := "0101";
   constant OPCODE_LEE            : std_logic_vector( 3 downto 0) := "0110";
   constant OPCODE_RETARDO        : std_logic_vector( 3 downto 0) := "0111";
   constant OPCODE_BRINCA_SI_NACK : std_logic_vector( 3 downto 0) := "1000";
   constant OPCODE_I2C_ENVIA_BAJO : std_logic_vector( 3 downto 0) := "1001";
   constant OPCODE_I2C_RECIBE_BAJO: std_logic_vector( 3 downto 0) := "1010";
   constant OPCODE_MASTER_ACK     : std_logic_vector( 3 downto 0) := "1011";
   constant OPCODE_NOP            : std_logic_vector( 3 downto 0) := "1100";
   constant OPCODE_I2C_STOP       : std_logic_vector( 3 downto 0) := "1101";
   constant OPCODE_I2C_ENVIA      : std_logic_vector( 3 downto 0) := "1110";
   constant OPCODE_UNKNOWN        : std_logic_vector( 3 downto 0) := "1111";
   
   signal opcode    : std_logic_vector( 3 downto 0);
      
   signal brinca    : std_logic ;    
   
   -- contadores       
   signal pcnext    : unsigned(ROM_address'high downto 0);  -- contador de programa. Direccion de la proxima instruccion a ejecutar
   signal divclk    : unsigned(clk_divide'high downto 0);     -- cuenta los ciclos del reloj de 100Mhz para obtener un ciclo de I2C_scl 
   signal retardo   : unsigned(15 downto 0);
    
   type RAM_array is array(0 to 15) of STD_LOGIC_VECTOR (7 downto 0);
   signal RAM : RAM_array;   -- Memoria RAM para almacenar datos/variables: 15 elementos de 8 bits

begin

   i2c_sda_o <= '0';
   i2c_scl_o <= '0';     -- si i2c_scl_t='0' (buffer de salida)  -> saldra un  '0'
                         -- si i2c_scl_t='1' (buffer de entrada) -> entrara un '1' por el pullup interno 

-- +---------+-------------+----------------------------------------
-- |codigo   | Instruccion | Accion
-- +---------+-------------+----------------------------------------
-- |00nnnnnnn| salta m     | PC=m  (contador de programa apunta a etiqueta m)
-- |01000nnnn| brincaSi0 n | Salta la siguiente instrucci n si Pin n vale '0' (no la ejecuta)
-- |01001nnnn| brincaSi1 n | Salta la siguiente instrucci n si Pin n vale '1' (no la ejecuta)
-- |01010nnnn| pin0 n      | Pin de salida n a '0'
-- |01011nnnn| pin1 n      | Pin de salida n a '1'
-- |01100nnnn| recibe n    | Recibe dato por I2C y lo pone en el registro n (0 <= n <= 15)
-- |01101nnnn| lee    n    | Lee el registro n y lo pone en el byte alto del puerto de salida (outputs)
-- |01110nnnn| retardo m   | Retardo de m ciclos de reloj I2C (n = log2(m))
-- |011110000| brincaSiNack| Salta la siguiente instrucci n si NACK est  activo
-- |011110001| recibeBajo  | Recibe dato por I2C y lo pone en el byte bajo del puerto de salida (outputs)
-- |011110010| enviaBajo   | Envia el byte bajo de las entradas ( 7 downto 0) al bus I2C
-- |011110100| USER0       | Definida por el usuario (no usada por ahora)
-- |.........|             |
-- |011111100| USER8       | Definida por el usuario (no usada por ahora)
-- |011111101| masterAck   | Master ACK
-- |011111110| nop         |  No operar (no hace nada)
-- |011111111| stop        | Env a Stop al bus I2C
-- |1nnnnnnnn| envia n     | Env a n on I2C bus (el operando est  en la propia instrucci n)
-- +---------+-------------+----------------------------------------

   -- Se asigna la salida "ROM_address" con la direccion de la pr xima instruccion 
   -- que la recibe la memoria de programa (ROM) como entrada "ROM.address". 
   ROM_address <= std_logic_vector(pcnext);   

   -- La memoria ROM_address pone en su salida "data" la instruccion actual que llega a este
   -- m dulo de la CPU como la entrada "ROM_address_data".
   -- La siguiente instrucci n decodifica (identifica) la instruccion -recibida por
   -- la entrada "ROM_address_data"- seg n sus bits m s significativos y la almacena en la se al "opcode".
           
   opcode <= OPCODE_SALTA           when ROM_data(8 downto 7) = "00"        else
             OPCODE_BRINCA_SI_1     when ROM_data(8 downto 4) = "01001"     else
             OPCODE_PIN_1           when ROM_data(8 downto 4) = "01011"     else
             OPCODE_UNKNOWN;
              
   
   -- ------------------------------------------------------
   -- Se asigna  estado_s . Proceso ssincrono. Solo depende del reloj. 
   -- ------------------------------------------------------
   PROCESS (clk,reset)
   BEGIN
    IF (reset='1') THEN                     -- Reset activo a nviel alto
       estado_s  <= STATE_BOOT;
    ELSIF (rising_edge(clk)) THEN  
       estado_s  <= estado_c;                -- Cambio de estado
    END IF;
   END PROCESS;



   -- ------------------------------------------------------
   -- En este proceso se asigna la se al para el cambio de estado:   
   --       > estado_c 
   PROCESS (estado_s, divclk, brinca, opcode, retardo)
   BEGIN
      -- ----------------------------------
      -- Valor por defecto
      -- ----------------------------------
      estado_c <= estado_s;   
     
      case estado_s is 
          when STATE_BOOT =>
              estado_c    <= STATE_RUN;
                
          when STATE_RUN =>
            if brinca = '0' then
                case opcode is
                    when OPCODE_I2C_ENVIA | OPCODE_I2C_RECIBE | OPCODE_I2C_ENVIA_BAJO | OPCODE_I2C_RECIBE_BAJO =>
   
                 
                    when OPCODE_RETARDO =>
                       -- Se asigna la entrada estado_c para el cambio de estado 
                        
                    when OPCODE_I2C_STOP =>
                         
                    when others =>
                end case;
             end if;
          when STATE_I2C_START =>
 
          when STATE_I2C_BITS => 
 
          when STATE_I2C_STOP =>
                
          when STATE_DELAY =>
             -- Se asignala señal estado_c para que cambie al estado STATE_RUN si se ha realizado
             -- la cuenta correspondiente al retardo, es decir, retardo y divclk han llegado a 0.
                 
          when others =>
             estado_c  <= STATE_BOOT;
 
       end case;
   end process;
    
       

    -- ------------------------------------------------------
    -- En este proceso se asignan las se ales:  
    --      > i2c_scl_t 
    --      > i2c_sda_t 
    --      > divclk 
    --      > i2c_conta_bits 
    --      > i2c_data 
    --      > retardo 
    --      > pc 
    --      > led  (pines de salida)
    --      > ram_data 
    --      > brinca 
    --      > i2c_leyendo 
    --      > i2c_iniciado 
    -- ------------------------------------------------------
    PROCESS (clk)
    BEGIN
    
       IF (rising_edge(clk)) THEN  
         case estado_s is 
         
            when STATE_BOOT =>
                led       <= (others => '0');
                i2c_scl_t <= '1';   -- pin I2C_scl de entrada (se ver  un '1' por el pull-up interno del pin)
                i2c_sda_t <= '1';   -- pin I2C_sda de entrada (se ver  un '1' por el pull-up interno del pin)
          
                brinca    <= '1';   -- La ROM es sincrona y tarde un ciclo en poner la instrucci n
                                    -- desde que se pone la direccion de la misma. La CPU no hace 
                                    -- nada en el primer ciclo de reloj despu s del reset hasta que
                                    -- disponible la primera instruccion
   
                -- contadores     
                pcnext          <= (others => '0');    -- El contador de programa apunta a la primera instruccion
          
            when STATE_RUN =>
              
               if brinca = '1'then
                  -- No hace nada durante un ciclo de 100Mhz. 
                  brinca <= '0';      
                  pcnext <= pcnext+1;
               else
                  case opcode is
                     when OPCODE_SALTA =>
                        -- Ignora la siguiente instruccion mientras recoge (fetch) el destino de "salta" 
                        brinca <= '1';
                        pcnext <= unsigned(ROM_data(6 downto 0)) & "000";

                     when OPCODE_BRINCA_SI_0 =>
                        -- Salta una instruccion si el pin de entrada n es '0' -> sw(n)= '0'

                        
                     when OPCODE_BRINCA_SI_1 =>
                        -- Salta una instruccion si el pin de entrada n es '1' -> sw(n)= '1'
                        brinca <='0';
                        if sw(to_integer(unsigned(ROM_data(3 downto 0))))='1' then
                           brinca <='1';
                        end if;
                        pcnext <= pcnext+1;
                  
                     when OPCODE_PIN_0 =>
                        -- La salida con la posici n de 0-15 [ROM_data(3 downto 0)] la pones a 0 (ROM_data(4)
                        -- Ej.: led(5) <= '0'
 
                        
                     when OPCODE_PIN_1 =>
                         -- La salida con la posici n de 0-15 [ROM_data(3 downto 0)] la pone a 1 (ROM_data(4)
                        -- Ej.: led(5) <= '1'
                        led(to_integer(unsigned(ROM_data(3 downto 0)))) <= '1';
                        pcnext <= pcnext+1;
 
                     when OPCODE_NOP =>
                        -- Esta instruccion no hace nada. Deja pasar un ciclo de reloj e incrementa el
                        -- contador de programa para que apunte a la siguiente instruccion
                        
                     when OPCODE_RETARDO =>
                        -- Valores iniciales de divlck y retardo para realizar la cuenta de retardo*clk_divide
                        divclk <= unsigned(clk_divide) - 1;
                        case ROM_data(3 downto 0) is
                           when "0000" => retardo <= x"0001";
                           when others => 
                        end case;
    
                     when others =>

                  end case;
               end if;
         
            when STATE_I2C_START =>


            when STATE_I2C_BITS => -- scl esta  a '0' cuando entra


            when STATE_I2C_STOP =>
               
            when STATE_DELAY =>
               -- divclk permite obtener un ciclo del reloj i2c_scl
               -- deja pasar retardo*clk_divide ciclos del reloj de 100Mhz
                  
            when others =>
               pcnext <= (others => '0');
               brinca   <= '1';

         end case;
      end if;
   end process;
   
end CPU_arq;












