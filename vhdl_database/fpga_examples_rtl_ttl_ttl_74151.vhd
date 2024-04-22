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
-- 8-input multiplexer
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use work.ttl_pkg.all;

-- -----------------------------------------------------------------------

entity ttl_74151 is
	generic (
		latency : integer := 3
	);
	port (
		emuclk : in std_logic;

		p4  : in ttl_t; -- I0
		p3  : in ttl_t; -- I1
		p2  : in ttl_t; -- I2
		p1  : in ttl_t; -- I3
		p15 : in ttl_t; -- I4
		p14 : in ttl_t; -- I5
		p13 : in ttl_t; -- I6
		p12 : in ttl_t; -- I7

		p7  : in ttl_t; -- nEnable
		p11 : in ttl_t; -- S0
		p10 : in ttl_t; -- S1
		p9  : in ttl_t; -- S2

		p5 : out ttl_t; -- Y
		p6 : out ttl_t  -- nY
	);
end entity;

architecture rtl of ttl_74151 is
	signal p5_loc : ttl_t;
	signal p6_loc : ttl_t;
begin
	p5_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p5_loc, q => p5);
	p6_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p6_loc, q => p6);


	p5_loc <=
		ZERO when is_high(p7) else
		buffered(p4) when is_low(p9) and is_low(p10) and is_low(p11) else
		buffered(p3) when is_low(p9) and is_low(p10) and is_high(p11) else
		buffered(p2) when is_low(p9) and is_high(p10) and is_low(p11) else
		buffered(p1) when is_low(p9) and is_high(p10) and is_high(p11) else
		buffered(p15) when is_high(p9) and is_low(p10) and is_low(p11) else
		buffered(p14) when is_high(p9) and is_low(p10) and is_high(p11) else
		buffered(p13) when is_high(p9) and is_high(p10) and is_low(p11) else
		buffered(p12);
	p6_loc <= not(p5_loc);
end architecture;
