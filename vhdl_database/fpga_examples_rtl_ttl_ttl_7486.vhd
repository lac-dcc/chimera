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
-- Quad 2-input EXOR gate
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use work.ttl_pkg.all;

-- -----------------------------------------------------------------------

entity ttl_7486 is
	generic (
		latency : integer := 1
	);
	port (
		emuclk : in std_logic;

		p1 : in ttl_t;
		p2 : in ttl_t;
		p3 : out ttl_t;

		p4 : in ttl_t;
		p5 : in ttl_t;
		p6 : out ttl_t;

		p8 : out ttl_t;
		p9 : in ttl_t;
		p10 : in ttl_t;

		p11 : out ttl_t;
		p12 : in ttl_t;
		p13 : in ttl_t
	);
end entity;

architecture rtl of ttl_7486 is
	signal p3_loc : ttl_t;
	signal p6_loc : ttl_t;
	signal p8_loc : ttl_t;
	signal p11_loc : ttl_t;
begin
	p3_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p3_loc, q => p3);
	p6_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p6_loc, q => p6);
	p8_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p8_loc, q => p8);
	p11_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p11_loc, q => p11);

	p3_loc <= p1 xor p2;
	p6_loc <= p4 xor p5;
	p8_loc <= p9 xor p10;
	p11_loc <= p12 xor p13;
end architecture;
