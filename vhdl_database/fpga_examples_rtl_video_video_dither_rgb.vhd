-- -----------------------------------------------------------------------
--
-- Syntiac VHDL support files.
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2009 by Peter Wendrich (pwsoft@syntiac.com)
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
-- Video dither block. Converts high precision color signal to
-- lower precision by dithering. The dither input can for example
-- come from the current X and Y coordinates or a pseudo random source.
--
-- If bypass input is 1 the dither algorithm is disabled and the output
-- is equal to the input.
--
-- This component has a delay of one clock cycle.
--
-- uses entities:
-- * video_dither
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity video_dither_rgb is
	generic (
		dBitsR : integer := 8;
		dBitsG : integer := 8;
		dBitsB : integer := 8;
		qBitsR : integer := 5;
		qBitsG : integer := 6;
		qBitsB : integer := 5;
		ditherBits : integer := 4
	);
	port (
		clk : in std_logic;
		clkEna : in std_logic := '1';
		bypass : in std_logic := '0';

		dither : in unsigned(ditherBits-1 downto 0);
		dR : in unsigned((dBitsR-1) downto 0);
		dG : in unsigned((dBitsG-1) downto 0);
		dB : in unsigned((dBitsB-1) downto 0);
		qR : out unsigned((qBitsR-1) downto 0);
		qG : out unsigned((qBitsG-1) downto 0);
		qB : out unsigned((qBitsB-1) downto 0)
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of video_dither_rgb is
begin
	myRed : entity work.video_dither
		generic map (
			ditherBits => ditherBits,
			dBits => dBitsR,
			qBits => qBitsR
		)
		port map (
			clk => clk,
			clkEna => clkEna,
			bypass => bypass,
			dither => dither,
			d => dR,
			q => qR
		);
	myGrn : entity work.video_dither
		generic map (
			ditherBits => ditherBits,
			dBits => dBitsG,
			qBits => qBitsG
		)
		port map (
			clk => clk,
			clkEna => clkEna,
			bypass => bypass,
			dither => dither,
			d => dG,
			q => qG
		);
	myBlu : entity work.video_dither
		generic map (
			ditherBits => ditherBits,
			dBits => dBitsB,
			qBits => qBitsB
		)
		port map (
			clk => clk,
			clkEna => clkEna,
			bypass => bypass,
			dither => dither,
			d => dB,
			q => qB
		);
end architecture;

