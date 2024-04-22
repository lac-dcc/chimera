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
-- 8-bit parallel-in and serial-out shift register
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use work.ttl_pkg.all;

-- -----------------------------------------------------------------------

entity ttl_74166 is
	generic (
		latency : integer := 2
	);
	port (
		emuclk : in std_logic;

		p1 : in ttl_t;  -- Serial input

		p2 : in ttl_t;  -- D0
		p3 : in ttl_t;  -- D1
		p4 : in ttl_t;  -- D2
		p5 : in ttl_t;  -- D3
		p10 : in ttl_t; -- D4
		p11 : in ttl_t; -- D5
		p12 : in ttl_t; -- D6
		p14 : in ttl_t; -- D7


		p6 : in ttl_t;  -- CEn
		p7 : in ttl_t;  -- CP
		p9 : in ttl_t;  -- MRn
		p15 : in ttl_t; -- PEn

		p13 : out ttl_t -- Q7
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of ttl_74166 is
	signal p13_loc : ttl_t;
	signal cp : std_logic;
	signal cp_dly : std_logic := '0';
	signal shift_reg : unsigned(7 downto 0) := (others => '0');
begin
	p13_latency_inst : entity work.ttl_latency
		generic map (latency => latency)
		port map (clk => emuclk, d => p13_loc, q => p13);

	cp <= ttl2std(p7);
	p13_loc <= std2ttl(shift_reg(7));
	process(emuclk)
	begin
		if rising_edge(emuclk) then
			cp_dly <= cp;
			if is_low(p9) then
				shift_reg <= (others => '0');
			elsif (cp = '1') and (cp_dly = '0') and is_low(p6) then
				if is_low(p15) then
					-- Parallel load
					shift_reg(0) <= ttl2std(p2);
					shift_reg(1) <= ttl2std(p3);
					shift_reg(2) <= ttl2std(p4);
					shift_reg(3) <= ttl2std(p5);
					shift_reg(4) <= ttl2std(p10);
					shift_reg(5) <= ttl2std(p11);
					shift_reg(6) <= ttl2std(p12);
					shift_reg(7) <= ttl2std(p14);
				else
					-- Serial shift
					shift_reg <= shift_reg(6 downto 0) & ttl2std(p1);
				end if;
			end if;
		end if;
	end process;
end architecture;
