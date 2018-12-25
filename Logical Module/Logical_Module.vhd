-------------------------------------------------------------------------------
--
-- Title       : Logical_Module
-- Design      : Pipelined_Processor
-- Author      : Riwaz Awasthi
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : d:\AldecDesigns\ESE345_Final_Project\Pipelined_Processor\src\Logical_Module.vhd
-- Generated   : Mon Dec  3 18:13:55 2018
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
--{entity {Logical_Module} architecture {Logical_Module}}
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Logical_Module is
	port(
	    first_bit: in std_logic;
		second_bit: in std_logic;
		opcode : in std_logic_vector(7 downto 0);  	-- Operation Code
		a : in std_logic_vector(127 downto 0);		-- Register Input One (RS1) Data
		b : in std_logic_vector(127 downto 0);	  	-- Register Input Two (Or Destination) (RS2) Data
		c : in std_logic_vector(127 downto 0);      --Register Input three (RS3) Data
		r : out std_logic_vector(127 downto 0);		-- Destination Register (RD) Data	  
		immediate: in std_logic_vector(15 downto 0);
		li_Data : in std_logic_vector(2 downto 0));  
end Logical_Module;



architecture Logical_Module of Logical_Module is
--////////////////////////////////
	--clz function
	--/////////////////////////////////
	function clz (signal A : std_logic_vector(127 downto 0)) return std_logic_vector is	  
		variable word1 : std_logic_vector(31 downto 0) := A(127 downto 96);
		variable word2 : std_logic_vector(31 downto 0) := A(95 downto 64);
		variable word3 : std_logic_vector(31 downto 0) := A(63 downto 32);
		variable word4 : std_logic_vector(31  downto 0):= A(31 downto 0);
		variable temp1 : integer range 0 to 32 := 0;	 
		variable temp2 : integer range 0 to 32 := 0;
		variable temp3 : integer range 0 to 32 := 0;	 
		variable temp4 : integer range 0 to 32 := 0;	
		variable count1 : std_logic_vector(31 downto 0);
		variable count2 : std_logic_vector(31 downto 0);
		variable count3 : std_logic_vector(31 downto 0);
		variable count4 : std_logic_vector(31 downto 0);
		
	begin  
		
		loop1 : for i in 31 downto 0 loop 
			exit loop1 when word1(i) = '1'; 
			case word1(i) is 
				when '0' => temp1 := temp1 + 1; 
				when others => exit; 
			end case; 
			
		end loop;	
		
		
		if (temp1 = 0) then
			temp1 := 32;
		end if;	
		
		count1 := std_logic_vector(to_unsigned(temp1, 32)); 
		
		loop2 : for i in 31 downto 0 loop 
			exit loop2 when word2(i) = '1'; 
			case word2(i) is 
				when '0' => temp2 := temp2 + 1; 
				when others => exit; 
			end case; 
			
		end loop;		
		
		if (temp2 = 0) then
			temp2 := 32;
		end if;
		
		
		count2 := std_logic_vector(to_unsigned(temp2, 32)); 
		
		loop3 : for i in 31 downto 0 loop 
			exit loop3 when word3(i) = '1'; 
			case word3(i) is 
				when '0' => temp3 := temp3 + 1; 
				when others => exit; 
			end case; 
			
		end loop;	
		
		
		if (temp3 = 0) then
			temp3 := 32;
		end if;	
		
		count3 := std_logic_vector(to_unsigned(temp1, 32)); 
		
		loop4 : for i in 31 downto 0 loop 
			exit loop4 when word4(i) = '1'; 
			case word4(i) is 
				when '0' => temp4 := temp4 + 1; 
				when others => exit; 
			end case; 
			
		end loop;		
		
		if (temp4 = 0) then
			temp4 := 32;
		end if;
		
		
		count4 := std_logic_vector(to_unsigned(temp2, 32)); 
		return count1 & count2 & count3 & count4;
	end clz;
	
	--//////////////////////////////////
	--shlhi (Shift left halfword immediate) function	 
	--packed 16-bit halfword shift left logical of the contents of register rs1 by the 4-bit immediate value of instruction field rs2. 
	--Each of the results is placed into the corresponding 16-bit slot in register rd.
	--//////////////////////////////////
	
	function shlhi (signal A : std_logic_vector(127 downto 0); signal B : std_logic_vector(3 downto 0)) return std_logic_vector is
		
		variable halfWord1 : std_logic_vector(15 downto 0) := A(127 downto 112);	--The first set of 16 bits 
		variable halfWord2 : std_logic_vector(15 downto 0) := A(111 downto 96);	--The second set of 16 bits 
		variable halfWord3 : std_logic_vector(15 downto 0) := A(95 downto 80);  --The third set of 16 bits 
		variable halfWord4 : std_logic_vector(15 downto 0) := A(79 downto 64); 	--The fourth set of 16 bits 
	    variable halfWord5 : std_logic_vector(15 downto 0) := A(63 downto 48);	--The fifth set of 16 bits 
		variable halfWord6 : std_logic_vector(15 downto 0) := A(47 downto 32);	--The sixth set of 16 bits 
		variable halfWord7 : std_logic_vector(15 downto 0) := A(31 downto 16);  --The seventh set of 16 bits 
		variable halfWord8 : std_logic_vector(15 downto 0) := A(15 downto 0); 	--The Least Significant 16 Bits
		
		variable halfWord1Shift : std_logic_vector(15 downto 0) := std_logic_vector(unsigned(halfWord1) sll to_integer(unsigned(B)));	   
		variable halfWord2Shift : std_logic_vector(15 downto 0) := std_logic_vector(unsigned(halfWord2) sll to_integer(unsigned(B)));
		variable halfWord3Shift : std_logic_vector(15 downto 0) := std_logic_vector(unsigned(halfWord3) sll to_integer(unsigned(B)));
		variable halfWord4Shift : std_logic_vector(15 downto 0) := std_logic_vector(unsigned(halfWord4) sll to_integer(unsigned(B)));
		variable halfWord5Shift : std_logic_vector(15 downto 0) := std_logic_vector(unsigned(halfWord5) sll to_integer(unsigned(B)));	   
		variable halfWord6Shift : std_logic_vector(15 downto 0) := std_logic_vector(unsigned(halfWord6) sll to_integer(unsigned(B)));
		variable halfWord7Shift : std_logic_vector(15 downto 0) := std_logic_vector(unsigned(halfWord7) sll to_integer(unsigned(B)));
		variable halfWord8Shift : std_logic_vector(15 downto 0) := std_logic_vector(unsigned(halfWord8) sll to_integer(unsigned(B)));
	begin  
		
		return halfWord1Shift & halfWord2Shift & halfWord3Shift & halfWord4Shift & halfWord5Shift & halfWord6Shift & halfWord7Shift & halfWord8Shift;
		
	end shlhi;	

	--////////////////////////////////////////
	--mpyu function
	--///////////////////////////////////////
	
	function mpyu (signal A : std_logic_vector(127 downto 0); signal B : std_logic_vector(127 downto 0)) return std_logic_vector is
		
		variable halfWord1 : std_logic_vector(15 downto 0) := A(111 downto 96);
		variable halfWord2 : std_logic_vector(15 downto 0) := A(79 downto 64);
	    variable halfWord3 : std_logic_vector(15 downto 0) := A(47 downto 32);
		variable halfWord4 : std_logic_vector(15 downto 0) := A(15 downto 0);
		variable halfWord5 : std_logic_vector(15 downto 0) := B(111 downto 96);
		variable halfWord6 : std_logic_vector(15 downto 0) := B(79 downto 64);
		variable halfWord7 : std_logic_vector(15 downto 0) := B(47 downto 32);
		variable halfWord8 : std_logic_vector(15 downto 0) := B(15 downto 0);
		
		variable word1 : std_logic_vector(31 downto 0) := std_logic_vector(unsigned(halfWord1) * unsigned(halfWord5));
		variable word2 : std_logic_vector(31 downto 0) := std_logic_vector(unsigned(halfWord2) * unsigned(halfWord6));
		variable word3 : std_logic_vector(31 downto 0) := std_logic_vector(unsigned(halfWord3) * unsigned(halfWord7));
		variable word4 : std_logic_vector(31 downto 0) := std_logic_vector(unsigned(halfWord4) * unsigned(halfWord8));
	begin
		
		return word1 & word2 & word3 & word4;
		
	end mpyu;		 
	
	--////////////////////////////////////////
	--absdb function  
	--absolute difference of bytes: the contents of each of the eight byte slots in 
	--register rs2 is subtracted from the contents of the corresponding byte slot in register rs1. 
	--The absolute value of each of the results is placed into the corresponding byte slot in register rd.
	--///////////////////////////////////////
	
	function absdb (signal A : std_logic_vector(127 downto 0); signal B : std_logic_vector(127 downto 0)) return std_logic_vector is
		
		variable byte1a : std_logic_vector(7 downto 0) := A(127 downto 120); 	 
		variable byte2a : std_logic_vector(7 downto 0) := A(119 downto 112);
		variable byte3a : std_logic_vector(7 downto 0) := A(111 downto 104);
		variable byte4a : std_logic_vector(7 downto 0) := A(103 downto 96);
		variable byte5a : std_logic_vector(7 downto 0) := A(95 downto 88);
		variable byte6a : std_logic_vector(7 downto 0) := A(87 downto 80);
		variable byte7a : std_logic_vector(7 downto 0) := A(79 downto 72);
		variable byte8a : std_logic_vector(7 downto 0) := A(71 downto 64);
	    variable byte9a : std_logic_vector(7 downto 0) := A(63 downto 56); 	 
		variable byte10a : std_logic_vector(7 downto 0) := A(55 downto 48);
		variable byte11a : std_logic_vector(7 downto 0) := A(47 downto 40);
		variable byte12a : std_logic_vector(7 downto 0) := A(39 downto 32);
		variable byte13a : std_logic_vector(7 downto 0) := A(31 downto 24);
		variable byte14a : std_logic_vector(7 downto 0) := A(23 downto 16);
		variable byte15a : std_logic_vector(7 downto 0) := A(15 downto 8);
		variable byte16a : std_logic_vector(7 downto 0) := A(7 downto 0);
		
		variable byte1b : std_logic_vector(7 downto 0) := B(127 downto 120); 	 
		variable byte2b : std_logic_vector(7 downto 0) := B(119 downto 112);
		variable byte3b : std_logic_vector(7 downto 0) := B(111 downto 104);
		variable byte4b : std_logic_vector(7 downto 0) := B(103 downto 96);
		variable byte5b : std_logic_vector(7 downto 0) := B(95 downto 88);
		variable byte6b : std_logic_vector(7 downto 0) := B(87 downto 80);
		variable byte7b : std_logic_vector(7 downto 0) := B(79 downto 72);
		variable byte8b : std_logic_vector(7 downto 0) := B(71 downto 64);
		variable byte9b : std_logic_vector(7 downto 0) := B(63 downto 56); 	 
		variable byte10b : std_logic_vector(7 downto 0) := B(55 downto 48);
		variable byte11b : std_logic_vector(7 downto 0) := B(47 downto 40);
		variable byte12b : std_logic_vector(7 downto 0) := B(39 downto 32);
		variable byte13b : std_logic_vector(7 downto 0) := B(31 downto 24);
		variable byte14b : std_logic_vector(7 downto 0) := B(23 downto 16);
		variable byte15b : std_logic_vector(7 downto 0) := B(15 downto 8);
		variable byte16b : std_logic_vector(7 downto 0) := B(7 downto 0);
		
		variable word1 : std_logic_vector(7 downto 0) := std_logic_vector(abs(signed(byte1a) - signed(byte1b)));
		variable word2 : std_logic_vector(7 downto 0) := std_logic_vector(abs(signed(byte2a) - signed(byte2b)));
		variable word3 : std_logic_vector(7 downto 0) := std_logic_vector(abs(signed(byte3a) - signed(byte3b)));
		variable word4 : std_logic_vector(7 downto 0) := std_logic_vector(abs(signed(byte4a) - signed(byte4b)));
		variable word5 : std_logic_vector(7 downto 0) := std_logic_vector(abs(signed(byte5a) - signed(byte5b)));
		variable word6 : std_logic_vector(7 downto 0) := std_logic_vector(abs(signed(byte6a) - signed(byte6b)));
		variable word7 : std_logic_vector(7 downto 0) := std_logic_vector(abs(signed(byte7a) - signed(byte7b)));
		variable word8 : std_logic_vector(7 downto 0) := std_logic_vector(abs(signed(byte8a) - signed(byte8b)));
		variable word9 : std_logic_vector(7 downto 0) := std_logic_vector(abs(signed(byte9a) - signed(byte9b)));
		variable word10 : std_logic_vector(7 downto 0) := std_logic_vector(abs(signed(byte10a) - signed(byte10b)));
		variable word11: std_logic_vector(7 downto 0) := std_logic_vector(abs(signed(byte11a) - signed(byte11b)));
		variable word12 : std_logic_vector(7 downto 0) := std_logic_vector(abs(signed(byte12a) - signed(byte12b)));
		variable word13 : std_logic_vector(7 downto 0) := std_logic_vector(abs(signed(byte13a) - signed(byte13b)));
		variable word14 : std_logic_vector(7 downto 0) := std_logic_vector(abs(signed(byte14a) - signed(byte14b)));
		variable word15 : std_logic_vector(7 downto 0) := std_logic_vector(abs(signed(byte15a) - signed(byte15b)));
		variable word16 : std_logic_vector(7 downto 0) := std_logic_vector(abs(signed(byte16a) - signed(byte16b)));
		
	begin
		
		return word1 & word2 & word3 & word4 & word5 & word6 & word7 & word8 & word9 & word10 & word11 & word12 & word13 & word14 & word15 & word16;
		
	end absdb;
	
	--/////////////////////////////////////////
	-- popcnth function	
	-- count ones in halfwords: the number of 1s in each of the halfword-slots in register rs1 is computed. 
	--If the halfword slot in register rs1 is zero, the result is 0. 
	--Each of the results is placed into corresponding 16-bit slot in register rd. 
	--/////////////////////////////////////////
	
	function popcnth (signal A : std_logic_vector(127 downto 0)) return std_logic_vector is
		variable byte1 : std_logic_vector(15 downto 0) := A(127 downto 112);
		variable byte2 : std_logic_vector(15 downto 0) := A(111 downto 96);
		variable byte3 : std_logic_vector(15 downto 0) := A(95 downto 80);
		variable byte4 : std_logic_vector(15 downto 0) := A(79 downto 64);
		variable byte5 : std_logic_vector(15 downto 0) := A(63 downto 48);
		variable byte6 : std_logic_vector(15 downto 0) := A(47 downto 32);
		variable byte7 : std_logic_vector(15 downto 0) := A(31 downto 16);	  	 
		variable byte8 : std_logic_vector(15 downto 0) := A(15 downto 0);	 
		
		variable temp1 : integer range 0 to 16:=0; 
		variable temp2 : integer range 0 to 16:=0;
		variable temp3 : integer range 0 to 16:=0;
		variable temp4 : integer range 0 to 16:=0;
		variable temp5 : integer range 0 to 16:=0;
		variable temp6 : integer range 0 to 16:=0;
		variable temp7 : integer range 0 to 16:=0;
		variable temp8 : integer range 0 to 16:=0;	   
		
		variable count1 : std_logic_vector(15 downto 0);
		variable count2 : std_logic_vector(15 downto 0);
		variable count3 : std_logic_vector(15 downto 0);
		variable count4 : std_logic_vector(15 downto 0);
		variable count5 : std_logic_vector(15 downto 0);
		variable count6 : std_logic_vector(15 downto 0);
		variable count7 : std_logic_vector(15 downto 0);
		variable count8 : std_logic_vector(15 downto 0);
		
	begin
		
		loop1 : for i in 15 downto 0 loop
			case byte1(i) is
				when '1' => temp1 := temp1 + 1;
				when others => next;
			end case;
		end loop;
		count1 := std_logic_vector(to_unsigned(temp1, 16)); 
		
		loop2 : for i in 15 downto 0 loop
			case byte2(i) is
				when '1' => temp2 := temp2 + 1;
				when others => next;
			end case;
		end loop;
		count2 := std_logic_vector(to_unsigned(temp2, 16)); 
		
		loop3 : for i in 15 downto 0 loop
			case byte3(i) is
				when '1' => temp3 := temp3 + 1;
				when others => next;
			end case;
		end loop;	  
		count3 := std_logic_vector(to_unsigned(temp3, 16)); 
		
		loop4 : for i in 15 downto 0 loop
			case byte4(i) is
				when '1' => temp4 := temp4 + 1;
				when others => next;
			end case;
		end loop;		 	  
		count4 := std_logic_vector(to_unsigned(temp4, 16)); 
		
		loop5 : for i in 15 downto 0 loop
			case byte5(i) is
				when '1' => temp5 := temp5 + 1;
				when others => next;
			end case;
		end loop;	   
		count5 := std_logic_vector(to_unsigned(temp5, 16)); 
		
		loop6 : for i in 15 downto 0 loop
			case byte6(i) is
				when '1' => temp6 := temp6 + 1;
				when others => next;
			end case;
		end loop;								  
		count6 := std_logic_vector(to_unsigned(temp6, 16)); 
		
		loop7 : for i in 15 downto 0 loop
			case byte7(i) is
				when '1' => temp7 := temp7 + 1;
				when others => next;
			end case;
		end loop;								  
		count7 := std_logic_vector(to_unsigned(temp7, 16)); 
		
		loop8 : for i in 15 downto 0 loop
			case byte8(i) is
				when '1' => temp8 := temp8 + 1;
				when others => next;
			end case;
		end loop;				  
		count8 := std_logic_vector(to_unsigned(temp8, 16)); 
		
		return count1 & count2 & count3 & count4 & count5 & count6 & count7 & count8; 
		
	end popcnth;
	
	------------------------------------------------------------
	--rot function
	---------------------
	function rot(signal A : std_logic_vector(127 downto 0); signal B : std_logic_vector(6 downto 0)) return std_logic_vector is
	variable result : std_logic_vector(127 downto 0) := std_logic_vector(unsigned(A) ror to_integer(unsigned(B)));
	begin
		return result;
	end rot;
	
	-----------------------------------------------
	--bcw function
	-----------------------------------------------
	function bcw(signal A: std_logic_vector(127 downto 0))return std_logic_vector is
	variable temp:std_logic_vector(31 downto 0):= A(31 downto 0);
	begin
		return temp & temp & temp & temp;
	end bcw;
	
	---------------------------------------------------
	--li_function
	----------------------------------------------------
	function li_function(signal A: std_logic_vector(127 downto 0); signal B : std_logic_vector(2 downto 0); signal C:std_logic_vector(15 downto 0))return std_logic_vector is
	variable x:integer range 0 to 7 := to_integer(unsigned(B));	
	variable index_high : integer range 0 to 127 := 16*(x + 1) -1;
	variable index_low : integer range 0 to 127 := 16*x;
	variable result: std_logic_vector(127 downto 0) :=A(127 downto 0);
	begin
		result(index_high downto index_low):=C(15 downto 0);
		return result;
	end li_function;
	
	
	
	

