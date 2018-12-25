-------------------------------------------------------------------------------
--
-- Title       : mult_module_tb
-- Design      : Pipelined_Processor
-- Author      : Riwaz Awasthi
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : d:\AldecDesigns\ESE345_Final_Project\Pipelined_Processor\src\mult_module_tb.vhd
-- Generated   : Tue Dec  4 04:42:12 2018
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
--{entity {mult_module_tb} architecture {mult_module_tb}}

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 

entity mult_module_tb is
end mult_module_tb;

--}} End of automatically maintained section

architecture mult_module_tb of mult_module_tb is
	    signal second_bit,first_bit: std_logic;
		  
		signal ma_ms: std_logic_vector(2 downto 0);
		signal opcode :  std_logic_vector(7 downto 0);  	-- Operation Code
		signal a,b,c,r : std_logic_vector(127 downto 0);		-- Register Input One (RS1) Data
		constant clk_period:time:=50ns;
		
	begin
		uut:entity mult_module_signed port map(
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
		second_bit<='0';
		ma_ms<="000";
		a<= x"0000000000000000000000007FFFFFFF";
		b<= x"00000000000000000000000000000001";
		c<= x"00000000000000000000000000000001";
		wait for clk_period;
		
		first_bit<='1';
		second_bit<='0';
		ma_ms<="000";
		a<= x"000000000000000000000000FFFFFFFF";
		b<= x"0000000000000000000000000000FFF0";
		c<= x"00000000000000000000000000000002";
		wait for clk_period;
		
		wait;
		end process;
		
	 -- enter your statements here --

end;
