--
-- This file is part of the la16fw project.
--
-- Copyright (C) 2014-2015 Gregor Anich
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library unisim;
use unisim.vcomponents.all;

entity clock is
    generic(
        CLK_FAST_DIV : integer;
        CLK_FAST_MUL : integer;
        STARTUP_WAIT : boolean := false
    );
    port(
        clk_in   : in std_logic;
        reset    : in std_logic;
        clk      : out std_logic;
        clk_fb   : in std_logic;
        clk_fast : out std_logic;
        locked   : out std_logic
    );
end clock;

architecture behavioral of clock is
begin

    -- DCM_SP: Digital Clock Manager Circuit
    --         Spartan-3A
    -- Xilinx HDL Language Template, version 14.7
    DCM_SP_inst : DCM_SP
        generic map(
            CLKDV_DIVIDE          => 12.0,                 -- 4MHz on CLKDV
            CLKFX_DIVIDE          => CLK_FAST_DIV,
            CLKFX_MULTIPLY        => CLK_FAST_MUL,         -- 100MHz on CLKFX
            CLKIN_DIVIDE_BY_2     => FALSE,
            CLKIN_PERIOD          => 20.83333333333333333, -- 48MHz
            CLKOUT_PHASE_SHIFT    => "NONE",               -- Specify phase shift of "NONE", "FIXED" or "VARIABLE" 
            CLK_FEEDBACK          => "1X",                 -- Specify clock feedback of "NONE", "1X" or "2X" 
            DESKEW_ADJUST         => "SYSTEM_SYNCHRONOUS", -- "SOURCE_SYNCHRONOUS", "SYSTEM_SYNCHRONOUS" or an integer from 0 to 15
            DLL_FREQUENCY_MODE    => "LOW",                -- "HIGH" or "LOW" frequency mode for DLL
            DUTY_CYCLE_CORRECTION => TRUE,                 -- Duty cycle correction, TRUE or FALSE
            PHASE_SHIFT           => 0,                    -- Amount of fixed phase shift from -255 to 255
            STARTUP_WAIT          => TRUE--STARTUP_WAIT          -- Delay configuration DONE until DCM_SP LOCK, TRUE/FALSE
        )
        port map(
            CLKIN    => clk_in,   -- 48MHz clock input (from IBUFG, BUFG or DCM)
            RST      => reset,    -- DCM asynchronous reset input
            CLK0     => clk,      -- 0 degree DCM CLK ouptput
            CLK90    => open,     -- 90 degree DCM CLK output
            CLK180   => open,     -- 180 degree DCM CLK output
            CLK270   => open,     -- 270 degree DCM CLK output
            CLK2X    => open,     -- 2X DCM CLK output
            CLK2X180 => open,     -- 2X, 180 degree DCM CLK out
            CLKDV    => open,     -- Divided DCM CLK out (CLKDV_DIVIDE)
            CLKFX    => clk_fast, -- DCM CLK synthesis out (M/D)
            CLKFX180 => open,     -- 180 degree CLK synthesis out
            LOCKED   => locked,   -- DCM LOCK status output
            STATUS   => open,     -- 8-bit DCM status bits output
            CLKFB    => clk_fb,   -- DCM clock feedback
            PSCLK    => '0',  -- Dynamic phase adjust clock input
            PSEN     => '0',  -- Dynamic phase adjust enable input
            PSINCDEC => '0',  -- Dynamic phase adjust increment/decrement
            PSDONE   => open      -- Dynamic phase adjust done output
        );

end behavioral;

