-------------------------------------------------------------------------------
--
-- Title       : Instruction_Fetch_Decode
-- Design      : Pipelined_Processor
-- Author      : Riwaz Awasthi
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : d:\AldecDesigns\ESE345_Final_Project\Pipelined_Processor\src\Instruction_Fetch_Decode.vhd
-- Generated   : Sun Dec  2 18:40:58 2018
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
--{entity {Instruction_Fetch_Decode} architecture {Instruction_Fetch_Decode}}

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity Instruction_Fetch_Decode is	
	 port(clk : in std_logic;
	    din : in std_logic_vector(24 downto 0);	
	 	writein : in std_logic;
		rs1 : out std_logic_vector(4 downto 0);
		rs2 : out std_logic_vector(4 downto 0);
		rs3 : out std_logic_vector(4 downto 0);
		rd  : out std_logic_vector(4 downto 0);	
		first_bit : out std_logic;
		second_bit : out std_logic;
		li  : out std_logic_vector(2 downto 0);
		ma_ms : out std_logic_vector(2 downto 0);
		immediate : out std_logic_vector(15 downto 0);
		RegWrite : out std_logic;
		li_signal       : out std_logic;
		opcode : out std_logic_vector(7 downto 0));
end Instruction_Fetch_Decode;

--}} End of automatically maintained section

architecture Instruction_Fetch_Decode of Instruction_Fetch_Decode is 
--temporary signals declaration


     
begin
	process(clk, din, writein)
	
	file test_vector : text open write_mode is "output.txt";
	variable s : line;
	
	begin
		if (rising_edge(clk) and writein='0') then
			first_bit <= din(24);
			second_bit <= din(23);
			li <= din(23 downto 21);
			ma_ms <= din(22 downto 20);
			immediate <= din(20 downto 5);
			opcode <= din(22 downto 15);
			rs3 <= din(19 downto 15);
			rs2 <= din(14 downto 10);
			rs1 <= din(9 downto 5);
			rd <= din(4 downto 0);
			li_signal<='0';
			
			if (din(24) = '0') then
				li_signal<='1';
				write(s, string'("*****New cycle*****"));
				writeline(test_vector, s);
				write(s, string'("IF/ID    -li:"));
				hwrite(s, din(23 downto 21));
				write (s, string'("     immediate:"));
				hwrite(s,din(20 downto 5) );
				write (s, string'("                rd:"));
				hwrite(s,din(4 downto 0));
				writeline(test_vector,s);
			elsif (din(23) = '0') then
				write(s, string'("*****New cycle*****"));
				writeline(test_vector, s);
				write (s, string'("IF/ID    -MA/MS:"));
				hwrite(s, din(22 downto 20));
				write(s,string'("     rs3:"));
				hwrite(s,din(19 downto 15) );
				write(s, string'("      rs2:"));
				hwrite(s, din(14 downto 10) );
				write(s, string'("      rs1:"));
				hwrite(s, din(9 downto 5));
				write(s, string'("      rd:"));
				hwrite(s, din(4 downto 0));
				writeline(test_vector, s);
			else 
				write(s, string'("*****New cycle*****"));
				writeline(test_vector, s);
				write (s, string'("IF/ID    -opcode:"));
				hwrite (s, din(22 downto 15));
				write(s, string'("      rs2:"));
				hwrite(s, din(14 downto 10) );
				write(s, string'("      rs1:"));
				hwrite(s, din(9 downto 5));
				write(s, string'("      rd:"));
				hwrite(s, din(4 downto 0));
				writeline(test_vector, s);
			end if;
			RegWrite<='1';
		end if;	
	end process;				

end Instruction_Fetch_Decode;
