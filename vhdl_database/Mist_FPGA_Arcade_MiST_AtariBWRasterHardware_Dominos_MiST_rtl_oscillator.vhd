-- Oscillator for Atari Dominos
-- Based on engine sound generator developed for Sprint 2
-- (c) 2018 James Sweet
--
-- Original circuit used a 555 configured as an astable oscillator with the frequency controlled by
-- a four bit binary value. The output of this oscillator drives a counter to divide down the frequency
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

entity Oscillator is 
generic(
			constant Freq_tune : integer := 50 -- Value from 0-100 used to tune the oscillator frequency
			);
port(		
			Clk_6		: in  std_logic; 
			Ena_3k		: in  std_logic;
			FreqData	: in  std_logic_vector(3 downto 0);
			output		: out std_logic
			);
end Oscillator;

architecture rtl of Oscillator is

signal Freq_val 		: integer range 1 to 350;
signal Ramp_term_unfilt		: integer range 1 to 80000;
signal Ramp_Count 		: integer range 0 to 80000;
signal Ramp_term		: integer range 1 to 80000;
signal Freq_mod			: integer range 0 to 400;
signal Osc_Clk			: std_logic;

signal Counter_A		: std_logic;
signal Counter_B 		: unsigned(2 downto 0);
signal Counter_A_clk		: std_logic;


begin

-- The frequency of the oscillator is set by a 4 bit binary value controlled by the game CPU
-- in the real hardware this is a 555 coupled to a 4 bit resistor DAC used to pull the frequency.
-- The output of this DAC has a capacitor to smooth out the frequency variation.
-- The constants assigned to Freq_val can be tweaked to adjust the frequency curve

Speed_select: process(Clk_6)
begin
	if rising_edge(Clk_6) then
		case FreqData is
			when "0000" => Freq_val <= 280;
			when "0001" => Freq_val <= 245;
			when "0010" => Freq_val <= 230;
			when "0011" => Freq_val <= 205;
			when "0100" => Freq_val <= 190;
			when "0101" => Freq_val <= 175;
			when "0110" => Freq_val <= 160;
			when "0111" => Freq_val <= 145;
		        when "1000" => Freq_val <= 130;
			when "1001" => Freq_val <= 115;
			when "1010" => Freq_val <= 100;
			when "1011" => Freq_val <= 85;
			when "1100" => Freq_val <= 70;
			when "1101" => Freq_val <= 55;
			when "1110" => Freq_val <= 40;
			when "1111" => Freq_val <= 25; 
		end case;
	end if;
end process;


-- There is a RC filter between the frequency control DAC and the 555 to smooth out the transitions between the
-- 16 possible states. We can simulate a reasonable approximation of that behavior using a linear slope which is
-- not truly accurate but should be close enough. Sprint used 10uF, Dominos uses only 0.1uF so the time constant
-- is much shorter.
RC_filt: process(clk_6, ena_3k, ramp_term_unfilt)
begin
	if rising_edge(clk_6) then
		if ena_3k = '1' then
			if ramp_term_unfilt > ramp_term then
				ramp_term <= ramp_term + 500;
			elsif ramp_term_unfilt = ramp_term then
				ramp_term <= ramp_term;
			else
				ramp_term <= ramp_term - 300;
			end if;
		end if;
	end if;
end process;


-- Ramp_term terminates the ramp count, the higher this value, the longer the ramp will count up and the lower
-- the frequency. Freq_val is multiplied by a constant which can be adjusted by changing the value of freq_tune
-- to simulate the function of the frequency adjustment pot in the original hardware.
ramp_term_unfilt <= ((200 - freq_tune) * Freq_val);

-- Variable frequency oscillator roughly approximating the function of a 555 astable oscillator
Ramp_osc: process(clk_6)
begin
	if rising_edge(clk_6) then
		Osc_Clk <= '1';
		ramp_count <= ramp_count + 1;
		if ramp_count > ramp_term then
			ramp_count <= 0;
			Osc_Clk <= '0';
		end if;
	end if;
end process;
		

-- 7492 counter has two sections, one div-by-2 and one div-by-6
-- Sprint uses this to generate the irregular thumping sound to simulate an engine
-- Dominos only uses div-by-6
Engine_counter: process(Osc_Clk, counter_A_clk, counter_B)
begin
	if rising_edge(Osc_Clk) then
		Counter_B <= Counter_B + '1';
	end if;
end process;
Output <= Counter_B(0);

end rtl;
