-------------------------------------------------------------------------------
--
-- Title       : InstructionEXE_WB
-- Design      : Pipelined_Processor
-- Author      : Riwaz Awasthi
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : d:\AldecDesigns\ESE345_Final_Project\Pipelined_Processor\src\InstructionEXE_WB.vhd
-- Generated   : Mon Dec  3 15:05:10 2018
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
--{entity {InstructionEXE_WB} architecture {InstructionEXE_WB}}
library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all; 
use IEEE.std_logic_textio.all;
use STD.textio.all;


entity InstructionEXE_WB is	
	port(clk : in std_logic; 
		writein : in std_logic;
		
		opcode : in std_logic_vector(7 downto 0);  
		opcode_out : out std_logic_vector(7 downto 0); 
		
		newrd : in std_logic_vector(4 downto 0); 
		oldrd: out std_logic_vector(4 downto 0); 
		
		rs1Data : in std_logic_vector(127 downto 0);
		rs2Data : in std_logic_vector(127 downto 0); 
		rs3Data : in std_logic_vector(127 downto 0);
		operand1 : out std_logic_vector(127 downto 0);
		operand2 : out std_logic_vector(127 downto 0);
		operand3 : out std_logic_vector(127 downto 0);
		
		first_bit : in std_logic;
		first_bit_out: out std_logic;
		
		second_bit : in std_logic;
		second_bit_out : out std_logic;
		
		li  : in std_logic_vector(2 downto 0); 
		li_out : out std_logic_vector(2 downto 0);
		
		ma_ms : in std_logic_vector(2 downto 0);
		ma_ms_out : out std_logic_vector(2 downto 0);
		
		immediate : in std_logic_vector(15 downto 0);
		immediate_out: in std_logic_vector(15 downto 0);
		RegWrite : out std_logic;
		rdData : in std_logic_vector(127 downto 0)); 
end InstructionEXE_WB;

--}} End of automatically maintained section

architecture InstructionEXE_WB of InstructionEXE_WB is
begin
	process(clk, writein, first_bit, second_bit, li, ma_ms, opcode)
	
	file test_vector : text open write_mode is "output.txt";
	variable s : line;
	begin
		if (rising_edge(clk) and writein='0') then
			operand1<=rs1Data;
			operand2<=rs2Data;
			operand3<=rs3Data;
			first_bit_out<=first_bit;
			second_bit_out<=second_bit;
			li_out<=li;
			ma_ms_out<=ma_ms;
			opcode_out<=opcode;
			oldrd<=newrd; 
			RegWrite<='1';
			if (first_bit= '0') then
				write(s, string'("ID/EX    -li:"));
				hwrite(s, li);
				write (s, string'("     immediate:"));
				hwrite(s,immediate);
				write (s, string'("                rd:"));
				hwrite(s,newrd);
				writeline(test_vector,s); 
				write(s, string'("-reading rd Data:"));
				hwrite(s, rs3Data);
				writeline(test_vector, s); 
				write(s, string'("WB to Rd from previous cycle")); 
				writeline(test_vector, s);
						
				write(s, string'("-Data to be written:"));
				hwrite(s, rdData);
				writeline(test_vector, s); 
			
			elsif (second_bit = '0') then
				write (s, string'("ID/EX    -MA/MS:"));
				hwrite(s, ma_ms);
				write (s, string'("   rd:"));
				hwrite(s,newrd);
				writeline(test_vector,s);
				
				write(s,string'("-reading rs3 data:"));
				hwrite(s,rs3Data );
				writeline(test_vector,s);
				
				write(s, string'("-reading rs2 data:"));
				hwrite(s, rs2Data );
				writeline(test_vector,s);
				
				write(s, string'("reading rs1 data:"));
				hwrite(s, rs1Data);	
				writeline(test_vector,s);
				
				write(s, string'("WB to Rd from previous cycle")); 
				writeline(test_vector, s);
						
				write(s, string'("-Data to be written:"));
				hwrite(s, rdData);
				writeline(test_vector, s); 
			
			else
				if(std_match(opcode,"----0000")) then
					oldrd<="ZZZZZ";
				end if;
				
				write (s, string'("ID/EX    -opcode:"));
				hwrite(s, opcode);
				write (s, string'("   rd:"));
				hwrite(s,newrd);
				writeline(test_vector,s);
				
				write(s, string'("-reading rs2 data:"));
				hwrite(s, rs2Data );
				writeline(test_vector,s);
				
				write(s, string'("reading rs1 data:"));
				hwrite(s, rs1Data);	
				writeline(test_vector,s);
				
				write(s, string'("WB to Rd from previous cycle")); 
				writeline(test_vector, s);
						
				write(s, string'("-Data to be written:"));
				hwrite(s, rdData);
				writeline(test_vector, s); 
			end if;
		end if;	
	end process;				
			
	 

end InstructionEXE_WB;
