-- -----------------------------------------------------------------------
--
-- Syntiac's generic VHDL support files.
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2010 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
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
-- gen_filter_tb.vhd
--
-- -----------------------------------------------------------------------
--
-- Testbench for signal filter
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity gen_filter_tb is
end entity;

-- -----------------------------------------------------------------------

architecture rtl of gen_filter_tb is
	signal clk : std_logic := '0';
	signal stop : std_logic := '0';
	
	signal d : std_logic := '0';
	signal q : std_logic;
	
	procedure waitRisingEdge is
	begin
		wait until clk = '0';
		wait until clk = '1';
		wait for 0.5 ns;
	end procedure;

	procedure waitCheck(expected:integer) is
	begin
		waitRisingEdge;
		assert(to_integer(unsigned'("" & q)) = expected);
	end procedure;
begin
	filter_inst : entity work.gen_filter
		generic map (
			steps => 4
		)
		port map (
			clk => clk,
			d => d,
			q => q
		);

	clk <= (not stop) and (not clk) after 5 ns;

	process
	begin
		d <= '0';
		waitCheck(0);

		d <= '1';
		waitCheck(0);
		waitCheck(0);
		waitCheck(0);
		waitCheck(0);
		waitCheck(1);

		d <= '0';
		waitCheck(1);
		waitCheck(1);
		waitCheck(1);
		waitCheck(1);
		waitCheck(0);
		
		stop <= '1';
		wait;
	end process;
end architecture;


