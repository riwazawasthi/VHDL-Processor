-------------------------------------------------------------------------------
--
-- Title       : Signed_multiplier_16bit
-- Design      : Pipelined_Processor
-- Author      : Riwaz Awasthi
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : d:\AldecDesigns\ESE345_Final_Project\Pipelined_Processor\src\Signed_multiplier_16bit.vhd
-- Generated   : Mon Dec  3 18:10:34 2018
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {Signed_multiplier_16bit} architecture {Signed_multiplier_16bit}}
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Signed_multiplier_16bit is 
	port 
	(
		a		: in signed (15 downto 0);
		b		: in signed (15 downto 0);
		result	: out signed (31 downto 0)
	);
end Signed_multiplier_16bit;



architecture Signed_multiplier_16bit of Signed_multiplier_16bit is
begin
	 result <= a * b;
	 

end Signed_multiplier_16bit;
