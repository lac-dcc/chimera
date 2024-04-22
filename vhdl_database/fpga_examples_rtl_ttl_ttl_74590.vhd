-- -----------------------------------------------------------------------
--
-- Syntiac VHDL support files.
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2020 by Peter Wendrich (pwsoft@syntiac.com)
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
-- 8-bit binary counter with output register; 3-state
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use work.ttl_pkg.all;

-- -----------------------------------------------------------------------

entity ttl_74590 is
	generic (
		latency : integer := 3
	);
	port (
		emuclk : in std_logic;

		p1  : out ttl_t;  -- Q1
		p2  : out ttl_t;  -- Q2
		p3  : out ttl_t;  -- Q3
		p4  : out ttl_t;  -- Q4
		p5  : out ttl_t;  -- Q5
		p6  : out ttl_t;  -- Q6
		p7  : out ttl_t;  -- Q7

		p9  : out ttl_t;  -- RCOn

		p10 : in ttl_t;   -- MRCn (counter reset)
		p11 : in ttl_t;   -- CPC  (counter clock)
		p12 : in ttl_t;   -- CEn  (clock enable of CPC)
		p13 : in ttl_t;   -- CPR  (output register clock)
		p14 : in ttl_t;   -- OEn
		p15 : out ttl_t   -- Q0
	);
end entity;

architecture rtl of ttl_74590 is
	signal cpc_ena : std_logic;
	signal cpr_ena : std_logic;
	signal p1_loc : ttl_t;
	signal p2_loc : ttl_t;
	signal p3_loc : ttl_t;
	signal p4_loc : ttl_t;
	signal p5_loc : ttl_t;
	signal p6_loc : ttl_t;
	signal p7_loc : ttl_t;
	signal p9_loc : ttl_t;
	signal p15_loc : ttl_t;
	signal counter_reg : unsigned(7 downto 0) := (others => '0');
	signal output_reg : unsigned(7 downto 0) := (others => '0');
begin
	cpc_edge_inst : entity work.ttl_edge
		port map (emuclk => emuclk, edge => '1', d => p11, ena => cpc_ena);
	cpr_edge_inst : entity work.ttl_edge
		port map (emuclk=> emuclk, edge => '1', d => p13, ena => cpr_ena);

	p1_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p1_loc, q => p1);
	p2_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p2_loc, q => p2);
	p3_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p3_loc, q => p3);
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
	p15_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p15_loc, q => p15);

	p1_loc <= std2ttl(output_reg(1));
	p2_loc <= std2ttl(output_reg(2));
	p3_loc <= std2ttl(output_reg(3));
	p4_loc <= std2ttl(output_reg(4));
	p5_loc <= std2ttl(output_reg(5));
	p6_loc <= std2ttl(output_reg(6));
	p7_loc <= std2ttl(output_reg(7));
	p9_loc <= ZERO when counter_reg = X"FF" else ONE;
	p15_loc <= std2ttl(output_reg(0));

	process(emuclk)
	begin
		if rising_edge(emuclk) then
			if (cpc_ena = '1') and is_low(p12) then
				counter_reg <= counter_reg + 1;
			end if;
			if cpr_ena = '1' then
				output_reg <= counter_reg;
			end if;
			if is_low(p10) then
				-- Asynchronous reset, clears counter but not the output register
				counter_reg <= (others => '0');
			end if;
		end if;
	end process;
end architecture;
