library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;
entity arithmetic_control_subhalf is
	port(
	   	first_bit: in std_logic;
		second_bit: in std_logic;  
		ma_ms: in std_logic_vector(2 downto 0);
		opcode : in std_logic_vector(7 downto 0);  	-- Operation Code
		sub : out STD_LOGIC;
		half : out STD_LOGIC
		);
end arithmetic_control_subhalf;						

architecture dataflow of arithmetic_control_subhalf is	 
	
begin
	
	process(first_bit, second_bit, ma_ms, opcode)
	begin	   
		if(first_bit='1' and second_bit='1') then 
		 
			 if(std_match(opcode,"----1001"))then --sfw			
				sub <= '1';
				half <= '0';  
			
			 elsif(std_match(opcode, "----1010"))then --ah			
				sub <= '0';
				half <= '1';  
			
			 elsif(std_match(opcode,"----1011"))then --sfh		    
				sub <= '1';
				half <= '1';
			
			 elsif(std_match(opcode,"----1100"))then    --ahs
				sub <= '0';		    
				half <= '1';
				
			
			 elsif(std_match(opcode,"----1101"))then  --sfhs				
				sub <= '1';
				half <= '1';   
			
			 else 
				sub <= '0';		    
				half <= '0'; 
			 end if;
			 
		elsif (first_bit='1' and second_bit='0') then 
			if(std_match(ma_ms,"-0-")) then 
				sub <= '0';
				half <= '0';
			else
				sub <= '1';
				half <= '0';
			end if;
		else
			sub <='0';
			half<='0';
		end if;
		
				
		
		 
		
	end process;		
end dataflow; 	