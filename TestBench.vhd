-------------------------------------------------------------------------------
--
-- Title       : TestBench
-- Design      : Pipelined_Processor
-- Author      : Riwaz Awasthi
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : d:\AldecDesigns\ESE345_Final_Project\Pipelined_Processor\src\TestBench.vhd
-- Generated   : Tue Dec  4 05:42:42 2018
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
--{entity {TestBench} architecture {TestBench}}

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity TestBench is
end TestBench;

--}} End of automatically maintained section

architecture TestBench of TestBench is
signal clk: std_logic;
signal dataIntoInstructBuff: std_logic_vector(24 downto 0);
signal buff_write : std_logic;
signal result : std_logic_vector(127 downto 0);
constant period : time := 50 ns;
begin
	uut: entity processor port map(
		clk=> clk,
		dataIntoBuffer=>dataIntoInstructBuff,
		buff_write=>buff_write,
		result=>result);
	clk <= not clk after period/2;
	process
	variable cnt: integer:=0;
	begin 
		buff_write<='1';
		for I in 1 to 10 loop
			
			case cnt is
		        when 0 => dataIntoInstructBuff <=  "0010111111111111111100001";	
				when 1 => dataIntoInstructBuff <=  "1000000001000100001101010";
				when 2 => dataIntoInstructBuff <=  "1100000000000010001000011";
				when 3 => dataIntoInstructBuff <=  "1100000100000010001000011";
				when 4 => dataIntoInstructBuff <=  "1100000101000010001000011";
				when 5 => dataIntoInstructBuff <=  "1100000001000010001000011";
				when 6 => dataIntoInstructBuff <=  "1100100001000010001000011";
				when 7 => dataIntoInstructBuff <=  "1100000110000010001000011";
				when 8 => dataIntoInstructBuff <=  "1100000111000010001000011";
				when 9 => dataIntoInstructBuff <=  "1100001000000010001000011";
				when others => NULL;
			end case; 
			cnt := cnt + 1;
			wait for period;
		end loop;
		buff_write <= '0';
		dataIntoInstructBuff <=  (others=>'0');
		
		wait;
	end process;
	 -- enter your statements here --

end TestBench;
