-- -----------------------------------------------------------------------
--
-- Turbo Chameleon 64
--
-- Multi purpose FPGA expansion for the Commodore 64 computer
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2019 by Peter Wendrich (pwsoft@syntiac.com)
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
-- Default toplevel entity for the Turbo Chameleon 64 first edition
--
-- -----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- -----------------------------------------------------------------------

entity chameleon1 is
	port (
-- Clocks
		clk8m : in std_logic;
		phi2_n : in std_logic;
		dotclk_n : in std_logic;

-- Freeze button
		usart_cts : in std_logic; -- Left button
		freeze_btn : in std_logic;  -- Middle button

-- SPI, Flash and SD-Card
		spi_miso : in std_logic;
		mmc_cd : in std_logic;
		mmc_wp : in std_logic;

-- C64
		ioef : in std_logic;
		romlh : in std_logic;

-- MUX CPLD
		mux_clk : out std_logic;
		mux : out unsigned(3 downto 0);
		mux_d : out unsigned(3 downto 0);
		mux_q : in unsigned(3 downto 0);

-- SDRAM
		ram_clk : out std_logic;
		ram_ldqm : out std_logic;
		ram_udqm : out std_logic;
		ram_ras : out std_logic;
		ram_cas : out std_logic;
		ram_we : out std_logic;
		ram_ba : out unsigned(1 downto 0);
		ram_a : out unsigned(12 downto 0);
		ram_d : inout unsigned(15 downto 0);

-- USB micro
		usart_clk : in std_logic;
		usart_rts : in std_logic;
		usart_tx : in std_logic;

-- Video output
		red : out unsigned(4 downto 0);
		grn : out unsigned(4 downto 0);
		blu : out unsigned(4 downto 0);
		hsync_n : out std_logic;
		vsync_n : out std_logic;

-- Audio output
		sigma_l : out std_logic;
		sigma_r : out std_logic
	);
end entity;
