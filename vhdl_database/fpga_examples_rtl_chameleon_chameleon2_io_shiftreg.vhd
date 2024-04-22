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
-- I/O controller entity for the shiftregister controlling PS/2,
-- LEDs and reset signals on Turbo Chameleon 64 second edition.
--
-- -----------------------------------------------------------------------
-- clk             - System clock
--
-- ser_out_clk     - Serial clock, connect on toplevel to port with same name
-- ser_out_dat     - Serial data, connect on toplevel to port with same name
-- ser_out_rclk    - Serial strobe, connect on toplevel to port with same name
--
-- reset_c64       - Active high, pulls reset on the cartridge port
-- reset_iec       - Active high, pulls reset on teh IEC connector
-- ps2_mouse_clk   - Open drain output for PS/2 mouse clock (active low)
-- ps2_mouse_dat   - Open drain output for PS/2 mouse data (active low)
-- ps2_keybard_clk - Open drain output for PS/2 keyboard clock (active low)
-- ps2_keybard_dat - Open drain output for PS/2 keyboard data (active low)
-- led_green       - Active high, enable the green LED
-- led_red         - Active high, enable the red LED
-- -----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- -----------------------------------------------------------------------

entity chameleon2_io_shiftreg is
	port (
		clk : in std_logic;

		ser_out_clk : out std_logic;
		ser_out_dat : out std_logic;
		ser_out_rclk : out std_logic;

		reset_c64 : in std_logic;
		reset_iec : in std_logic;
		ps2_mouse_clk : in std_logic;
		ps2_mouse_dat : in std_logic;
		ps2_keyboard_clk : in std_logic;
		ps2_keyboard_dat : in std_logic;
		led_green : in std_logic;
		led_red : in std_logic
	);
end entity;

architecture rtl of chameleon2_io_shiftreg is
	signal state_reg : unsigned(6 downto 0) := (others => '0');
	signal clk_reg : std_logic := '0';
	signal dat_reg : std_logic := '0';
	signal rclk_reg : std_logic := '1';
begin
	ser_out_clk <= clk_reg;
	ser_out_dat <= dat_reg;
	ser_out_rclk <= rclk_reg;

	process(clk)
	begin
		if rising_edge(clk) then
			state_reg <= state_reg + 1;
			clk_reg <= state_reg(2) and (not state_reg(6));
			rclk_reg <= state_reg(2) and state_reg(6);
			case state_reg(6 downto 3) is
			when "0000" => dat_reg <= reset_c64;
			when "0001" => dat_reg <= reset_iec;
			when "0010" => dat_reg <= not ps2_mouse_clk;
			when "0011" => dat_reg <= not ps2_mouse_dat;
			when "0100" => dat_reg <= not ps2_keyboard_clk;
			when "0101" => dat_reg <= not ps2_keyboard_dat;
			when "0110" => dat_reg <= not led_green;
			when "0111" => dat_reg <= not led_red;
			when "1000" => null;
			when others => state_reg <= (others => '0');
			end case;
		end if;
	end process;
end architecture;
