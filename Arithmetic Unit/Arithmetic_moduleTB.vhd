-------------------------------------------------------------------------------
--
-- Title       : Arithmetic_moduleTB
-- Design      : Pipelined_Processor
-- Author      : Riwaz Awasthi
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : d:\AldecDesigns\ESE345_Final_Project\Pipelined_Processor\src\Arithmetic_moduleTB.vhd
-- Generated   : Tue Dec  4 05:07:23 2018
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
--{entity {Arithmetic_moduleTB} architecture {Arithmetic_moduleTB}}
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 


entity Arithmetic_moduleTB is
end Arithmetic_moduleTB;

--}} End of automatically maintained section

architecture Arithmetic_moduleTB of Arithmetic_moduleTB is
	    signal second_bit,first_bit: std_logic;
		  
		signal ma_ms: std_logic_vector(2 downto 0);
		signal opcode :  std_logic_vector(7 downto 0);  	-- Operation Code
		signal a,b,c,r : std_logic_vector(127 downto 0);		-- Register Input One (RS1) Data
		constant clk_period:time:=50ns;
begin
	 uut:entity arithmetic_module port map(
			 first_bit=>first_bit,
		second_bit=>second_bit,
		ma_ms=>ma_ms,
		opcode=>opcode,
		a=>a,
		b=>b,
		c=>c,
		r=>r);
		process
		begin 
			first_bit<='1';
			second_bit<='1';
			opcode<=x"08";
			a<= x"00000000000000000000000000000002";
			b<= x"00000000000000000000000000000002";
			wait for clk_period;
			first_bit<='1';
			second_bit<='1';
			opcode<=x"09";
			a<= x"00000000000000000000000000000002";
			b<= x"00000000000000000000000000000002";
			wait for clk_period;
			first_bit<='1';
			second_bit<='1';
			opcode<=x"0A";
			a<= x"0000000000000000000000000000F002";
			b<= x"0000000000000000000000000000F002";
			wait for clk_period;
			first_bit<='1';
			second_bit<='1';
			opcode<=x"0B";
			a<= x"00000000000000000000000000010002";
			b<= x"0000000000000000000000000000F002";
			wait for clk_period;
			first_bit<='1';
			second_bit<='1';
			opcode<=x"0C";
			a<= x"00000000000000000000000000007FFF";
			b<= x"00000000000000000000000000000002";
			wait for clk_period;  
			first_bit<='1';
			second_bit<='1';
			opcode<=x"0D";
			a<= x"00000000000000000000000000008000";
			b<= x"00000000000000000000000000000002";
			wait for clk_period; 
			wait;
			end process;
	 -- enter your statements here --

end Arithmetic_moduleTB;
