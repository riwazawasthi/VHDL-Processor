-------------------------------------------------------------------------------
--
-- Title       : ALU
-- Design      : Pipelined_Processor
-- Author      : Riwaz Awasthi
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : d:\AldecDesigns\ESE345_Final_Project\Pipelined_Processor\src\ALU.vhd
-- Generated   : Tue Dec  4 02:13:33 2018
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
--{entity {ALU} architecture {ALU}}
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is 
	port(
	    first_bit: in std_logic;
		second_bit: in std_logic;
		ma_ms: in std_logic_vector(2 downto 0);
		opcode : in std_logic_vector(7 downto 0);  	-- Operation Code
		operand1 : in std_logic_vector(127 downto 0);		-- Register Input One (RS1) Data
		operand2 : in std_logic_vector(127 downto 0);	  	-- Register Input Two (RS2) Data
		operand3 : in std_logic_vector(127 downto 0);      --Register Input three (RS3) Data
		result : out std_logic_vector(127 downto 0);		-- Destination Register (RD) Data	  
		immediate: in std_logic_vector(15 downto 0);
		li_Data : in std_logic_vector(2 downto 0)); 
end ALU;

--}} End of automatically maintained section

architecture ALU of ALU is
signal logic, arith, mult: std_logic_vector(127 downto 0):=(others=>'0');
begin

	u1: entity Logical_Module port map(
		first_bit=>first_bit,
		second_bit=>second_bit,
		opcode=>opcode,
		a=>operand1,
		b=>operand2,
		c=>operand3,
		r=>logic,
		immediate=>immediate,
		li_Data=>li_Data);
	u2: entity mult_module_signed port map(
		first_bit=>first_bit,
		second_bit=>second_bit,
		ma_ms=>ma_ms,
		opcode=>opcode,
		a=>operand1,
		b=>operand2,
		c=>operand3,
		r=>mult);
	u3: entity arithmetic_module port map(
		first_bit=>first_bit,
		second_bit=>second_bit,
		ma_ms=>ma_ms,
		opcode=>opcode,
		a=>operand1,
		b=>operand2,
		c=>operand3,
		r=>arith);
	u4: entity alu_result_combine port map(
		logic => logic,
		arith=> arith,
		mult => mult);
		
		

end ALU;
