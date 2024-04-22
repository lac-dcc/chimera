-- -----------------------------------------------------------------------
--
-- Syntiac VHDL support files.
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2009 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com
--
-- This source file is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published
-- by the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This source file is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program. If not, see <http://www.gnu.org/licenses/>.
--
-- -----------------------------------------------------------------------
--
-- Video dither block. Converts high precision video signal to
-- lower precision by dithering. The dither input can for example
-- come from the current X and Y coordinates or a pseudo random source.
--
-- If bypass input is 1 the dither algorithm is disabled and the output
-- is equal to the input.
--
-- This component has a delay of one clock cycle.
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity video_dither is
	generic (
		dBits : integer := 8;
		qBits : integer := 5;
		ditherBits : integer := 4
	);
	port (
		clk : in std_logic;
		clkEna : in std_logic := '1';
		bypass : in std_logic := '0';

		dither : in unsigned(ditherBits-1 downto 0);
		d : in unsigned(dBits-1 downto 0);
		q : out unsigned(qBits-1 downto 0)
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of video_dither is
	constant tempBits : integer := qBits + ditherBits + 1;
begin
	process(clk)
		variable t : unsigned((tempBits-1) downto 0);
	begin
		if rising_edge(clk) then
			if clkEna = '1' then
				t := ("0" & d & to_unsigned(0, t'high-d'length)) + dither;
				if t(t'high) = '1' then
					q <= (others => '1');
				else
					q <= t((t'high-1) downto (t'high-qBits));
				end if;
				if bypass = '1' then
					q <= d(d'high downto (d'high-q'high));
				end if;
			end if;
		end if;
	end process;
end architecture;
