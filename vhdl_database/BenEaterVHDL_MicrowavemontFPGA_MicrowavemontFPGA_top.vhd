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
-- copies or substantial portions of the Software.
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


-- MicrowavemontFPGA hook-up is as follows:
--
-- LED 1-8 are "output" register of CPU (LSB on right)
-- Pin SDA is 9600 baud 8N1 serial CPU trace output TX (use USB serial adapter)
-- Pin SCL is 9600 baud 8N1 serial RX input (optional, used to auto-set baud rate)
-- S1 is reset -- S2 is "wait" (will halt CPU clock while pressed)
-- left digit decimal point LED is clock (blicks with "slow" clock)
-- Right digit decimal point LED is halt (lights if CPU halted)

ENTITY Microwavemont_top IS
	generic
	(
		C_SYSTEM_HZ:	integer	:= 12_000_000;	-- master clock (in Hz)
		C_TARGET_HZ:	integer := 5;			-- speed of "slow" clock in Hz used by CPU
												-- needs to be low so CPU trace has time
		C_BPS:			integer := 9600;
		C_AUTOBAUD:		boolean	:= false			-- use RX bit interval to set baud rate	(type 'U' for best results)	
	);

	PORT(
		clk_12mhz	: IN	STD_LOGIC;
		led1		: OUT	STD_LOGIC;
		led2		: OUT	STD_LOGIC;
		led3		: OUT	STD_LOGIC;
		led4		: OUT	STD_LOGIC;
		led5		: OUT	STD_LOGIC;
		led6		: OUT	STD_LOGIC;
		led7		: OUT	STD_LOGIC;
		led8		: OUT	STD_LOGIC;
		ledneg		: OUT	STD_LOGIC;
		digit1neg	: OUT	STD_LOGIC;
		digit2neg	: OUT	STD_LOGIC;
		scl			: IN	STD_LOGIC;	-- RX (optional for auto baud set)
		sda			: OUT	STD_LOGIC;	-- TX (9600 N 1)
		sounder		: OUT	STD_LOGIC;
		btn1		: IN	STD_LOGIC;
		btn2		: IN	STD_LOGIC
	);
END Microwavemont_top;

ARCHITECTURE RTL of Microwavemont_top is

	SIGNAL	rst			: STD_LOGIC := '0';						-- asynchronous reset
	SIGNAL	clk			: STD_LOGIC := '0';						-- CPU clock
	SIGNAL	clk_en		: STD_LOGIC := '0';						-- CPU clock enable (clock ignored if 0)
	SIGNAL	halt		: STD_LOGIC := '0';						-- CPU halted

	SIGNAL	cpu_out		: STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

	SIGNAL	tx_o		: STD_LOGIC := '0';	
	SIGNAL	rx_i		: STD_LOGIC := '0';	
	
	SIGNAL	rst_btn_ff	: STD_LOGIC_VECTOR(1 downto 0) := "11";
	SIGNAL	rst_btn		: STD_LOGIC := '0';
	SIGNAL	user_btn_ff	: STD_LOGIC_VECTOR(1 downto 0) := "00";
	SIGNAL	user_btn	: STD_LOGIC := '0';

	SIGNAL	slowclk			: STD_LOGIC := '0';
	SIGNAL	blink			: STD_LOGIC := '0';

	CONSTANT cyc_per_clk	: INTEGER := (C_SYSTEM_HZ/C_TARGET_HZ)/2;

	SIGNAL	cpu_count	: INTEGER RANGE 0 TO cyc_per_clk-1;

	-- LEDs and 7-segment
	
	SIGNAL	segments	: STD_LOGIC_VECTOR(7 downto 0);			-- 7-segment segments (a, b, c, d, e, f, g, dp)

	SIGNAL	number		: STD_LOGIC_VECTOR(7 downto 0);		-- 8-bit number to display in hex
	SIGNAL	vled		: STD_LOGIC_VECTOR(7 downto 0);			-- "virtual" LEDs multiplexed with 7-segment onto real LEDs

	SIGNAL	decimal		: STD_LOGIC_VECTOR(1 downto 0);		-- true if digit is to be blanked (no segments lit)
	SIGNAL	digit		: UNSIGNED(1 downto 0);				-- bit to indicate which LED to activtate (0=seg1, 1=seg2, 2=dummy, 3=leds)

	SIGNAL	counter		: UNSIGNED (12 downto 0);				-- count to 0x1fff for ~= 1464Hz @ 12Mhz clock

BEGIN
	clk			<= clk_12mhz;
	sounder		<= '0';
	
	sda			<= tx_o;	-- make sure to hook GND to serial adapter GND also
	rx_i		<= scl;

	btn_read: PROCESS(clk)
	BEGIN
		IF(rising_edge(clk)) THEN
				user_btn <= user_btn_ff(1);
				rst_btn <= rst_btn_ff(1);
			user_btn_ff	<= user_btn_ff(0) & (NOT btn2);
			rst_btn_ff	<= rst_btn_ff(0) & (NOT btn1);
		end if;
	END PROCESS btn_read;

	rst			<= rst_btn;
	
	slow_clk: PROCESS(clk, rst)
	BEGIN
		IF(rst = '1') THEN
			cpu_count	<= 0;
			slowclk 		<= '0';
			clk_en <= '0';
		ELSE
			IF(rising_edge(clk)) THEN
				clk_en <= '0';
					IF (cpu_count = 0) THEN
					cpu_count <= cyc_per_clk - 1;
					slowclk <= NOT blink;
					clk_en <= (NOT slowclk) AND (NOT user_btn);
					else
						cpu_count <= cpu_count - 1;
					end if;
			END IF;
		END IF;
	END PROCESS slow_clk;

	sys: entity work.system
	generic map (
		C_SYSTEM_HZ	=> C_SYSTEM_HZ,
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
	
	blink <= slowclk AND (NOT halt);
			 
	sck	<= slowclk;
	sck	<= slowclk;

	leds: entity work.led_multiplex
	port map(
		clk			=> clk,
		number		=> cpu_out,
		vleds		=> cpu_out,
		decimal(1)	=> halt,
		decimal(0)	=> blink,
		led1		=> led1,
		led2		=> led2,		
		led3		=> led3,		
		led4		=> led4,		
		led5		=> led5,		
		led6		=> led6,		
		led7		=> led7,		
		led8		=> led8,		
		ledneg		=> ledneg,		
		digit1neg	=> digit1neg,	
		digit2neg	=> digit2neg	
	);
			
END ARCHITECTURE RTL;