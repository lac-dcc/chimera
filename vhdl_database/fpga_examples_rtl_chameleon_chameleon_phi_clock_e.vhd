-- -----------------------------------------------------------------------
--
-- VGA-64
--
-- Multi purpose FPGA expansion for the Commodore 64 computer
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2018 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/chameleon.html
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
-- C64 Phi2-clock regeneration and divider
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- -----------------------------------------------------------------------

entity chameleon_phi_clock is
	generic (
		phase_shift : integer := 8
	);
	port (
		clk : in std_logic;
		phi2_n : in std_logic;
		
		-- Standalone mode, 0=PAL and 1=NTSC
		mode : in std_logic := '0';
		
		-- Buffered and inverted phi_n (delayed)
		phiLength : out unsigned(7 downto 0);
		
		-- no_clock is high when there are no phiIn changes detected.
		-- This signal allows switching between real I/O and internal emulation.
		no_clock : out std_logic;
		
		-- docking_station is high when there are no phiIn changes (no_clock) and
		-- the phi signal is low. Without docking station phi is pulled up.
		docking_station : out std_logic;

		-- Resynthesised Phi2 clock
		phiLocal : out std_logic;
		-- Cycle counter
		phiCnt : out unsigned(7 downto 0);
		-- Control pulses
		phiPreHalf : out std_logic;
		phiHalf : out std_logic;
		phiPreEnd : out std_logic;
		phiEnd : out std_logic;

		-- First cycle where phiLocal is changed.
		phiPost1 : out std_logic;
		-- Second cycle after phiLocal change.
		phiPost2 : out std_logic;
		-- Third cycle after phiLocal change.
		phiPost3 : out std_logic;
		-- Forth cycle after phiLocal change.
		phiPost4 : out std_logic
	);
end entity;


