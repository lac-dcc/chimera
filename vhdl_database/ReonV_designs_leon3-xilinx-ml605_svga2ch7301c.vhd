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
-------------------------------------------------------------------------------
-- Entity:      svga2ch7301c
-- File:        svga2ch7301c.vhd
-- Author:      Jan Andersson - Aeroflex Gaisler AB
--              jan@gaisler.com
--
-- Description: Converter inteneded to connect a SVGACTRL core to a Chrontel
--              CH7301C DVI transmitter. Multiplexes data and generates clocks.
--              Tailored for use on the Xilinx ML50x boards with Leon3/GRLIB
--              template designs.
--
-- This multiplexer has been developed for use with the Chrontel CH7301C DVI
-- transmitter. Supported multiplexed formats are, as in the CH7301 datasheet:
--
-- IDF   Description
--  0    12-bit multiplexed RGB input (24-bit color), (scheme 1)
--  1    12-bit multiplexed RGB2 input (24-bit color), (scheme 2)
--  2    8-bit multiplexed RGB input (16-bit color, 565)
--  3    8-bit multiplexed RGB input (15-bit color, 555)
--
-- This core assumes a 100 MHz input clock on the 'clk' input.
--
-- If the generic 'dynamic' is non-zero the core uses the value vgao.bitdepth
-- to decide if multiplexing should be done according to IDF 0 or IDF 2.
-- vago.bitdepth = "11" gives IDF 0, others give IDF2.
-- The 'idf' generic is not used when the 'dynamic' generic is non-zero.
-- Note that if dynamic selection is enabled you will need to reconfigure
-- the DVI transmitter when the VGA core changes bit depth.
-- 

library ieee;
use ieee.std_logic_1164.all;

library gaisler;
use gaisler.misc.all;

library grlib;
use grlib.stdlib.all;

-- pragma translate_off
library unisim;
use unisim.BUFG;
use unisim.DCM;
-- pragma translate_on

library techmap;
use techmap.gencomp.all;

entity svga2ch7301c is
  
  generic (
    tech    : integer := 0;
    idf     : integer := 0;
    dynamic : integer := 0
    );
  port (
    clk100      : in  std_ulogic;
    clk125      : in  std_ulogic;
    rstn        : in  std_ulogic;
    clksel      : in  std_logic_vector(1 downto 0);
    vgao        : in  apbvga_out_type;
    clkvga     : out std_ulogic;
    dclk_p      : out std_ulogic;
    dclk_n      : out std_ulogic;
    data        : out std_logic_vector(11 downto 0);
    hsync       : out std_ulogic;
    vsync       : out std_ulogic;
    de          : out std_ulogic
    );
  
end svga2ch7301c;

architecture rtl of svga2ch7301c is

  component BUFG port (O : out std_logic; I : in std_logic); end component;

  constant VERSION : integer := 1;
  
  signal vcc, gnd : std_logic;
  signal d0, d1 : std_logic_vector(11 downto 0);
  signal red, green, blue : std_logic_vector(7 downto 0);

  signal lvgaclk, vgaclk, clk40, clk65, clk50, clk25 : std_ulogic;
  
  signal clkval : std_logic_vector(1 downto 0);
  signal clkval40 : std_logic_vector(1 downto 0);
  signal clkval65 : std_logic_vector(1 downto 0);
  
