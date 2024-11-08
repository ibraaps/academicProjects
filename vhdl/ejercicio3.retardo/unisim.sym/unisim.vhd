-- https://docs.xilinx.com/r/en-US/ug953-vivado-7series-libraries/IOBUF

-- https://www.hdlworks.com/hdl_corner/vhdl_ref/VHDLContents/PackageBody.htm
-- https://www.hdlworks.com/hdl_corner/vhdl_ref/VHDLContents/Package.htm

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package vcomponents is 
    component IOBUF is 
       PORT(
              IO     : inout STD_LOGIC;
              O      : out   STD_LOGIC;
              I      : in    STD_LOGIC;
              T      : in    STD_LOGIC
           );
    end component IOBUF;   
    
end package;


package body vcomponents is

--   procedure IOBUFx(
--          signal IO     : inout    STD_LOGIC;
--          signal O      : out    STD_LOGIC;
--          signal I      : in    STD_LOGIC;
--          signal T      : in    STD_LOGIC
--         ) is
--   begin
--	O  <= IO;
--   	IO <= '0' WHEN T='0' ELSE 'H';
--   end IOBUFx;

end ;

