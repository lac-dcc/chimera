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
-- 4-bit magnitude comparator
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use work.ttl_pkg.all;

-- -----------------------------------------------------------------------

entity ttl_7485 is
	generic (
		latency : integer := 3
	);
	port (
		emuclk : in std_logic;

		p2 : in ttl_t;   -- I A<B
		p3 : in ttl_t;   -- I A=B
		p4 : in ttl_t;   -- I A>B

		p5 : out ttl_t;  -- Q A>B
		p6 : out ttl_t;  -- Q A=B
		p7 : out ttl_t;  -- Q A<B

		p10 : in ttl_t;  -- A0
		p12 : in ttl_t;  -- A1
		p13 : in ttl_t;  -- A2
		p15 : in ttl_t;  -- A3

		p9 : in ttl_t;   -- B0
		p11 : in ttl_t;  -- B1
		p14 : in ttl_t;  -- B2
		p1  : in ttl_t   -- B3

	);
end entity;

architecture rtl of ttl_7485 is
	signal p5_loc : ttl_t;
	signal p6_loc : ttl_t;
	signal p7_loc : ttl_t;

	signal a : unsigned(3 downto 0);
	signal b : unsigned(3 downto 0);
begin
	p5_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p5_loc, q => p5);
	p6_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p6_loc, q => p6);
	p7_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p7_loc, q => p7);

	a <= ttl2std(p15) & ttl2std(p13) & ttl2std(p12) & ttl2std(p10);
	b <= ttl2std(p1) & ttl2std(p14) & ttl2std(p11) & ttl2std(p9);

	p5_loc <=
		ONE when a>b else
		ONE when (a=b) and (is_low(p2) and is_low(p3) and is_high(p4)) else
		ONE when (a=b) and (is_low(p2) and is_low(p3) and is_low(p4)) else
		ZERO;
	p6_loc <=
		ONE when (a=b) and is_high(p3) else
		ZERO;
	p7_loc <=
		ONE when a<b else
		ONE when (a=b) and (is_high(p2) and is_low(p3) and is_low(p4)) else
		ONE when (a=b) and (is_low(p2) and is_low(p3) and is_low(p4)) else
		ZERO;
end architecture;
