-- -----------------------------------------------------------------------
--
-- Turbo Chameleon
--
-- Multi purpose FPGA expansion for the Commodore 64 computer
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2021 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/chameleon.html
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
--
-- Part of the Gigatron emulator.
-- SRAM emulation mapped to FPGA blockram.
--
-- -----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- -----------------------------------------------------------------------

entity gigatron_ram is
	generic (
		abits : integer := 15;
		dbits : integer := 8
	);
	port (
		clk : in std_logic;

		we : in std_logic;
		a : in unsigned(abits-1 downto 0);
		d : in unsigned(dbits-1 downto 0);
		q : out unsigned(dbits-1 downto 0)
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of gigatron_ram is
	constant ramsize : integer := 2**abits;
	type ram_t is array(0 to ramsize-1) of unsigned(d'range);
	signal ram_reg : ram_t := (others => (others => '0'));
	signal q_reg : unsigned(q'range);
begin
	q <= q_reg;

	process(clk)
	begin
		if rising_edge(clk) then
			if we = '1' then
				ram_reg(to_integer(a)) <= d;
			end if;
			q_reg <= ram_reg(to_integer(a));
		end if;
	end process;
end architecture;
