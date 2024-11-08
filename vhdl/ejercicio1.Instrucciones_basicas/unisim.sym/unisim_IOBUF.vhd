-- https://docs.xilinx.com/r/en-US/ug953-vivado-7series-libraries/IOBUF

-- https://www.hdlworks.com/hdl_corner/vhdl_ref/VHDLContents/PackageBody.htm
-- https://www.hdlworks.com/hdl_corner/vhdl_ref/VHDLContents/Package.htm

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IOBUF is
   Port ( 
          IO     : inout STD_LOGIC;
          O      : out    STD_LOGIC;
          I      : in     STD_LOGIC;
          T      : in    STD_LOGIC
         );
end IOBUF;


architecture IOBUF_arq of IOBUF is
begin

	O  <= IO;
   	IO <= I WHEN T='0' ELSE 'H';
   
end IOBUF_arq;
