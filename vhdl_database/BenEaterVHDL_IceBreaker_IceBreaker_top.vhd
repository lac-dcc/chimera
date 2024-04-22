--
-- Based on Ben Eater's build of the SAP breadboard computer and his excellent videos.
-- https://eater.net/
--
-- Copyright (c) 2017 Ken Jordan
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
-- 
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portxions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- IceBrreaker FPGA hook-up is as follows:
--
-- Green LED = CPU clock tick (C_TARGET_HZ)
-- Red LED   = CPU halted
-- UBUTTON   = CPU reset
--
-- PMOD1A (top right side) IceBreaker dual 7-Segment PMOD (C_PMOD1A_7SEG)
-- PMOD1B (bottom right side) 8 individual LEDs (C_PMOD1B_8LED)
-- PMOD2 (built-in PMOD) LEDs and buttons

ENTITY IceBreaker_top IS
	generic
	(
		C_SYSTEM_HZ		:	integer	:= 12_000_000;	-- master clock (in Hz)
		C_TARGET_HZ		:	integer := 5;			-- speed of "slow" clock in Hz used by CPU
													-- needs to be slow enough for CPU trace over UART
		C_BPS			:	integer := 115_200;		-- initial baud rate										
		C_AUTOBAUD		:	boolean := false;		-- use RX bit interval to set baud rate	(type 'U' for best results)
		
		C_PMOD1A_7SEG	:	boolean	:= true;		-- IceBreaker 7-segment PMOD on port PMOD1A
		C_PMOD1B_8LED	:	boolean	:= true			-- 8-LED output PMOD on port PMOD1B (e.g., Digilent 8LD)
	);

	PORT(
		clk			: IN 	STD_LOGIC;
		TX			: OUT	STD_LOGIC;	-- UART TX out (for CPU "trace")
		RX			: IN	STD_LOGIC;	-- UART RX in (for CPU "trace" C_AUTOBAUD)
		BTN_N		: IN	STD_LOGIC;	-- RESET button
		LEDR_N		: OUT	STD_LOGIC;	-- Red LED = CPU slow clock
		LEDG_N		: OUT	STD_LOGIC;	-- Green LED = CPU halt
		P1A1		: OUT	STD_LOGIC;	-- PMOD1A (7-segment) 
		P1A2		: OUT	STD_LOGIC;  
		P1A3		: OUT	STD_LOGIC;  
		P1A4		: OUT	STD_LOGIC;  
		P1A7		: OUT	STD_LOGIC;  
		P1A8		: OUT	STD_LOGIC;  
		P1A9		: OUT	STD_LOGIC;  
		P1A10		: OUT	STD_LOGIC;  
		P1B1		: OUT	STD_LOGIC;	--	PMOD1B (8 LEDs)
		P1B2		: OUT	STD_LOGIC;
		P1B3		: OUT	STD_LOGIC;
		P1B4		: OUT	STD_LOGIC;
		P1B7		: OUT	STD_LOGIC;
		P1B8		: OUT	STD_LOGIC;
		P1B9		: OUT	STD_LOGIC;
		P1B10		: OUT	STD_LOGIC;
		LED1		: OUT	STD_LOGIC;	-- PMOD2 middle LED = CPU halt
		LED2		: OUT	STD_LOGIC;	-- PMOD2 left LED = CPU halt
		LED3		: OUT	STD_LOGIC;	-- PMOD2 right LED = CPU halt
		LED4		: OUT	STD_LOGIC;	-- PMOD2 top LED = CPU halt
		LED5		: OUT	STD_LOGIC;	-- PMOD2 bottom LED = CPU halt
		BTN1		: IN	STD_LOGIC;	-- PMOD2 BTN 1 = PAUSE button
		BTN2		: IN	STD_LOGIC;	-- PMOD2 BTN 2 =
		BTN3		: IN	STD_LOGIC	-- PMOD2 BTN 3 =
	);
END IceBreaker_top;

