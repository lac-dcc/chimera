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
-- Test bench for audio_sigmadelta_dac
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity audio_sigmadelta_dac_tb is
end entity;

-- -----------------------------------------------------------------------

architecture rtl of audio_sigmadelta_dac_tb is
	signal clk : std_logic;
	signal audio : signed(15 downto 0) := (others => '0');
	signal singlebit : std_logic;
begin
	mySigmaDelta : entity work.audio_sigmadelta_dac
		port map (
			clk => clk,
			
			d => audio,
			q => singlebit
		);
		
	process
	begin
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
	end process;

	process(clk)
	begin
		if rising_edge(clk) then
			audio <= audio + 1;
		end if;
	end process;
end architecture;


