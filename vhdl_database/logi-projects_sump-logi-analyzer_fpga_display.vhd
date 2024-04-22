----------------------------------------------------------------------------------
-- display.vhd
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
-- Provides 7 segment display multiplexing.
-- No encoding is performed. Input will be displayed in raw format.
-- This allows to display 32bit on the on-board 4 digit display.
-- (The dot serves as 8th bit.)
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity display is
    Port ( data : in  STD_LOGIC_VECTOR (31 downto 0);
			  clock : in STD_LOGIC;
           an : inout std_logic_vector (3 downto 0);
           segment : out  STD_LOGIC_VECTOR (7 downto 0));
end display;

architecture Behavioral of display is

signal counter : STD_LOGIC_VECTOR (17 downto 0);

begin
	an(0) <= counter(17) or counter(16);
	an(1) <= counter(17) or not counter(16);
	an(2) <= not counter(17) or counter(16);
	an(3) <= not counter(17) or not counter(16);

	segment(0) <= not ((an(0) or data(0)) and (an(1) or data( 8)) and (an(2) or data(16)) and (an(3) or data(24)));
	segment(1) <= not ((an(0) or data(1)) and (an(1) or data( 9)) and (an(2) or data(17)) and (an(3) or data(25)));
	segment(2) <= not ((an(0) or data(2)) and (an(1) or data(10)) and (an(2) or data(18)) and (an(3) or data(26)));
	segment(3) <= not ((an(0) or data(3)) and (an(1) or data(11)) and (an(2) or data(19)) and (an(3) or data(27)));
	segment(4) <= not ((an(0) or data(4)) and (an(1) or data(12)) and (an(2) or data(20)) and (an(3) or data(28)));
	segment(5) <= not ((an(0) or data(5)) and (an(1) or data(13)) and (an(2) or data(21)) and (an(3) or data(29)));
	segment(6) <= not ((an(0) or data(6)) and (an(1) or data(14)) and (an(2) or data(22)) and (an(3) or data(30)));
	segment(7) <= not ((an(0) or data(7)) and (an(1) or data(15)) and (an(2) or data(23)) and (an(3) or data(31)));

	process(clock)
	begin
		if rising_edge(clock) then
			counter <= counter + 1;
		end if;
	end process;
end Behavioral;

