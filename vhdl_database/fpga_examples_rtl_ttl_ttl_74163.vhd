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
-- Presettable synchronous 4-bit binary counter with synchronous reset
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use work.ttl_pkg.all;

-- -----------------------------------------------------------------------

entity ttl_74163 is
	generic (
		latency : integer := 3
	);
	port (
		emuclk : in std_logic;

		p1 : in ttl_t; -- MRn
		p2 : in ttl_t; -- CP

		p3 : in ttl_t; -- D0
		p4 : in ttl_t; -- D1
		p5 : in ttl_t; -- D2
		p6 : in ttl_t; -- D3

		p7 : in ttl_t;  -- CEP
		p9 : in ttl_t;   -- PEn
		p10 : in ttl_t;  -- CET

		p11 : out ttl_t; -- Q3
		p12 : out ttl_t; -- Q2
		p13 : out ttl_t; -- Q1
		p14 : out ttl_t; -- Q0
		p15 : out ttl_t  -- TC
	);
end entity;

architecture rtl of ttl_74163 is

	signal q0_reg : ttl_t := ZERO;
	signal q1_reg : ttl_t := ZERO;
	signal q2_reg : ttl_t := ZERO;
	signal q3_reg : ttl_t := ZERO;
	signal tc_reg : ttl_t := ZERO;
	signal cp : std_logic;
	signal cp_dly : std_logic := '0';
begin
	p11_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => q3_reg, q => p11);
	p12_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => q2_reg, q => p12);
	p13_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => q1_reg, q => p13);
	p14_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => q0_reg, q => p14);
	p15_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => tc_reg, q => p15);

	cp <= ttl2std(p2);

	process(emuclk)
	begin
		if rising_edge(emuclk) then
			cp_dly <= cp;
			if (cp = '1') and (cp_dly = '0') then
				if is_low(p1) then
					-- Master reset
					q0_reg <= ZERO;
					q1_reg <= ZERO;
					q2_reg <= ZERO;
					q3_reg <= ZERO;
				elsif is_low(p9) then
					-- Load constant
					q0_reg <= buffered(p3);
					q1_reg <= buffered(p4);
					q2_reg <= buffered(p5);
					q3_reg <= buffered(p6);
				elsif is_high(p7) and is_high(p10) then
					-- Count
					q0_reg <= not q0_reg;
					if is_high(q0_reg) then
						q1_reg <= not q1_reg;
					end if;
					if is_high(q0_reg) and is_high(q1_reg) then
						q2_reg <= not q2_reg;
					end if;
					if is_high(q0_reg) and is_high(q1_reg) and is_high(q2_reg) then
						q3_reg <= not q3_reg;
					end if;
					tc_reg <= ZERO;
					if is_low(q0_reg) and is_high(q1_reg) and is_high(q2_reg) and is_high(q3_reg) then
						tc_reg <= ONE;
					end if;
				end if;
			end if;
		end if;
	end process;
end architecture;
