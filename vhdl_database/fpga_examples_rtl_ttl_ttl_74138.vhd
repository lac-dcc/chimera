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
-- 3 to 8 line demultiplexer
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use work.ttl_pkg.all;

-- -----------------------------------------------------------------------

entity ttl_74138 is
	generic (
		latency : integer := 2
	);
	port (
		emuclk : in std_logic;

		p1 : in ttl_t; -- S0
		p2 : in ttl_t; -- S1
		p3 : in ttl_t; -- S2

		p4 : in ttl_t; -- nE1
		p5 : in ttl_t; -- nE2
		p6 : in ttl_t; -- E3

		p15 : out ttl_t; -- nY0
		p14 : out ttl_t; -- nY1
		p13 : out ttl_t; -- nY2
		p12 : out ttl_t; -- nY3
		p11 : out ttl_t; -- nY4
		p10 : out ttl_t; -- nY5
		p9  : out ttl_t; -- nY6
		p7  : out ttl_t  -- nY7
	);
end entity;

architecture rtl of ttl_74138 is
	signal p7_loc : ttl_t;
	signal p9_loc : ttl_t;
	signal p10_loc : ttl_t;
	signal p11_loc : ttl_t;
	signal p12_loc : ttl_t;
	signal p13_loc : ttl_t;
	signal p14_loc : ttl_t;
	signal p15_loc : ttl_t;
begin
	p7_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p7_loc, q => p7);
	p9_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p9_loc, q => p9);
	p10_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p10_loc, q => p10);
	p11_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p11_loc, q => p11);
	p12_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p12_loc, q => p12);
	p13_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p13_loc, q => p13);
	p14_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p14_loc, q => p14);
	p15_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p15_loc, q => p15);

	p7_loc <= ZERO when is_high(p1) and is_high(p2) and is_high(p3) and is_low(p4) and is_low(p5) and is_high(p6) else ONE;
	p9_loc <= ZERO when is_low(p1) and is_high(p2) and is_high(p3) and is_low(p4) and is_low(p5) and is_high(p6) else ONE;
	p10_loc <= ZERO when is_high(p1) and is_low(p2) and is_high(p3) and is_low(p4) and is_low(p5) and is_high(p6) else ONE;
	p11_loc <= ZERO when is_low(p1) and is_low(p2) and is_high(p3) and is_low(p4) and is_low(p5) and is_high(p6) else ONE;
	p12_loc <= ZERO when is_high(p1) and is_high(p2) and is_low(p3) and is_low(p4) and is_low(p5) and is_high(p6) else ONE;
	p13_loc <= ZERO when is_low(p1) and is_high(p2) and is_low(p3) and is_low(p4) and is_low(p5) and is_high(p6) else ONE;
	p14_loc <= ZERO when is_high(p1) and is_low(p2) and is_low(p3) and is_low(p4) and is_low(p5) and is_high(p6) else ONE;
	p15_loc <= ZERO when is_low(p1) and is_low(p2) and is_low(p3) and is_low(p4) and is_low(p5) and is_high(p6) else ONE;
end architecture;
