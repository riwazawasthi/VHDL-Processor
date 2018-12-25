-------------------------------------------------------------------------------
--
-- Title       : arithmetic_module
-- Design      : Pipelined_Processor
-- Author      : Riwaz Awasthi
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : d:\AldecDesigns\ESE345_Final_Project\Pipelined_Processor\src\arithmetic_module.vhd
-- Generated   : Mon Dec  3 22:02:48 2018
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
--{entity {arithmetic_module} architecture {arithmetic_module}}


--//////////////////////////////////
--
-- arithmetic_module
--
-- Implements the arithmetic functions of the ALU
--
--//////////////////////////////////
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  

entity arithmetic_module is	
	port(
	    first_bit: in std_logic;
		second_bit: in std_logic;
		ma_ms : in std_logic_vector(2 downto 0);
		opcode : in std_logic_vector(7 downto 0);  	-- Operation Code
		a : in std_logic_vector(127 downto 0);		-- Register Input One (RS1) Data
		b : in std_logic_vector(127 downto 0);	  	-- Register Input Two (RS2) Data
		c : in std_logic_vector(127 downto 0);      --Register Input three (RS3) Data
		r : out std_logic_vector(127 downto 0));		-- Data to be written	  
end arithmetic_module;



architecture arithmetic_module of arithmetic_module is
    signal sub, half, cout1a, cout0a, cout1b, cout0b, cout1c, cout0c, cout1d, cout0d : std_logic; 	
	signal suma, sumb, sumc, sumd: std_logic_vector(31 downto 0):=(others=>'0');

begin
	u1: entity cla_32bit port map(
		a => a(127 downto 96), b => b(127 downto 96), sub => sub, half => half, sum => suma, cout1 => cout1a, cout0 => cout0a);
	u2: entity cla_32bit port map(
		a => a(95 downto 64), b => b(95 downto 64), sub => sub, half => half, sum => sumb, cout1 => cout1b, cout0 => cout0b);
	u3: entity cla_32bit port map(
		a => a(63 downto 32), b => b(63 downto 32), sub => sub, half => half, sum => sumc, cout1 => cout1c, cout0 => cout0c);
	u4: entity cla_32bit port map(
		a => a(31 downto 0), b => b(31 downto 0), sub => sub, half => half, sum => sumd, cout1 => cout1d, cout0 => cout0d);	
	
	u5: entity arithmetic_result_control port map(
		first_bit=>first_bit,
		second_bit=>second_bit,
		opcode=>opcode,
		a1=>a(127 downto 96), b1=>b(127 downto 96),
		a2=>a(95 downto 64), b2=>b(95 downto 64),
		a3=>a(63 downto 32), b3=>b(63 downto 32),
		a4=>a(31 downto 0), b4=>b(31 downto 0),
		cout1a=>cout1a, cout0a=>cout0a,
		cout1b=>cout0a, cout0b=>cout0b,
		cout1c=>cout1c, cout0c=>cout0c,
		cout1d=>cout1d, cout0d=>cout0d,
		suma => suma,
		sumb=> sumb,
		sumc=>sumc,
		sumd=>sumd,
		result=>r);
	
	u6: entity arithmetic_control_subhalf port map(
		first_bit=> first_bit,
		second_bit=>second_bit,
		ma_ms=> ma_ms,
		opcode => opcode,
		sub => sub,
		half => half 
		); 
end arithmetic_module;
