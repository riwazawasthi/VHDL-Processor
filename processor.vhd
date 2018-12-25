-------------------------------------------------------------------------------
--
-- Title       : processor
-- Design      : Pipelined_Processor
-- Author      : Riwaz Awasthi
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : d:\AldecDesigns\ESE345_Final_Project\Pipelined_Processor\src\processor.vhd
-- Generated   : Tue Dec  4 02:35:29 2018
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
--{entity {processor} architecture {processor}}
library ieee;
use ieee.std_logic_1164.all;


entity processor is
	port(
	clk:in std_logic;
	dataIntoBuffer: in std_logic_vector(24 downto 0);
	buff_write : in std_logic;
	result : out std_logic_vector(127 downto 0));
	
	
end processor;

--}} End of automatically maintained section

architecture processor of processor is
signal dataFromBuffer : std_logic_vector(24 downto 0);
signal rs1,rs2,rs3,oldrd,rd : std_logic_vector(4 downto 0);
signal first_bit, second_bit,first_bitEX,second_bitEX, RegWrite,li_signal: std_logic;
signal li_data,ma_ms,li_dataEX, ma_ms_outEX: std_logic_vector(2 downto 0);
signal immediate,immediateEX: std_logic_vector(15 downto 0);
signal opcode,opcodefromEX : std_logic_vector(7 downto 0);
signal operand1,operand2,operand3, rs1data, rs2data,rs3data,data_to_write: std_logic_vector(127 downto 0);
begin

	u1: entity Instruction_Buffer port map(
		clk=>clk,
		din=>dataIntoBuffer,
		dout=>dataFromBuffer,
		write=>buff_write);
	
	u2: entity Instruction_Fetch_Decode port map(
		clk=>clk,
		din=>dataFromBuffer,
		writein=>buff_write,
		rs1=>rs1,
		rs2=>rs2,
		rs3=>rs3,
		rd=>rd,
		first_bit=>first_bit,
		second_bit=>second_bit,
		li=>li_data,
		ma_ms=>ma_ms,
		immediate=>immediate,
		RegWrite=>RegWrite,
		li_signal=>li_signal,
		opcode=>opcode);
		
	u3: entity regFile port map(
		rs1=>rs1,
		rs2=>rs2,
		rs3=>rs3,
		rd=>oldrd,
		din=>data_to_write,
		dout1=>rs1data,
		dout2=>rs2data,
		dout3=>rs3data,
		li=>li_signal,
		Regwrite=>RegWrite);
	u4: entity InstructionEXE_WB port map(
		clk=>clk,
		writein=>buff_write,
		opcode=>opcode,
		opcode_out=>opcodefromEX, 
		newrd=>rd,
		oldrd=>oldrd,
		rs1Data=>rs1data,
		rs2Data=>rs2data,
		rs3Data=>rs3data,
		operand1=>operand1,
		operand2=>operand2,
		operand3=>operand3,
		first_bit=>first_bit,
		first_bit_out=>first_bitEX,
		second_bit=>second_bit,
		second_bit_out=>second_bitEX,
		li=>li_data,
		li_out=>li_dataEX,
		ma_ms=>ma_ms,
		ma_ms_out=>ma_ms_outEX,
		immediate=>immediate,
		immediate_out=>immediateEX,
		RegWrite=>Regwrite,
		rdData => data_to_write);
		
	u5: entity ALU port map(
		first_bit=>first_bitEX,
		second_bit=>second_bitEX,
		ma_ms=>ma_ms_outEX,
		opcode=>opcodefromEX,
		operand1=>operand1,
		operand2=>operand2,
		operand3=>operand3,
		result=>data_to_write,
		immediate=>immediateEX,
		li_Data=>li_dataEX);
		
		
		
		
		
end processor;
