-------------------------------------------------------------------------------
--
-- Title       : alu_result_combine
-- Design      : Pipelined_Processor
-- Author      : Riwaz Awasthi
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : d:\AldecDesigns\ESE345_Final_Project\Pipelined_Processor\src\alu_result_combine.vhd
-- Generated   : Tue Dec  4 02:08:31 2018
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
--{entity {alu_result_combine} architecture {alu_result_combine}}

library ieee;
use ieee.std_logic_1164.all;

entity alu_result_combine is
	port(
	logic: in std_logic_vector(127 downto 0);
	arith: in std_logic_vector(127 downto 0);
	mult: in std_logic_vector(127 downto 0);
	result: out std_logic_vector(127 downto 0)
	);
end alu_result_combine;

--}} End of automatically maintained section

architecture alu_result_combine of alu_result_combine is
begin
	process(logic, arith, mult)
	begin
		result<=  logic or arith or mult;
	end process;
end alu_result_combine;
