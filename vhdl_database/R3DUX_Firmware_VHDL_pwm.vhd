-- Design Name: R3DUX
-- Module Name: PWM.VHD
-- Project Name: R3DUX. Open Source TX X3 CPLD replacement project
-- Target Devices: LC4256
--
-- the following were used as reference:
-- https://www.codeproject.com/Articles/513169/Servomotor-Control-with-PWM-and-VHDL
--https://www.digikey.com/eewiki/pages/viewpage.action?pageId=20939345&utm_adgroup=General&slid=&gclid=CjwKCAjwq4fsBRBnEiwANTahcFA1h-_3RCxEktKPKAfM_SAfjySeEVaQF4_AvyJxJqgoLXcbCN69nxoCjdEQAvD_BwE

-- Revision 1.0 - File Created - Aaron "Kekule" Van Tassle
--
-- Additional Comments:
-- R3DUX is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program. If not, see .


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY pwm IS
	PORT (
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		pos : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		brightness : OUT STD_LOGIC
	);
END pwm;

ARCHITECTURE Behavioral OF pwm IS
	-- Counter, from 0 to 1279.
	SIGNAL pwm_cnt : unsigned(10 DOWNTO 0);
	-- Counter from 0 to 2047 to divide clock
	SIGNAL clk_cnt : unsigned(10 DOWNTO 0);
	-- Temporal signal used to generate the PWM pulse.
	SIGNAL pwmi : unsigned(7 DOWNTO 0);
BEGIN
	-- Minimum value should be 0.5ms.
	pwmi <= unsigned(pos);--unsigned('0' & pos)+ 32; -- the & adds an extra bit making it 9
	-- Counter process, from 0 to 1279.
	counter : PROCESS (reset, clk) BEGIN
		IF (reset = '1') THEN
			pwm_cnt <= (OTHERS => '0');
			clk_cnt <= (OTHERS => '0');
		ELSIF rising_edge(clk) THEN
			IF (clk_cnt = 256) THEN -- divide clk by 2047 to ~16kHz
				clk_cnt <= (OTHERS => '0');
				--
				IF (pwm_cnt = 256) THEN --1279
					pwm_cnt <= (OTHERS => '0');
				ELSE
					pwm_cnt <= pwm_cnt + 1;
				END IF; -- end PWM counter
				ELSE
				clk_cnt <= clk_cnt + 1;
			
			END IF; -- end clk divider
		END IF;
	END PROCESS;
	-- Output signal for the backlight mosfet.
	brightness <= '0' WHEN (pwm_cnt < pwmi) ELSE '1';
END Behavioral;
