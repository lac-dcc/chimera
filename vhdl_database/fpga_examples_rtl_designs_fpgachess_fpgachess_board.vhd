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
-- Keeps track of the board state
--
-- -----------------------------------------------------------------------
-- clk             - System clock input
--
-- search_req      - Toggle to start a move search on the board
-- search_ack      - Toggles when a search is complete
-- search_color    - Color to use when searching a move on the board
-- search_fromto   - Starting point when searching a move on the board
-- found_done      - High when no new move have been found on the board
-- found_fromto    - Coordinate and target of the found move on the board
--
-- -----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.fpgachess_pkg.all;

-- -----------------------------------------------------------------------

entity fpgachess_board is
	port (
		clk : in std_logic;
		busy : out std_logic;

		board : out extboard_t;
		board_display_trig : out std_logic;

		new_game_trig : in std_logic;

		move_trig : in std_logic;
		move_fromto : in unsigned(11 downto 0);
		move_promotion : in piece_t;
		undo_trig : in std_logic;
		undo_fromto : in unsigned(11 downto 0);
		undo_captured : in piece_t;
		undo_promotion : in piece_t;

		search_req : in std_logic;
		search_ack : out std_logic;
		search_color : in std_logic;
		search_fromto : in unsigned(11 downto 0);
		found_done : out std_logic;
		found_promotion : out std_logic;
		found_fromto : out unsigned(11 downto 0);

		movelist_trig : out std_logic;
		movelist_fromto : out unsigned(11 downto 0);
		movelist_captured : out piece_t;
		movelist_promotion : out piece_t
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of fpgachess_board is

	signal busy_reg : std_logic := '0';


	constant init_board : extboard_t :=  (
			ext_wrook, ext_wknight, ext_wbishop, ext_wqueen, ext_wking, ext_wbishop, ext_wknight, ext_wrook,
			ext_wpawn, ext_wpawn, ext_wpawn, ext_wpawn, ext_wpawn, ext_wpawn, ext_wpawn, ext_wpawn,
			ext_empty, ext_empty, ext_empty, ext_empty, ext_empty, ext_empty, ext_empty, ext_empty,
			ext_empty, ext_empty, ext_empty, ext_empty, ext_empty, ext_empty, ext_empty, ext_empty,
			ext_empty, ext_empty, ext_empty, ext_empty, ext_empty, ext_empty, ext_empty, ext_empty,
			ext_empty, ext_empty, ext_empty, ext_empty, ext_empty, ext_empty, ext_empty, ext_empty,
			ext_bpawn, ext_bpawn, ext_bpawn, ext_bpawn, ext_bpawn, ext_bpawn, ext_bpawn, ext_bpawn,
			ext_brook, ext_bknight, ext_bbishop, ext_bqueen, ext_bking, ext_bbishop, ext_bknight, ext_brook
		);
	signal eval_board_reg : extboard_t := init_board;

	signal move_piece_reg : extpiece_t := ext_empty;
	signal move_phase2_reg : std_logic := '0';
	signal undo_phase2_reg : std_logic := '0';
	signal update_display_reg : std_logic := '0';
begin
	busy <= busy_reg;
	board <= eval_board_reg;
	board_display_trig <= update_display_reg;

	move_blk : block
		signal fromto_reg : unsigned(11 downto 0);
		signal movelist_trig_reg : std_logic := '0';
		signal movelist_fromto_reg : unsigned(movelist_fromto'range) := (others => '0');
		signal movelist_captured_reg : piece_t := piece_empty;
		signal movelist_promotion_reg : piece_t := piece_empty;
	begin
		movelist_trig <= movelist_trig_reg;
		movelist_fromto <= movelist_fromto_reg;
		movelist_captured <= movelist_captured_reg;
		movelist_promotion <= movelist_promotion_reg;

		process(clk)
		begin
			if rising_edge(clk) then
				move_phase2_reg <= '0';
				undo_phase2_reg <= '0';
				movelist_trig_reg <= '0';
				update_display_reg <= '0';

				if new_game_trig = '1' then
					eval_board_reg <= init_board;
					update_display_reg <= '1';
				end if;
				if move_trig = '1' then
					move_phase2_reg <= '1';
					fromto_reg <= move_fromto;
					movelist_trig_reg <= '1';
					movelist_fromto_reg <= move_fromto;
					movelist_captured_reg <= to_piece(eval_board_reg(to_integer(move_fromto(5 downto 0))));
					movelist_promotion_reg <= move_promotion;
					move_piece_reg <= eval_board_reg(to_integer(move_fromto(11 downto 6)));
					if move_promotion /= piece_empty then
						move_piece_reg <= to_extpiece(move_promotion);
					end if;
				end if;
				if move_phase2_reg = '1' then
					eval_board_reg(to_integer(fromto_reg(5 downto 0))) <= move_piece_reg;
					eval_board_reg(to_integer(fromto_reg(11 downto 6))) <= piece_empty;
					update_display_reg <= '1';
				end if;
				if undo_trig = '1' then
					undo_phase2_reg <= '1';
					fromto_reg <= undo_fromto;
					move_piece_reg <= eval_board_reg(to_integer(undo_fromto(5 downto 0)));
					if undo_promotion /= piece_empty then
						move_piece_reg(2 downto 0) <= piece_pawn;
					end if;
				end if;
				if undo_phase2_reg = '1' then
					eval_board_reg(to_integer(fromto_reg(5 downto 0))) <= to_extpiece(undo_captured);
					eval_board_reg(to_integer(fromto_reg(11 downto 6))) <= move_piece_reg;
					update_display_reg <= '1';
				end if;
			end if;
		end process;
	end block;

	search_blk : block
		signal search_req_reg : std_logic := '0';
		signal search_ack_reg : std_logic := '0';
		signal search_fetch_reg : std_logic := '0';
		signal search_check_reg : std_logic := '0';
		signal search_piece_reg : extpiece_t := ext_empty;
		-- Possible captured/attacked piece in last search move.
		-- Used in move checks for rooks, bishops and queens so they don't move through opponent pieces.
		signal search_lastp_reg : extpiece_t := ext_empty;

		signal search_from_reg : unsigned(6 downto 0) := (others => '0');
		signal search_to_reg : unsigned(5 downto 0) := (others => '0');
		signal search_from_incr : unsigned(6 downto 0);
		signal found_promotion_reg : std_logic;
	begin
		search_ack <= search_ack_reg;
		search_from_incr <= search_from_reg + 1;
		found_done <= search_from_reg(6);
		found_fromto <= search_from_reg(5 downto 0) & search_to_reg;
		found_promotion <= found_promotion_reg;

		process(clk)
			variable valid : std_logic;
			variable skip : std_logic;
			variable col : integer range 0 to 7;
			variable row : integer range 0 to 7;
			variable cell : unsigned(5 downto 0);
			variable dest : unsigned(5 downto 0);
		begin
			if rising_edge(clk) then
				if search_from_reg(6) = '1' then
					-- Searched every cell
					search_ack_reg <= search_req_reg;
					search_fetch_reg <= '0';
					search_check_reg <= '0';
				elsif search_fetch_reg = '1' then
					search_fetch_reg <= '0';
					search_check_reg <= '1';
					search_piece_reg <= eval_board_reg(to_integer(search_from_reg(5 downto 0)));
					search_lastp_reg <= eval_board_reg(to_integer(search_to_reg(5 downto 0)));
				end if;

				if search_check_reg = '1' then
					valid := '0';
					skip := '0';
					col := to_integer(search_from_reg(2 downto 0));
					row := to_integer(search_from_reg(5 downto 3));
					cell := search_from_reg(5 downto 0);
					dest := search_to_reg;

					search_check_reg <= '0';
					if ((search_color = '0') and (search_piece_reg(4) = '0'))
					or ((search_color = '1') and (search_piece_reg(3) = '0')) then
						-- Cell doesn't have piece of matching color, so search next
						skip := '1';
					else
						case search_piece_reg(3 downto 0) is
						when piece_white & piece_pawn =>
							if search_to_reg = search_from_reg then
								-- Move forward once
								dest := cell+8;
								if eval_board_reg(to_integer(dest))(4 downto 3) = "00" then
									valid := '1';
									if row = 6 then
										found_promotion_reg <= '1';
									end if;
								end if;
							elsif search_to_reg = cell+8 then
								-- Capture left
								dest := cell+7;
								if (eval_board_reg(to_integer(dest))(3) = '1') and (col /= 0) then
									valid := '1';
									if row = 6 then
										found_promotion_reg <= '1';
									end if;
								end if;
							elsif search_to_reg = cell+7 then
								-- Capture right
								dest := cell+9;
								if (eval_board_reg(to_integer(dest))(3) = '1') and (col /= 7) then
									valid := '1';
									if row = 6 then
										found_promotion_reg <= '1';
									end if;
								end if;
							elsif (search_to_reg = cell+9) and (row = 1) then
								-- Two spaces forward on row one
								dest := cell+16;
								if (eval_board_reg(to_integer(cell+8))(4 downto 3) = "00") and (eval_board_reg(to_integer(dest))(4 downto 3) = "00") then
									valid := '1';
								end if;
							else
								skip := '1';
							end if;
						when piece_black & piece_pawn =>
							if search_to_reg = search_from_reg then
								-- Move forward once
								dest := cell-8;
								if eval_board_reg(to_integer(dest))(4 downto 3) = "00" then
									valid := '1';
									if row = 1 then
										found_promotion_reg <= '1';
									end if;
								end if;
							elsif search_to_reg = cell-8 then
								-- Capture right
								dest := cell-7;
								if (eval_board_reg(to_integer(dest))(4) = '1') and (col /= 7) then
									valid := '1';
									if row = 1 then
										found_promotion_reg <= '1';
									end if;
								end if;
							elsif search_to_reg = cell-7 then
								-- Capture left
								dest := cell-9;
								if (eval_board_reg(to_integer(dest))(4) = '1') and (col /= 0) then
									valid := '1';
									if row = 1 then
										found_promotion_reg <= '1';
									end if;
								end if;
							elsif (search_to_reg = cell-9) and (row = 6) then
								-- Two spaces forward on row six
								dest := cell-16;
								if (eval_board_reg(to_integer(cell-8))(4 downto 3) = "00") and (eval_board_reg(to_integer(dest))(4 downto 3) = "00") then
									valid := '1';
								end if;
							else
								skip := '1';
							end if;
						when piece_white & piece_knight | piece_black & piece_knight =>
							if search_to_reg = search_from_reg then
								-- Two up, right
								dest := cell+17;
								if (row < 6) and (col /= 7) then
									if ((eval_board_reg(to_integer(dest))(4) = search_color) or (eval_board_reg(to_integer(dest))(4 downto 3) = "00")) then
										valid := '1';
									end if;
								end if;
							elsif search_to_reg = cell+17 then
								-- Two up, left
								dest := cell+15;
								if (row < 6) and (col /= 0) then
									if ((eval_board_reg(to_integer(dest))(4) = search_color) or (eval_board_reg(to_integer(dest))(4 downto 3) = "00")) then
										valid := '1';
									end if;
								end if;
							elsif search_to_reg = cell+15 then
								-- up, two right
								dest := cell+10;
								if (row /= 7) and (col < 6) then
									if ((eval_board_reg(to_integer(dest))(4) = search_color) or (eval_board_reg(to_integer(dest))(4 downto 3) = "00")) then
										valid := '1';
									end if;
								end if;
							elsif search_to_reg = cell+10 then
								-- up, two left
								dest := cell+6;
								if (row /= 7) and (col > 1) then
									if ((eval_board_reg(to_integer(dest))(4) = search_color) or (eval_board_reg(to_integer(dest))(4 downto 3) = "00")) then
										valid := '1';
									end if;
								end if;
							elsif search_to_reg = cell+6 then
								-- down, two right
								dest := cell-6;
								if (row /= 0) and (col < 6) then
									if ((eval_board_reg(to_integer(dest))(4) = search_color) or (eval_board_reg(to_integer(dest))(4 downto 3) = "00")) then
										valid := '1';
									end if;
								end if;
							elsif search_to_reg = cell-6 then
								-- down, two left
								dest := cell-10;
								if (row /= 0) and (col > 1) then
									if ((eval_board_reg(to_integer(dest))(4) = search_color) or (eval_board_reg(to_integer(dest))(4 downto 3) = "00")) then
										valid := '1';
									end if;
								end if;
							elsif search_to_reg = cell-10 then
								-- two down, right
								dest := cell-15;
								if (row > 1) and (col /= 7) then
									if ((eval_board_reg(to_integer(dest))(4) = search_color) or (eval_board_reg(to_integer(dest))(4 downto 3) = "00")) then
										valid := '1';
									end if;
								end if;
							elsif search_to_reg = cell-15 then
								-- two down, left
								dest := cell-17;
								if (row > 1) and (col /= 0) then
									if ((eval_board_reg(to_integer(dest))(4) = search_color) or (eval_board_reg(to_integer(dest))(4 downto 3) = "00")) then
										valid := '1';
									end if;
								end if;
							else
								skip := '1';
							end if;
						when piece_white & piece_rook | piece_black & piece_rook =>
							if search_to_reg = search_from_reg then
								if (col /= 7) then
									-- Check right
									dest := cell+1;
									if ((eval_board_reg(to_integer(dest))(4) = search_color) or (eval_board_reg(to_integer(dest))(4 downto 3) = "00")) then
										valid := '1';
									end if;
								else
									-- Check left
									dest := cell-1;
									if ((eval_board_reg(to_integer(dest))(4) = search_color) or (eval_board_reg(to_integer(dest))(4 downto 3) = "00")) then
										valid := '1';
									end if;
								end if;
							elsif (dest(5 downto 3) = cell(5 downto 3)) and (dest(2 downto 0) > cell(2 downto 0)) then
								-- Going right
								if (search_lastp_reg(4 downto 3) = "00") and (dest(2 downto 0) /= 7) then
									-- Only go right further if not hitting right border and last destination empty (can't move through opponent)
									dest := dest+1;
									if ((eval_board_reg(to_integer(dest))(4) = search_color) or (eval_board_reg(to_integer(dest))(4 downto 3) = "00")) then
										valid := '1';
									end if;
								elsif (col /= 0) then
									-- Try going left
									dest := cell-1;
									if ((eval_board_reg(to_integer(dest))(4) = search_color) or (eval_board_reg(to_integer(dest))(4 downto 3) = "00")) then
										valid := '1';
									end if;
								elsif (row /= 7) then
									-- Try going up
									dest := cell+8;
									if ((eval_board_reg(to_integer(dest))(4) = search_color) or (eval_board_reg(to_integer(dest))(4 downto 3) = "00")) then
										valid := '1';
									end if;
								else
									-- Try going down
									dest := cell-8;
									if ((eval_board_reg(to_integer(dest))(4) = search_color) or (eval_board_reg(to_integer(dest))(4 downto 3) = "00")) then
										valid := '1';
									end if;
								end if;
							elsif (dest(5 downto 3) = cell(5 downto 3)) and (dest(2 downto 0) < cell(2 downto 0)) then
								-- Going left
								if (search_lastp_reg(4 downto 3) = "00") and (dest(2 downto 0) /= 0) then
									-- Only go left further if not hitting left border and last destination empty (can't move through opponent)
									dest := dest-1;
									if ((eval_board_reg(to_integer(dest))(4) = search_color) or (eval_board_reg(to_integer(dest))(4 downto 3) = "00")) then
										valid := '1';
									end if;
								elsif (row /= 7) then
									-- Try going up
									dest := cell+8;
									if ((eval_board_reg(to_integer(dest))(4) = search_color) or (eval_board_reg(to_integer(dest))(4 downto 3) = "00")) then
										valid := '1';
									end if;
								else
									-- Try going down
									dest := cell-8;
									if ((eval_board_reg(to_integer(dest))(4) = search_color) or (eval_board_reg(to_integer(dest))(4 downto 3) = "00")) then
										valid := '1';
									end if;
								end if;
							elsif (dest(5 downto 3) > cell(5 downto 3)) and (dest(2 downto 0) = cell(2 downto 0)) then
								-- Going up
								if (search_lastp_reg(4 downto 3) = "00") and (dest(5 downto 3) /= 7) then
									-- Only go up further if not hitting upper border and last destination empty (can't move through opponent)
									dest := dest+8;
									if ((eval_board_reg(to_integer(dest))(4) = search_color) or (eval_board_reg(to_integer(dest))(4 downto 3) = "00")) then
										valid := '1';
									end if;
								elsif (row /= 0) then
									-- Try going down
									dest := cell-8;
									if ((eval_board_reg(to_integer(dest))(4) = search_color) or (eval_board_reg(to_integer(dest))(4 downto 3) = "00")) then
										valid := '1';
									end if;
								else
									-- Already checked right,left,up and can't go down
									skip := '1';
								end if;
							else
								-- Going down
								if (search_lastp_reg(4 downto 3) = "00") and (dest(5 downto 3) /= 0) then
									-- Only go down further if not hitting lower border and last destination empty (can't move through opponent)
									dest := dest-8;
									if ((eval_board_reg(to_integer(dest))(4) = search_color) or (eval_board_reg(to_integer(dest))(4 downto 3) = "00")) then
										valid := '1';
									end if;
								else
									-- All four directions checked
									skip := '1';
								end if;
							end if;
						when others =>
							skip := '1';
						end case;
					end if;

					search_to_reg <= dest;
					if valid = '1' then
						search_ack_reg <= search_req_reg;
					else
						search_fetch_reg <= '1';
					end if;
					if skip = '1' then
						search_from_reg <= search_from_incr;
						search_to_reg <= search_from_incr(5 downto 0);
					end if;
				end if;

				if search_req /= search_req_reg then
					search_req_reg <= search_req;
					search_fetch_reg <= '1';
					search_check_reg <= '0';
					search_from_reg <= "0" & search_fromto(11 downto 6);
					search_to_reg <= search_fromto(5 downto 0);
					found_promotion_reg <= '0';
				end if;
			end if;
		end process;
	end block;
end architecture;
