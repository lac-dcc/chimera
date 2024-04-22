------------------------------------------------------------------------------
--  Clock generator for VGA/TMDS video output.
--  Modified by Joris van Rantwijk to support Digilent Atlys board.
--
------------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2003 - 2008, Gaisler Research
--  Copyright (C) 2008 - 2012, Aeroflex Gaisler
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

library ieee;
use ieee.std_logic_1164.all;
library techmap;
use techmap.gencomp.all;
use techmap.allclkgen.all;
library unisim;
use unisim.vcomponents.BUFGMUX;
use unisim.vcomponents.PLL_BASE;


entity vga_clkgen is
  port (
    resetn  : in  std_logic;
    clk100  : in  std_logic;
    sel     : in  std_logic_vector(1 downto 0);
    vgaclk  : out std_logic;
    fastclk : out std_logic
  );
end;

architecture struct of vga_clkgen is

  signal s_resetp  : std_logic;
  signal s_clkfb   : std_logic;
  signal s_clk25   : std_logic;
  signal s_clk40   : std_logic;
  signal s_clk125  : std_logic;
  signal s_clk200  : std_logic;

begin

  s_resetp <= not resetn;

  -- Generate VGA pixel clock and 5x fast clock.
  vgapll: PLL_BASE
    generic map (
      CLKFBOUT_MULT => 10,
      DIVCLK_DIVIDE => 1,
      CLKOUT0_DIVIDE => 40,
      CLKOUT1_DIVIDE => 25,
      CLKOUT2_DIVIDE => 8,
      CLKOUT3_DIVIDE => 5,
      CLKIN_PERIOD => 10.0,
      CLK_FEEDBACK => "CLKFBOUT" )
    port map (
      CLKIN => clk100,
      CLKFBIN => s_clkfb,
      CLKFBOUT => s_clkfb,
      CLKOUT0 => s_clk25,
      CLKOUT1 => s_clk40,
      CLKOUT2 => s_clk125,
      CLKOUT3 => s_clk200,
      RST => s_resetp );

  -- Choose between 25 Mhz and 40 MHz for pixel clock.
  bufg0 : BUFGMUX
    port map ( I0 => s_clk25, I1 => s_clk40, S => sel(0), O => vgaclk );

  -- Choose between 125 MHz and 200 MHz for TMDS output clock.
  bufg1 : BUFGMUX
    port map ( I0 => s_clk125, I1 => s_clk200, S => sel(0), O => fastclk );

end architecture;

