-- -----------------------------------------------------------------------
--
-- Turbo Chameleon 64
--
-- Multi purpose FPGA expansion for the Commodore 64 computer
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
-- I/O controller entity for the PS2IEC multiplexer.
-- This provides capturing and reading the state of the (multiplexed)
-- PS/2 and IEC lines.
--
-- -----------------------------------------------------------------------
-- clk           - System clock
-- ps2iec_sel    - Select line, connect on toplevel to port with same name
-- ps2iec        - Multiplexed signals, connect on toplevel to port with same name
--
-- ps2_mouse_clk - State of the PS/2 mouse clock signal
-- ps2_mouse_dat - State of the PS/2 mouse data signal
-- ps2_mouse_clk - State of the PS/2 keyboard clock signal
-- ps2_mouse_dat - State of the PS/2 keyboard data signal
--
-- iec_clk       - State of the CLK line on the IEC bus
-- iec_srq       - State of the SRQ line on the IEC bus
-- iec_atn       - State of the ATN line on the IEC bus
-- iec_dat       - State of the DAT line on the IEC bus
-- -----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- -----------------------------------------------------------------------

entity chameleon2_io_ps2iec is
	port (
		clk : in std_logic;

		-- Mux signals
		ps2iec_sel : out std_logic;
		ps2iec : in unsigned(3 downto 0);

		-- Decoded
		ps2_mouse_clk : out std_logic;
		ps2_mouse_dat : out std_logic;
		ps2_keyboard_clk : out std_logic;
		ps2_keyboard_dat : out std_logic;

		iec_clk : out std_logic;
		iec_srq : out std_logic;
		iec_atn : out std_logic;
		iec_dat : out std_logic
	);
end entity;

architecture rtl of chameleon2_io_ps2iec is
	signal state_reg : unsigned(2 downto 0) := "000";

	signal ps2iec_reg : unsigned(3 downto 0) := "1111";

	signal ps2_mouse_clk_reg : std_logic := '1';
	signal ps2_mouse_dat_reg : std_logic := '1';
	signal ps2_keyboard_clk_reg : std_logic := '1';
	signal ps2_keyboard_dat_reg : std_logic := '1';

	signal iec_clk_reg : std_logic := '1';
	signal iec_srq_reg : std_logic := '1';
	signal iec_atn_reg : std_logic := '1';
	signal iec_dat_reg : std_logic := '1';
begin
	ps2iec_sel <= state_reg(2);

	ps2_mouse_clk <= ps2_mouse_clk_reg;
	ps2_mouse_dat <= ps2_mouse_dat_reg;
	ps2_keyboard_clk <= ps2_keyboard_clk_reg;
	ps2_keyboard_dat <= ps2_keyboard_dat_reg;

	iec_clk <= iec_clk_reg;
	iec_srq <= iec_srq_reg;
	iec_atn <= iec_atn_reg;
	iec_dat <= iec_dat_reg;

	process(clk)
	begin
		if rising_edge(clk) then
			state_reg <= state_reg + 1;
			ps2iec_reg <= ps2iec;
			if state_reg = "011" then
				-- Capture PS2 lines
				ps2_mouse_dat_reg <= ps2iec_reg(0);
				ps2_mouse_clk_reg <= ps2iec_reg(1);
				ps2_keyboard_clk_reg <= ps2iec_reg(2);
				ps2_keyboard_dat_reg <= ps2iec_reg(3);
			end if;
			if state_reg = "111" then
				-- Capture IEC lines
				iec_atn_reg <= ps2iec_reg(0);
				iec_dat_reg <= ps2iec_reg(1);
				iec_clk_reg <= ps2iec_reg(2);
				iec_srq_reg <= ps2iec_reg(3);
			end if;
		end if;
	end process;
end architecture;
