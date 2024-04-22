-- -----------------------------------------------------------------------
--
-- FPGA-Chess
--
-- Chess game engine for programmable logic devices
--
-- -----------------------------------------------------------------------
-- Copyright 2022-2023 by Peter Wendrich (pwsoft@syntiac.com)
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
--
-- Part of FPGA-Chess
-- User interface logic, processes joystick inputs to navigate the board
-- and the menu system. Generates cursor coordinates and various action
-- triggers that other logic can respond to.
--
-- -----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;
use work.fpgachess_pkg.all;

-- -----------------------------------------------------------------------

entity fpgachess_ui is
	port (
		clk : in std_logic;
		ena_1khz : in std_logic;
		reset : in std_logic;

		undo_valid : in std_logic;
		redo_valid : in std_logic;

		cursor_up : in std_logic;
		cursor_down : in std_logic;
		cursor_left : in std_logic;
		cursor_right : in std_logic;
		cursor_enter : in std_logic;

		new_game_trig : out std_logic;
		search_start_trig : out std_logic;
		white_top : out std_logic;
		move_trig : out std_logic;
		undo_trig : out std_logic;
		redo_trig : out std_logic;

		cursor_row : out unsigned(2 downto 0);
		cursor_col : out unsigned(3 downto 0);
		cursor_select : out std_logic;
		cursor_select_row : out unsigned(2 downto 0);
		cursor_select_col : out unsigned(2 downto 0)
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of fpgachess_ui is
	signal ena_cursor : std_logic;
	signal cursor_up_trig : std_logic;
	signal cursor_down_trig : std_logic;
	signal cursor_left_trig : std_logic;
	signal cursor_right_trig : std_logic;
	signal cursor_enter_trig : std_logic;
begin
	clk_blk : block
		signal ena_cnt_reg : unsigned(3 downto 0) := (others => '0');
		signal ena_reg : std_logic := '0';
	begin
		ena_cursor <= ena_reg;

		-- Divide 1khz clock to get enable signal for debounching the cursor control inputs
		process(clk)
		begin
			if rising_edge(clk) then
				ena_reg <= '0';
				if ena_1khz = '1' then
					ena_cnt_reg <= ena_cnt_reg + 1;
					if ena_cnt_reg = 0 then
						ena_reg <= '1';
					end if;
				end if;
			end if;
		end process;
	end block;

	debounch_blk : block
		signal cursor_up_prev_reg : std_logic := '0';
		signal cursor_down_prev_reg : std_logic := '0';
		signal cursor_left_prev_reg : std_logic := '0';
		signal cursor_right_prev_reg : std_logic := '0';
		signal cursor_enter_prev_reg : std_logic := '0';
		signal cursor_up_trig_reg : std_logic := '0';
		signal cursor_down_trig_reg : std_logic := '0';
		signal cursor_left_trig_reg : std_logic := '0';
		signal cursor_right_trig_reg : std_logic := '0';
		signal cursor_enter_trig_reg : std_logic := '0';
	begin
		cursor_up_trig <= cursor_up_trig_reg;
		cursor_down_trig <= cursor_down_trig_reg;
		cursor_left_trig <= cursor_left_trig_reg;
		cursor_right_trig <= cursor_right_trig_reg;
		cursor_enter_trig <= cursor_enter_trig_reg;

		process(clk)
		begin
			if rising_edge(clk) then
				cursor_up_trig_reg <= '0';
				cursor_down_trig_reg <= '0';
				cursor_left_trig_reg <= '0';
				cursor_right_trig_reg <= '0';
				cursor_enter_trig_reg <= '0';
				if ena_cursor = '1' then
					cursor_up_prev_reg <= cursor_up;
					cursor_down_prev_reg <= cursor_down;
					cursor_left_prev_reg <= cursor_left;
					cursor_right_prev_reg <= cursor_right;
					cursor_enter_prev_reg <= cursor_enter;
					if cursor_up > cursor_up_prev_reg  then
						cursor_up_trig_reg <= '1';
					end if;
					if cursor_down > cursor_down_prev_reg  then
						cursor_down_trig_reg <= '1';
					end if;
					if cursor_left > cursor_left_prev_reg  then
						cursor_left_trig_reg <= '1';
					end if;
					if cursor_right > cursor_right_prev_reg  then
						cursor_right_trig_reg <= '1';
					end if;
					if cursor_enter > cursor_enter_prev_reg  then
						cursor_enter_trig_reg <= '1';
					end if;
				end if;
			end if;
		end process;
	end block;

	menu_blk : block
		signal cursor_row_reg : unsigned(2 downto 0) := (others => '0');
		signal cursor_col_reg : unsigned(3 downto 0) := (others => '0');
		signal select_row_reg : unsigned(2 downto 0) := (others => '0');
		signal select_col_reg : unsigned(2 downto 0) := (others => '0');
		signal select_reg : std_logic := '0';
		signal new_game_trig_reg : std_logic := '0';
		signal search_start_trig_reg : std_logic := '0';
		signal white_top_reg : std_logic := '0';
		signal move_trig_reg : std_logic := '0';
		signal undo_trig_reg : std_logic := '0';
		signal redo_trig_reg : std_logic := '0';
	begin
		cursor_row <= cursor_row_reg;
		cursor_col <= cursor_col_reg;
		cursor_select <= select_reg;
		cursor_select_row <= select_row_reg;
		cursor_select_col <= select_col_reg;
		white_top <= white_top_reg;
		new_game_trig <= new_game_trig_reg;
		search_start_trig <= search_start_trig_reg;
		move_trig <= move_trig_reg;
		undo_trig <= undo_trig_reg;
		redo_trig <= redo_trig_reg;

		process(clk)
		begin
			if rising_edge(clk) then
				if (cursor_up_trig = '1') and (cursor_row_reg /= 0) then
					cursor_row_reg <= cursor_row_reg - 1;
				end if;
				if (cursor_down_trig = '1') and (cursor_row_reg /= 7) then
					cursor_row_reg <= cursor_row_reg + 1;
				end if;
				if (cursor_left_trig = '1') and (cursor_col_reg /= 0) then
					cursor_col_reg <= cursor_col_reg - 1;
				end if;
				if (cursor_right_trig = '1') and (cursor_col_reg /= 8) then
					cursor_col_reg <= cursor_col_reg + 1;
				end if;
			end if;
		end process;

		process(clk)
			variable cursor_rowcol : unsigned(6 downto 0);
		begin
			if rising_edge(clk) then
				new_game_trig_reg <= '0';
				search_start_trig_reg <= '0';
				move_trig_reg <= '0';
				undo_trig_reg <= '0';
				redo_trig_reg <= '0';

				if (cursor_enter_trig = '1') then
					if cursor_col_reg(3) = '0' then
						-- Select piece within board
						select_reg <= not select_reg;
						if select_reg = '0' then
							-- Remember coordinates of selection
							select_row_reg <= cursor_row_reg;
							select_col_reg <= cursor_col_reg(2 downto 0);
						else
							-- Perform move action
							-- Only trigger move action if selection and current cursor are different though
							-- Otherwise simply deselect what was selected.
							if (select_row_reg /= cursor_row_reg) or (select_col_reg /= cursor_col_reg(2 downto 0)) then
								move_trig_reg <= '1';
							end if;
						end if;
					else
						-- Deselect piece when accessing menu
						select_reg <= '0';
					end if;

					cursor_rowcol := cursor_row_reg & cursor_col_reg;
					case cursor_rowcol is
					when "0001000" => -- New game
						new_game_trig_reg <= '1';
					when "0011000" => -- TBD trigger search
						search_start_trig_reg <= '1';
					when "1011000" => -- Undo
						undo_trig_reg <= undo_valid;
					when "1101000" => -- Redo
						redo_trig_reg <= redo_valid;
					when "1111000" => -- Board flip
						white_top_reg <= not white_top_reg;
					when others =>
						null;
					end case;
				end if;

				if reset = '1' then
					new_game_trig_reg <= '1';
				end if;
			end if;
		end process;
	end block;
end architecture;
