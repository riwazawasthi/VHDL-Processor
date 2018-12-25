-------------------------------------------------------------------------------
--
-- Title       : Instruction_Buffer
-- Design      : Pipelined_Processor
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : d:\AldecDesigns\ESE345_Final_Project\Pipelined_Processor\src\Instruction_Buffer.vhd
-- Generated   : Fri Nov 30 17:47:00 2018
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
--{entity {Instruction_Buffer} architecture {Instruction_Buffer}}

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Instruction_Buffer is  
	port(clk : in std_logic;
		din : in std_logic_vector(24 downto 0);
		dout : out std_logic_vector(24 downto 0);
		write : in std_logic);
end Instruction_Buffer;

--}} End of automatically maintained section

architecture Instruction_Buffer of Instruction_Buffer is
signal instruct0 : std_logic_vector(24 downto 0);
signal instruct1 : std_logic_vector(24 downto 0);
signal instruct2 : std_logic_vector(24 downto 0);
signal instruct3 : std_logic_vector(24 downto 0);
signal instruct4 : std_logic_vector(24 downto 0);
signal instruct5 : std_logic_vector(24 downto 0);
signal instruct6 : std_logic_vector(24 downto 0);
signal instruct7 : std_logic_vector(24 downto 0);
signal instruct8 : std_logic_vector(24 downto 0);
signal instruct9 : std_logic_vector(24 downto 0);
signal instruct10: std_logic_vector(24 downto 0);
signal instruct11: std_logic_vector(24 downto 0);
signal instruct12: std_logic_vector(24 downto 0);
signal instruct13:std_logic_vector(24 downto 0);
signal instruct14: std_logic_vector(24 downto 0);
signal instruct15: std_logic_vector(24 downto 0);
signal instruct16: std_logic_vector(24 downto 0);
signal instruct17: std_logic_vector(24 downto 0);
signal instruct18: std_logic_vector(24 downto 0);
signal instruct19: std_logic_vector(24 downto 0);
signal instruct20: std_logic_vector(24 downto 0);
signal instruct21: std_logic_vector(24 downto 0);
signal instruct22: std_logic_vector(24 downto 0);
signal instruct23: std_logic_vector(24 downto 0);
signal instruct24: std_logic_vector(24 downto 0);
signal instruct25: std_logic_vector(24 downto 0);
signal instruct26: std_logic_vector(24 downto 0);
signal instruct27: std_logic_vector(24 downto 0);
signal instruct28: std_logic_vector(24 downto 0);
signal instruct29: std_logic_vector(24 downto 0);
signal instruct30: std_logic_vector(24 downto 0);
signal instruct31: std_logic_vector(24 downto 0);
signal count : integer := 0;			
signal d : std_logic_vector(24 downto 0);
begin
	process(clk, write) 
	begin
		
		if(write = '1' and rising_edge(clk)) then
			case count is
				when 0 => instruct0 <= din;	
				when 1 => instruct1 <= din;
				when 2 => instruct2 <= din;
				when 3 => instruct3 <= din;
				when 4 => instruct4 <= din;
				when 5 => instruct5 <= din;
				when 6 => instruct6 <= din;
				when 7 => instruct7 <= din;
				when 8 => instruct8 <= din;
				when 9 => instruct9 <= din;
				when 10 => instruct10 <= din;
				when 11 => instruct11 <= din;
				when 12 => instruct12 <= din;
				when 13 => instruct13 <= din;
				when 14 => instruct14 <= din;
				when 15 => instruct15 <= din;
				when 16 => instruct16 <= din;
				when 17 => instruct17 <= din;
				when 18 => instruct18 <= din;
				when 19 => instruct19 <= din;
				when 20 => instruct20 <= din;
				when 21 => instruct21 <= din;
				when 22 => instruct22 <= din;
				when 23 => instruct23 <= din;
				when 24 => instruct24 <= din;
				when 25 => instruct25 <= din;
				when 26 => instruct26 <= din;
				when 27 => instruct27 <= din;
				when 28 => instruct28 <= din;
				when 29 => instruct29 <= din;
				when 30 => instruct30 <= din;
				when 31 => instruct31 <= din;
				
				when others => NULL;
			end case;	
			if(count = 31) then
				count <= 0;
			else
				count <= count + 1;
			end if;
		elsif(write = '0' and rising_edge(clk)) then
			case count is
				when 0 => dout <= instruct0;	
				when 1 => dout <= instruct1;
				when 2 => dout <= instruct2;
				when 3 => dout <= instruct3;
				when 4 => dout <= instruct4;
				when 5 => dout <= instruct5;
				when 6 => dout <= instruct6;
				when 7 => dout <= instruct7;
				when 8 => dout <= instruct8;
				when 9 => dout <= instruct9;
				when 10 => dout <= instruct10;
				when 11 => dout <= instruct11;
				when 12 => dout <= instruct12;
				when 13 => dout <= instruct13;
				when 14 => dout <= instruct14;
				when 15 => dout <= instruct15;
				when 16 => dout <= instruct16;
				when 17 => dout <= instruct17;
				when 18 => dout <= instruct18;
				when 19 => dout <= instruct19;
				when 20 => dout <= instruct20;
				when 21 => dout <= instruct21;
				when 22 => dout <= instruct22;
				when 23 => dout <= instruct23;
				when 24 => dout <= instruct24;
				when 25 => dout <= instruct25;
				when 26 => dout <= instruct26;
				when 27 => dout <= instruct27;
				when 28 => dout <= instruct28;
				when 29 => dout <= instruct29;
				when 30 => dout <= instruct30;
				when 31 => dout <= instruct31;
				when others => NULL;
			end case;
			if(count = 31) then
				count <= 0;
			else
				count <= count + 1;
			end if;
		end if;	
	end process;  
	 

end Instruction_Buffer;
