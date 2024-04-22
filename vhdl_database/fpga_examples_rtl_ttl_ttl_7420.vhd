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
-- Dual 4-input NAND gate
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use work.ttl_pkg.all;


-- -----------------------------------------------------------------------

entity ttl_7420 is
	generic (
		latency : integer := 1
	);
	port (
		emuclk : in std_logic;

		p1 : in ttl_t;
		p2 : in ttl_t;
		p4 : in ttl_t;
		p5 : in ttl_t;
		p6 : out ttl_t;

		p9  : in ttl_t;
		p10 : in ttl_t;
		p12 : in ttl_t;
		p13 : in ttl_t;
		p8  : out ttl_t
	);
end entity;

architecture rtl of ttl_7420 is
	signal p6_loc : ttl_t;
	signal p8_loc : ttl_t;
begin
	p6_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p6_loc, q => p6);
	p8_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p8_loc, q => p8);

	p6_loc <= not(p1 and p2 and p4 and p5);
	p8_loc <= not(p9 and p10 and p12 and p13);
end architecture;
