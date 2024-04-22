-- Whistle sound generator for Atari Canyon Bomber
-- Produces a descending slide whistle sound for the falling bomb shells
-- (c) 2018 James Sweet

--
-- This is free software: you can redistribute
-- it and/or modify it under the terms of the GNU General
-- Public License as published by the Free Software
-- Foundation, either version 3 of the License, or (at your
-- option) any later version.
--
-- This is distributed in the hope that it will
-- be useful, but WITHOUT ANY WARRANTY; without even the
-- implied warranty of MERCHANTABILITY or FITNESS FOR A
-- PARTICULAR PURPOSE. See the GNU General Public License
-- for more details.

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity whistle is 
generic(
			constant Freq_tune : integer := 50 -- Value from 0-100 used to tune the overall whistle sound frequency
			);
port(		
			clk_12				: in  std_logic;  
			Ena_3k			: in  std_logic;	-- Saves some logic since this signal is already used elsewhere
			Whistle_trig	: in  std_logic;  -- Active-high trigger for whistle sound
			Whistle_out		: out std_logic_vector(3 downto 0)	-- Whistle output 
			);
end whistle;

architecture rtl of whistle is

signal Ramp_Count 			: integer range 0 to 80000;
signal Ramp_term				: integer range 1 to 80000;
signal Pitch_bend				: integer range 0 to 30000;
signal Whistle_bit			: std_logic;

begin
-- The real hardware used a R-C circuit to pull the control voltage of a 555, bending the pitch 
-- downward as a capacitor discharges through a resistor. This simulates that functionality by
-- incrementing a value on each cycle of ena_3k, this value is then used to alter the frequency
-- of the whistle.
RC_pitchbend: process(clk_12, ena_3k, Whistle_trig)
begin
	if Whistle_trig = '0' then
		Pitch_bend <= 0;
	elsif rising_edge(clk_12) then
		if ena_3k = '1' then
			if Pitch_bend < 30000 then
				Pitch_bend <= pitch_bend + 1;
			end if;
		end if;
	end if;
end process;


-- Ramp_term terminates the ramp count, the higher this value, the longer the ramp will count up and the lower
-- the frequency. This is a constant which can be adjusted by changing the value of freq_tune, here a setting of
-- 0 to 100 results in a ramp_term value ranging from 1000 to 3000 to simulate the function of the frequency 
-- adjustment pot in the original hardware.
Ramp_term <= (2800 - (20 * Freq_tune))*2;

-- Variable frequency oscillator roughly approximating the function of a 555 astable oscillator
Ramp_osc: process(clk_12, pitch_bend)
begin
	if rising_edge(clk_12) then
		Ramp_count <= Ramp_count + 1;
		if Ramp_count > Ramp_term + Pitch_bend / 2 then
			Ramp_count <= 0;
			Whistle_bit <= (not Whistle_bit);
		end if;
	end if;
end process;
-- Whistle_out is 4 bits wide, the active value can be adjusted to tune the volume level
Whistle_out <= "0011" when Whistle_bit = '1' and Whistle_trig = '1' else "0000";

end rtl;