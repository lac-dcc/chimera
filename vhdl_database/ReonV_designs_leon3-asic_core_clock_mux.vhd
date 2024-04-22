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
-- Entity: core_clock_mux
-- File:	core_clock_mux.vhd
-- Author:	Fredrik Ringhage - Aeroflex Gaisler AB
-- Description: Clock muxes for LEONx ASIC
------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
library techmap;
use techmap.gencomp.clkmux;
use techmap.gencomp.has_clkmux;

entity core_clock_mux is
  generic(
    tech         : integer;
    scantest     : integer range 0 to 1 := 0
    );
  port(
    clksel     : in  std_logic_vector(1 downto 0);
    testen     : in  std_logic;
    clkin      : in  std_logic;
    clk1x      : in  std_logic;
    clk2x      : in  std_logic;
    clk4x      : in  std_logic;
    clkout     : out std_ulogic
  );
end entity;

architecture rtl of core_clock_mux is

  signal sel1x,sel2x,sel4x     : std_logic;
  signal lclkm1o,lclkm2o       : std_logic;
  signal selbypass,seltest     : std_logic;

begin

  -- Select testclk or not
  seltest <= '1' when (testen = '1' and scantest = 1) else '0';

  -- Bypass PLL
  selbypass <= '1' when (clksel = "00" or seltest = '1') else '0';

  -- Select PLL clock if not test or bypassed
  sel1x <= '1' when (clksel(1 downto 0) = "01" and selbypass = '0' and seltest = '0') else '0';
  sel2x <= '1' when (clksel(1 downto 0) = "10" and selbypass = '0' and seltest = '0') else '0';
  sel4x <= '1' when (clksel(1 downto 0) = "11" and selbypass = '0' and seltest = '0') else '0';

  -- Select output clock from PLL (or bypass PLL)
  lpllclkm1 : clkmux generic map (tech => tech) port map (clkin  ,clk1x,sel1x,lclkm1o);
  lpllclkm2 : clkmux generic map (tech => tech) port map (lclkm1o,clk2x,sel2x,lclkm2o);
  lpllclkm4 : clkmux generic map (tech => tech) port map (lclkm2o,clk4x,sel4x,clkout );

end architecture;

