----------------------------------------------------------------------------------
-- sampler.vhd
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
-- Produces samples from input applying a programmable divider to the clock.
-- Sampling rate can be calculated by:
--
--     r = f / (d + 1)
--
-- Where r is the sampling rate, f is the clock frequency and d is the value
-- programmed into the divider register.
--
-- As of version 0.6 sampling on an external clock is also supported. If external
-- is set '1', the external clock will be used to sample data. (Divider is
-- ignored for this.)
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sampler is
    Port ( input : in  STD_LOGIC_VECTOR (31 downto 0);	-- 32 input channels
           clock : in  STD_LOGIC;								-- internal clock
			  exClock : in std_logic;								-- external clock
			  external : in std_logic;								-- clock selection
           data : in  STD_LOGIC_VECTOR (23 downto 0);		-- configuration data
           wrDivider : in  STD_LOGIC;							-- write divider register
           sample : out  STD_LOGIC_VECTOR (31 downto 0);	-- sampled data
           ready : out  STD_LOGIC;								-- new sample ready
			  ready50 : out std_logic);							-- low rate sample signal with 50% duty cycle
end sampler;

architecture Behavioral of sampler is

signal divider, counter : std_logic_vector (23 downto 0);
signal lastExClock, syncExClock : std_logic;

begin

	-- sample data
	process(clock)
	begin
		if rising_edge(clock) then
			syncExClock <= exClock;

			if wrDivider = '1' then
				divider <= data(23 downto 0);
				counter <= (others => '0');
				ready <= '0';

			elsif external = '1' then
				if syncExClock = '0' and lastExClock = '1' then
--					sample <= input(31 downto 10) & exClock & lastExClock & input(7 downto 0);
					ready <= '1';
				else
					sample <= input;
					ready <= '0';
				end if;
				lastExClock <= syncExClock;

			elsif counter = divider then
				sample <= input;
				counter <= (others => '0');
				ready <= '1';
				
			else
				counter <= counter + 1;
				ready <= '0';

			end if;
		end if;
	end process;

	-- generate ready50 50% duty cycle sample signal
	process(clock)
	begin
		if rising_edge(clock) then
			if counter = divider then
				ready50 <= '1';
			elsif counter(22 downto 0) = divider(23 downto 1) then
				ready50 <= '0';
			end if;
		end if;
	end process;

end Behavioral;

