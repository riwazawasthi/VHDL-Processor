-------------------------------------------------------------------------------
--
-- Title       : logical_test_bench
-- Design      : Pipelined_Processor
-- Author      : Riwaz Awasthi
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : d:\AldecDesigns\ESE345_Final_Project\Pipelined_Processor\src\logical_test_bench.vhd
-- Generated   : Tue Dec  4 03:50:07 2018
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
--{entity {logical_test_bench} architecture {logical_test_bench}}

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity logical_test_bench is
end logical_test_bench;

--}} End of automatically maintained section

architecture logical_test_bench of logical_test_bench is
    signal first_bit, second_bit : std_logic;
	signal opcode : std_logic_vector(7 downto 0);
	signal a, b, c,r:std_logic_vector(127 downto 0);
	signal immediate: std_logic_vector(15 downto 0);
	signal li_data : std_logic_vector(2 downto 0);
	constant clk_period:time:= 50 ns;
begin 
	uut:entity Logical_Module port map(
		first_bit=>first_bit,
		second_bit=>second_bit,
		opcode=>opcode,
		a=>a,
		b=>b,
		c=>c,
		r=>r,
		immediate=>immediate,
		li_Data=>li_data);
	process
	begin
		first_bit<='0';
		second_bit<='0';
		li_data <= "010";
		immediate<=x"FFFF";
		c<= x"00000000000000000000000000000000";
		wait for clk_period;
		first_bit<='1';
		second_bit<='1';
		opcode<=x"01";
		a<= x"000000000000000000000000FFFFFFFF";
		wait for clk_period;
		first_bit<='1';
		second_bit<='1';
		opcode<=x"04";
		a<= x"000000000000000000000000FFFFFFFF";
		wait for clk_period;  
		first_bit<='1';
		second_bit<='1';
		opcode<=x"05";
		a<= x"000000000000000000000000FFFFFFFF";
		wait for clk_period;
		first_bit<='1';
		second_bit<='1';
		opcode<=x"06";
		a<= x"000000000000000000000000FFFFFFFF";
		b<= x"00000000000000000000000000000001";
		wait for clk_period;
		first_bit<='1';
		second_bit<='1';
		opcode<=x"07";
		a<= x"000000000000000000000000FFFFFFFF";
		b<= x"00000000000000000000000000000001";
		wait for clk_period;
		first_bit<='1';
		second_bit<='1';
		opcode<=x"0E";
		a<= x"000000000000000000000000FFFF0001";
		b<= x"00000000000000000000000000000001";
		wait for clk_period;
		first_bit<='1';
		second_bit<='1';
		opcode<=x"0F";
		a<= x"000000000000000000000000FFFF0001";
		b<= x"00000000000000000000000000000001";
		wait for clk_period;
		
		wait;
	end process;
	
	 -- enter your statements here --

end;
