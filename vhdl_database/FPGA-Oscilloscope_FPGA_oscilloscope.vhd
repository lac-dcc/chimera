-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 32-bit"
-- VERSION		"Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"
-- CREATED		"Sun Mar 09 12:12:32 2014"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY oscilloscope IS 
	PORT
	(
		RESET_IN :  IN  STD_LOGIC;
		HSYNC_IN :  IN  STD_LOGIC;
		CLK_IN :  IN  STD_LOGIC;
		SRT_IN :  IN  STD_LOGIC;
		CS_IN :  IN  STD_LOGIC;
		RW_IN :  IN  STD_LOGIC;
		RAS :  OUT  STD_LOGIC;
		CAS :  OUT  STD_LOGIC;
		TRG :  OUT  STD_LOGIC;
		WE :  OUT  STD_LOGIC;
		BUSY :  OUT  STD_LOGIC;
		ADDR :  OUT  STD_LOGIC_VECTOR(8 DOWNTO 0)
	);
END oscilloscope;

ARCHITECTURE bdf_type OF oscilloscope IS 

COMPONENT lpm_mux0
	PORT(data0x : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		 data1x : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		 data2x : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		 data3x : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		 sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lpm_constant1
	PORT(		 result : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lpm_constant2
	PORT(		 result : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lpm_counter1
	PORT(sclr : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 q : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lpm_constant0
	PORT(		 result : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
	);
END COMPONENT;

COMPONENT scopevram
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 cs : IN STD_LOGIC;
		 rw : IN STD_LOGIC;
		 srt : IN STD_LOGIC;
		 RAS : OUT STD_LOGIC;
		 CAS : OUT STD_LOGIC;
		 TRG : OUT STD_LOGIC;
		 WE : OUT STD_LOGIC;
		 ACK : OUT STD_LOGIC;
		 BUSY : OUT STD_LOGIC;
		 AS : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	ADDRESS :  STD_LOGIC_VECTOR(17 DOWNTO 0);
SIGNAL	CS :  STD_LOGIC;
SIGNAL	RESET :  STD_LOGIC;
SIGNAL	RW :  STD_LOGIC;
SIGNAL	SYS_CLK :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SRFF_inst3 :  STD_LOGIC;


BEGIN 
SYNTHESIZED_WIRE_3 <= '1';
SYNTHESIZED_WIRE_4 <= '1';



b2v_ADDR_MUX : lpm_mux0
PORT MAP(data0x => ADDRESS(8 DOWNTO 0),
		 data1x => ADDRESS(17 DOWNTO 9),
		 data2x => SYNTHESIZED_WIRE_0,
		 data3x => SYNTHESIZED_WIRE_1,
		 sel => SYNTHESIZED_WIRE_2,
		 result => ADDR);


b2v_inst : lpm_constant1
PORT MAP(		 result => ADDRESS(17 DOWNTO 9));



PROCESS(SYS_CLK,SYNTHESIZED_WIRE_4,SYNTHESIZED_WIRE_3)
VARIABLE synthesized_var_for_SRFF_inst3 : STD_LOGIC;
BEGIN
IF (SYNTHESIZED_WIRE_4 = '0') THEN
	synthesized_var_for_SRFF_inst3 := '0';
ELSIF (SYNTHESIZED_WIRE_3 = '0') THEN
	synthesized_var_for_SRFF_inst3 := '1';
ELSIF (RISING_EDGE(SYS_CLK)) THEN
	synthesized_var_for_SRFF_inst3 := (NOT(synthesized_var_for_SRFF_inst3) AND SRT_IN) OR (synthesized_var_for_SRFF_inst3 AND (NOT(SYNTHESIZED_WIRE_5)));
END IF;
	SRFF_inst3 <= synthesized_var_for_SRFF_inst3;
END PROCESS;



b2v_inst4 : lpm_constant2
PORT MAP(		 result => ADDRESS(8 DOWNTO 0));


b2v_ROW_TRANSFER_COUNTER : lpm_counter1
PORT MAP(sclr => RESET,
		 clock => HSYNC_IN,
		 q => SYNTHESIZED_WIRE_0);


b2v_SRT_COL_START : lpm_constant0
PORT MAP(		 result => SYNTHESIZED_WIRE_1);


b2v_STATE_MACHINE : scopevram
PORT MAP(clk => SYS_CLK,
		 reset => RESET,
		 cs => CS,
		 rw => RW,
		 srt => SRFF_inst3,
		 RAS => RAS,
		 CAS => CAS,
		 TRG => TRG,
		 WE => WE,
		 ACK => SYNTHESIZED_WIRE_5,
		 BUSY => BUSY,
		 AS => SYNTHESIZED_WIRE_2);

SYS_CLK <= CLK_IN;
RESET <= RESET_IN;
CS <= CS_IN;
RW <= RW_IN;

END bdf_type;