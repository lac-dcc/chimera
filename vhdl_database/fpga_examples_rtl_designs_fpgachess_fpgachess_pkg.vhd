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
-- Global definitions shared between the various building blocks.
--
-- -----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package fpgachess_pkg is
	subtype piece_t is unsigned(3 downto 0);
	subtype extpiece_t is unsigned(4 downto 0);
	constant piece_white  : std_logic := '0';
	constant piece_black  : std_logic := '1';
	constant piece_empty  : unsigned(3 downto 0) := "0000";
	constant piece_none   : unsigned(2 downto 0) := "000";
	constant piece_pawn   : unsigned(2 downto 0) := "001";
	constant piece_bishop : unsigned(2 downto 0) := "010";
	constant piece_knight : unsigned(2 downto 0) := "011";
	constant piece_rook   : unsigned(2 downto 0) := "100";
	constant piece_queen  : unsigned(2 downto 0) := "101";
	constant piece_king   : unsigned(2 downto 0) := "110";

	constant ext_empty   : unsigned(4 downto 0) := "00000";
	constant ext_wpawn   : unsigned(4 downto 0) := "10001";
	constant ext_wbishop : unsigned(4 downto 0) := "10010";
	constant ext_wknight : unsigned(4 downto 0) := "10011";
	constant ext_wrook   : unsigned(4 downto 0) := "10100";
	constant ext_wqueen  : unsigned(4 downto 0) := "10101";
	constant ext_wking   : unsigned(4 downto 0) := "10110";
	constant ext_bpawn   : unsigned(4 downto 0) := "01001";
	constant ext_bbishop : unsigned(4 downto 0) := "01010";
	constant ext_bknight : unsigned(4 downto 0) := "01011";
	constant ext_brook   : unsigned(4 downto 0) := "01100";
	constant ext_bqueen  : unsigned(4 downto 0) := "01101";
	constant ext_bking   : unsigned(4 downto 0) := "01110";

	type board_t is array(0 to 63) of piece_t;
	type extboard_t is array(0 to 63) of extpiece_t;

	function to_piece(p : in extpiece_t) return piece_t;
	function to_extpiece(p : in piece_t) return extpiece_t;
end package;

package body fpgachess_pkg is
	function to_piece(p : in extpiece_t) return piece_t is
	begin
		return p(3 downto 0);
	end function;

	function to_extpiece(p : in piece_t) return extpiece_t is
		variable white_flag : std_logic;
	begin
		white_flag := '0';
		if (p(3) = piece_white) and (p(2 downto 0) /= piece_none) then
			white_flag := '1';
		end if;
		return white_flag & p;
	end function;
end package body;
