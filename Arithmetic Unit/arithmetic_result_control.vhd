-------------------------------------------------------------------------------
--
-- Title       : arithmetic_result_control
-- Design      : Pipelined_Processor
-- Author      : Riwaz Awasthi
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : d:\AldecDesigns\ESE345_Final_Project\Pipelined_Processor\src\arithmetic_result_control.vhd
-- Generated   : Tue Dec  4 01:02:46 2018
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
--{entity {arithmetic_result_control} architecture {arithmetic_result_control}}

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity arithmetic_result_control is
	port(
	    first_bit: in std_logic;
		second_bit: in std_logic;
		opcode : in std_logic_vector(7 downto 0);  	-- Operation Code 
		a1,b1,a2,b2,a3,b3,a4,b4: in std_logic_vector(31 downto 0);
		cout1a, cout0a, cout1b, cout0b, cout1c, cout0c, cout1d, cout0d : in std_logic; 
		suma, sumb, sumc, sumd: in std_logic_vector(31 downto 0);
		result : out std_logic_vector(127 downto 0));
end arithmetic_result_control;

--}} End of automatically maintained section

architecture arithmetic_result_control of arithmetic_result_control is
begin
	process(first_bit, second_bit, opcode, a1,b1,a2,b2,a3,b3,a4,b4,
	cout1a, cout0a, cout1b, cout0b, cout1c, cout0c, cout1d, cout0d,
	suma, sumb, sumc, sumd)
	begin
		if(first_bit='1' and second_bit='1') then 
			if(std_match(opcode,"----1000")) then   --a
				result<= suma & sumb & sumc & sumd;
			elsif(std_match(opcode,"----1001")) then   --sfw
				result <=suma & sumb & sumc & sumd;
			elsif(std_match(opcode,"----1010")) then  --ah
				result<= suma & sumb & sumc & sumc;
			elsif(std_match(opcode,"----1011")) then  --sfh
				result<=suma & sumb & sumc & sumd;
			elsif(std_match(opcode,"----1100") or std_match(opcode,"----1101")) then  --ahs or sfhs
				if(cout1a='1') then
				if ((a1(31)xor b1(31))='0') then --overflow/underflow
					if(a1(31)='1') then
						result(127 downto 112) <= (others=>'0');
						result(127)<='1';
					else
						result(127 downto 112) <= (others=>'1');
						result(127)<='0';
					end if;
				else
					result(127 downto 112) <= suma(31 downto 16);
				end if;
				end if;
				if(cout0a='1') then
				if ((a1(15)xor b1(15))='0') then --overflow/underflow
					if(a1(15)='1') then
						result(111 downto 96) <= (others=>'0');
						result(111)<='1';
					else
						result(111 downto 96) <= (others=>'1');
						result(111)<='0';
					end if;
				else
					result(111 downto 96) <= suma(15 downto 0);
				end if;
				end if;
	 			if(cout1b='1') then
				if ((a2(31)xor b2(31))='0') then --overflow/underflow
					if(a2(31)='1') then
						result(95 downto 80) <= (others=>'0');
						result(95)<='1';
					else
						result(95 downto 80) <= (others=>'1');
						result(95)<='0';
					end if;
				else
					result(95 downto 80) <= sumb(31 downto 16);
				end if;
				end if;
				if (cout0b='1') then 
				if ((a2(15)xor b2(15))='0') then --overflow/underflow
					if(a2(15)='1') then
						result(79 downto 64) <= (others=>'0');
						result(79)<='1';
					else
						result(79 downto 64) <= (others=>'1');
						result(79)<='0';
					end if;
				else
					result(79 downto 64) <= sumb(15 downto 0);
				end if;
				end if;
				if (cout1c='1') then
				if ((a3(31)xor b3(31))='0') then --overflow/underflow
					if(a3(31)='1') then
						result(63 downto 48) <= (others=>'0');
						result(63)<='1';
					else
						result(63 downto 48) <= (others=>'1');
						result(63)<='0';
					end if;
				else
					result(63 downto 48) <= sumc(31 downto 16);
				end if;
				end if;
				if(cout0c='1') then
				if ((a3(15)xor b3(15))='0') then --overflow/underflow
					if(a3(15)='1') then
						result(47 downto 32) <= (others=>'0');
						result(47)<='1';
					else
						result(47 downto 32) <= (others=>'1');
						result(47)<='0';
					end if;
				else
					result(47 downto 32) <= sumc(15 downto 0);
				end if;
				end if;
				if (cout1d='1') then
				if ((a4(31)xor b4(31))='0') then --overflow/underflow
					if(a4(31)='1') then
						result(31 downto 16) <= (others=>'0');
						result(31)<='1';
					else
						result(31 downto 16) <= (others=>'1');
						result(31)<='0';
					end if;
				else
					result(31 downto 16) <= sumd(31 downto 16);
				end if;
				end if;
				if (cout0d='1') then 
				if ((a4(15)xor b4(15))='0') then --overflow/underflow
					if(a4(15)='1') then
						result(15 downto 0) <= (others=>'0');
						result(15)<='1';
					else
						result(15 downto 0) <= (others=>'1');
						result(15)<='0';
					end if;
				else
					result(15 downto 0) <= sumd(15 downto 0);
				end if;
				end if;
			else
				result<=(others=>'0');
			end if;
		else
			result<=(others=>'0');
		end if;
	end process;
				
end arithmetic_result_control;
