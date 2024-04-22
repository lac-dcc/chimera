-- -----------------------------------------------------------------------
--
-- Syntiac VHDL support files.
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2017 by Peter Wendrich (pwsoft@syntiac.com)
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
-- IQ_Mixer for PAL and NTSC video encoding.
-- Requires clk to be exactly 16 times the color-burst frequency.
-- PAL needs some additional logic to rotate phase on each line.
--
-- This design has a 3 clock cycle latency from inputs to video output.
--
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- -----------------------------------------------------------------------

entity iq_mixer is
	generic (
		black_level : unsigned(7 downto 0);
		sync_level : unsigned(7 downto 0) := "00000000"
	);
	port (
		clk : in std_logic;
		phase_i : in unsigned(3 downto 0);
		phase_q : in unsigned(3 downto 0);
		in_y : in unsigned(7 downto 0);
		in_i : in signed(7 downto 0);
		in_q : in signed(7 downto 0);

		black : in std_logic;
		sync : in std_logic;

		video : out unsigned(7 downto 0)
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of iq_mixer is
	type sintable_t is array(integer range 0 to 15) of signed(7 downto 0);
	constant sintable : sintable_t := (
		X"00", X"31", X"5A", X"75", X"7F", X"75", X"5A", X"31",
		X"00", X"CF", X"A6", X"8B", X"81", X"8B", X"A6", X"CF");
	signal iq_i_sin : signed(15 downto 0) := (others => '0');
	signal iq_q_sin : signed(15 downto 0) := (others => '0');
	signal video_tmp : signed(9 downto 0) := (others => '0');

	signal black_dly : std_logic := '0';
	signal sync_dly : std_logic := '0';
begin
	process(clk)
	begin
		if rising_edge(clk) then
			iq_i_sin <= sintable(to_integer(phase_i)) * in_i;
			iq_q_sin <= sintable(to_integer(phase_q)) * in_q;
			black_dly <= black;
			sync_dly <= sync;
		end if;
	end process;

	process(clk)
	begin
		if rising_edge(clk) then
			video_tmp <= signed("00" & in_y) + iq_i_sin(15 downto 6) + iq_q_sin(15 downto 6);
			if black_dly = '1' then
				video_tmp <= signed("00" & black_level);
			end if;
			if sync_dly = '1' then
				video_tmp <= signed("00" & sync_level);
			end if;
		end if;
	end process;

	process(clk)
	begin
		if rising_edge(clk) then
			if video_tmp < 0 then
				-- Underflow color signal
				video <= "00000000";
			elsif video_tmp > "0011111111" then
				-- Overflow color signal
				video <= "11111111";
			else
				video <= unsigned(video_tmp(7 downto 0));
			end if;
		end if;
	end process;
end architecture;