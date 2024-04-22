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
-- Audio sigmadelta first order 1 bit converter
--
-- -----------------------------------------------------------------------
-- audioBits - Resolution of audio signal in bits
-- clk       - system clock
-- clkena    - system clock enable
-- d         - signed audio input
-- q         - sigma-delta bitstream output
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity audio_sigmadelta_dac is
	generic (
		audioBits : integer := 16
	);
	port (
		clk : in std_logic;
		clkena : in std_logic := '1';

		d : in signed(audioBits-1 downto 0);
		q : out std_logic
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of audio_sigmadelta_dac is
	signal accumulator : unsigned(d'high downto 0) := (others => '0');
begin
	process(clk)
		variable t : unsigned(d'length downto 0);
	begin
		if rising_edge(clk) then
			t := unsigned('0' & (not d(d'high)) & d(d'high-1 downto 0)) + ('0' & accumulator);
			if clkena = '1' then
				accumulator <= t(accumulator'range);
				q <= t(t'high);
			end if;
		end if;
	end process;
end architecture;


