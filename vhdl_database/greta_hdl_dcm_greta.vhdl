--
-- Copyright (C) 2013 Martin Åberg
--
--  This program is free software: you can redistribute it
--  and/or modify it under the terms of the GNU General Public
--  License as published by the Free Software Foundation,
--  either version 3 of the License, or (at your option)
--  any later version.
--
--  This program is distributed in the hope that it will
--  be useful, but WITHOUT ANY WARRANTY; without even the
--  implied warranty of MERCHANTABILITY or FITNESS FOR A
--  PARTICULAR PURPOSE.  See the GNU General Public License
--  for more details.
--
--  You should have received a copy of the GNU General
--  Public License along with this program.  If not, see
--  <http://www.gnu.org/licenses/>.
--
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity dcm_greta is
   port ( CLKIN_IN        : in    std_logic; 
          CLKFX_OUT       : out   std_logic; 
          CLKFX180_OUT    : out   std_logic; 
          CLKIN_IBUFG_OUT : out   std_logic; 
          LOCKED_OUT      : out   std_logic);
end;

architecture BEHAVIORAL of dcm_greta is
   signal CLKFX_BUF       : std_logic;
   signal CLKFX180_BUF    : std_logic;
   signal CLKIN_IBUFG     : std_logic;
   signal GND_BIT         : std_logic;
begin
   GND_BIT <= '0';
   CLKIN_IBUFG_OUT <= CLKIN_IBUFG;
   CLKFX_BUFG_INST : BUFG
      port map (I=>CLKFX_BUF,
                O=>CLKFX_OUT);
   
   CLKFX180_BUFG_INST : BUFG
      port map (I=>CLKFX180_BUF,
                O=>CLKFX180_OUT);
   
   CLKIN_IBUFG_INST : IBUFG
      port map (I=>CLKIN_IN,
                O=>CLKIN_IBUFG);
   
   DCM_SP_INST : DCM_SP
   generic map( CLK_FEEDBACK => "NONE",
            CLKDV_DIVIDE => 2.0,
            -- 133.3 ... MHz
            CLKFX_DIVIDE => 3,
            CLKFX_MULTIPLY => 8,
            CLKIN_DIVIDE_BY_2 => FALSE,
            CLKIN_PERIOD => 20.000,
            CLKOUT_PHASE_SHIFT => "NONE",
            DESKEW_ADJUST => "SYSTEM_SYNCHRONOUS",
            DFS_FREQUENCY_MODE => "LOW",
            DLL_FREQUENCY_MODE => "LOW",
            DUTY_CYCLE_CORRECTION => TRUE,
            FACTORY_JF => x"C080",
            PHASE_SHIFT => 0,
            STARTUP_WAIT => FALSE)
      port map (CLKFB=>GND_BIT,
                CLKIN=>CLKIN_IBUFG,
                DSSEN=>GND_BIT,
                PSCLK=>GND_BIT,
                PSEN=>GND_BIT,
                PSINCDEC=>GND_BIT,
                RST=>GND_BIT,
                CLKDV=>open,
                CLKFX=>CLKFX_BUF,
                CLKFX180=>CLKFX180_BUF,
                CLK0=>open,
                CLK2X=>open,
                CLK2X180=>open,
                CLK90=>open,
                CLK180=>open,
                CLK270=>open,
                LOCKED=>LOCKED_OUT,
                PSDONE=>open,
                STATUS=>open);
end;

