-------------------------------------------------------------------------------
--
-- Title       : regFile
-- Design      : Pipelined_Processor
-- Author      : 
-- Company     : 
-------------------------------------------------------------------------------
-- Description : 
--
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;   
use ieee.numeric_std.all;

entity regFile is									--Register File		
	port(
		
	    rs1 : in std_logic_vector(4 downto 0);			--Source Register
		rs2 : in std_logic_vector(4 downto 0);	 		--Source Register
		rs3 : in std_logic_vector(4 downto 0); 			--Source Register
		rd  : in std_logic_vector(4 downto 0); 			--Destination Register
		din : in std_logic_vector(127 downto 0);	    --Data Input
		dout1 : out std_logic_vector(127 downto 0);	 	--Data Output From rs1
		dout2 : out std_logic_vector(127 downto 0);     --Data Output From rs2 
		dout3 : out std_logic_vector(127 downto 0);     --Data Output From rs3
		li    : in std_logic;
		Regwrite : in std_logic);						--Decides whether to write or read the registers
	
end regFile;

architecture regFile of regFile is
	
	signal r0 : std_logic_vector(127 downto 0) := (others => '0');		    --Register 0
	signal r1 : std_logic_vector(127 downto 0) := (others => '0');		    --Register 1
	signal r2 : std_logic_vector(127 downto 0) := (others => '0');		    --Register 2
	signal r3 : std_logic_vector(127 downto 0) := (others => '0');		    --Register 3
	signal r4 : std_logic_vector(127 downto 0) := (others => '0');		    --Register 4
	signal r5 : std_logic_vector(127 downto 0) := (others => '0');		    --Register 5
	signal r6 : std_logic_vector(127 downto 0) := (others => '0');		   	--Register 6
	signal r7 : std_logic_vector(127 downto 0) := (others => '0');			--Register 7
	signal r8 : std_logic_vector(127 downto 0) := (others => '0');	   		--Register 8
	signal r9 : std_logic_vector(127 downto 0) := (others => '0');	  		--Register 9
	signal r10: std_logic_vector(127 downto 0) := (others => '0');	   		--Register 10
	signal r11: std_logic_vector(127 downto 0) := (others => '0');	  		--Register 11
	signal r12: std_logic_vector(127 downto 0) := (others => '0');	  		--Register 12
	signal r13: std_logic_vector(127 downto 0) := (others => '0');			--Register 13					  
	signal r14: std_logic_vector(127 downto 0) := (others => '0');	  		--Register 14
	signal r15: std_logic_vector(127 downto 0) := (others => '0');		   	--Register 15 
	signal r16: std_logic_vector(127 downto 0) := (others => '0');		   	--Register 16
	signal r17: std_logic_vector(127 downto 0) := (others => '0');		   	--Register 17
	signal r18: std_logic_vector(127 downto 0) := (others => '0');		   	--Register 18 
	signal r19: std_logic_vector(127 downto 0) := (others => '0');		   	--Register 19 
	signal r20: std_logic_vector(127 downto 0) := (others => '0');		   	--Register 20 
	signal r21: std_logic_vector(127 downto 0) := (others => '0');		   	--Register 21
	signal r22: std_logic_vector(127 downto 0) := (others => '0');		   	--Register 22 
	signal r23: std_logic_vector(127 downto 0) := (others => '0');		   	--Register 23 
	signal r24: std_logic_vector(127 downto 0) := (others => '0');		   	--Register 24 
	signal r25: std_logic_vector(127 downto 0) := (others => '0');		   	--Register 25 
	signal r26: std_logic_vector(127 downto 0) := (others => '0');		   	--Register 26 
	signal r27: std_logic_vector(127 downto 0) := (others => '0');		   	--Register 27 
	signal r28: std_logic_vector(127 downto 0) := (others => '0');		   	--Register 28 
	signal r29: std_logic_vector(127 downto 0) := (others => '0');		   	--Register 29 
	signal r30: std_logic_vector(127 downto 0) := (others => '0');		   	--Register 30 
	signal r31: std_logic_vector(127 downto 0) := (others => '0');		   	--Register 31 
	 
	
				 
	
