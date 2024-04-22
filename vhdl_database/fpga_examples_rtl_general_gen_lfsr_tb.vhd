-- -----------------------------------------------------------------------
--
-- Syntiac's generic VHDL support files.
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2011 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/vhdl_lib.html
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
-- gen_lfsr_tb.vhd
--
-- -----------------------------------------------------------------------
--
-- Testbench for LFSR
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity gen_lfsr_tb is
end entity;

-- -----------------------------------------------------------------------

architecture rtl of gen_lfsr_tb is
	constant max_bits_tested : integer := 18;
	signal clk : std_logic := '0';
	signal stop : std_logic := '0';
	signal reset : std_logic := '0';
	signal load : std_logic := '0';
	type lfsr_t is array(3 to max_bits_tested) of unsigned(167 downto 0);
	signal lfsr : lfsr_t := (others => (others => '0'));

	procedure waitRisingEdge is
	begin
		wait until clk = '0';
		wait until clk = '1';
		wait for 0.5 ns;
	end procedure;

begin
	myLfsrCollection: for i in 3 to max_bits_tested generate
		myLfsr : entity work.gen_lfsr
			generic map (
				bits => i
			)
			port map (
				clk => clk,
				reset => reset,
				stop => '0',
				load => load,
				d => to_unsigned(1, i),
				q => lfsr(i)(i-1 downto 0)
			);
		end generate;

	clk <= (not stop) and (not clk) after 5 ns;
	
	process
	begin
		reset <= '1';
		waitRisingEdge;
		-- Test outputs are zero after reset
		for i in 3 to max_bits_tested loop
			assert(to_integer(lfsr(i)) = 0);
		end loop;

		reset <= '0';
		waitRisingEdge;
		-- Test outputs are one after 1 clock
		for i in 3 to max_bits_tested loop
			assert(to_integer(lfsr(i)) = 1);
		end loop;

		--
		-- Test sequence length of some of the outputs
		for i in 2 to 7 loop
			assert(to_integer(lfsr(3)) /= 0);
			assert(to_integer(lfsr(4)) /= 0);
			assert(to_integer(lfsr(5)) /= 0);
			assert(to_integer(lfsr(6)) /= 0);
			waitRisingEdge;
		end loop;
		assert(to_integer(lfsr(3)) = 0); -- 3 is zero after 2**3-1 = 7 cycles
		for i in 8 to 15 loop
			assert(to_integer(lfsr(4)) /= 0);
			assert(to_integer(lfsr(5)) /= 0);
			assert(to_integer(lfsr(6)) /= 0);
			waitRisingEdge;
		end loop;
		assert(to_integer(lfsr(4)) = 0); -- 4 is zero after 2**4-1 = 15 cycles
		for i in 16 to 31 loop
			assert(to_integer(lfsr(5)) /= 0);
			assert(to_integer(lfsr(6)) /= 0);
			waitRisingEdge;
		end loop;
		assert(to_integer(lfsr(5)) = 0); -- 5 is zero after 2**5-1 = 31 cycles
		for i in 32 to 63 loop
			assert(to_integer(lfsr(6)) /= 0);
			waitRisingEdge;
		end loop;
		assert(to_integer(lfsr(6)) = 0); -- 5 is zero after 2**6-1 = 63 cycles
		
		stop <= '1';
		wait;
	end process;
end architecture;


