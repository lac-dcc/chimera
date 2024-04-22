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
-- gen_fifo_tb.vhd
--
-- -----------------------------------------------------------------------
--
-- Testbench for gen_fifo
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity gen_fifo_tb is
end entity;

-- -----------------------------------------------------------------------

architecture rtl of gen_fifo_tb is
	signal clk : std_logic := '0';
	signal stop : std_logic := '0';
	
	signal d_ena : std_logic := '0';
	signal d : unsigned(7 downto 0) := (others => '0');
	signal q_ena : std_logic := '0';
	signal q : unsigned(7 downto 0);
	signal empty : std_logic;
	signal full : std_logic;

	function tohex(value : in unsigned) return string is
		constant hex_digit : string(1 to 16) := "0123456789ABCDEF"; 
		variable input : unsigned(value'high downto value'low);
		variable rlen : integer;
		variable output : string(1 to 16) := (others => '0');
	begin
		input := value;
		rlen := value'length / 4;
		for i in output'range loop
			if i <= rlen then
				output(i) := hex_digit(to_integer(input(input'high-(i-1)*4 downto input'high-(i*4-1))) + 1);
			end if;
		end loop;
		
		return output(1 to rlen);
	end function;

	procedure waitRisingEdge is
	begin
		wait until clk = '0';
		wait until clk = '1';
		wait for 0.5 ns;
	end procedure;
	
	procedure waitCheck(
		expected_empty:std_logic;
		expected_full:std_logic) is
	begin
		waitRisingEdge;
		assert(expected_empty = empty) report "q output " & tohex("000" & empty) & " expected " & tohex("000" & expected_empty);
		assert(expected_full = full) report "q output " & tohex("000" & full) & " expected " & tohex("000" & expected_full);
	end procedure;

	procedure waitCheck(
		expected_q:unsigned(7 downto 0);
		expected_empty:std_logic;
		expected_full:std_logic) is
	begin
		waitRisingEdge;
		assert(expected_q = q) report "q output " & tohex(q) & " expected " & tohex(expected_q);
		assert(expected_empty = empty) report "q output " & tohex("000" & empty) & " expected " & tohex("000" & expected_empty);
		assert(expected_full = full) report "q output " & tohex("000" & full) & " expected " & tohex("000" & expected_full);
	end procedure;
begin
	gen_fifo_inst : entity work.gen_fifo
		generic map (
			width => 8,
			depth => 4
		)
		port map (
			clk => clk,
			d_ena => d_ena,
			d => d,
			q_ena => q_ena,
			q => q,
			
			empty => empty,
			full => full
		);

	clk <= (not stop) and (not clk) after 5 ns;

	process
	begin
		waitCheck(X"00", '1', '0');
		d_ena <= '1';
		d <= X"55";
		waitCheck(X"55", '0', '0');
		d_ena <= '1';
		d <= X"66";
		waitCheck(X"55", '0', '0');
		d_ena <= '1';
		d <= X"77";
		waitCheck(X"55", '0', '0');
		d_ena <= '1';
		d <= X"88";
		waitCheck(X"55", '0', '1');
		d_ena <= '0';
		q_ena <= '1';
		waitCheck(X"66", '0', '0');
		waitCheck(X"77", '0', '0');
		waitCheck(X"88", '0', '0');
		waitCheck('1', '0');
		
		
		stop <= '1';
		wait;
	end process;
end architecture;

