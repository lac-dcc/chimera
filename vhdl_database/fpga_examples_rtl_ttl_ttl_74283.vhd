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
-- 4-bit binary full adder with fast carry
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use work.ttl_pkg.all;

-- -----------------------------------------------------------------------

entity ttl_74283 is
	generic (
		latency : integer := 2
	);
	port (
		emuclk : in std_logic;

		p1  : out ttl_t; -- Sum 2
		p2  : in ttl_t;  -- B2
		p3  : in ttl_t;  -- A2
		p4  : out ttl_t; -- Sum 1
		p5  : in ttl_t;  -- A1
		p6  : in ttl_t;  -- B1
		p7  : in ttl_t;  -- C0

		p9  : out ttl_t; -- C4
		p10 : out ttl_t; -- Sum 4
		p11 : in ttl_t;  -- B4
		p12 : in ttl_t;  -- A4
		p13 : out ttl_t; -- Sum 3
		p14 : in ttl_t;  -- A3
		p15 : in ttl_t   -- B3
	);
end entity;

architecture rtl of ttl_74283 is
	signal p1_loc : ttl_t;
	signal p4_loc : ttl_t;
	signal p9_loc : ttl_t;
	signal p10_loc : ttl_t;
	signal p13_loc : ttl_t;

	signal a : unsigned(3 downto 0);
	signal b : unsigned(3 downto 0);
	signal c : unsigned(0 downto 0);
	signal adder_reg : unsigned(4 downto 0) := (others => '0');
begin
	p1_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p1_loc, q => p1);
	p4_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p4_loc, q => p4);
	p9_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p9_loc, q => p9);
	p10_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p10_loc, q => p10);
	p13_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p13_loc, q => p13);

	-- Adder inputs
	a(0) <= ttl2std(p5);
	a(1) <= ttl2std(p3);
	a(2) <= ttl2std(p14);
	a(3) <= ttl2std(p12);
	b(0) <= ttl2std(p6);
	b(1) <= ttl2std(p2);
	b(2) <= ttl2std(p15);
	b(3) <= ttl2std(p11);
	c(0) <= ttl2std(p7);

	-- Adder results
	p1_loc <= std2ttl(adder_reg(1));
	p4_loc <= std2ttl(adder_reg(0));
	p9_loc <= std2ttl(adder_reg(4));
	p10_loc <= std2ttl(adder_reg(3));
	p13_loc <= std2ttl(adder_reg(2));

	process(emuclk)
	begin
		if rising_edge(emuclk) then
			adder_reg <= ("0" & a) + ("0" & b) + ("0000" & c);
		end if;
	end process;
end architecture;
