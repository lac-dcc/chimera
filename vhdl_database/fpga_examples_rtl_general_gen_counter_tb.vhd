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
-- gen_counter_tb.vhd
--
-- -----------------------------------------------------------------------
--
-- Testbench for up/down counter
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity gen_counter_tb is
end entity;

-- -----------------------------------------------------------------------

architecture rtl of gen_counter_tb is
	signal clk : std_logic := '0';
	signal stop : std_logic := '0';
	
	signal reset : std_logic := '0';
	signal load : std_logic := '0';
	signal up : std_logic := '0';
	signal down : std_logic := '0';
	signal counter : unsigned(7 downto 0);
	signal counter_signed : signed(7 downto 0);

	procedure waitRisingEdge is
	begin
		wait until clk = '0';
		wait until clk = '1';
		wait for 0.5 ns;
	end procedure;

	procedure waitEdgeAndCheck(expected:integer) is
	begin
		waitRisingEdge;
		assert(counter = expected);
		assert(counter_signed = expected);
	end procedure;

	procedure waitEdgeAndCheck(expected_unsigned:integer; expected_signed:integer) is
	begin
		waitRisingEdge;
		assert(counter = expected_unsigned);
		assert(counter_signed = expected_signed);
	end procedure;
begin
	myUpDownCounter : entity work.gen_counter
		port map (
			clk => clk,
			reset => reset,
			load => load,
			up => up,
			down => down,
			d => to_unsigned(12, 8),
			q => counter
		);

	myCounterSigned : entity work.gen_counter_signed
		port map (
			clk => clk,
			reset => reset,
			load => load,
			up => up,
			down => down,
			d => to_signed(12, 8),
			q => counter_signed
		);

	clk <= (not stop) and (not clk) after 5 ns;

	process
	begin
		-- No counting with all control inputs 0
		waitEdgeAndCheck(0);

		-- Count up
		up <= '1';
		waitEdgeAndCheck(1);
		waitEdgeAndCheck(2);
		waitEdgeAndCheck(3);

		-- Don't count with up+down
		down <= '1';
		waitEdgeAndCheck(3);

		-- Count down
		up <= '0';
		waitEdgeAndCheck(2);
		waitEdgeAndCheck(1);
		waitEdgeAndCheck(0);

		-- Roll-over
		waitEdgeAndCheck(255, -1);
		waitEdgeAndCheck(254, -2);

		-- Load has priority over counting
		load <= '1';
		waitEdgeAndCheck(12);

		-- Reset has priority over everything
		reset <= '1';
		waitEdgeAndCheck(0);
		
		stop <= '1';
		wait;
	end process;

end architecture;


