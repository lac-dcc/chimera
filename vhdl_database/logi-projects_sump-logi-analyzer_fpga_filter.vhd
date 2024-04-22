----------------------------------------------------------------------------------
-- filter.vhd
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
-- Fast 32 channel digital noise filter using a single LUT function for each
-- individual channel. It will filter out all pulses that only appear for half
-- a clock cycle. This way a pulse has to be at least 5-10ns long to be accepted
-- as valid. This is sufficient for sample rates up to 100MHz.
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity filter is
    Port ( input : in  STD_LOGIC_VECTOR (31 downto 0);
			  input180 : in  STD_LOGIC_VECTOR (31 downto 0);
			  clock : in std_logic;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end filter;

architecture Behavioral of filter is

signal input360, input180Delay, result : STD_LOGIC_VECTOR (31 downto 0);

begin

	process(clock)
	begin
		if rising_edge(clock) then
			-- determine next result
			for i in 31 downto 0 loop
				result(i) <= (result(i) or input360(i) or input(i)) and input180Delay(i);
			end loop;

			-- shift in input data
			input360 <= input;
			input180Delay <= input180;
		end if;
	end process;
	output <= result;

end Behavioral;
