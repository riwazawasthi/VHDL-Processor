-------------------------------------------------------------------------------
--
-- Title       : mult_module_signed
-- Design      : Pipelined_Processor
-- Author      : Riwaz Awasthi
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : d:\AldecDesigns\ESE345_Final_Project\Pipelined_Processor\src\mult_module_signed.vhd
-- Generated   : Mon Dec  3 22:13:00 2018
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
--{entity {mult_module_signed} architecture {mult_module_signed}}

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  

entity mult_module_signed is 
	port(
	    first_bit: in std_logic;
		second_bit: in std_logic;  
		ma_ms: in std_logic_vector(2 downto 0);
		opcode : in std_logic_vector(7 downto 0);  	-- Operation Code
		a : in std_logic_vector(127 downto 0);		-- Register Input One (RS1) Data
		b : in std_logic_vector(127 downto 0);	  	-- Register Input Two (Or Destination) (RS2) Data
		c : in std_logic_vector(127 downto 0);      --Register Input three (RS3) Data
		r : out std_logic_vector(127 downto 0));		-- Destination Register (RD) Data	  
end mult_module_signed;

--}} End of automatically maintained section

architecture mult_module_signed of mult_module_signed is
--temp. signals declaration
signal mlow1,mlow2,mlow3,mlow4,mhigh1,mhigh2,mhigh3,mhigh4 : signed(31 downto 0);
signal sl1, sl2, sl3, sl4, sh1, sh2, sh3, sh4 : std_logic_vector(31 downto 0);
signal sub, half : std_logic;
signal cout1_low_a, cout0_low_a, cout1_low_b, cout0_low_b, cout1_low_c, cout0_low_c, cout1_low_d, cout0_low_d: std_logic;
signal cout1_high_a, cout0_high_a, cout1_high_b, cout0_high_b, cout1_high_c, cout0_high_c, cout1_high_d, cout0_high_d: std_logic;
begin  
	u1:entity Signed_multiplier_16bit port map(
		a=> signed(b(15 downto 0)), b => signed(c(15 downto 0)), result => mlow1);
	u2:	entity Signed_multiplier_16bit port map(
		a=> signed(b(47 downto 32)), b => signed(c(47 downto 32)), result => mlow2); 
	u3: entity Signed_multiplier_16bit port map(
		a=> signed(b(79 downto 64)), b => signed(c(79 downto 64)), result => mlow3); 
	u4: entity Signed_multiplier_16bit port map(
		a=> signed(b(111 downto 96)), b => signed(c(111 downto 96)), result => mlow4); 
	
	u5: entity cla_32bit port map(
		a=> a(31 downto 0), b=>std_logic_vector(mlow1), sub=> sub, half=> half, sum=> sl1, cout1=> cout1_low_a, cout0=>cout0_low_a);
	u6: entity cla_32bit port map(
		a=> a(63 downto 32), b=>std_logic_vector(mlow2), sub=> sub, half=> half, sum=> sl2, cout1=> cout1_low_b, cout0=>cout0_low_b);
	u7: entity cla_32bit port map(
		a=> a(95 downto 64), b=>std_logic_vector(mlow3), sub=> sub, half=> half, sum=> sl3, cout1=> cout1_low_c, cout0=>cout0_low_c);
	u8: entity cla_32bit port map(
		a=> a(127 downto 96), b=>std_logic_vector(mlow4), sub=> sub, half=> half, sum=> sl4, cout1=> cout1_low_d, cout0=>cout0_low_d); 
	
	u9:entity Signed_multiplier_16bit port map(
		a=> signed(b(31 downto 16)), b => signed(c(15 downto 0)), result => mhigh1);
	u10:	entity Signed_multiplier_16bit port map(
		a=> signed(b(63 downto 48)), b => signed(c(47 downto 32)), result => mhigh2); 
	u11: entity Signed_multiplier_16bit port map(
		a=> signed(b(95 downto 80)), b => signed(c(79 downto 64)), result => mhigh3); 
	u12: entity Signed_multiplier_16bit port map(
		a=> signed(b(127 downto 112)), b => signed(c(127 downto 112)), result => mhigh4);
	
	u13: entity cla_32bit port map(
		a=> a(31 downto 0), b=>std_logic_vector(mhigh1), sub=> sub, half=> half, sum=> sh1, cout1=> cout1_high_a, cout0=>cout0_high_a);
	u14: entity cla_32bit port map(
		a=> a(63 downto 32), b=>std_logic_vector(mhigh2), sub=> sub, half=> half, sum=> sh2, cout1=> cout1_high_b, cout0=>cout0_high_b);
	u15: entity cla_32bit port map(
		a=> a(95 downto 64), b=>std_logic_vector(mhigh3), sub=> sub, half=> half, sum=> sh3, cout1=> cout1_high_c, cout0=>cout0_high_c);
	u16: entity cla_32bit port map(
		a=> a(127 downto 96), b=>std_logic_vector(mhigh4), sub=> sub, half=> half, sum=> sh4, cout1=> cout1_high_d, cout0=>cout0_high_d); 
	
	u17: entity mult_result_control port map(
		first_bit => first_bit,
		second_bit => second_bit,
		ma_ms=> ma_ms, 
		rs1Data=>a,
		cout1_low_a=>cout1_low_a, cout0_low_a=>cout0_low_a, 
		cout1_low_b=>cout1_low_b, cout0_low_b=>cout0_low_b, 
		cout1_low_c=>cout1_low_c, cout0_low_c=>cout0_low_c, 
		cout1_low_d=>cout1_low_d, cout0_low_d=>cout0_low_d,
		cout1_high_a=>cout1_high_a, cout0_high_a=>cout0_high_a, 
		cout1_high_b=>cout1_high_b, cout0_high_b=>cout0_high_b, 
		cout1_high_c=>cout1_high_c, cout0_high_c=>cout0_high_c, 
		cout1_high_d=>cout1_high_d, cout0_high_d=>cout0_high_d,
		sl1=>sl1, sl2=>sl2, sl3=>sl3, sl4=>sl4, 
		sh1=>sh1, sh2=>sh2, sh3=>sh3, sh4=>sh4,
		result=>r);
	
	
	u18: entity arithmetic_control_subhalf port map(
		first_bit=> first_bit,
		second_bit=>second_bit,
		ma_ms=> ma_ms,
		opcode => opcode,
		sub => sub,
		half => half 
		);
end mult_module_signed;
