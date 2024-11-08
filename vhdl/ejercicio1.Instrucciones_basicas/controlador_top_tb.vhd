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

   constant ciclo: time := 10 ns;  -- Frecuenica de 100Mhz
   
   
   
begin

   U1: controlador 
        PORT MAP (
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
        reset<='1';    
        wait for 9*ciclo/4;    -- ENABLE=RESET='1' durante 1.25 ciclos
        
        reset<='0';
        wait;                  -- Espera indefinida con RESET_test='1'
    END PROCESS;


    -- ======================================================================
    -- Proceso para el resto de entradas o bidireccionales: sw, i2c_sda, i2c_scl
    -- ======================================================================
    PROCESS
    BEGIN
        sw  <= (others => '0');
        i2c_sda <= 'Z';
        i2c_scl <= 'Z';
        
        wait;                  -- Espera indefinida con RESET_test='1'
    END PROCESS;

end i2c_test_arq;



