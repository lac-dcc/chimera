-- Tire screech sound generator for Kee Games Sprint 2 
-- (c) 2017 James Sweet
--
-- Original circuit used a 7414 Schmitt trigger oscillator operating at approximately
-- 1.2kHz producing a sawtooth with the frequency modulated slightly by the pseudo-random 
-- noise generator. This is an extension of work initially done in Verilog by Jonas Elofsson.
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

entity tire_screech is 
generic(
			constant Inc1 : integer := 24; -- These constants can be adjusted to tune the frequency and modulation
			constant Inc2 : integer := 34;
			constant Dec1 : integer := 23;
			constant Dec2 : integer := 12
			);
port(		
			Clk			: in  std_logic;  -- 750kHz from the horizontal line counter chain works well here
			Noise			: in	std_logic;  -- Output from LFSR pseudo-random noise generator
			Screech_out	: out std_logic	-- Screech output - single bit
			);
end tire_screech;

architecture rtl of tire_screech is

signal Screech_count	: integer range 1000 to 11000;
signal Screech_state	: std_logic;

begin

Screech: process(Clk, Screech_state)
begin
	if rising_edge(Clk) then
		if screech_state = '1' then -- screech_state is 1, counter is rising
			if noise = '1' then 	-- Noise signal from LFSR, when high increases the slope of the rising ramp
				screech_count <= screech_count + inc2;
			else 						-- When Noise is low, decreas the slope of the ramp
				screech_count <= screech_count + inc1; 
			end if;
			if screech_count > 10000 then -- Reverse the ramp direction when boundary value of 10,000 is reached
				screech_state <= '0';
			end if;
		elsif screech_state = '0' then -- screech_state is now low, decrement the counter (ramp down)
			if noise = '1' then 
				screech_count <= screech_count - dec2; -- Slope is influenced by the Noise signal
			else
				screech_count <= screech_count - dec1;
			end if;
			if screech_count < 1000 then -- Reverse the ramp direction again when the lower boundary of 1,000 is crossed
				screech_state <= '1';
			end if;
		end if;
	end if;
screech_out <= screech_state;
end process;

end rtl;