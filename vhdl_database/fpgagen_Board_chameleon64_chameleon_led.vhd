-- -----------------------------------------------------------------------
--
-- Turbo Chameleon
--
-- Multi purpose FPGA expansion for the Commodore 64 computer
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2011 by Peter Wendrich (pwsoft@syntiac.com)
-- All Rights Reserved.
--
-- Your allowed to re-use this file for non-commercial applications
-- developed for the Turbo Chameleon 64 cartridge. Either open or closed
-- source whatever might be required by other licenses.
--
-- http://www.syntiac.com/chameleon.html
-- -----------------------------------------------------------------------
--
-- LED blinker. Blink frequency 2 Hz
--
-- -----------------------------------------------------------------------
-- clk       - system clock input
-- clk_1khz  - 1 Khz clock input
-- led_on    - if high the LED is on
-- led_blink - if high the LED is blinking
-- led       - led output (high is on) 2hz
-- led_1hz   - led output 1 hz
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- -----------------------------------------------------------------------

entity chameleon_led is
	port (
		clk : in std_logic;
		clk_1khz : in std_logic;
		
		led_on : in std_logic;
		led_blink : in std_logic;
		led : out std_logic;
		led_1hz : out std_logic
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of chameleon_led is
	signal count : unsigned(9 downto 0);
begin
	led <= count(8);
	led_1hz <= count(9);

	process(clk)
	begin
		if rising_edge(clk) then
			if clk_1khz = '1' then
				count <= count + 1;
			end if;
			if led_blink = '0' then
				count(8) <= led_on;
				count(9) <= led_on;
			end if;					
		end if;
	end process;
end architecture;
