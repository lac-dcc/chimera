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
-- Keeps track of played moves. Both for display of previous moves, but also
-- for undo/redo and review/analysis of a game. Also assists storing search
-- state.
--
-- -----------------------------------------------------------------------
--
-- search_mode  - When set the moves are stored in the search list
--                Separate from the normal move list and used to store and
--                undo moves while traversing the min/max tree.
--
-- -----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.fpgachess_pkg.all;

-- -----------------------------------------------------------------------

entity fpgachess_movelist is
	generic (
		ply_count_bits : integer;
		scroll_threshold : integer;
		vid_line_start : integer;
		vid_line_end : integer
	);
	port (
		clk : in std_logic;

		current_color : out std_logic;
		search_mode : in std_logic;

		clear_trig : in std_logic;
		move_trig : in std_logic;
		undo_trig : in std_logic;
		redo_trig : in std_logic;

		move_fromto : in unsigned(11 downto 0);
		move_captured : in piece_t;
		move_promotion : in piece_t;

		undo_valid : out std_logic;
		undo_fromto : out unsigned(11 downto 0);
		undo_captured : out piece_t;
		undo_promotion : out piece_t;
		redo_valid : out std_logic;
		redo_fromto : out unsigned(11 downto 0);

		vid_line : in unsigned(5 downto 0);
		vid_move_show : out unsigned(1 downto 0);
		vid_move_ply : out unsigned(ply_count_bits-1 downto 0);
		vid_white_fromto : out unsigned(11 downto 0);
		vid_black_fromto : out unsigned(11 downto 0)
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of fpgachess_movelist is
	-- Add one bit to get twice the storage as half of it is used for storing search tree
	constant storage_bits : integer := ply_count_bits+1;
	type moves_t is array(0 to (2**storage_bits)-1) of unsigned(11 downto 0);
	type captures_t is array(0 to (2**storage_bits)-1) of piece_t;
	type promotions_t is array(0 to (2**storage_bits)-1) of piece_t;
	signal moves_reg : moves_t := (others => (others => '0'));
	signal captures_reg : captures_t := (others => (others => '0'));
	signal promotions_reg : promotions_t := (others => (others => '0'));
	signal readout_fromto_reg : unsigned(11 downto 0) := (others => '0');
	signal readout_captured_reg : piece_t := piece_empty;
	signal readout_promotion_reg : piece_t := piece_empty;

	signal undo_valid_reg : std_logic := '0';
	signal undo_fromto_reg : unsigned(11 downto 0) := (others => '0');
	signal undo_captured_reg : piece_t := piece_empty;
	signal undo_promotion_reg : piece_t := piece_empty;
	signal redo_valid_reg : std_logic := '0';
	signal redo_fromto_reg : unsigned(11 downto 0) := (others => '0');


	-- position counters have one bit greater as memory address so compares also work when at full capacity and won't cause wraparound glitches.
	signal current_pos_reg : unsigned(ply_count_bits downto 0) := (others => '0');
	signal max_count_reg : unsigned(ply_count_bits downto 0) := (others => '0');

	-- These are position counters used only for search
	signal search_pos_reg : unsigned(ply_count_bits downto 0) := (others => '0');

	signal vid_move_addr : unsigned(storage_bits-1 downto 0) := (others => '0');
	signal vid_white_trig : std_logic;
	signal vid_black_trig : std_logic;
begin
	current_color <= current_pos_reg(0);
	undo_valid <= undo_valid_reg;
	undo_fromto <= undo_fromto_reg;
	undo_captured <= undo_captured_reg;
	undo_promotion <= undo_promotion_reg;
	redo_valid <= '0'; --redo_valid_reg;
	redo_fromto <= redo_fromto_reg;

	memory_blk : block
		signal we_reg : std_logic := '0';
		signal addr_reg : unsigned(storage_bits-1 downto 0) := (others => '0');
		signal fromto_reg : unsigned(move_fromto'range) := (others => '0');

		signal undo_update_reg : std_logic := '0';
		signal undo_ready_reg : unsigned(1 downto 0) := (others => '0');
		signal vid_ready_reg : unsigned(1 downto 0) := (others => '0');
		signal vid_color_reg : unsigned(1 downto 0) := (others => '0');
	begin
		-- A memory read for the video output has completed (after 2 cycles)
		vid_white_trig <= '1' when (vid_ready_reg(1) = '1') and vid_color_reg(1) = '0' else '0';
		vid_black_trig <= '1' when (vid_ready_reg(1) = '1') and vid_color_reg(1) = '1' else '0';

		process(clk)
		begin
			if rising_edge(clk) then
				if we_reg = '1' then
					moves_reg(to_integer(addr_reg)) <= fromto_reg;
					captures_reg(to_integer(addr_reg)) <= move_captured;
					promotions_reg(to_integer(addr_reg)) <= move_promotion;
				else
					readout_fromto_reg <= moves_reg(to_integer(addr_reg));
					readout_captured_reg <= captures_reg(to_integer(addr_reg));
					readout_promotion_reg <= promotions_reg(to_integer(addr_reg));
				end if;
			end if;
		end process;

		process(clk)
		begin
			if rising_edge(clk) then
				we_reg <= '0';
				undo_update_reg <= '0';
				undo_ready_reg <= undo_ready_reg(0) & '0';
				vid_ready_reg <= vid_ready_reg(0) & '0';
				vid_color_reg(1) <= vid_color_reg(0);

				if (clear_trig = '1') or (undo_trig = '1') then
					-- Last move information is not valid (possibly will become again once fetched)
					undo_ready_reg <= "00";
					undo_valid_reg <= '0';
					undo_update_reg <= undo_trig;
					redo_valid_reg <= undo_trig;
					redo_fromto_reg <= undo_fromto_reg;
				end if;
--				if redo_trig = '1' then
--				end if;

				if move_trig = '1' then
					we_reg <= '1';
					undo_valid_reg <= '1';
					redo_valid_reg <= '0';
					fromto_reg <= move_fromto;
					addr_reg(ply_count_bits-1 downto 0) <= current_pos_reg(ply_count_bits-1 downto 0);
					addr_reg(addr_reg'high) <= '0';
					undo_fromto_reg <= move_fromto;
					undo_captured_reg <= move_captured;
					undo_promotion_reg <= move_promotion;
				elsif undo_update_reg = '1' then
					undo_valid_reg <= '0';
					addr_reg(ply_count_bits-1 downto 0) <= current_pos_reg(ply_count_bits-1 downto 0)-1;
					addr_reg(addr_reg'high) <= '0';
					if current_pos_reg > 0 then
						undo_ready_reg(0) <= '1';
					end if;
				else
					-- Read historic move data for video output
					-- Done at lowest priority as data is displayed on the most right side of the screen
					-- So an almost full line of time is available to read the memory
					vid_color_reg(0) <= not vid_color_reg(0);
					addr_reg <= vid_move_addr;
					addr_reg(0) <= not vid_color_reg(0);
					vid_ready_reg(0) <= '1';
				end if;

				if undo_ready_reg(1) = '1' then
					-- Read memory to update last move information
					undo_valid_reg <= '1';
					undo_fromto_reg <= readout_fromto_reg;
					undo_captured_reg <= readout_captured_reg;
					undo_promotion_reg <= readout_promotion_reg;
				end if;
			end if;
		end process;
	end block;

	process(clk)
	begin
		if rising_edge(clk) then
			if clear_trig = '1' then
				current_pos_reg <= (others => '0');
				max_count_reg <= (others => '0');
			end if;
			if move_trig = '1' then
				current_pos_reg <= current_pos_reg + 1;
				max_count_reg <= current_pos_reg + 1;
			end if;
			if undo_trig = '1' then
				current_pos_reg <= current_pos_reg - 1;
			end if;
			if redo_trig = '1' then
				current_pos_reg <= current_pos_reg + 1;
			end if;
		end if;
	end process;

	video_blk : block
		signal vid_move_show_reg : unsigned(vid_move_show'range) := (others => '0');
		signal vid_move_ply_reg : unsigned(vid_move_ply'range) := (others => '0');
		signal vid_white_fromto_reg : unsigned(vid_white_fromto'range) := (others => '0');
		signal vid_black_fromto_reg : unsigned(vid_black_fromto'range) := (others => '0');
	begin
		vid_move_show <= vid_move_show_reg;
		vid_move_ply <= vid_move_ply_reg;
		vid_white_fromto <= vid_white_fromto_reg;
		vid_black_fromto <= vid_black_fromto_reg;

		vid_move_addr <= "0" & vid_move_ply_reg;

		process(clk)
		begin
			if rising_edge(clk) then
				vid_move_show_reg <= (others => '0');

				if (vid_line >= vid_line_start) and (vid_line < vid_line_end) then
					vid_move_ply_reg(vid_move_ply_reg'high downto 1) <= resize(vid_line, ply_count_bits-1) - vid_line_start;
					vid_move_ply_reg(0) <= '0';

					if vid_move_ply_reg < max_count_reg then
						-- At least white made a turn in this move
						vid_move_show_reg(0) <= '1';
						if vid_move_ply_reg < max_count_reg-1 then
							-- Black also made turn this move, so enable both bits
							vid_move_show_reg(1) <= '1';
						end if;
					end if;
				end if;

				if vid_white_trig = '1' then
					vid_white_fromto_reg <= readout_fromto_reg;
				end if;
				if vid_black_trig = '1' then
					vid_black_fromto_reg <= readout_fromto_reg;
				end if;
			end if;
		end process;
	end block;
end architecture;
