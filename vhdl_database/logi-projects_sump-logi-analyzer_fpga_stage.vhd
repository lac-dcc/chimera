----------------------------------------------------------------------------------
-- stage.vhd
--
-- Copyright (C) 2006 Michael Poppitz
-- 
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or (at
-- your option) any later version.
--
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-- General Public License for more details.
--
-- You should have received a copy of the GNU General Public License along
-- with this program; if not, write to the Free Software Foundation, Inc.,
-- 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
--
----------------------------------------------------------------------------------
--
-- Details: http://www.sump.org/projects/analyzer/
--
-- Programmable 32 channel trigger stage. It can operate in serial
-- and parallel mode. In serial mode any of the input channels
-- can be used as input for the 32bit shift register. Comparison
-- is done using the value and mask registers on the input in
-- parallel mode and on the shift register in serial mode.
-- If armed and 'level' has reached the configured minimum value,
-- the stage will start to check for a match.
-- The match and run output signal delay can be configured.
-- The stage will disarm itself after a match occured or when reset is set.
--
-- The stage supports "high speed demux" operation in serial and parallel
-- mode. (Lower and upper 16 channels contain a 16bit sample each.)
--
-- Matching is done using a pipeline. This should not increase the minimum
-- time needed between two dependend trigger stage matches, because the
-- dependence is evaluated in the last pipeline step.
-- It does however increase the delay for the capturing process, but this
-- can easily be compensated by software.
-- (By adjusting the before/after ratio.)
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity stage is
    Port ( input : in  STD_LOGIC_VECTOR (31 downto 0);
           inputReady : in std_logic;
           data : in  STD_LOGIC_VECTOR (31 downto 0);
			  clock : in std_logic;
			  reset : in std_logic;
           wrMask : in  STD_LOGIC;
           wrValue : in  STD_LOGIC;
			  wrConfig : in STD_LOGIC;
			  arm : in std_logic;
           level : in  STD_LOGIC_VECTOR (1 downto 0);
			  demuxed : in std_logic;
           run : out  STD_LOGIC;
           match : out  STD_LOGIC
	);
end stage;

architecture Behavioral of stage is

type STATES is (OFF, ARMED, MATCHED);

signal	maskRegister, valueRegister, configRegister : STD_LOGIC_VECTOR (31 downto 0);
signal	intermediateRegister, shiftRegister : STD_LOGIC_VECTOR (31 downto 0);
signal	testValue: STD_LOGIC_VECTOR (31 downto 0);
signal	cfgStart, cfgSerial : std_logic;
signal	cfgChannel : std_logic_vector(4 downto 0);
signal	cfgLevel : std_logic_vector(1 downto 0);
signal	counter, cfgDelay : std_logic_vector(15 downto 0);
signal	matchL16, matchH16, match32Register : STD_LOGIC;
signal	state : STATES;
signal	serialChannelL16, serialChannelH16 : std_logic;

begin
	-- assign configuration bits to more meaningful signal names
	cfgStart <= configRegister(27);
	cfgSerial <= configRegister(26);
	cfgChannel <= configRegister(24 downto 20);
	cfgLevel <= configRegister(17 downto 16);
	cfgDelay <= configRegister(15 downto 0);

	-- use shift register or input depending on configuration
	testValue <= shiftRegister when cfgSerial = '1' else input;

	-- apply mask and value and create a additional pipeline step
	process(clock)
	begin
		if rising_edge(clock) then
			intermediateRegister <= (testValue xor valueRegister) and maskRegister;
		end if;
	end process;

	-- match upper and lower word separately
	matchL16 <= '1' when intermediateRegister(15 downto 0) = "0000000000000000" else '0';
	matchH16 <= '1' when intermediateRegister(31 downto 16) = "0000000000000000" else '0';

	-- in demux mode only one half must match, in normal mode both words must match
	process(clock)
	begin
		if rising_edge(clock) then
			if demuxed = '1' then
				match32Register <= matchL16 or matchH16;
			else 
				match32Register <= matchL16 and matchH16;
			end if;
		end if;
	end process;

	-- select serial channel based on cfgChannel
	process(input, cfgChannel)
	begin
		for i in 0 to 15 loop
			if conv_integer(cfgChannel(3 downto 0)) = i then
				serialChannelL16 <= input(i);
				serialChannelH16 <= input(i + 16);
			end if;
		end loop;
	end process;

	-- shift in bit from selected channel whenever input is ready
	process(clock)
	begin
		if rising_edge(clock) then
			if inputReady = '1' then
				if demuxed = '1' then -- in demux mode two bits come in per sample
					shiftRegister <= shiftRegister(29 downto 0) & serialChannelH16 & serialChannelL16;
				elsif cfgChannel(4) = '1' then
					shiftRegister <= shiftRegister(30 downto 0) & serialChannelH16;
				else
					shiftRegister <= shiftRegister(30 downto 0) & serialChannelL16;
				end if;
			end if;
		end if;
	end process;

	-- trigger state machine
	process(clock, reset)
	begin
		if reset = '1' then
			state <= OFF;
		elsif rising_edge(clock) then
			run <= '0';
			match <= '0';
			case state is

				when OFF =>
					if arm = '1' then
						state <= ARMED;
					end if;

				when ARMED =>
					if match32Register = '1' and level >= cfgLevel then
						counter <= cfgDelay;
						state <= MATCHED;
					end if;

				when MATCHED =>
					if inputReady = '1' then
						if counter = "0000000000000000" then
							run <= cfgStart;
							match <= not cfgStart;
							state <= OFF;
						else
							counter <= counter - 1;
						end if;
					end if;
					
			end case;
		end if;
	end process;
	
	-- handle mask, value & config register write requests
	process(clock) 
	begin
		if rising_edge(clock) then
			if wrMask = '1' then
				maskRegister <= data;
			end if;
			if wrValue = '1' then
				valueRegister <= data;
			end if;
			if wrConfig = '1' then
				configRegister <= data;
			end if;
		end if;
	end process;

end Behavioral;

