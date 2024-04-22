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
-- Dual 2 to 4 line demultiplexer
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use work.ttl_pkg.all;

-- -----------------------------------------------------------------------

entity ttl_74139 is
	generic (
		latency : integer := 1
	);
	port (
		emuclk : in std_logic;

		p1 : in ttl_t;
		p2 : in ttl_t;
		p3 : in ttl_t;
		p4 : out ttl_t;
		p5 : out ttl_t;
		p6 : out ttl_t;
		p7 : out ttl_t;

		p9 : out ttl_t;
		p10 : out ttl_t;
		p11 : out ttl_t;
		p12 : out ttl_t;
		p13 : in ttl_t;
		p14 : in ttl_t;
		p15 : in ttl_t
	);
end entity;

architecture rtl of ttl_74139 is
	signal p4_loc : ttl_t;
	signal p5_loc : ttl_t;
	signal p6_loc : ttl_t;
	signal p7_loc : ttl_t;
	signal p9_loc : ttl_t;
	signal p10_loc : ttl_t;
	signal p11_loc : ttl_t;
	signal p12_loc : ttl_t;
begin
	p4_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p4_loc, q => p4);
	p5_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p5_loc, q => p5);
	p6_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p6_loc, q => p6);
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

	p4_loc <= p1 or p2 or p3;
	p5_loc <= p1 or (not p2) or p3;
	p6_loc <= p1 or p2 or (not p3);
	p7_loc <= p1 or (not p2) or (not p3);

	p9_loc <= p15 or (not p13) or (not p14);
	p10_loc <= p15 or (not p13) or p14;
	p11_loc <= p15 or p13 or (not p14);
	p12_loc <= p15 or p13 or p14;
end architecture;
