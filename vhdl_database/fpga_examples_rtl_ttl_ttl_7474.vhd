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
-- Dual positive-edge triggered D-type flip-flop with set and reset
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use work.ttl_pkg.all;

-- -----------------------------------------------------------------------

entity ttl_7474 is
	generic (
		latency : integer := 2
	);
	port (
		emuclk : in std_logic;

		p1 : in ttl_t;  -- Async nReset FF1
		p2 : in ttl_t;  -- D FF1
		p3 : in ttl_t;  -- CP clock FF1
		p4 : in ttl_t;  -- Async nSet FF1
		p5 : out ttl_t; -- Q FF1
		p6 : out ttl_t; -- nQ FF1

		p8 : out ttl_t; -- nQ FF2
		p9 : out ttl_t; -- Q FF2
		p10 : in ttl_t; -- Async nSet FF2
		p11 : in ttl_t; -- CP clock FF2
		p12 : in ttl_t; -- D FF2
		p13 : in ttl_t  -- Aync nReset FF2
	);
end entity;

architecture rtl of ttl_7474 is
	signal p5_loc : ttl_t := ZERO;
	signal p6_loc : ttl_t := ONE;
	signal p8_loc : ttl_t := ONE;
	signal p9_loc : ttl_t := ZERO;

	signal cp1 : std_logic;
	signal cp1_dly : std_logic;
	signal cp2 : std_logic;
	signal cp2_dly : std_logic;
begin
	p5_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p5_loc, q => p5);
	p6_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p6_loc, q => p6);
	p8_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p8_loc, q => p8);
	p9_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p9_loc, q => p9);

	cp1 <= ttl2std(p3);
	cp2 <= ttl2std(p11);

	process(emuclk)
	begin
		if rising_edge(emuclk) then
			cp1_dly <= cp1;
			if cp1 = '1' and cp1_dly = '0' then
				p5_loc <= p2;
				p6_loc <= not(p2);
			end if;
			if is_low(p4) then
				p5_loc <= ONE;
				p6_loc <= ZERO;
			end if;
			if is_low(p1) then
				if not is_low(p4) then
					p5_loc <= ZERO;
				end if;
				p6_loc <= ONE;
			end if;

			cp2_dly <= cp2;
			if cp2 = '1' and cp2_dly = '0' then
				p9_loc <= p12;
				p8_loc <= not(p12);
			end if;
			if is_low(p10) then
				p9_loc <= ONE;
				p8_loc <= ZERO;
			end if;
			if is_low(p13) then
				if not is_low(p10) then
					p9_loc <= ZERO;
				end if;
				p8_loc <= ONE;
			end if;
		end if;
	end process;
end architecture;
