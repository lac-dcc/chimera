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
-- Video generation circuitry. Generates VGA signal and draws game board
-- with pieces, movable cursor and renders text characters for the menus.
--
-- -----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;
use work.fpgachess_pkg.all;

-- -----------------------------------------------------------------------

entity fpgachess_video is
	generic (
		ply_count_bits : integer;
		board_xpos : integer := 16;
		board_ypos : integer := 16
	);
	port (
		clk : in std_logic;
		ena_1sec : in std_logic;
		reset : in std_logic;

		white_top : in std_logic;
		show_undo : in std_logic;
		show_redo : in std_logic;

		cursor_row : in unsigned(2 downto 0);
		cursor_col : in unsigned(3 downto 0);
		cursor_select : in std_logic;
		cursor_select_row : in unsigned(2 downto 0);
		cursor_select_col : in unsigned(2 downto 0);
		cursor_targets : in unsigned(63 downto 0);

		vid_line : out unsigned(5 downto 0);
		vid_row : out unsigned(2 downto 0);
		vid_col : out unsigned(2 downto 0);
		piece : in piece_t;

		stats_pos : out unsigned(6 downto 0);
		stats_digit : in unsigned(3 downto 0);
		vid_eval : in signed(11 downto 0);

		move_show : in unsigned(1 downto 0);
		move_ply : in unsigned(ply_count_bits-1 downto 0);
		move_white : in unsigned(11 downto 0);
		move_black : in unsigned(11 downto 0);

		red : out unsigned(7 downto 0);
		grn : out unsigned(7 downto 0);
		blu : out unsigned(7 downto 0);
		hsync : out std_logic;
		vsync : out std_logic
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of fpgachess_video is
-- Colors
	type color_t is (
			C_BLANK, C_BACKGROUND, C_BORDER,
			C_CHARACTER,
			C_BOARD_CURSOR1, C_BOARD_CURSOR2, C_BOARD_LIGHT, C_BOARD_DARK,
			C_PIECE_BLACK, C_PIECE_WHITE,
			C_TARGET_MID, C_TARGET_SIDE
		);
	signal current_color : color_t;

-- Video pipeline
	signal end_of_line : std_logic;
	signal end_of_frame : std_logic;
	type vid_stage_t is record
			ena_pixel : std_logic;
			hsync : std_logic;
			vsync : std_logic;
			x : unsigned(11 downto 0);
			y : unsigned(11 downto 0);

			-- Character double width (40 vs 80 columns)
			char_dw : std_logic;
			-- Character double height (30 vs 60 lines)
			char_dh : std_logic;

			board : std_logic;
			cursor : std_logic;
			-- Selects the chess cell currently rendered, only valid if "board" is set
			-- Also used for cursor display, col is bigger as the board to allow access the menu next to the board
			board_col : unsigned(3 downto 0);
			board_row : unsigned(2 downto 0);
			-- Coordinates within a chess cell, only valid if "board" is set
			board_colx : unsigned(5 downto 0);
			board_rowy : unsigned(5 downto 0);
		end record;
	signal vga_master : vid_stage_t;
	signal vga_coords : vid_stage_t;
	signal vga_matrix : vid_stage_t;
	signal vga_character : vid_stage_t;
	signal vga_color : vid_stage_t;
	signal current_char : unsigned(7 downto 0);
	signal current_pixels : unsigned(7 downto 0);
	signal piece_pixels : unsigned(47 downto 0);
	signal target_dot_reg : unsigned(1 downto 0);
begin
-- -----------------------------------------------------------------------
-- Video timing 640x480
-- -----------------------------------------------------------------------
	vga_master_inst : entity work.video_vga_master
		generic map (
			clkDivBits => 4
		)
		port map (
			clk => clk,
			-- 100 Mhz / (3+1) = 25 Mhz
			clkDiv => X"3",

			hSync => vga_master.hsync,
			vSync => vga_master.vsync,

			endOfPixel => vga_master.ena_pixel,
			endOfLine => end_of_line,
			endOfFrame => end_of_frame,
			currentX => vga_master.x,
			currentY => vga_master.y,

			-- Setup 640x480@60hz needs ~25 Mhz
			hSyncPol => '0',
			vSyncPol => '0',
			xSize => to_unsigned(800, 12),
			ySize => to_unsigned(525, 12),
			xSyncFr => to_unsigned(656, 12), -- Sync pulse 96
			xSyncTo => to_unsigned(752, 12),
			ySyncFr => to_unsigned(500, 12), -- Sync pulse 2
			ySyncTo => to_unsigned(502, 12)
		);

	-- Initialize video pipeline with sane defaults
	vga_master.char_dw <= '0';
	vga_master.char_dh <= '0';
	vga_master.board <= '0';
	vga_master.cursor <= '0';
	vga_master.board_col <= (others => '0');
	vga_master.board_row <= (others => '0');
	vga_master.board_colx <= (others => '0');
	vga_master.board_rowy <= (others => '0');

-- -----------------------------------------------------------------------
-- Coordinates
-- -----------------------------------------------------------------------
	coords_blk : block
		signal vga_coords_reg : vid_stage_t;
		signal board_xrun_reg : std_logic := '0';
		signal board_yrun_reg : std_logic := '0';
		signal board_col07_reg : std_logic := '0';
		signal board_xcnt_reg : unsigned(5 downto 0) := (others => '0');
		signal board_ycnt_reg : unsigned(5 downto 0) := (others => '0');
		signal board_col_reg : unsigned(3 downto 0) := (others => '0');
		signal board_row_reg : unsigned(2 downto 0) := (others => '0');
	begin
		vga_coords <= vga_coords_reg;
		vid_line <= vga_master.y(9 downto 4);
		vid_col <= board_col_reg(vid_col'range) xor (white_top & white_top & white_top);
		vid_row <= (not board_row_reg) xor (white_top & white_top & white_top);
		stats_pos <= vga_master.x(9 downto 3);

		process(clk)
		begin
			if rising_edge(clk) then
				vga_coords_reg <= vga_master;

				if vga_master.ena_pixel = '1' then
					if vga_master.x = board_xpos-1 then
						board_xcnt_reg <= (others => '0');
						board_col_reg <= (others => '0');
						board_xrun_reg <= '1';
						board_col07_reg <= '1';
					end if;
					if board_xrun_reg = '1' then
						board_xcnt_reg <= board_xcnt_reg + 1;
					end if;
					if board_xcnt_reg = 47 then
						board_xcnt_reg <= (others => '0');
						board_col_reg <= board_col_reg + 1;
						if board_col_reg = 7 then
							board_col07_reg <= '0';
						end if;
						-- Add two extra columns on the right of the board for the menu
						if board_col_reg = 9 then
							board_xrun_reg <= '0';
						end if;
					end if;
				end if;

				if end_of_line = '1' then
					if vga_master.y = board_ypos then
						board_ycnt_reg <= (others => '0');
						board_row_reg <= (others => '0');
						board_yrun_reg <= '1';
					end if;
					if board_yrun_reg = '1' then
						board_ycnt_reg <= board_ycnt_reg + 1;
					end if;
					if board_ycnt_reg = 47 then
						board_ycnt_reg <= (others => '0');
						board_row_reg <= board_row_reg + 1;
						if board_row_reg = 7 then
							board_yrun_reg <= '0';
						end if;
					end if;
				end if;

				vga_coords_reg.board <= board_col07_reg and board_yrun_reg;
				vga_coords_reg.cursor <= board_xrun_reg and board_yrun_reg;
				vga_coords_reg.board_col <= board_col_reg;
				vga_coords_reg.board_row <= board_row_reg;
				vga_coords_reg.board_colx <= board_xcnt_reg;
				vga_coords_reg.board_rowy <= board_ycnt_reg;
			end if;
		end process;
	end block;

-- -----------------------------------------------------------------------
-- Screen matrix
-- -----------------------------------------------------------------------
	matrix_blk : block
		signal vga_matrix_reg : vid_stage_t;
		signal current_char_reg : unsigned(7 downto 0);
		signal move_ply_prev_reg : unsigned(move_ply'range) := (others => '0');
		signal move_reg : unsigned(move_ply'range) := (others => '0');
		signal move_100_reg : unsigned(7 downto 0) := (others => '0');
		signal move_10_reg : unsigned(7 downto 0) := (others => '0');
		signal move_1_reg : unsigned(7 downto 0) := (others => '0');

		signal eval_prev_reg : signed(vid_eval'range) := (others => '0');
		signal eval_reg : signed(vid_eval'range) := (others => '0');
		signal eval_sign_reg : unsigned(7 downto 0) := (others => '0');
		signal eval_1000_reg : unsigned(7 downto 0) := (others => '0');
		signal eval_100_reg : unsigned(7 downto 0) := (others => '0');
		signal eval_10_reg : unsigned(7 downto 0) := (others => '0');
		signal eval_1_reg : unsigned(7 downto 0) := (others => '0');
	begin
		vga_matrix <= vga_matrix_reg;
		current_char <= current_char_reg;

		-- Divide current ply by two to get moves and convert from binary to decimal digits for display
		-- Also add one as ply is an index that starts at zero
		process(clk)
		begin
			if rising_edge(clk) then
				if move_ply /= move_ply_prev_reg then
					move_ply_prev_reg <= move_ply;
					move_reg <= ("0" & move_ply(move_ply'high downto 1)) + 1;
					move_100_reg <= X"30";
					move_10_reg <= X"30";
					move_1_reg <= X"30";
				elsif move_reg > 99 then
					move_reg <= move_reg - 100;
					move_100_reg(3 downto 0) <= move_100_reg(3 downto 0) + 1;
				elsif move_reg > 9 then
					move_reg <= move_reg - 10;
					move_10_reg(3 downto 0) <= move_10_reg(3 downto 0) + 1;
				else
					move_1_reg(3 downto 0) <= move_reg(3 downto 0);
					if move_100_reg(3 downto 0) = 0 then
						move_100_reg(4) <= '0'; -- Remove leading zeros by replacing it with space (clear bit 4 so 30h becomes 20h)
						if move_10_reg(3 downto 0) = 0 then
							move_10_reg(4) <= '0'; -- Remove leading zeros by replacing it with space (clear bit 4 so 30h becomes 20h)
						end if;
					end if;
				end if;
			end if;
		end process;

		process(clk)
		begin
			if rising_edge(clk) then
				if (vid_eval /= eval_prev_reg) or (reset = '1') then
					eval_prev_reg <= vid_eval;
					eval_reg <= vid_eval;
					eval_sign_reg <= X"20";
					eval_1000_reg <= X"30";
					eval_100_reg <= X"30";
					eval_10_reg <= X"30";
					eval_1_reg <= X"30";
				elsif eval_reg < 0 then
					eval_reg <= -eval_reg;
					eval_sign_reg <= X"2D";
				elsif eval_reg > 999 then
					eval_reg <= eval_reg - 1000;
					eval_1000_reg(3 downto 0) <= eval_1000_reg(3 downto 0) + 1;
				elsif eval_reg > 99 then
					eval_reg <= eval_reg - 100;
					eval_100_reg(3 downto 0) <= eval_100_reg(3 downto 0) + 1;
				elsif eval_reg > 9 then
					eval_reg <= eval_reg - 10;
					eval_10_reg(3 downto 0) <= eval_10_reg(3 downto 0) + 1;
				else
					eval_1_reg(3 downto 0) <= unsigned(eval_reg(3 downto 0));
					if eval_1000_reg(3 downto 0) = 0 then
						eval_1000_reg(4) <= '0'; -- Remove leading zeros by replacing it with space (clear bit 4 so 30h becomes 20h)
						if eval_100_reg(3 downto 0) = 0 then
							eval_100_reg(4) <= '0'; -- Remove leading zeros by replacing it with space (clear bit 4 so 30h becomes 20h)
							if eval_10_reg(3 downto 0) = 0 then
								eval_10_reg(4) <= '0'; -- Remove leading zeros by replacing it with space (clear bit 4 so 30h becomes 20h)
							end if;
						end if;
					end if;
				end if;
			end if;
		end process;

		process(clk)
		begin
			if rising_edge(clk) then
				vga_matrix_reg <= vga_coords;
				vga_matrix_reg.char_dh <= '1';
				current_char_reg <= X"20";

				-- Display move history on the right side of the screen
				if move_show(0) = '1' then
					case vga_coords.x(9 downto 3) is
					when "1000000" => current_char_reg <= move_100_reg;
					when "1000001" => current_char_reg <= move_10_reg;
					when "1000010" => current_char_reg <= move_1_reg;
					--   "1000011"
					when "1000100" => current_char_reg <= X"61" + move_white( 8 downto 6);
					when "1000101" => current_char_reg <= X"31" + move_white(11 downto 9);
					when "1000110" => current_char_reg <= X"61" + move_white( 2 downto 0);
					when "1000111" => current_char_reg <= X"31" + move_white( 5 downto 3);
					--   "1001000"
					--   "1001001"
					when "1001010" => if (move_show(1) = '1') then current_char_reg <= X"61" + move_black( 8 downto 6); end if;
					when "1001011" => if (move_show(1) = '1') then current_char_reg <= X"31" + move_black(11 downto 9); end if;
					when "1001100" => if (move_show(1) = '1') then current_char_reg <= X"61" + move_black( 2 downto 0); end if;
					when "1001101" => if (move_show(1) = '1') then current_char_reg <= X"31" + move_black( 5 downto 3); end if;
					--   "1001110"
					when others =>
						null;
					end case;
				end if;

				case vga_coords.y(8 downto 4) is
				when "00000" =>
					case vga_coords.x(9 downto 3) is
					when "0000010" => current_char_reg <= X"46"; -- F
					when "0000011" => current_char_reg <= X"50"; -- P
					when "0000100" => current_char_reg <= X"47"; -- G
					when "0000101" => current_char_reg <= X"41"; -- A
					when "0000110" => current_char_reg <= X"43"; -- C
					when "0000111" => current_char_reg <= X"48"; -- H
					when "0001000" => current_char_reg <= X"45"; -- E
					when "0001001" => current_char_reg <= X"53"; -- S
					when "0001010" => current_char_reg <= X"53"; -- S
					when others =>
						null;
					end case;
				when "00001" =>
					case vga_coords.x(9 downto 3) is
					when "0110010" => current_char_reg <= X"4E"; -- N
					when "0110011" => current_char_reg <= X"65"; -- e
					when "0110100" => current_char_reg <= X"77"; -- w
					when others =>
						null;
					end case;
				when "00010" =>
					case vga_coords.x(9 downto 3) is
					when "0000000" | "0000001" =>
						vga_matrix_reg.char_dw <= '1';
						if white_top = '0' then
							current_char_reg <= X"38";
						else
							current_char_reg <= X"31";
						end if;
					when "0110010" => current_char_reg <= X"47"; -- G
					when "0110011" => current_char_reg <= X"61"; -- a
					when "0110100" => current_char_reg <= X"6D"; -- m
					when "0110101" => current_char_reg <= X"65"; -- e
					when others =>
						null;
					end case;
				when "00100" =>
					case vga_coords.x(9 downto 3) is
					when "0110010" => current_char_reg <= X"41"; -- A
					when "0110011" => current_char_reg <= X"49"; -- I
--					when "0110100" =>
					when "0110101" => current_char_reg <= X"68"; -- h
					when "0110110" => current_char_reg <= X"61"; -- a
					when "0110111" => current_char_reg <= X"73"; -- s
					when others =>
						null;
					end case;
				when "00101" =>
					case vga_coords.x(9 downto 3) is
					when "0000000" | "0000001" =>
						vga_matrix_reg.char_dw <= '1';
						if white_top = '0' then
							current_char_reg <= X"37";
						else
							current_char_reg <= X"32";
						end if;
					when "0110010" => current_char_reg <= X"0B"; -- up arrow
					-- Black/White/Both needs implementation, is placeholder text for now
					when "0110011" => if white_top = '0' then current_char_reg <= X"57"; else current_char_reg <= X"42"; end if; -- W / B
					when "0110100" => if white_top = '0' then current_char_reg <= X"68"; else current_char_reg <= X"6C"; end if; -- h / l
					when "0110101" => if white_top = '0' then current_char_reg <= X"69"; else current_char_reg <= X"61"; end if; -- i / a
					when "0110110" => if white_top = '0' then current_char_reg <= X"74"; else current_char_reg <= X"63"; end if; -- t / c
					when "0110111" => if white_top = '0' then current_char_reg <= X"65"; else current_char_reg <= X"6B"; end if; -- e / k
					when others =>
						null;
					end case;
				when "00111" =>
					case vga_coords.x(9 downto 3) is
					when "0110010" => current_char_reg <= X"53"; -- S
					when "0110011" => current_char_reg <= X"65"; -- e
					when "0110100" => current_char_reg <= X"61"; -- a
					when "0110101" => current_char_reg <= X"72"; -- r
					when "0110110" => current_char_reg <= X"63"; -- c
					when "0110111" => current_char_reg <= X"68"; -- h
					when others =>
						null;
					end case;
				when "01000" =>
					case vga_coords.x(9 downto 3) is
					when "0000000" | "0000001" =>
						vga_matrix_reg.char_dw <= '1';
						if white_top = '0' then
							current_char_reg <= X"36";
						else
							current_char_reg <= X"33";
						end if;
					when "0110010" => current_char_reg <= X"4D"; -- M
					when "0110011" => current_char_reg <= X"6F"; -- o
					when "0110100" => current_char_reg <= X"76"; -- v
					when "0110101" => current_char_reg <= X"65"; -- e
					when others =>
						null;
					end case;
				when "01011" =>
					case vga_coords.x(9 downto 4) is
					when "000000" =>
						vga_matrix_reg.char_dw <= '1';
						if white_top = '0' then
							current_char_reg <= X"35";
						else
							current_char_reg <= X"34";
						end if;
					when others =>
						null;
					end case;
				when "01110" =>
					case vga_coords.x(9 downto 4) is
					when "000000" =>
						vga_matrix_reg.char_dw <= '1';
						if white_top = '0' then
							current_char_reg <= X"34";
						else
							current_char_reg <= X"35";
						end if;
					when others =>
						null;
					end case;
				when "10000" =>
					case vga_coords.x(9 downto 3) is
					when "0110010" => if show_undo = '1' then current_char_reg <= X"55"; end if; -- U
					when "0110011" => if show_undo = '1' then current_char_reg <= X"6E"; end if; -- n
					when "0110100" => if show_undo = '1' then current_char_reg <= X"64"; end if; -- d
					when "0110101" => if show_undo = '1' then current_char_reg <= X"6F"; end if; -- o
					when others =>
						null;
					end case;
				when "10001" =>
					case vga_coords.x(9 downto 4) is
					when "000000" =>
						vga_matrix_reg.char_dw <= '1';
						if white_top = '0' then
							current_char_reg <= X"33";
						else
							current_char_reg <= X"36";
						end if;
					when others =>
						null;
					end case;
				when "10011" =>
					case vga_coords.x(9 downto 3) is
					when "0110010" => if show_redo = '1' then current_char_reg <= X"52"; end if; -- R
					when "0110011" => if show_redo = '1' then current_char_reg <= X"65"; end if; -- e
					when "0110100" => if show_redo = '1' then current_char_reg <= X"64"; end if; -- d
					when "0110101" => if show_redo = '1' then current_char_reg <= X"6F"; end if; -- o
					when others =>
						null;
					end case;
				when "10100" =>
					case vga_coords.x(9 downto 4) is
					when "000000" =>
						vga_matrix_reg.char_dw <= '1';
						if white_top = '0' then
							current_char_reg <= X"32";
						else
							current_char_reg <= X"37";
						end if;
					when others =>
						null;
					end case;
				when "10110" =>
					case vga_coords.x(9 downto 3) is
					when "0110010" => current_char_reg <= X"46"; -- F
					when "0110011" => current_char_reg <= X"6C"; -- l
					when "0110100" => current_char_reg <= X"69"; -- i
					when "0110101" => current_char_reg <= X"70"; -- p
					when others =>
						null;
					end case;
				when "10111" =>
					case vga_coords.x(9 downto 3) is
					when "0000000" | "0000001" =>
						vga_matrix_reg.char_dw <= '1';
						if white_top = '0' then
							current_char_reg <= X"31";
						else
							current_char_reg <= X"38";
						end if;
					when "0110010" => current_char_reg <= X"0A"; -- down arrow
					when "0110011" => if white_top = '0' then current_char_reg <= X"57"; else current_char_reg <= X"42"; end if; -- W / B
					when "0110100" => if white_top = '0' then current_char_reg <= X"68"; else current_char_reg <= X"6C"; end if; -- h / l
					when "0110101" => if white_top = '0' then current_char_reg <= X"69"; else current_char_reg <= X"61"; end if; -- i / a
					when "0110110" => if white_top = '0' then current_char_reg <= X"74"; else current_char_reg <= X"63"; end if; -- t / c
					when "0110111" => if white_top = '0' then current_char_reg <= X"65"; else current_char_reg <= X"6B"; end if; -- e / k
					when others =>
						null;
					end case;
				when "11001" =>
					vga_matrix_reg.char_dw <= '1';
					case vga_coords.x(9 downto 4) is
					when "000010" => if white_top = '0' then current_char_reg <= X"61"; else current_char_reg <= X"68"; end if; -- a/h
					when "000101" => if white_top = '0' then current_char_reg <= X"62"; else current_char_reg <= X"67"; end if; -- b/g
					when "001000" => if white_top = '0' then current_char_reg <= X"63"; else current_char_reg <= X"66"; end if; -- c/f
					when "001011" => if white_top = '0' then current_char_reg <= X"64"; else current_char_reg <= X"65"; end if; -- d/e
					when "001110" => if white_top = '0' then current_char_reg <= X"65"; else current_char_reg <= X"64"; end if; -- e/d
					when "010001" => if white_top = '0' then current_char_reg <= X"66"; else current_char_reg <= X"63"; end if; -- f/c
					when "010100" => if white_top = '0' then current_char_reg <= X"67"; else current_char_reg <= X"62"; end if; -- g/b
					when "010111" => if white_top = '0' then current_char_reg <= X"68"; else current_char_reg <= X"61"; end if; -- h/a
					when others =>
						null;
					end case;
				when "11011" =>
					vga_matrix_reg.char_dw <= '1';
					case vga_coords.x(9 downto 4) is
					when "000000" => current_char_reg <= eval_sign_reg;
					when "000001" => current_char_reg <= eval_1000_reg;
					when "000010" => current_char_reg <= eval_100_reg;
					when "000011" => current_char_reg <= eval_10_reg;
					when "000100" => current_char_reg <= eval_1_reg;
					when others =>
						null;
					end case;
				when "11100" =>
					if stats_digit /= X"F" then
						current_char_reg <= X"3" & stats_digit;
					end if;
				when others =>
					null;
				end case;
			end if;
		end process;
	end block;

-- -----------------------------------------------------------------------
-- Character generator
-- -----------------------------------------------------------------------
	character_blk : block
		type charrom_t is array(0 to 1023) of unsigned(7 downto 0);
		constant charrom_init : charrom_t := (
			X"AA", X"55", X"AA", X"55", X"AA", X"55", X"AA", X"55",
			X"60", X"60", X"60", X"60", X"7F", X"7F", X"00", X"00",
			X"00", X"00", X"00", X"00", X"C0", X"C0", X"00", X"00",
			X"03", X"03", X"03", X"03", X"03", X"03", X"00", X"00",
			X"18", X"0C", X"06", X"03", X"03", X"01", X"00", X"00",
			X"00", X"00", X"00", X"00", X"00", X"80", X"00", X"00",
			X"00", X"00", X"0C", X"0C", X"07", X"03", X"00", X"00",
			X"38", X"0C", X"0C", X"0C", X"38", X"F0", X"00", X"00",
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
			X"18", X"18", X"18", X"99", X"5A", X"3C", X"18", X"00", -- 0A Down arrow
			X"18", X"3C", X"5A", X"99", X"18", X"18", X"18", X"00", -- 0B Up arrow
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
			X"08", X"08", X"08", X"08", X"08", X"00", X"08", X"00", -- !
			X"14", X"14", X"00", X"00", X"00", X"00", X"00", X"00", -- "
			X"14", X"14", X"7F", X"14", X"7F", X"14", X"14", X"00", -- #
			X"08", X"1E", X"28", X"1C", X"0A", X"3C", X"08", X"00", -- $
			X"00", X"32", X"34", X"08", X"16", X"26", X"00", X"00", -- %
			X"18", X"28", X"10", X"28", X"46", X"44", X"3A", X"00", -- &
			X"08", X"08", X"00", X"00", X"00", X"00", X"00", X"00", -- '
			X"04", X"08", X"10", X"10", X"10", X"08", X"04", X"00", -- (
			X"10", X"08", X"04", X"04", X"04", X"08", X"10", X"00", -- )
			X"08", X"49", X"2A", X"1C", X"2A", X"49", X"08", X"00", -- *
			X"08", X"08", X"08", X"7F", X"08", X"08", X"08", X"00", -- +
			X"00", X"00", X"00", X"00", X"0C", X"0C", X"04", X"08", -- ,
			X"00", X"00", X"00", X"7F", X"00", X"00", X"00", X"00", -- -
			X"00", X"00", X"00", X"00", X"00", X"0C", X"0C", X"00", -- .
			X"01", X"02", X"04", X"08", X"10", X"20", X"40", X"00", -- /
			X"1C", X"22", X"22", X"2A", X"22", X"22", X"1C", X"00", -- 0
			X"08", X"18", X"08", X"08", X"08", X"08", X"1C", X"00", -- 1
			X"1C", X"22", X"02", X"04", X"08", X"10", X"3E", X"00", -- 2
			X"1C", X"22", X"02", X"0C", X"02", X"22", X"1C", X"00", -- 3
			X"0C", X"14", X"24", X"3E", X"04", X"04", X"0E", X"00", -- 4
			X"3E", X"20", X"3C", X"02", X"02", X"22", X"1C", X"00", -- 5
			X"1C", X"20", X"20", X"3C", X"22", X"22", X"1C", X"00", -- 6
			X"3E", X"02", X"04", X"08", X"10", X"10", X"10", X"00", -- 7
			X"1C", X"22", X"22", X"1C", X"22", X"22", X"1C", X"00", -- 8
			X"1C", X"22", X"22", X"1E", X"02", X"02", X"1C", X"00", -- 9
			X"00", X"0C", X"0C", X"00", X"0C", X"0C", X"00", X"00", -- :
			X"00", X"0C", X"0C", X"00", X"0C", X"0C", X"04", X"08", -- ;
			X"04", X"08", X"10", X"20", X"10", X"08", X"04", X"00", -- <
			X"00", X"00", X"7F", X"00", X"7F", X"00", X"00", X"00", -- =
			X"20", X"10", X"08", X"04", X"08", X"10", X"20", X"00", -- >
			X"1C", X"22", X"02", X"04", X"08", X"00", X"08", X"00", -- ?
			X"1C", X"22", X"2E", X"2A", X"2E", X"20", X"1C", X"00", -- @
			X"1C", X"22", X"22", X"3E", X"22", X"22", X"22", X"00", -- A
			X"78", X"24", X"24", X"3C", X"22", X"22", X"7C", X"00", -- B
			X"1C", X"22", X"20", X"20", X"20", X"22", X"1C", X"00", -- C
			X"38", X"24", X"22", X"22", X"22", X"24", X"38", X"00", -- D
			X"3E", X"20", X"20", X"3C", X"20", X"20", X"3E", X"00", -- E
			X"3E", X"20", X"20", X"3C", X"20", X"20", X"20", X"00", -- F
			X"1C", X"22", X"20", X"2E", X"22", X"22", X"1C", X"00", -- G
			X"22", X"22", X"22", X"3E", X"22", X"22", X"22", X"00", -- H
			X"1C", X"08", X"08", X"08", X"08", X"08", X"1C", X"00", -- I
			X"0E", X"04", X"04", X"04", X"24", X"24", X"18", X"00", -- J
			X"22", X"22", X"24", X"38", X"24", X"22", X"22", X"00", -- K
			X"10", X"10", X"10", X"10", X"10", X"10", X"1E", X"00", -- L
			X"41", X"63", X"55", X"49", X"41", X"41", X"41", X"00", -- M
			X"22", X"32", X"2A", X"2A", X"26", X"22", X"22", X"00", -- N
			X"1C", X"22", X"22", X"22", X"22", X"22", X"1C", X"00", -- O
			X"1C", X"12", X"12", X"1C", X"10", X"10", X"10", X"00", -- P
			X"1C", X"22", X"22", X"22", X"22", X"22", X"1C", X"06", -- Q
			X"3C", X"22", X"22", X"3C", X"28", X"24", X"22", X"00", -- R
			X"1C", X"22", X"20", X"1C", X"02", X"22", X"1C", X"00", -- S
			X"3E", X"08", X"08", X"08", X"08", X"08", X"08", X"00", -- T
			X"22", X"22", X"22", X"22", X"22", X"22", X"1C", X"00", -- U
			X"22", X"22", X"22", X"14", X"14", X"08", X"08", X"00", -- V
			X"41", X"41", X"41", X"2A", X"2A", X"14", X"14", X"00", -- W
			X"22", X"22", X"14", X"08", X"14", X"22", X"22", X"00", -- X
			X"22", X"22", X"14", X"08", X"08", X"08", X"08", X"00", -- Y
			X"3E", X"02", X"04", X"08", X"10", X"20", X"3E", X"00", -- Z
			X"1C", X"10", X"10", X"10", X"10", X"10", X"1C", X"00", -- [
			X"40", X"20", X"10", X"08", X"04", X"02", X"01", X"00", -- \
			X"1C", X"04", X"04", X"04", X"04", X"04", X"1C", X"00", -- ]
			X"08", X"14", X"22", X"00", X"00", X"00", X"00", X"00", -- ^
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"7F", -- _
			X"10", X"08", X"00", X"00", X"00", X"00", X"00", X"00", -- `
			X"00", X"1C", X"02", X"1E", X"22", X"22", X"1D", X"00", -- a
			X"10", X"10", X"1C", X"12", X"12", X"12", X"2C", X"00", -- b
			X"00", X"00", X"1C", X"20", X"20", X"20", X"1C", X"00", -- c
			X"02", X"02", X"0E", X"12", X"12", X"12", X"0D", X"00", -- d
			X"00", X"00", X"1C", X"22", X"3E", X"20", X"1C", X"00", -- e
			X"0C", X"12", X"10", X"38", X"10", X"10", X"10", X"00", -- f
			X"00", X"00", X"1D", X"22", X"22", X"1E", X"02", X"1C", -- g
			X"20", X"20", X"2C", X"32", X"22", X"22", X"22", X"00", -- h
			X"00", X"08", X"00", X"08", X"08", X"08", X"08", X"00", -- i
			X"00", X"08", X"00", X"08", X"08", X"08", X"08", X"30", -- j
			X"20", X"20", X"24", X"28", X"30", X"28", X"24", X"00", -- k
			X"18", X"08", X"08", X"08", X"08", X"08", X"08", X"00", -- l
			X"00", X"00", X"B6", X"49", X"49", X"41", X"41", X"00", -- m
			X"00", X"00", X"2C", X"12", X"12", X"12", X"12", X"00", -- n
			X"00", X"00", X"1C", X"22", X"22", X"22", X"1C", X"00", -- o
			X"00", X"00", X"2C", X"12", X"12", X"1C", X"10", X"10", -- p
			X"00", X"00", X"1A", X"24", X"24", X"1C", X"04", X"04", -- q
			X"00", X"00", X"2C", X"30", X"20", X"20", X"20", X"00", -- r
			X"00", X"00", X"1C", X"20", X"18", X"04", X"38", X"00", -- s
			X"00", X"08", X"1C", X"08", X"08", X"08", X"08", X"00", -- t
			X"00", X"00", X"24", X"24", X"24", X"24", X"1A", X"00", -- u
			X"00", X"00", X"22", X"22", X"22", X"14", X"08", X"00", -- v
			X"00", X"00", X"41", X"41", X"49", X"55", X"22", X"00", -- w
			X"00", X"00", X"22", X"14", X"08", X"14", X"22", X"00", -- x
			X"00", X"00", X"12", X"12", X"12", X"0E", X"02", X"1C", -- y
			X"00", X"00", X"3C", X"04", X"08", X"10", X"3C", X"00", -- z
			X"0C", X"10", X"10", X"20", X"10", X"10", X"0C", X"00", -- {
			X"08", X"08", X"08", X"08", X"08", X"08", X"08", X"00", -- |
			X"30", X"08", X"08", X"04", X"08", X"08", X"30", X"00", -- }
			X"00", X"00", X"30", X"49", X"06", X"00", X"00", X"00", -- ~
			X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00");
		signal charrom : charrom_t := charrom_init;
		signal vga_char_reg : vid_stage_t;
		signal pixels_reg : unsigned(7 downto 0);
	begin
		vga_character <= vga_char_reg;
		current_pixels <= pixels_reg;
		process(clk)
		begin
			if rising_edge(clk) then
				vga_char_reg <= vga_matrix;
				pixels_reg <= charrom(to_integer(current_char(6 downto 0) & vga_matrix.y(3 downto 1)));
			end if;
		end process;
	end block;

	piece_blk : block
		signal piece_pixels_reg : unsigned(piece_pixels'range) := (others => '0');
	begin
		piece_pixels <= piece_pixels_reg;

		process(clk)
		begin
			if rising_edge(clk) then
				piece_pixels_reg <= (others => '0');

				case piece(2 downto 0) is
				when piece_pawn =>
					case vga_matrix.board_rowy is     --  0       1       2       3       4       5       X
					when "001000" => piece_pixels_reg <= "000000000000000000000011110000000000000000000000";
					when "001001" => piece_pixels_reg <= "000000000000000000001111111100000000000000000000";
					when "001010" => piece_pixels_reg <= "000000000000000000111111111111000000000000000000";
					when "001011" => piece_pixels_reg <= "000000000000000001111111111111100000000000000000";
					when "001100" => piece_pixels_reg <= "000000000000000011111111111111110000000000000000";
					when "001101" => piece_pixels_reg <= "000000000000000011111111111111110000000000000000";
					when "001110" => piece_pixels_reg <= "000000000000000011111111111111110000000000000000";
					when "001111" => piece_pixels_reg <= "000000000000000001111111111111100000000000000000";
					when "010000" => piece_pixels_reg <= "000000000000000000111111111111000000000000000000";
					when "010001" => piece_pixels_reg <= "000000000000000000011111111110000000000000000000";
					when "010010" => piece_pixels_reg <= "000000000000000000000111111000000000000000000000";
					when "010011" => piece_pixels_reg <= "000000000000000000111111111111000000000000000000";
					when "010100" => piece_pixels_reg <= "000000000000000011111111111111110000000000000000";
					when "010101" => piece_pixels_reg <= "000000000000001111111111111111111100000000000000";
					when "010110" => piece_pixels_reg <= "000000000000000000001111111100000000000000000000";
					when "010111" => piece_pixels_reg <= "000000000000000000011111111110000000000000000000";
					when "011000" => piece_pixels_reg <= "000000000000000000011111111110000000000000000000";
					when "011001" => piece_pixels_reg <= "000000000000000000111111111111000000000000000000";
					when "011010" => piece_pixels_reg <= "000000000000000000111111111111000000000000000000";
					when "011011" => piece_pixels_reg <= "000000000000000001111111111111100000000000000000";
					when "011100" => piece_pixels_reg <= "000000000000000011111111111111110000000000000000";
					when "011101" => piece_pixels_reg <= "000000000000000111111111111111111000000000000000";
					when "011110" => piece_pixels_reg <= "000000000000001111111111111111111100000000000000";
					when "011111" => piece_pixels_reg <= "000000000000011111111111111111111110000000000000";
					when "100000" => piece_pixels_reg <= "000000000000111111111111111111111111000000000000";
					when "100001" => piece_pixels_reg <= "000000000001111111111111111111111111100000000000";
					when others =>
						null;
					end case;
				when piece_bishop =>
					case vga_matrix.board_rowy is     --  0       1       2       3       4       5       X
					when "000100" => piece_pixels_reg <= "000000000000000000000001100000000000000000000000";
					when "000101" => piece_pixels_reg <= "000000000000000000000011110000000000000000000000";
					when "000110" => piece_pixels_reg <= "000000000000000000000111111000000000000000000000";
					when "000111" => piece_pixels_reg <= "000000000000000000000011110000000000000000000000";
					when "001000" => piece_pixels_reg <= "000000000000000000000001100000000000000000000000";
					when "001001" => piece_pixels_reg <= "000000000000000000000111111000000000000000000000";
					when "001010" => piece_pixels_reg <= "000000000000000000001111111100000000000000000000";
					when "001011" => piece_pixels_reg <= "000000000000000000011110011110000000000000000000";
					when "001100" => piece_pixels_reg <= "000000000000000000111110011111000000000000000000";
					when "001101" => piece_pixels_reg <= "000000000000000001111110011111100000000000000000";
					when "001110" => piece_pixels_reg <= "000000000000000011110000000011110000000000000000";
					when "001111" => piece_pixels_reg <= "000000000000000111110000000011111000000000000000";
					when "010000" => piece_pixels_reg <= "000000000000000111111110011111111000000000000000";
					when "010001" => piece_pixels_reg <= "000000000000000111111110011111111000000000000000";
					when "010010" => piece_pixels_reg <= "000000000000000111111110011111111000000000000000";
					when "010011" => piece_pixels_reg <= "000000000000000011111110011111110000000000000000";
					when "010100" => piece_pixels_reg <= "000000000000000011111110011111110000000000000000";
					when "010101" => piece_pixels_reg <= "000000000000000001111111111111100000000000000000";
					when "010110" => piece_pixels_reg <= "000000000000000000111111111111000000000000000000";
					when "010111" => piece_pixels_reg <= "000000000000000000001111111100000000000000000000";
					when "011000" => piece_pixels_reg <= "000000000000000000000111111000000000000000000000";
					when "011001" => piece_pixels_reg <= "000000000000000000001111111100000000000000000000";
					when "011010" => piece_pixels_reg <= "000000000000000000011111111110000000000000000000";
					when "011011" => piece_pixels_reg <= "000000000000000000111111111111000000000000000000";
					when "011100" => piece_pixels_reg <= "000000000000000001111111111111100000000000000000";
					when "011101" => piece_pixels_reg <= "000000000000000011111111111111110000000000000000";
					when "011110" => piece_pixels_reg <= "000000000000000111111111111111111000000000000000";
					when "011111" => piece_pixels_reg <= "000000000000001111111111111111111100000000000000";
					when "100000" => piece_pixels_reg <= "000000000000011111111111111111111110000000000000";
					when "100001" => piece_pixels_reg <= "000000000000111111111111111111111111000000000000";
					when others =>
						null;
					end case;
				when piece_knight =>
					case vga_matrix.board_rowy is     --  0       1       2       3       4       5       X
					when "001000" => piece_pixels_reg <= "000000000000000000001000010000000000000000000000";
					when "001001" => piece_pixels_reg <= "000000000000000000010100101000000000000000000000";
					when "001010" => piece_pixels_reg <= "000000000000000000010010101000000000000000000000";
					when "001011" => piece_pixels_reg <= "000000000000000000011111111100000000000000000000";
					when "001100" => piece_pixels_reg <= "000000000000000000111111111110000000000000000000";
					when "001101" => piece_pixels_reg <= "000000000000000001100001111111000000000000000000";
					when "001110" => piece_pixels_reg <= "000000000000000011000111111111100000000000000000";
					when "001111" => piece_pixels_reg <= "000000000000000111011111111111110000000000000000";
					when "010000" => piece_pixels_reg <= "000000000000001111111111111111111000000000000000";
					when "010001" => piece_pixels_reg <= "000000000000111111111111111111111000000000000000";
					when "010010" => piece_pixels_reg <= "000000000001111111111111111111111100000000000000";
					when "010011" => piece_pixels_reg <= "000000000111111111111111111111111100000000000000";
					when "010100" => piece_pixels_reg <= "000000001111111111111111111111111110000000000000";
					when "010101" => piece_pixels_reg <= "000000011001111111111111111111111110000000000000";
					when "010110" => piece_pixels_reg <= "000000011011111111110011111111111111000000000000";
					when "010111" => piece_pixels_reg <= "000000011111001111000001111111111111000000000000";
					when "011000" => piece_pixels_reg <= "000000001110011100000001111111111111100000000000";
					when "011001" => piece_pixels_reg <= "000000001100111000000011111111111111100000000000";
					when "011010" => piece_pixels_reg <= "000000000001110000011111111111111111100000000000";
					when "011011" => piece_pixels_reg <= "000000000111000001111111111111111111110000000000";
					when "011100" => piece_pixels_reg <= "000000000000000111111111111111111111110000000000";
					when "011101" => piece_pixels_reg <= "000000000000011111111111111111111111110000000000";
					when "011110" => piece_pixels_reg <= "000000000000111111111111111111111111111000000000";
					when "011111" => piece_pixels_reg <= "000000000001111111111111111111111111111000000000";
					when "100000" => piece_pixels_reg <= "000000000011111111111111111111111111111000000000";
					when "100001" => piece_pixels_reg <= "000000000011111111111111111111111111111000000000";
					when others =>
						null;
					end case;
				when piece_rook =>
					case vga_matrix.board_rowy is     --  0       1       2       3       4       5       X
					when "001000" => piece_pixels_reg <= "000000001111110000111100001111000011111100000000";
					when "001001" => piece_pixels_reg <= "000000001111110000111100001111000011111100000000";
					when "001010" => piece_pixels_reg <= "000000001111110000111100001111000011111100000000";
					when "001011" => piece_pixels_reg <= "000000001111110000111100001111000011111100000000";
					when "001100" => piece_pixels_reg <= "000000001111110000111100001111000011111100000000";
					when "001101" => piece_pixels_reg <= "000000001111111111111111111111111111111100000000";
					when "001110" => piece_pixels_reg <= "000000000111111111111111111111111111111000000000";
					when "001111" => piece_pixels_reg <= "000000000011111111111111111111111111110000000000";
					when "010000" => piece_pixels_reg <= "000000000001111001111111111111111111100000000000";
					when "010001" => piece_pixels_reg <= "000000000001111001111111111111111111100000000000";
					when "010010" => piece_pixels_reg <= "000000000001111001111111111111100111100000000000";
					when "010011" => piece_pixels_reg <= "000000000001111001111111111111100111100000000000";
					when "010100" => piece_pixels_reg <= "000000000001111111111111111111100111100000000000";
					when "010101" => piece_pixels_reg <= "000000000001111111111111001111100111100000000000";
					when "010110" => piece_pixels_reg <= "000000000001111111111111001111111111100000000000";
					when "010111" => piece_pixels_reg <= "000000000001111111111111001111111111100000000000";
					when "011000" => piece_pixels_reg <= "000000000001111111111111001111111111100000000000";
					when "011001" => piece_pixels_reg <= "000000000001111111111111111111111111100000000000";
					when "011010" => piece_pixels_reg <= "000000000001111110011111111111111111100000000000";
					when "011011" => piece_pixels_reg <= "000000000001111110011111111111111111100000000000";
					when "011100" => piece_pixels_reg <= "000000000001111110011111110001111111100000000000";
					when "011101" => piece_pixels_reg <= "000000000001111110011111100000111111100000000000";
					when "011110" => piece_pixels_reg <= "000000000001111111111111100000111111100000000000";
					when "011111" => piece_pixels_reg <= "000000000001111111111111100000111111100000000000";
					when "100000" => piece_pixels_reg <= "000000000001111111111111100000111111100000000000";
					when "100001" => piece_pixels_reg <= "000000000001111111111111100000111111100000000000";
					when others =>
						null;
					end case;
				when piece_queen =>
					case vga_matrix.board_rowy is     --  0       1       2       3       4       5       X
					when "001000" => piece_pixels_reg <= "000000000000000000000001100000000000000000000000";
					when "001001" => piece_pixels_reg <= "000000000000000110000011110000011000000000000000";
					when "001010" => piece_pixels_reg <= "000000000000001111000110011000111100000000000000";
					when "001011" => piece_pixels_reg <= "000000001100011001100110011001100110001100000000";
					when "001100" => piece_pixels_reg <= "000000011110011001100011110001100110011110000000";
					when "001101" => piece_pixels_reg <= "000000110011001111000001100000111100110011000000";
					when "001110" => piece_pixels_reg <= "000000110011000110000001100000011000110011000000";
					when "001111" => piece_pixels_reg <= "000000011110000011000001100000110000011110000000";
					when "010000" => piece_pixels_reg <= "000000000110000001100011110001100000011000000000";
					when "010001" => piece_pixels_reg <= "000000000011100001110011110011100001110000000000";
					when "010010" => piece_pixels_reg <= "000000000011111001111011110111100111110000000000";
					when "010011" => piece_pixels_reg <= "000000000001111111111111111111111111100000000000";
					when "010100" => piece_pixels_reg <= "000000000001111111111111111111111111100000000000";
					when "010101" => piece_pixels_reg <= "000000000000111111111111111111111111000000000000";
					when "010110" => piece_pixels_reg <= "000000000000111111111111111111111111000000000000";
					when "010111" => piece_pixels_reg <= "000000000000111111111111111111111111000000000000";
					when "011000" => piece_pixels_reg <= "000000000000111111111111111111111111000000000000";
					when "011001" => piece_pixels_reg <= "000000000000011111111000000111111110000000000000";
					when "011010" => piece_pixels_reg <= "000000000000001111000111111000111100000000000000";
					when "011011" => piece_pixels_reg <= "000000000000000000111110011111000000000000000000";
					when "011100" => piece_pixels_reg <= "000000000000001111111100001111111100000000000000";
					when "011101" => piece_pixels_reg <= "000000000000011001111110011111100110000000000000";
					when "011110" => piece_pixels_reg <= "000000000000110000111111111111000011000000000000";
					when "011111" => piece_pixels_reg <= "000000000000111001111000000111100111000000000000";
					when "100000" => piece_pixels_reg <= "000000000001111111000111111000111111100000000000";
					when "100001" => piece_pixels_reg <= "000000000001110000111111111111000011100000000000";
					when others =>
						null;
					end case;
				when piece_king =>
					case vga_matrix.board_rowy is     --  0       1       2       3       4       5       X
					when "001000" => piece_pixels_reg <= "000000000000000000000001100000000000000000000000";
					when "001001" => piece_pixels_reg <= "000000000000000000000001100000000000000000000000";
					when "001010" => piece_pixels_reg <= "000000000000000000000001100000000000000000000000";
					when "001011" => piece_pixels_reg <= "000000000000000000111111111111000000000000000000";
					when "001100" => piece_pixels_reg <= "000000000000000000111111111111000000000000000000";
					when "001101" => piece_pixels_reg <= "000000000000000000000001100000000000000000000000";
					when "001110" => piece_pixels_reg <= "000000000000000000000001100000000000000000000000";
					when "001111" => piece_pixels_reg <= "000000000000000000000001100000000000000000000000";
					when "010000" => piece_pixels_reg <= "000000000000000000000001100000000000000000000000";
					when "010001" => piece_pixels_reg <= "000000000000000000000011110000000000000000000000";
					when "010010" => piece_pixels_reg <= "000000000000000000000111111000000000000000000000";
					when "010011" => piece_pixels_reg <= "000000000000111100000111111000001111000000000000";
					when "010100" => piece_pixels_reg <= "000000000011111110000111111000011111110000000000";
					when "010101" => piece_pixels_reg <= "000000000111111111001111111100111111111000000000";
					when "010110" => piece_pixels_reg <= "000000001111111111111111111111111111111100000000";
					when "010111" => piece_pixels_reg <= "000000000111111111111111111111111111111000000000";
					when "011000" => piece_pixels_reg <= "000000000011111111111111111111111111110000000000";
					when "011001" => piece_pixels_reg <= "000000000000111111111000000111111111000000000000";
					when "011010" => piece_pixels_reg <= "000000000000001111000111111000111100000000000000";
					when "011011" => piece_pixels_reg <= "000000000000000000111110011111000000000000000000";
					when "011100" => piece_pixels_reg <= "000000000000001111111100001111111100000000000000";
					when "011101" => piece_pixels_reg <= "000000000000011001111110011111100110000000000000";
					when "011110" => piece_pixels_reg <= "000000000000110000111111111111000011000000000000";
					when "011111" => piece_pixels_reg <= "000000000000111001111000000111100111000000000000";
					when "100000" => piece_pixels_reg <= "000000000001111111000111111000111111100000000000";
					when "100001" => piece_pixels_reg <= "000000000001110000111111111111000011100000000000";
					when others =>
						null;
					end case;
				when others =>
					null;
				end case;

				if piece(2 downto 0) /= piece_none then
					case vga_matrix.board_rowy is     --  0       1       2       3       4       5       X
					when "100010" => piece_pixels_reg <= "000000000011111111111111111111111111110000000000";
					when "100011" => piece_pixels_reg <= "000000000011000000000000000000000000110000000000";
					when "100100" => piece_pixels_reg <= "000000000111111111111111111111111111111000000000";
					when "100101" => piece_pixels_reg <= "000000000111111111111111111111111111111000000000";
					when "100110" => piece_pixels_reg <= "000000001111111111111111111111111111111100000000";
					when "100111" => piece_pixels_reg <= "000000001111111111111111111111111111111100000000";
					when others =>
						null;
					end case;
				end if;
			end if;
		end process;


		-- Generate target dot in center of pieced showing allowed moves for selected piece
		process(clk)
		begin
			if rising_edge(clk) then
				target_dot_reg <= "00";

				if (vga_matrix.board_rowy > 20) and (vga_matrix.board_rowy < 29) then
					if (vga_matrix.board_colx > 20) and (vga_matrix.board_colx < 29) then
						target_dot_reg <= "10";
					end if;
				end if;

				if (vga_matrix.board_rowy > 22) and (vga_matrix.board_rowy < 27) then
					if (vga_matrix.board_colx > 22) and (vga_matrix.board_colx < 27) then
						target_dot_reg <= "11";
					end if;
				end if;
			end if;
		end process;

	end block;

-- -----------------------------------------------------------------------
-- Combining, mixing and color selection
-- -----------------------------------------------------------------------
	color_blk : block
		signal vga_color_reg : vid_stage_t;
		signal color_reg : color_t := C_BLANK;
		signal border_cnt_reg : unsigned(2 downto 0) := (others => '0');
	begin
		vga_color <= vga_color_reg;
		current_color <= color_reg;

		process(clk)
		begin
			if rising_edge(clk) then
				if ena_1sec = '1' then
					if (not border_cnt_reg) /= 0 then
						border_cnt_reg <= border_cnt_reg + 1;
					end if;
				end if;
			end if;
		end process;

		process(clk)
		begin
			if rising_edge(clk) then
				vga_color_reg <= vga_character;

				color_reg <= C_BACKGROUND;

				if vga_character.board = '1' then
					color_reg <= C_BOARD_LIGHT;
					if (vga_character.board_col(0) xor vga_character.board_row(0)) = '1' then
						color_reg <= C_BOARD_DARK;
					end if;

					if piece_pixels(to_integer(47-vga_character.board_colx)) = '1' then
						color_reg <= C_PIECE_BLACK;
						if piece(3) = piece_white then
							color_reg <= C_PIECE_WHITE;
						end if;
					end if;

					-- Highlight for selected piece
					if cursor_select = '1' then
						if cursor_targets(to_integer(((not vga_character.board_row) & vga_character.board_col(2 downto 0)) xor (white_top & white_top & white_top & white_top & white_top & white_top))) = '1' then
							if target_dot_reg = "10" then
								color_reg <= C_TARGET_SIDE;
							end if;
							if target_dot_reg = "11" then
								color_reg <= C_TARGET_MID;
							end if;
						end if;
					end if;
				end if;

				if vga_character.char_dw = '0' then
					-- Narrow 80 column character
					if current_pixels(to_integer(7-vga_character.x(2 downto 0))) = '1' then
						color_reg <= C_CHARACTER;
					end if;
				else
					-- Wide 40 column character
					if current_pixels(to_integer(7-vga_character.x(3 downto 1))) = '1' then
						color_reg <= C_CHARACTER;
					end if;
				end if;

				if vga_character.cursor = '1' then
					if (vga_character.board_colx = 0) or (vga_character.board_colx = 1) or (vga_character.board_colx = 46) or (vga_character.board_colx = 47)
					or (vga_character.board_rowy = 0) or (vga_character.board_rowy = 1) or (vga_character.board_rowy = 46) or (vga_character.board_rowy = 47) then
						-- Cursor to select board cells or menu items
						if (cursor_row = vga_character.board_row) and (cursor_col = vga_character.board_col) then
							color_reg <= C_BOARD_CURSOR1;
						end if;

						-- Highlight a selected board cell as movement starting point
						if (cursor_select = '1') and (cursor_select_row = vga_character.board_row) and (("0" & cursor_select_col) = vga_character.board_col) then
							color_reg <= C_BOARD_CURSOR2;
						end if;
					end if;
				end if;
				if border_cnt_reg < 5 then
					if ((vga_character.x < 2) or (vga_character.x >= 638 and vga_character.x < 640)) and (vga_character.y < 480) then
						color_reg <= C_BORDER;
					end if;
					if ((vga_character.y < 2) or (vga_character.y >= 478 and vga_character.y < 480)) and (vga_character.x < 640) then
						color_reg <= C_BORDER;
					end if;
				end if;

				-- Never output pixels outside visible area
				if (vga_character.x > 639) or (vga_character.y > 479) then
					color_reg <= C_BLANK;
				end if;
			end if;
		end process;
	end block;

-- -----------------------------------------------------------------------
-- Output stage
-- -----------------------------------------------------------------------
	output_blk : block
		signal red_reg : unsigned(red'range) := (others => '0');
		signal grn_reg : unsigned(red'range) := (others => '0');
		signal blu_reg : unsigned(red'range) := (others => '0');
		signal output_reg : vid_stage_t;
	begin
		red <= red_reg;
		grn <= grn_reg;
		blu <= blu_reg;
		hsync <= output_reg.hsync;
		vsync <= output_reg.vsync;

		process(clk)
		begin
			if rising_edge(clk) then
				if vga_character.ena_pixel = '1' then
					output_reg <= vga_character;

					red_reg <= (others => '0');
					grn_reg <= (others => '0');
					blu_reg <= (others => '0');
					case current_color is
					when C_BLANK =>
						null;
					when C_BACKGROUND =>
						red_reg <= X"20";
					when C_BORDER =>
						red_reg <= (others => '1');
						grn_reg <= (others => '1');
						blu_reg <= (others => '1');
					when C_CHARACTER =>
						red_reg <= (others => '0');
						grn_reg <= (others => '1');
						blu_reg <= (others => '1');
					when C_BOARD_CURSOR1 =>
						red_reg <= X"FF";
						grn_reg <= X"FF";
					when C_BOARD_CURSOR2 =>
						grn_reg <= X"FF";
						blu_reg <= X"FF";
					when C_BOARD_LIGHT =>
						grn_reg <= X"80";
					when C_BOARD_DARK =>
						grn_reg <= X"50";
					when C_PIECE_BLACK =>
						red_reg <= (others => '0');
						grn_reg <= (others => '0');
						blu_reg <= (others => '0');
					when C_PIECE_WHITE =>
						red_reg <= (others => '1');
						grn_reg <= (others => '1');
						blu_reg <= (others => '1');
					when C_TARGET_MID =>
						red_reg <= (others => '1');
						grn_reg <= (others => '1');
						blu_reg <= (others => '0');
					when C_TARGET_SIDE =>
						red_reg <= X"20";
						grn_reg <= X"20";
						blu_reg <= X"80";
					end case;
				end if;
			end if;
		end process;
	end block;

end architecture;
