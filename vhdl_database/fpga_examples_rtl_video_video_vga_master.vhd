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
-- VGA Video sync and timing generator
--
-- -----------------------------------------------------------------------
--
-- clk          - video clock
-- clkDiv       - Clock divider. 0=clk, 1=clk/2, 2=clk/3 ... 15=clk/16
-- hSync        - Horizontal sync (sync polarity is set with hSyncPol)
-- vSync        - Vertical sync (sync polarity is set with vSyncPol)
-- genlock_hold - Delay start of vertical sync while genlock hold is one.
--                This is used to sync the vga timing to another video source.
-- endOfPixel   - Pixel clock is high each (clkDiv+1) clocks.
--                When clkDiv=0 is stays high continuously
-- endOfLine    - High when the last pixel on the current line is displayed.
-- endOfFrame   - High when the last pixel on the last line is displayed.
-- currentX     - X coordinate of current pixel.
-- currentY     - Y coordinate of current pixel.
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- -----------------------------------------------------------------------

entity video_vga_master is
	generic (
		clkDivBits : integer := 4
	);
	port (
-- System
		clk : in std_logic;
		clkDiv : in unsigned((clkDivBits-1) downto 0);

-- Sync outputs
		hSync : out std_logic;
		vSync : out std_logic;

-- Sync inputs
		genlock_hold : in std_logic := '0';

-- Control outputs
		endOfPixel : out std_logic;
		endOfLine : out std_logic;
		endOfFrame : out std_logic;
		currentX : out unsigned(11 downto 0);
		currentY : out unsigned(11 downto 0);

-- Configuration
		hSyncPol : in std_logic := '1';
		vSyncPol : in std_logic := '1';
		xSize : in unsigned(11 downto 0);
		ySize : in unsigned(11 downto 0);
		xSyncFr : in unsigned(11 downto 0);
		xSyncTo : in unsigned(11 downto 0);
		ySyncFr : in unsigned(11 downto 0);
		ySyncTo : in unsigned(11 downto 0)
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of video_vga_master is
	signal clkDivCnt : unsigned(clkDiv'high downto 0) := (others => '0');
	signal xCounter : unsigned(11 downto 0) := (others => '0');
	signal yCounter : unsigned(11 downto 0) := (others => '0');
	signal xCounterInc : unsigned(11 downto 0) := (others => '0');
	signal yCounterInc : unsigned(11 downto 0) := (others => '0');
	signal newPixel : std_logic := '0';
	
	signal hSync_reg : std_logic;
	signal vSync_reg : std_logic;

	signal pixel_reg : std_logic := '0';
	signal line_reg : std_logic := '0';
	signal frame_reg : std_logic := '0';
begin
-- -----------------------------------------------------------------------
-- Copy of local signals as outputs (for vga-slaves)
	hSync <= hSync_reg;
	vSync <= vSync_reg;
	currentX <= xCounter;
	currentY <= yCounter;
	endOfPixel <= pixel_reg;
	endOfLine <= line_reg;
	endOfFrame <= frame_reg;

-- -----------------------------------------------------------------------
-- X & Y counters
	process(clk)
	begin
		if rising_edge(clk) then
			yCounterInc <= yCounter + 1;
			pixel_reg <= '0';
			line_reg <= '0';
			frame_reg <= '0';
		
			if newPixel = '1' then
				pixel_reg <= '1';
				xCounter <= xCounterInc;
				if xCounterInc = xSize then
					line_reg <= '1';
					xCounter <= (others => '0');
					
					if (genlock_hold = '0') or (yCounterInc < ySyncFr) then
						yCounter <= yCounterInc;
					end if;
					if yCounterInc = ySize then
						frame_reg <= '1';
						yCounter <= (others => '0');
					end if;
				end if;
			end if;
		end if;
	end process;
	xCounterInc <= xCounter + 1;

-- -----------------------------------------------------------------------
-- Clock divider
	process(clk)
	begin
		if rising_edge(clk) then
			newPixel <= '0';
			clkDivCnt <= clkDivCnt + 1;
			if clkDivCnt = clkDiv then
				clkDivCnt <= (others => '0');
				newPixel <= '1';
			end if;
		end if;
	end process;

-- -----------------------------------------------------------------------
-- hSync
	process(clk)
	begin
		if rising_edge(clk) then
			hSync_reg <= not hSyncPol;
			if xCounter >= xSyncFr
			and xCounter < xSyncTo then
				hSync_reg <= hSyncPol;
			end if;
		end if;
	end process;

-- -----------------------------------------------------------------------
-- vSync
	process(clk)
	begin
		if rising_edge(clk) then
			if xCounter = xSyncFr then
				vSync_reg <= not vSyncPol;
				if yCounter >= ySyncFr
				and yCounter < ySyncTo then
					vSync_reg <= vSyncPol;
				end if;
			end if;
		end if;
	end process;
end architecture;


