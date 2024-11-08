-- This example will pause for 10 nanoseconds, or until signal1 changes and signal2 is equal to signal3:
--       wait on signal1 until signal2 = signal3 for 10 ns;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity i2c_test is
end    i2c_test;

architecture i2c_test_arq of i2c_test is
   COMPONENT controlador
    Port (  clk100Mhz: in    std_logic;
	        reset    : in    std_logic;
	        i2c_sda  : INOUT std_logic;      
            i2c_scl  : INOUT std_logic;
            sw       : in    std_logic_vector(15 downto 0);
            led      : out   std_logic_vector(15 downto 0)
         );
   END COMPONENT;



   signal clk100Mhz_test,reset,i2c_sda,i2c_scl  : std_logic;
   signal sw       :  std_logic_vector(15 downto 0);
   signal led      :  std_logic_vector(15 downto 0);

   constant ciclo: time := 10 ns;  -- hay que dejar un espacio entre 10 y ns  (Frecuenica de 100Mhz)
   
   
    -- Procedure: cuenta los 9 ciclos de reloj de una trama
    --   i2c_sda='0' si el parametro ack=true
    --   i2c_sda='1' si el parametro ack=false 
    procedure tramaACK(    signal   clk100Mhz : in std_logic;
                            signal   i2c_scl   : in std_logic;
                            signal   i2c_sda   : inout std_logic;
                            constant ack       : boolean) is
    begin
       i2c_sda <= 'Z';

       FOR i IN 0 TO 7 LOOP
           wait until rising_edge(i2c_scl);
       END LOOP;
       wait until falling_edge(i2c_scl);
       
       if ack = true then
          i2c_sda <= '0';
       end if;

       wait until rising_edge(clk100Mhz);
       wait until rising_edge(clk100Mhz);
       
       
       FOR i IN 0 TO 6 LOOP
           wait until rising_edge(clk100Mhz);
       END LOOP;
       
    end procedure;

   
begin

   U1: controlador PORT MAP (
      clk100Mhz  => clk100Mhz_test,
      reset      => reset,
      i2c_scl  => i2c_scl,
      i2c_sda  => i2c_sda,
      sw       => sw,
      led      => led
   );




    -- ======================================================================
    -- Proceso de la entrada de reloj. Se ejecuta indefinidamente ya que no tiene "WAIT;"
    -- ======================================================================
    PROCESS
    BEGIN
        clk100Mhz_test <='0';    wait for ciclo/2;
        clk100Mhz_test <='1';    wait for ciclo/2;
    END PROCESS;


    -- ======================================================================
    -- Proceso para la entrada 'reset'
    -- ======================================================================
    PROCESS
    BEGIN
        sw  <= (others => '0');
        reset<='1';    
        wait for 5*ciclo/4;    -- ENABLE=RESET='1' durante 1.25 ciclos
        
        reset<='0';
        
        wait for 200*ciclo;
        sw(0) <= '1';
        
        wait;                  -- Espera indefinida con RESET_test='1'
    END PROCESS;
   
    
    
    -- ======================================================================
    -- Proceso para el resto de entradas; ENABLE_test
    -- ======================================================================
    i2c_sda_ack: PROCESS
    BEGIN
        i2c_sda <= 'Z';
        
       tramaACK(clk100Mhz_test, i2c_scl, i2c_sda, true);
       tramaACK(clk100Mhz_test, i2c_scl, i2c_sda, false);
        
        wait;                  -- Espera indefinida 
    end process;

 
end i2c_test_arq;