begin 
	process(Regwrite, rs1, rs2, rs3, rd, din)					--Write Process
	begin	 
		if(Regwrite = '1') then
		 case rd is						 	 
			when "00000" => r0 <= din;	
			when "00001" => r1 <= din;
			when "00010" => r2 <= din;
			when "00011" => r3 <= din;
			when "00100" => r4 <= din;
			when "00101" => r5 <= din;
			when "00110" => r6 <= din;
			when "00111" => r7 <= din;
			when "01000" => r8 <= din;
			when "01001" => r9 <= din;
			when "01010" => r10 <= din;
			when "01011" => r11 <= din;
			when "01100" => r12 <= din;	 
			when "01101" => r13 <= din;
			when "01110" => r14 <= din;
			when "01111" => r15 <= din;	 
			when "10000" => r16 <= din;
			when "10001" => r17 <= din;
			when "10010" => r18 <= din;
			when "10011" => r19 <= din;
			when "10100" => r20 <= din;
			when "10101" => r21 <= din;
			when "10110" => r22 <= din;
			when "10111" => r23 <= din;
			when "11000" => r24 <= din;
			when "11001" => r25 <= din;
			when "11010" => r26 <= din;
			when "11011" => r27 <= din;
			when "11100" => r28 <= din;
			when "11101" => r29 <= din;
			when "11110" => r30 <= din;
			when "11111" => r31 <= din;
			when others => NULL;
		 end case;
		 end if;
		
		 case rs1 is								 	--Else Read Selected Register
			when "00000" => dout1 <= r0;	
			when "00001" => dout1 <= r1;
			when "00010" => dout1 <= r2;
			when "00011" => dout1 <= r3;
			when "00100" => dout1 <= r4;
			when "00101" => dout1 <= r5;
			when "00110" => dout1 <= r6;
			when "00111" => dout1 <= r7;
			when "01000" => dout1 <= r8;
			when "01001" => dout1 <= r9;
			when "01010" => dout1 <= r10;
			when "01011" => dout1 <= r11;
			when "01100" => dout1 <= r12;
			when "01101" => dout1 <= r13;
			when "01110" => dout1 <= r14;
			when "01111" => dout1 <= r15;
            when "10000" => dout1 <= r16;
			when "10001" => dout1 <= r17;
			when "10010" => dout1 <= r18;
			when "10011" => dout1 <= r19;
			when "10100" => dout1 <= r20;
			when "10101" => dout1 <= r21;
			when "10110" => dout1 <= r22;
			when "10111" => dout1 <= r23;
			when "11000" => dout1 <= r24;
			when "11001" => dout1 <= r25;
			when "11010" => dout1 <= r26;
			when "11011" => dout1 <= r27;
			when "11100" => dout1 <= r28;
			when "11101" => dout1 <= r29;
			when "11110" => dout1 <= r30;
			when "11111" => dout1 <= r31;
			when others => NULL;
		 end case; 
		
		 case rs2 is								  	
			when "00000" => dout2 <= r0;	
			when "00001" => dout2 <= r1;
			when "00010" => dout2 <= r2;
			when "00011" => dout2 <= r3;
			when "00100" => dout2 <= r4;
			when "00101" => dout2 <= r5;
			when "00110" => dout2 <= r6;
			when "00111" => dout2 <= r7;
			when "01000" => dout2 <= r8;
			when "01001" => dout2 <= r9;
			when "01010" => dout2 <= r10;
			when "01011" => dout2 <= r11;
			when "01100" => dout2 <= r12;
			when "01101" => dout2 <= r13;
			when "01110" => dout2 <= r14;
			when "01111" => dout2 <= r15;
            when "10000" => dout2 <= r16;
			when "10001" => dout2 <= r17;
			when "10010" => dout2 <= r18;
			when "10011" => dout2 <= r19;
			when "10100" => dout2 <= r20;
			when "10101" => dout2 <= r21;
			when "10110" => dout2 <= r22;
			when "10111" => dout2 <= r23;
			when "11000" => dout2 <= r24;
			when "11001" => dout2 <= r25;
			when "11010" => dout2 <= r26;
			when "11011" => dout2 <= r27;
			when "11100" => dout2 <= r28;
			when "11101" => dout2 <= r29;
			when "11110" => dout2 <= r30;
			when "11111" => dout2 <= r31;	 
			when others => NULL;
		 end case;
		
		 case rs3 is								  	
			when "00000" => dout3 <= r0;	
			when "00001" => dout3 <= r1;
			when "00010" => dout3 <= r2;
			when "00011" => dout3 <= r3;
			when "00100" => dout3 <= r4;
			when "00101" => dout3 <= r5;
			when "00110" => dout3 <= r6;
			when "00111" => dout3 <= r7;
			when "01000" => dout3 <= r8;
			when "01001" => dout3 <= r9;
			when "01010" => dout3 <= r10;
			when "01011" => dout3 <= r11;
			when "01100" => dout3 <= r12;
			when "01101" => dout3 <= r13;
			when "01110" => dout3 <= r14;
			when "01111" => dout3 <= r15;
            when "10000" => dout3 <= r16;
			when "10001" => dout3 <= r17;
			when "10010" => dout3 <= r18;
			when "10011" => dout3 <= r19;
			when "10100" => dout3 <= r20;
			when "10101" => dout3 <= r21;
			when "10110" => dout3 <= r22;
			when "10111" => dout3 <= r23;
			when "11000" => dout3 <= r24;
			when "11001" => dout3 <= r25;
			when "11010" => dout3 <= r26;
			when "11011" => dout3 <= r27;
			when "11100" => dout3 <= r28;
			when "11101" => dout3 <= r29;
			when "11110" => dout3 <= r30;
			when "11111" => dout3 <= r31;	 
			when others => NULL;
		 end case; 
		 
		 --if the instruction is li
		 if(li='1') then
			case rd is								  	
			when "00000" => dout3 <= r0;	
			when "00001" => dout3 <= r1;
			when "00010" => dout3 <= r2;
			when "00011" => dout3 <= r3;
			when "00100" => dout3 <= r4;
			when "00101" => dout3 <= r5;
			when "00110" => dout3 <= r6;
			when "00111" => dout3 <= r7;
			when "01000" => dout3 <= r8;
			when "01001" => dout3 <= r9;
			when "01010" => dout3 <= r10;
			when "01011" => dout3 <= r11;
			when "01100" => dout3 <= r12;
			when "01101" => dout3 <= r13;
			when "01110" => dout3 <= r14;
			when "01111" => dout3 <= r15;
            when "10000" => dout3 <= r16;
			when "10001" => dout3 <= r17;
			when "10010" => dout3 <= r18;
			when "10011" => dout3 <= r19;
			when "10100" => dout3 <= r20;
			when "10101" => dout3 <= r21;
			when "10110" => dout3 <= r22;
			when "10111" => dout3 <= r23;
			when "11000" => dout3 <= r24;
			when "11001" => dout3 <= r25;
			when "11010" => dout3 <= r26;
			when "11011" => dout3 <= r27;
			when "11100" => dout3 <= r28;
			when "11101" => dout3 <= r29;
			when "11110" => dout3 <= r30;
			when "11111" => dout3 <= r31;	 
			when others => NULL;
		    end case; 
		 end if;
		 
			 
		---Bypass/Forwarding logic	
		 if(rs1 = rd) then				 
			dout1 <= din;
		 end if;
		
		 if(rs2 = rd) then				 
			dout2 <= din;
		 end if;
		
		 if(rs3 = rd) then				 
			dout3 <= din;
		 end if;
	   
	end process;
	
	
end regFile;







