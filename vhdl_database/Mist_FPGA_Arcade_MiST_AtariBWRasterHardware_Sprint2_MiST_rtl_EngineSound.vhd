-- Motor sound generator for Kee Games Sprint 2 
-- Similar circuits are used in a number of other games
-- (c) 2017 James Sweet
--
-- Original circuit used a 555 configured as an astable oscillator with the frequency controlled by
-- a four bit binary value. The output of this oscillator drives a counter configured to produce an
-- irregular thumping simulating the sound of an engine.
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

entity EngineSound is 
generic(
			constant Freq_tune : integer := 50 -- Value from 0-100 used to tune the overall engine sound frequency
			);
port(		
			Clk_6			: in  std_logic; 
			Ena_3k		: in  std_logic;
			EngineData	: in	std_logic_vector(3 downto 0);
			Motor			: out std_logic_vector(5 downto 0)
			);
end EngineSound;

architecture rtl of EngineSound is

signal RPM_val 				: integer range 1 to 350;
signal Ramp_term_unfilt		: integer range 1 to 80000;
signal Ramp_Count 			: integer range 0 to 80000;
signal Ramp_term				: integer range 1 to 80000;
signal Freq_mod				: integer range 0 to 400;
signal Motor_Clk				: std_logic;

signal Counter_A				: std_logic;
signal Counter_B 				: unsigned(2 downto 0);
signal Counter_A_clk			: std_logic;

signal Motor_prefilter 		: unsigned(1 downto 0);
signal Motor_filter_t1 		: unsigned(3 downto 0);
signal Motor_filter_t2 		: unsigned(3 downto 0);
signal Motor_filter_t3 		: unsigned(3 downto 0);
signal Motor_filtered		: unsigned(5 downto 0);


begin

-- The frequency of the oscillator is set by a 4 bit binary value controlled by the game CPU
-- in the real hardware this is a 555 coupled to a 4 bit resistor DAC used to pull the frequency.
-- The output of this DAC has a capacitor to smooth out the frequency variation.
-- The constants assigned to RPM_val can be tweaked to adjust the frequency curve

Speed_select: process(Clk_6)
begin
	if rising_edge(Clk_6) then
		case EngineData is
			when "0000" => RPM_val <= 280;
			when "0001" => RPM_val <= 245;
			when "0010" => RPM_val <= 230;
			when "0011" => RPM_val <= 205;
			when "0100" => RPM_val <= 190;
			when "0101" => RPM_val <= 175;
			when "0110" => RPM_val <= 160;
			when "0111" => RPM_val <= 145;
		   when "1000" => RPM_val <= 130;
			when "1001" => RPM_val <= 115;
			when "1010" => RPM_val <= 100;
			when "1011" => RPM_val <= 85;
			when "1100" => RPM_val <= 70;
			when "1101" => RPM_val <= 55;
			when "1110" => RPM_val <= 40;
			when "1111" => RPM_val <= 25; 
		end case;
	end if;
end process;


-- There is a RC filter between the frequency control DAC and the 555 to smooth out the transitions between the
-- 16 possible states. We can simulate a reasonable approximation of that behavior using a linear slope which is
-- not truly accurate but should be close enough.
RC_filt: process(clk_6, ena_3k, ramp_term_unfilt)
begin
	if rising_edge(clk_6) then
		if ena_3k = '1' then
			if ramp_term_unfilt > ramp_term then
				ramp_term <= ramp_term + 5;
			elsif ramp_term_unfilt = ramp_term then
				ramp_term <= ramp_term;
			else
				ramp_term <= ramp_term - 3;
			end if;
		end if;
	end if;
end process;


-- Ramp_term terminates the ramp count, the higher this value, the longer the ramp will count up and the lower
-- the frequency. RPM_val is multiplied by a constant which can be adjusted by changing the value of freq_tune
-- to simulate the function of the frequency adjustment pot in the original hardware.
ramp_term_unfilt <= ((200 - freq_tune) * RPM_val);

-- Variable frequency oscillator roughly approximating the function of a 555 astable oscillator
Ramp_osc: process(clk_6)
begin
	if rising_edge(clk_6) then
		motor_clk <= '1';
		ramp_count <= ramp_count + 1;
		if ramp_count > ramp_term then
			ramp_count <= 0;
			motor_clk <= '0';
		end if;
	end if;
end process;
		

-- 7492 counter with XOR on two of the outputs creates lumpy engine sound from smooth pulse train
-- 7492 has two sections, one div-by-2 and one div-by-6.
Engine_counter: process(motor_clk, counter_A_clk, counter_B)
begin
	if rising_edge(motor_clk) then
		Counter_B <= Counter_B + '1';
	end if;
	Counter_A_clk <= Counter_B(0) xor Counter_B(2);
	if rising_edge(counter_A_clk) then 
		Counter_A <= (not Counter_A);
	end if;
end process;
motor_prefilter <= ('0' & Counter_B(2)) + ('0' & Counter_B(1)) + ('0' & Counter_A);

-- Very simple low pass filter, borrowed from MikeJ's Asteroids code
Engine_filter: process(clk_6)
begin
	if rising_edge(clk_6) then
		if (ena_3k = '1') then
			motor_filter_t1 <= ("00" & motor_prefilter) + ("00" & motor_prefilter);
			motor_filter_t2 <= motor_filter_t1;
			motor_filter_t3 <= motor_filter_t2;
		end if;
		motor_filtered <= ("00" & motor_filter_t1) +
								('0'  & motor_filter_t2 & '0') +
								("00" & motor_filter_t3);
	end if;
end process;	

motor <= std_logic_vector(motor_filtered);

end rtl;