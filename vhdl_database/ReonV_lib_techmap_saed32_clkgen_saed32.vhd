------------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2003 - 2008, Gaisler Research
--  Copyright (C) 2008 - 2014, Aeroflex Gaisler
--  Copyright (C) 2015 - 2017, Cobham Gaisler
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 
-----------------------------------------------------------------------------
-- Entity:      clkgen_saed32
-- File:        clkgen_saed32.vhd
-- Author:      Fredrik Ringhage - Aeroflex Gaisler AB
-- Description: Clock generator for SAED32
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library techmap;
use techmap.gencomp.all;

entity clkgen_saed32 is
  port (
    clkin   : in  std_logic;
    clk     : out std_logic;      -- main clock
    clk2x   : out std_logic;      -- 2x clock
    sdclk   : out std_logic;      -- SDRAM clock
    pciclk  : out std_logic;      -- PCI clock
    cgi     : in  clkgen_in_type;
    cgo     : out clkgen_out_type;
    clk4x   : out std_logic;      -- 4x clock
    clk1xu  : out std_logic;      -- unscaled 1X clock
    clk2xu  : out std_logic);     -- unscaled 2X clock
end; 

architecture struct of clkgen_saed32 is 

  component PLL
   port (
--    VDD25      : in    std_logic;
--    DVDD       : inout std_logic;
--    VSSA       : in    std_logic;
--    AVDD       : inout std_logic;
    REF_CLK    : in    std_logic;
    FB_CLK     : in    std_logic;
    FB_MODE    : in    std_logic;
    PLL_BYPASS : in    std_logic;
    CLK_4X     : out   std_logic;  
    CLK_2X     : out   std_logic;
    CLK_1X     : out   std_logic);
  end component;

  -----------------------------------------------------------------------------
   -- attributes
   -----------------------------------------------------------------------------
   attribute DONT_TOUCH  : Boolean;
   attribute DONT_TOUCH of pll0 : label is True;

begin

  pll0 : PLL port map (
--      VDD25      => '1',
--      DVDD       => open,
--      VSSA       => '0',
--      AVDD       => open,
      REF_CLK    => clkin,
      FB_CLK     => cgi.pllref,
      FB_MODE    => cgi.pllctrl(1),
      PLL_BYPASS => cgi.pllctrl(0),
      CLK_4X     => clk4x,
      CLK_2X     => clk2x,
      CLK_1X     => clk
    );

 cgo.clklock <= '1';
 sdclk <= '0';
 pciclk <= '0';
 cgo.pcilock <= '1';
 clk1xu <= '0';
 clk2xu <= '0';

end;

library ieee;

use ieee.std_logic_1164.all;
-- pragma translate_off
--library saed32;
--use saed32.CGLPPSX4_LVT;
-- pragma translate_on

entity clkand_saed32 is
  port (
    i     : in  std_ulogic;
    en    : in  std_ulogic;
    o     : out std_ulogic;
    tsten : in std_ulogic := '0');
end clkand_saed32;

architecture rtl of clkand_saed32 is

  component CGLPPSX4_LVT
      port (
          GCLK : out std_ulogic;
          CLK : in std_ulogic;
          EN : in std_ulogic;
          SE : in std_ulogic
      );
  end component;

   attribute DONT_TOUCH  : Boolean;
   attribute DONT_TOUCH of gate : label is True;

begin

  gate: CGLPPSX4_LVT port map (GCLK => o , CLK  => i , EN  => en, SE  => tsten);

end rtl;

library ieee;

use ieee.std_logic_1164.all;
-- pragma translate_off
--library saed32;
--use saed32.MUX21X1_LVT;
-- pragma translate_on
entity clkmux_saed32 is
  port (
    i0    : in  std_ulogic;
    i1    : in  std_ulogic;
    sel   : in  std_ulogic;
    o     : out std_ulogic);
end clkmux_saed32;

architecture rtl of clkmux_saed32 is

  component MUX21X1_LVT
      port (
          Y  : out std_ulogic;
          A1 : in std_ulogic;
          A2 : in std_ulogic;
          S0 : in std_ulogic
      );
  end component;

   attribute DONT_TOUCH  : Boolean;
   attribute DONT_TOUCH of m0 : label is True;

begin

  m0: MUX21X1_LVT port map (A1 => i0 , A2  => i1 , S0  => sel, Y => o);

end rtl;

library ieee;

use ieee.std_logic_1164.all;
-- pragma translate_off
--library saed32;
--use saed32.INVX4_LVT;
-- pragma translate_on

entity clkinv_saed32 is
  port (
    i : in  std_ulogic;
    o : out std_ulogic);
end clkinv_saed32;

architecture rtl of clkinv_saed32 is

  component INVX4_LVT
    port (
        Y : out std_ulogic;
        A : in std_ulogic
    );
  end component;

   attribute DONT_TOUCH  : Boolean;
   attribute DONT_TOUCH of gate : label is True;

begin

  gate: INVX4_LVT port map (A => i , Y  => o);

end rtl;

