-------------------------------------------------------------------------------
--
-- Title       : mult_result_control
-- Design      : Pipelined_Processor
-- Author      : Riwaz Awasthi
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : d:\AldecDesigns\ESE345_Final_Project\Pipelined_Processor\src\mult_result_control.vhd
-- Generated   : Mon Dec  3 23:57:58 2018
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
--{entity {mult_result_control} architecture {mult_result_control}}
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  


entity mult_result_control is
	port(
	first_bit: in std_logic;
	second_bit:in std_logic;
	ma_ms:in std_logic_vector(2 downto 0);
	rs1Data: in std_logic_vector(127 downto 0);
	cout1_low_a, cout0_low_a, cout1_low_b, cout0_low_b, cout1_low_c, cout0_low_c, cout1_low_d, cout0_low_d: in std_logic;
	cout1_high_a, cout0_high_a, cout1_high_b, cout0_high_b, cout1_high_c, cout0_high_c, cout1_high_d, cout0_high_d: in std_logic;
	sl1, sl2, sl3, sl4, sh1, sh2, sh3, sh4 : in std_logic_vector(31 downto 0);
	result: out std_logic_vector(127 downto 0));
end mult_result_control;

--}} End of automatically maintained section

architecture mult_result_control of mult_result_control is
begin 
	process(first_bit, second_bit, ma_ms, rs1Data,
	cout1_low_a, cout0_low_a, cout1_low_b, cout0_low_b, cout1_low_c, cout0_low_c, cout1_low_d, cout0_low_d,
	cout1_high_a, cout0_high_a, cout1_high_b, cout0_high_b, cout1_high_c, cout0_high_c, cout1_high_d, cout0_high_d,
	sl1, sl2, sl3, sl4, sh1, sh2, sh3, sh4)
	begin
		if(first_bit='1' and second_bit='0') then 
			if(std_match(ma_ms,"--0")) then	    --MA/MS/l
				if ((cout1_low_a xor cout0_low_a)='1') then 
					if(rs1Data(31)='1') then
						result(31 downto 0) <= (others=>'0');
						result(31)<='1';
					else
						result(31 downto 0) <= (others=>'1');
						result(31)<='0';
					end if;
				else
					result(31 downto 0)<= sl1;
				end if;
				
				if ((cout1_low_b xor cout0_low_b)='1') then 
					if(rs1Data(63)='1') then
						result(63 downto 32) <= (others=>'0');
						result(63)<='1';
					else
						result(63 downto 32) <= (others=>'1');
						result(63)<='0';
					end if;
				else
					result(63 downto 32)<= sl2;
				end if;	
				
				if ((cout1_low_c xor cout0_low_c)='1') then 
					if(rs1Data(95)='1') then
						result(95 downto 64) <= (others=>'0');
						result(95)<='1';
					else
						result(95 downto 64) <= (others=>'1');
						result(95)<='0';
					end if;
				else
					result(95 downto 64)<= sl3;
				end if;	 
				
				if ((cout1_low_d xor cout0_low_d)='1') then 
					if(rs1Data(127)='1') then
						result(127 downto 96) <= (others=>'0');
						result(127)<='1';
					else
						result(127 downto 96) <= (others=>'1');
						result(127)<='0';
					end if;
				else
					result(127 downto 96)<= sl4;
				end if;
			else										         --MA/MS/h
				if ((cout1_high_a xor cout0_high_a)='1') then 
					if(rs1Data(31)='1') then
						result(31 downto 0) <= (others=>'0');
						result(31)<='1';
					else
						result(31 downto 0) <= (others=>'1');
						result(31)<='0';
					end if;
				else
					result(31 downto 0)<= sh1;
				end if;
				
				if ((cout1_high_b xor cout0_high_b)='1') then 
					if(rs1Data(63)='1') then
						result(63 downto 32) <= (others=>'0');
						result(63)<='1';
					else
						result(63 downto 32) <= (others=>'1');
						result(63)<='0';
					end if;
				else
					result(63 downto 32)<= sh2;
				end if;	
				
				if ((cout1_high_c xor cout0_high_c)='1') then 
					if(rs1Data(95)='1') then
						result(95 downto 64) <= (others=>'0');
						result(95)<='1';
					else
						result(95 downto 64) <= (others=>'1');
						result(95)<='0';
					end if;
				else
					result(95 downto 64)<= sh3;
				end if;	 
				
				if ((cout1_high_d xor cout0_high_d)='1') then 
					if(rs1Data(127)='1') then
						result(127 downto 96) <= (others=>'0');
						result(127)<='1';
					else
						result(127 downto 96) <= (others=>'1');
						result(127)<='0';
					end if;
				else
					result(127 downto 96)<= sh4;
				end if;
			end if;	
		else
			result<=(others=>'0');
		end if;
		
				
				
					
	

	 end process;

end mult_result_control;
