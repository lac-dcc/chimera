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
-- Octal D-type transparent latch; 3-state
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use work.ttl_pkg.all;

-- -----------------------------------------------------------------------

entity ttl_74573 is
	generic (
		latency : integer := 2
	);
	port (
		emuclk : in std_logic;

		p1 : in ttl_t;   -- OEn

		p2 : in ttl_t;   -- D0
		p3 : in ttl_t;   -- D1
		p4 : in ttl_t;   -- D2
		p5 : in ttl_t;   -- D3
		p6 : in ttl_t;   -- D4
		p7 : in ttl_t;   -- D5
		p8 : in ttl_t;   -- D6
		p9 : in ttl_t;   -- D7

		p11 : in ttl_t;  -- LE

		p12 : out ttl_t; -- Q7
		p13 : out ttl_t; -- Q6
		p14 : out ttl_t; -- Q5
		p15 : out ttl_t; -- Q4
		p16 : out ttl_t; -- Q3
		p17 : out ttl_t; -- Q2
		p18 : out ttl_t; -- Q1
		p19 : out ttl_t  -- Q0
	);
end entity;

architecture rtl of ttl_74573 is
	signal p12_loc : ttl_t;
	signal p13_loc : ttl_t;
	signal p14_loc : ttl_t;
	signal p15_loc : ttl_t;
	signal p16_loc : ttl_t;
	signal p17_loc : ttl_t;
	signal p18_loc : ttl_t;
	signal p19_loc : ttl_t;
	signal latch_reg : unsigned(7 downto 0) := (others => '0');
begin
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
	p16_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p16_loc, q => p16);
	p17_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p17_loc, q => p17);
	p18_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p18_loc, q => p18);
	p19_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p19_loc, q => p19);

	p12_loc <= FLOAT when is_high(p1) else std2ttl(latch_reg(7));
	p13_loc <= FLOAT when is_high(p1) else std2ttl(latch_reg(6));
	p14_loc <= FLOAT when is_high(p1) else std2ttl(latch_reg(5));
	p15_loc <= FLOAT when is_high(p1) else std2ttl(latch_reg(4));
	p16_loc <= FLOAT when is_high(p1) else std2ttl(latch_reg(3));
	p17_loc <= FLOAT when is_high(p1) else std2ttl(latch_reg(2));
	p18_loc <= FLOAT when is_high(p1) else std2ttl(latch_reg(1));
	p19_loc <= FLOAT when is_high(p1) else std2ttl(latch_reg(0));

	process(emuclk)
	begin
		if rising_edge(emuclk) then
			if is_high(p11) then
				latch_reg(0) <= ttl2std(p2);
				latch_reg(1) <= ttl2std(p3);
				latch_reg(2) <= ttl2std(p4);
				latch_reg(3) <= ttl2std(p5);
				latch_reg(4) <= ttl2std(p6);
				latch_reg(5) <= ttl2std(p7);
				latch_reg(6) <= ttl2std(p8);
				latch_reg(7) <= ttl2std(p9);
			end if;
		end if;
	end process;
end architecture;
