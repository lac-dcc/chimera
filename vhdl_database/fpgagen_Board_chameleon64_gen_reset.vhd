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
-- Power-on reset circuit with manual reset button input.
--
-- -----------------------------------------------------------------------
--
-- reset = 1 (nreset = 0) on power-on or after pressing button. After
-- resetCycles number of clocks have passed the reset line is released.
-- If a longer reset period is required the enable input can be connected
-- to a slow clock signal (like the video vertical blanking interrupt).
-- The enable input should be one clock cycle high each video frame.
-- Then resetCycles is specified in the number of video frames iso clock cycles.
--
-- Initial reset is only active after power-on. It will not be retriggered by
-- the reset button.
--
-- If button is connected and set to '1' a new reset cycle if started.
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity gen_reset is
	generic (
		resetCycles: integer := 4095
	);
	port (
		clk : in std_logic;
		enable : in std_logic := '1';
		
		button : in std_logic := '0';
		initial_reset : out std_logic;
		reset : out std_logic;
		nreset : out std_logic
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of gen_reset is
	signal cnt : integer range 0 to resetCycles := 0;
	signal initial_nreset_reg : std_logic := '0';
	signal nresetLoc : std_logic := '0';
begin
	initial_reset <= not initial_nreset_reg;
	reset <= not nresetLoc;
	nreset <= nresetLoc;

	process(clk)
	begin
		if rising_edge(clk) then
			nresetLoc <= '1';
			if cnt < resetCycles then
				nresetLoc <= '0';
				if enable = '1' then
					cnt <= cnt + 1;
				end if;
			else
				initial_nreset_reg <= '1';
			end if;
			if button = '1' then
				cnt <= 0;
			end if;
		end if;
	end process;
end architecture;
