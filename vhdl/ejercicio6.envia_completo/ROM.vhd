library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ROM is
   Port ( clk     : in    STD_LOGIC;
          data    : out std_logic_vector(8 downto 0);
          address : in std_logic_vector(9 downto 0)
         );
end ROM;
architecture Behavioral of ROM is
begin
   process(clk)
   begin
      if rising_edge(clk) then
         case address is
           when "0000000000" => data <= "101110000";
           when "0000000001" => data <= "100001111";
           when "0000000010" => data <= "011111111";
           when "0000000011" => data <= "011101111";
           when "0000000100" => data <= "101110000";
           when "0000000101" => data <= "011110010";
           when "0000000110" => data <= "011101111";
           when "0000000111" => data <= "000000000";
           when others => data <= (others =>'0');
        end case;
     end if;
   end process;
end Behavioral;