begin  -- rtl

  vcc <= '1'; gnd <= '0';

  -----------------------------------------------------------------------------
  -- RGB data multiplexer
  -----------------------------------------------------------------------------
  red <= vgao.video_out_r;
  green <= vgao.video_out_g;
  blue <= vgao.video_out_b;
  clkvga <= vgaclk;

  static: if dynamic = 0 generate
    idf0: if (idf = 0) generate
      d0 <= green(3 downto 0) & blue(7 downto 0);
      d1 <= red(7 downto 0) & green(7 downto 4);
    end generate;

    idf1: if (idf = 1) generate
      d0 <= green(4 downto 2) & blue(7 downto 3) & green(0) & blue(2 downto 0);
      d1 <= red(7 downto 3) & green(7 downto 5) & red(2 downto 0) & green(1);
    end generate;

    idf2: if (idf = 2) generate
      d0(11 downto 4) <= green(4 downto 2) & blue(7 downto 3);
      d0(3 downto 0) <= (others => '0');
      d1(11 downto 4) <= red(7 downto 3) & green(7 downto 5);
      d1(3 downto 0) <= (others => '0');
      data(3 downto 0) <= (others => '0');
    end generate;

    idf3: if (idf = 3) generate
      d0(11 downto 4) <= green(5 downto 3) & blue(7 downto 3);
      d0(3 downto 0) <= (others => '0');
      d1(11 downto 4) <= '0' & red(7 downto 3) & green(7 downto 6);
      d1(3 downto 0) <= (others => '0');
      data(3 downto 0) <= (others => '0');
    end generate idf3;

    -- DDR regs
    dataregs: for i in 11 downto (4*(idf/2)) generate
      ddr_oreg0 : ddr_oreg generic map (tech)
        port map (q => data(i), c1 => vgaclk, c2 => gnd, ce => vcc,
                  d1 => d0(i), d2 => d1(i), r => gnd, s => gnd);
    end generate;
  end generate;
  
  nostatic: if dynamic /= 0 generate
    d0 <= green(3 downto 0) & blue(7 downto 0) when vgao.bitdepth = "11" else
          green(4 downto 2) & blue(7 downto 3) & "0000";

    d1 <= red(7 downto 0) & green(7 downto 4) when vgao.bitdepth = "11" else
          red(7 downto 3) & green(7 downto 5) & "0000";

    dataregs: for i in 11 downto 0 generate
      ddr_oreg0 : ddr_oreg generic map (tech)
        port map (q => data(i), c1 => vgaclk, c2 => gnd, ce => vcc,
                  d1 => d0(i), d2 => d1(i), r => gnd, s => gnd);
    end generate;
  end generate;

  -----------------------------------------------------------------------------
  -- Sync signals
  -----------------------------------------------------------------------------
  
  process (vgaclk)
  begin  -- process
    if rising_edge(vgaclk) then
      hsync <= vgao.hsync;
      vsync <= vgao.vsync;
      de    <= vgao.blank;
    end if;
  end process;
  
  -----------------------------------------------------------------------------
  -- Clock generation
  -----------------------------------------------------------------------------

  ddroreg_p : ddr_oreg generic map (tech)
    port map (q => dclk_p, c1 => vgaclk, c2 => gnd, ce => vcc,
              d1 => vcc, d2 => gnd, r => gnd, s => gnd);
  ddroreg_n : ddr_oreg generic map (tech)
    port map (q => dclk_n, c1 => vgaclk, c2 => gnd, ce => vcc,
              d1 => gnd, d2 => vcc, r => gnd, s => gnd);
  
  -- Clock selection
  bufg00 : BUFG port map (I => lvgaclk, O => vgaclk);
  lvgaclk <= clk25 when clksel = "00" else clk40 when clksel = "01"
 	else clk50 when clksel = "10" else clk65;
  
  -- Generate clocks
  clkdiv : process(clk100, rstn)
  begin
    if rstn = '0' then clkval <= "00";
    elsif rising_edge(clk100) then
      clkval <= clkval + 1;
    end if;
  end process;

  clkdiv65 : process(clk125, rstn)
  begin
    if rstn = '0' then clkval65 <= "00"; clkval40 <= "00";
    elsif rising_edge(clk125) then
      clkval65 <= clkval65 + 1;
      if clkval40 = "10" then clkval40 <= "00";
      else clkval40 <= clkval40 + 1; end if;
    end if;
  end process;

  clk25 <= clkval(1);
  clk50 <= clkval(0);
  clk40 <= clkval40(1);
  clk65 <= clkval65(0);
  
end rtl;

