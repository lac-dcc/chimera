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
-- Evaluate the board and give a score. Positive score when white has
-- advantage and negative score when black has advantage.
--
-- -----------------------------------------------------------------------
-- clk             - System clock input
--
-- -----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.fpgachess_pkg.all;

-- -----------------------------------------------------------------------

entity fpgachess_eval is
	port (
		clk : in std_logic;

		board : in extboard_t;
--		board_flags : in unsigned(15 downto 0);

		eval_req : in std_logic;
		eval_ack : out std_logic;
		eval_score : out signed(11 downto 0)
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of fpgachess_eval is
	constant eval_sum_bits : integer := 12;
	constant eval_part_bits : integer := 8;

	type eval_cells_t is array(0 to 63) of signed(eval_part_bits-1 downto 0);
	type eval_sum_t is array(0 to 7) of signed(eval_sum_bits-1 downto 0);

	signal eval_cells_reg : eval_cells_t := (others => (others => '0'));
	signal eval_row_sum_reg : eval_sum_t := (others => (others => '0'));
	signal eval_sum_reg : signed(eval_sum_bits-1 downto 0) := (others => '0');

	signal eval_board_reg : extboard_t := (others => ext_empty);
	signal eval_req_reg : std_logic := '0';
	signal eval_ack_reg : std_logic := '0';
	signal eval_score_reg : signed(eval_score'range) := (others => '0');
begin
	eval_ack <= eval_ack_reg;
	eval_score <= eval_sum_reg;

	process(clk)
	begin
		if rising_edge(clk) then
			if eval_req /= eval_req_reg then
				eval_req_reg <= eval_req;
				eval_board_reg <= board;
			end if;
		end if;
	end process;

	eval_block : block
		-- Check if there are files with pawns of only one color
		signal wpawn_in_file_reg : unsigned(0 to 7) := (others => '0');
		signal bpawn_in_file_reg : unsigned(0 to 7) := (others => '0');
		signal wpawn_sum : unsigned(3 downto 0) := (others => '0');
		signal bpawn_sum : unsigned(3 downto 0) := (others => '0');
		signal pawn_sum_reg : signed(4 downto 0) := (others => '0');
	begin
		popcnt8_wpawn_inst : entity work.fpgachess_popcnt8
			port map (
				d => wpawn_in_file_reg,
				q => wpawn_sum
			);
		popcnt8_bpawn_inst : entity work.fpgachess_popcnt8
			port map (
				d => bpawn_in_file_reg,
				q => bpawn_sum
			);

		process(clk)
			variable row_sum : signed(eval_sum_bits-1 downto 0);
--			variable pawn_sum : signed(pawn_sum_reg'range);
			variable sum : signed(eval_sum_bits-1 downto 0);

		begin
			if rising_edge(clk) then
				wpawn_in_file_reg <= (others => '0');
				bpawn_in_file_reg <= (others => '0');
				for cell in 0 to 63 loop
					case to_piece(eval_board_reg(cell)) is
					when piece_white & piece_pawn =>
						eval_cells_reg(cell) <= to_signed(10, eval_part_bits);
						wpawn_in_file_reg(cell mod 8) <= '1';
					when piece_white & piece_bishop => eval_cells_reg(cell) <= to_signed(30, eval_part_bits);
					when piece_white & piece_knight => eval_cells_reg(cell) <= to_signed(30, eval_part_bits);
					when piece_white & piece_rook => eval_cells_reg(cell) <= to_signed(50, eval_part_bits);
					when piece_white & piece_queen => eval_cells_reg(cell) <= to_signed(70, eval_part_bits);
					when piece_white & piece_king => eval_cells_reg(cell) <= to_signed(100, eval_part_bits);
					when piece_black & piece_pawn =>
						eval_cells_reg(cell) <= to_signed(-10, eval_part_bits);
						bpawn_in_file_reg(cell mod 8) <= '1';
					when piece_black & piece_bishop => eval_cells_reg(cell) <= to_signed(-30, eval_part_bits);
					when piece_black & piece_knight => eval_cells_reg(cell) <= to_signed(-30, eval_part_bits);
					when piece_black & piece_rook => eval_cells_reg(cell) <= to_signed(-50, eval_part_bits);
					when piece_black & piece_queen => eval_cells_reg(cell) <= to_signed(-70, eval_part_bits);
					when piece_black & piece_king => eval_cells_reg(cell) <= to_signed(-100, eval_part_bits);
					when others =>
						eval_cells_reg(cell) <= (others => '0');
					end case;
				end loop;

				for row in 0 to 7 loop
					row_sum := (others => '0');
					for col in 0 to 7 loop
						row_sum := row_sum + resize(eval_cells_reg(row*8+col), eval_sum_bits);
					end loop;
					eval_row_sum_reg(row) <= row_sum;
				end loop;

				pawn_sum_reg <= "00000" + to_integer(wpawn_sum) - to_integer(bpawn_sum);

				sum := (others => '0');
				sum := sum + resize(pawn_sum_reg, eval_sum_bits);
				for row in 0 to 7 loop
					sum := sum + eval_row_sum_reg(row);
				end loop;
				eval_sum_reg <= sum;
			end if;
		end process;
	end block;
end architecture;