ARCHITECTURE RTL of IceBreaker_top is

	CONSTANT cyc_per_clk	: INTEGER := (C_SYSTEM_HZ/C_TARGET_HZ)/2;

	SIGNAL	rst		: STD_LOGIC := '0';							-- asynchronous reset
	SIGNAL	clk_en	: STD_LOGIC := '0';							-- CPU clock enable (clock ignored if 0)
	SIGNAL	halt	: STD_LOGIC := '0';							-- CPU halted
	
	SIGNAL	cpu_out : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	
	SIGNAL	tx_o		: STD_LOGIC := '0';	
	SIGNAL	rx_i		: STD_LOGIC := '0';	
	
	SIGNAL	rst_btn_ff	: STD_LOGIC_VECTOR(1 downto 0) := "00";
	SIGNAL	rst_btn		: STD_LOGIC := '0';							-- asynchronous reset
	SIGNAL	user_btn_ff	: STD_LOGIC_VECTOR(1 downto 0) := "00";
	SIGNAL	user_btn	: STD_LOGIC := '0';
	
	SIGNAL	led		: STD_LOGIC := '0';
	
	SIGNAL	btn_count	: UNSIGNED(15 downto 0) := (others => '0');
	SIGNAL	cpu_count	: INTEGER RANGE 0 TO cyc_per_clk-1 := 0;
	SIGNAL	first_clk	: UNSIGNED(1 downto 0) := (others => '0');

BEGIN


	TX			<= tx_o;
	rx_i		<= RX;

	LEDG_N		<= NOT (led AND (NOT user_btn) AND (NOT halt));
	LEDR_N		<= NOT halt;
	
	LED1		<= '0';
	LED2		<= '0';
	LED3		<= '0';
	LED4		<= '0';
	LED5		<= '0';

	user_btn	<= user_btn_ff(1);
	rst_btn		<= rst_btn_ff(1);
	rst			<= '1'  when (first_clk /= "11") else rst_btn;

	btn_read: PROCESS(clk)
	BEGIN
		IF(rising_edge(clk)) THEN
			if (btn_count = 0) then
				user_btn_ff	<= user_btn_ff(0) & BTN1;
				rst_btn_ff	<= rst_btn_ff(0) & (NOT BTN_N);
				if (first_clk /= "11") then
					first_clk <= first_clk + 1;
				end if;
			END IF;
			btn_count <= btn_count - 1;
		end if;
	END PROCESS btn_read;

	slow_clk: PROCESS(clk, rst)
	BEGIN
		IF (rst = '1') THEN
			cpu_count	<= 0;
			led 		<= '0';
			clk_en 		<= '0';
		ELSIF(rising_edge(clk)) THEN
			clk_en <= '0';
			IF (cpu_count = 0) THEN
				cpu_count <= cyc_per_clk - 1;
				led <= NOT led;
				clk_en <= (NOT led) AND (not user_btn);
			else
				cpu_count <= cpu_count - 1;
			end if;
		END IF;
	END PROCESS slow_clk;

	sys: entity work.system
	generic map (
		C_SYSTEM_HZ => C_SYSTEM_HZ,
		C_BPS		=> C_BPS,
		C_AUTOBAUD	=> C_AUTOBAUD
	)
	port map(
		clk_i		=> clk, 
		clk_en_i	=> clk_en,
		rst_i		=> rst,
		out_o		=> cpu_out,
		halt_o		=> halt,
		tx_o		=> tx_o,
		rx_i		=> rx_i
	);
	
	PMOD1A: if (C_PMOD1A_7SEG) generate
		digitout: entity work.PMOD_7Seg
		port map(
			clk_i		=>	clk,
			number_i	=>	cpu_out,
			ledA_o		=>	P1A1,
			ledB_o		=>	P1A2,
			ledC_o		=>	P1A3,
			ledD_o		=>	P1A4,
			ledE_o		=>	P1A7,
			ledF_o		=>	P1A8,
			ledG_o		=>	P1A9,
			ledCA_o		=>	P1A10
		);
	end generate PMOD1A;

	PMOD1B: if (C_PMOD1B_8LED) generate
		P1B1		<= cpu_out(0);
		P1B2		<= cpu_out(1);
		P1B3		<= cpu_out(2);
		P1B4		<= cpu_out(3);
		P1B7		<= cpu_out(4);
		P1B8		<= cpu_out(5);
		P1B9		<= cpu_out(6);
		P1B10		<= cpu_out(7);
	end generate PMOD1B;

END ARCHITECTURE RTL;