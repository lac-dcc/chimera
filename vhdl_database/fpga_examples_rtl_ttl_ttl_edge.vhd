-- -----------------------------------------------------------------------
--
-- Syntiac VHDL support files.
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2018 by Peter Wendrich (pwsoft@syntiac.com)
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
-- Clock edge detector
-- -----------------------------------------------------------------------
-- emuclk - Emulation clock
-- edge   - Which edge to detect 0 is falling, 1 is rising
-- d      - Input signal to sample
-- ena    - One clock high when edge has been detected
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use work.ttl_pkg.all;

-- -----------------------------------------------------------------------

entity ttl_edge is
	port (
		emuclk : in std_logic;

		edge: in std_logic;
		d : in ttl_t;
		ena : out std_logic
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of ttl_edge is
	signal d_dly : std_logic := '0';
begin
	ena <=
		'1' when edge = '0' and is_low(d) and d_dly = '1' else
		'1' when edge = '1' and is_high(d) and d_dly = '0' else
		'0';

	process(emuclk)
	begin
		if rising_edge(emuclk) then
			d_dly <= ttl2std(d);
		end if;
	end process;
end architecture;
