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
-- 8-input NAND gate
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use work.ttl_pkg.all;

-- -----------------------------------------------------------------------

entity ttl_7430 is
	generic (
		latency : integer := 1
	);
	port (
		emuclk : in std_logic;

		p1  : in ttl_t;
		p2  : in ttl_t;
		p3  : in ttl_t;
		p4  : in ttl_t;
		p5  : in ttl_t;
		p6  : in ttl_t;
		p11 : in ttl_t;
		p12 : in ttl_t;
		p8  : out ttl_t
	);
end entity;

architecture rtl of ttl_7430 is
	signal p8_loc : ttl_t;
begin
	p8_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p8_loc, q => p8);

	p8_loc <= not(p1 and p2 and p3 and p4 and p5 and p6 and p11 and p12);
end architecture;