begin 
	process(first_bit, second_bit, opcode,a,b,li_Data,immediate)
	begin
		
	if (first_bit='0') then 
		r<= li_function(c,li_Data, immediate);	--li fnction
	elsif(second_bit='1') then 
		if(std_match(opcode,"----0001")) then	  --bcw function
			r<= bcw(a);
		elsif(std_match(opcode,"----0010")) then  --bitwise and
			r<= a and b; 
		elsif(std_match(opcode,"----0011")) then   --bitwise or
			r<= a or b;
		elsif(std_match(opcode,"----0100")) then   --popcnth
			r<= popcnth(a);
		elsif(std_match(opcode,"----0101")) then --clz
			r<= clz(a);
		elsif(std_match(opcode,"----0110")) then --rot
			r<= rot(a,b(6 downto 0));
		elsif(std_match(opcode,"----0111")) then --shlhi
			r<= shlhi(a, b(3 downto 0));
		elsif(std_match(opcode,"----1110")) then --mpyu
			r<= mpyu(a,b);
		elsif(std_match(opcode,"----1111")) then --absdb
			r<= absdb(a,b);
		else
			r <= std_logic_vector(to_unsigned(0, r'length));
		end if;
	else 
		r <= std_logic_vector(to_unsigned(0, r'length));
	end if;
	end process;
			
		
	 

end Logical_Module;
