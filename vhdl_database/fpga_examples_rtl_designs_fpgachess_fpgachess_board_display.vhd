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
-- Stores the board that is displayed on the screen. Has interface to
-- video logic to extract the piece that is on the cell currently rendered
-- on screen.
--
-- -----------------------------------------------------------------------
-- clk        - System clock input
--
-- board_trig - When high copy board state into internal registers.
-- board      - Current board state input.
--
-- vid_row    - Board row currently displayed by the video subsystem
-- vid_col    - Board column currently displayed by the video subsystem
-- vid_piece  - Returns piece located on cell pointed to by vid_row and vid_col
-- -----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.fpgachess_pkg.all;

-- -----------------------------------------------------------------------

entity fpgachess_board_display is
	port (
		clk : in std_logic;

		board_trig : in std_logic;
		board : in extboard_t;

		vid_row : in unsigned(2 downto 0);
		vid_col : in unsigned(2 downto 0);
		vid_piece : out piece_t
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of fpgachess_board_display is
	signal display_board_reg : board_t := (others => piece_empty);
	signal vid_piece_reg : piece_t := piece_empty;
begin
	vid_piece <= vid_piece_reg;

	process(clk)
	begin
		if rising_edge(clk) then
			if board_trig = '1' then
				for i in 0 to 63 loop
					display_board_reg(i) <= to_piece(board(i));
				end loop;
			end if;
		end if;
	end process;

	display_blk : block
		signal display_col0_reg : piece_t := piece_empty;
		signal display_col1_reg : piece_t := piece_empty;
		signal display_col2_reg : piece_t := piece_empty;
		signal display_col3_reg : piece_t := piece_empty;
		signal display_col4_reg : piece_t := piece_empty;
		signal display_col5_reg : piece_t := piece_empty;
		signal display_col6_reg : piece_t := piece_empty;
		signal display_col7_reg : piece_t := piece_empty;
	begin
		process(clk)
		begin
			if rising_edge(clk) then
				-- Select a single cell from the display board and send it to the video logic.
				-- Multiplexing 64 squares into one output makes the logic large.
				-- So it is done in two separate steps. First for the current row all
				-- the columns are collected. Then the selection of a specific column is made.
				-- This reduces the mux sizes from 64 to 8 making it easier to meet timing.
				--
				display_col0_reg <= display_board_reg(to_integer(vid_row & "000"));
				display_col1_reg <= display_board_reg(to_integer(vid_row & "001"));
				display_col2_reg <= display_board_reg(to_integer(vid_row & "010"));
				display_col3_reg <= display_board_reg(to_integer(vid_row & "011"));
				display_col4_reg <= display_board_reg(to_integer(vid_row & "100"));
				display_col5_reg <= display_board_reg(to_integer(vid_row & "101"));
				display_col6_reg <= display_board_reg(to_integer(vid_row & "110"));
				display_col7_reg <= display_board_reg(to_integer(vid_row & "111"));

				case vid_col is
				when "000" => vid_piece_reg <= display_col0_reg;
				when "001" => vid_piece_reg <= display_col1_reg;
				when "010" => vid_piece_reg <= display_col2_reg;
				when "011" => vid_piece_reg <= display_col3_reg;
				when "100" => vid_piece_reg <= display_col4_reg;
				when "101" => vid_piece_reg <= display_col5_reg;
				when "110" => vid_piece_reg <= display_col6_reg;
				when others => vid_piece_reg <= display_col7_reg;
				end case;
			end if;
		end process;
	end block;
end architecture;

