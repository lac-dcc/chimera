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
-- Keeps track of statistics of the AI engine. As it works with very
-- big numbers, most of the calculations are performed in BCD arithmetic
-- to make them easy to display on the video output.
--
-- -----------------------------------------------------------------------
-- clk             - System clock input
--
--
--
-- vid_pos         - Selects the current digit to be displayed
-- vid_digit       - Digit on selected position 0-9 or F when digit is blanked
--                   This is updated on clock-cycle after vid_pos changes
-- -----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.fpgachess_pkg.all;

-- -----------------------------------------------------------------------

entity fpgachess_stats is
	generic (
		digits : integer
	);
	port (
		clk : in std_logic;
		reset : in std_logic;

		start_trig : in std_logic;
		move_trig : in std_logic;

		vid_pos : in unsigned(6 downto 0);
		vid_digit : out unsigned(3 downto 0)
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of fpgachess_stats is
	type number_t is array(0 to digits-1) of unsigned(3 downto 0);
	signal total_moves_reg : number_t := (others => (others => '0'));
	signal total_moves_carry_reg : unsigned(0 to digits-1) := (others => '0');
	signal vid_digit_reg : unsigned(vid_digit'range) := (others => '0');
begin
	vid_digit <= vid_digit_reg;

	process(clk)
	begin
		if rising_edge(clk) then
			total_moves_carry_reg <= (others => '0');
			for i in 0 to digits-1 loop
				if total_moves_carry_reg(i) = '1' then
					case total_moves_reg(i) is
					when X"1" => total_moves_reg(i) <= X"2";
					when X"2" => total_moves_reg(i) <= X"3";
					when X"3" => total_moves_reg(i) <= X"4";
					when X"4" => total_moves_reg(i) <= X"5";
					when X"5" => total_moves_reg(i) <= X"6";
					when X"6" => total_moves_reg(i) <= X"7";
					when X"7" => total_moves_reg(i) <= X"8";
					when X"8" => total_moves_reg(i) <= X"9";
					when X"9" => total_moves_reg(i) <= X"0";
						if i > 0 then
							-- Ripple carry to keep logic small (speed is ok as video is very slow in comparison)
							total_moves_carry_reg(i-1) <= '1';
						end if;
					when others => total_moves_reg(i) <= X"1";
					end case;
				end if;
			end loop;
			if move_trig = '1' then
				total_moves_carry_reg(total_moves_carry_reg'high) <= '1';
			end if;
			if (reset = '1') or (start_trig = '1') then
				total_moves_reg <= (others => X"F");
				total_moves_reg(total_moves_reg'high) <= X"0";
			end if;
		end if;
	end process;

	process(clk)
	begin
		if rising_edge(clk) then
			if vid_pos < digits then
				vid_digit_reg <= total_moves_reg(to_integer(vid_pos));
			else
				vid_digit_reg <= X"F";
			end if;
		end if;
	end process;
end architecture;
