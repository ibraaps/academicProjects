library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library unisim;
use unisim.vcomponents.all;


entity controlador is
    Port (  clk100Mhz: in  STD_LOGIC;
            reset    : in  STD_LOGIC;
            i2c_sda  : INOUT STD_LOGIC;      
            i2c_scl  : INOUT STD_LOGIC;
            sw       : in std_logic_vector(15 downto 0);     -- pines de entrada (conectados a los interruptores)
            led      : out std_logic_vector(15 downto 0)     -- pines de salida  (conectados a los leds)
         );   
end controlador;

architecture controlador_arq of controlador is
    COMPONENT CPU
        Generic( clk_divide : STD_LOGIC_VECTOR (11 downto 0));
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
    END COMPONENT;

   COMPONENT ROM
    PORT(
          clk     : IN std_logic;
          address : IN std_logic_vector(9 downto 0);     -- bus de datos para las instrucciones: 9 bits     
          data    : OUT std_logic_vector(8 downto 0)     -- bus de direcciones: memoria de 1024 instrucc.
        );
   END COMPONENT;
   
   signal inst_address : std_logic_vector(9 downto 0);   -- bus de datos para las instrucciones: 9 bits           
   signal inst_data    : std_logic_vector(8 downto 0);   -- bus de direcciones: memoria de 1024 instrucc.
   
   -- I2C signals
   signal i2c_sda_i : std_logic;
   signal i2c_sda_o : std_logic;
   signal i2c_sda_t : std_logic;
   signal i2c_scl_i : std_logic;
   signal i2c_scl_o : std_logic;
   signal i2c_scl_t : std_logic;

begin

   Inst_ROM: ROM PORT MAP(
        clk     => clk100Mhz,
        address => inst_address,
        data    => inst_data
    );

    
-- Inst_CPU: CPU GENERIC MAP(clk_divide => "011111010000") PORT MAP( -- 2000 (100Mhz/2000 = 50Khz I2C clock. Vivadoo)
   Inst_CPU: CPU GENERIC MAP(clk_divide => "000000000100") PORT MAP( -- 4 (100Mhz/4 = 25MHz I2C clock, no es realista)
   
        clk          => clk100Mhz,
        reset        => reset,
        ROM_address  => inst_address,
        ROM_data     => inst_data,
        i2c_sda_i    => i2c_sda_i,
        i2c_sda_o    => i2c_sda_o,
        i2c_sda_t    => i2c_sda_t,
        i2c_scl_i    => i2c_scl_i,
        i2c_scl_o    => i2c_scl_o,
        i2c_scl_t    => i2c_scl_t,
        sw           => sw,
        led          => led
    );
    
    
    Inst_sda_obuf : IOBUF port map (
       IO => I2C_SDA,   -- Buffer inout port (connect directly to top-level port)
       O  => i2c_sda_i, -- Buffer output (to fabric)
       I  => i2c_sda_o, -- Buffer input  (from fabric)
       T  => i2c_sda_t  -- 3-state enable input, high=input, low=output 
    );
   
    Inst_scl_obuf : IOBUF port map (
       IO => I2C_SCL,   -- Buffer inout port (connect directly to top-level port)
       O  => i2c_scl_i, -- Buffer output (to fabric)
       I  => i2c_scl_o, -- Buffer input  (from fabric)
       T  => i2c_scl_t  -- 3-state enable input, high=input, low=output 
    );
    
end controlador_arq;





