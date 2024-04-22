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
-- Entity: 	syncram_dp
-- File:	syncram_dp.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	syncronous dual-port ram with tech selection
------------------------------------------------------------------------------

library ieee;
library techmap;
use ieee.std_logic_1164.all;
use techmap.gencomp.all;
use work.allmem.all;
library grlib;
use grlib.config.all;
use grlib.config_types.all;
use grlib.stdlib.all;

entity syncram_dp is
  generic (tech : integer := 0; abits : integer := 6; dbits : integer := 8;
	testen : integer := 0; custombits : integer := 1; sepclk: integer := 1;
        wrfst: integer := 0);
  port (
    clk1     : in std_ulogic;
    address1 : in std_logic_vector((abits -1) downto 0);
    datain1  : in std_logic_vector((dbits -1) downto 0);
    dataout1 : out std_logic_vector((dbits -1) downto 0);
    enable1  : in std_ulogic;
    write1   : in std_ulogic;
    clk2     : in std_ulogic;
    address2 : in std_logic_vector((abits -1) downto 0);
    datain2  : in std_logic_vector((dbits -1) downto 0);
    dataout2 : out std_logic_vector((dbits -1) downto 0);
    enable2  : in std_ulogic;
    write2   : in std_ulogic;
    testin   : in std_logic_vector(TESTIN_WIDTH-1 downto 0) := testin_none
    );
end;

architecture rtl of syncram_dp is
  signal xenable1,xxenable1,xenable2,xxenable2,xwrite1,xwrite2: std_ulogic;
  signal dataout1x,dataout1xx,dataout2x,dataout2xx: std_logic_vector((dbits-1) downto 0);
  signal custominx,customoutx: std_logic_vector(syncram_customif_maxwidth downto 0);
  signal vgnd: std_logic_vector((dbits-1) downto 0);

  component memrwcol is
    generic (
      techwrfst : integer;
      techrwcol : integer;
      techrdhold : integer;
      abits: integer;
      dbits: integer;
      sepclk: integer;
      wrfst: integer
      );
    port (
      clk1     : in  std_ulogic;
      clk2     : in  std_ulogic;
      uenable1 : in  std_ulogic;
      uwrite1  : in  std_ulogic;
      uaddress1: in  std_logic_vector((abits-1) downto 0);
      udatain1 : in  std_logic_vector((dbits-1) downto 0);
      udataout1: out std_logic_vector((dbits-1) downto 0);
      uenable2 : in  std_ulogic;
      uwrite2  : in  std_ulogic;
      uaddress2: in  std_logic_vector((abits-1) downto 0);
      udatain2 : in  std_logic_vector((dbits-1) downto 0);
      udataout2: out std_logic_vector((dbits-1) downto 0);
      menable1 : out std_ulogic;
      menable2 : out std_ulogic;
      mdataout1: in  std_logic_vector((dbits-1) downto 0);
      mdataout2: in  std_logic_vector((dbits-1) downto 0);
      testmode : in  std_ulogic;
      testdata : in  std_logic_vector((dbits-1) downto 0)
      );
  end component;

begin

  xenable1 <= enable1 and not testin(TESTIN_WIDTH-2) when testen/=0 else enable1;
  xenable2 <= enable2 and not testin(TESTIN_WIDTH-2) when testen/=0 else enable2;
  xwrite1 <= write1 and not testin(TESTIN_WIDTH-2) when testen/=0 else write1;
  xwrite2 <= write2 and not testin(TESTIN_WIDTH-2) when testen/=0 else write2;
  dataout1 <= dataout1xx;
  dataout2 <= dataout2xx;
  vgnd <= (others => '0');

  rwcol0: memrwcol
    generic map (
      techwrfst  => 0,
      techrwcol  => syncram_dp_dest_rw_collision(tech),
      techrdhold => syncram_dp_readhold(tech),
      abits     => abits,
      dbits     => dbits,
      sepclk    => sepclk,
      wrfst     => wrfst
      )
    port map (
      clk1      => clk1,
      clk2      => clk2,
      uenable1  => xenable1,
      uwrite1   => xwrite1,
      uaddress1 => address1,
      udatain1  => datain1,
      udataout1 => dataout1xx,
      uenable2  => xenable2,
      uwrite2   => xwrite2,
      uaddress2 => address2,
      udatain2  => datain2,
      udataout2 => dataout2xx,
      menable1  => xxenable1,
      menable2  => xxenable2,
      mdataout1 => dataout1x,
      mdataout2 => dataout2x,
      testmode  => '0',
      testdata  => vgnd
      );

-- pragma translate_off
  inf : if has_dpram(tech) = 0 generate
    x : process
    begin
      assert false report "synram_dp: technology " & tech_table(tech) &
	" not supported"
      severity failure;
      wait;
    end process;
  end generate;
  dmsg : if GRLIB_CONFIG_ARRAY(grlib_debug_level) >= 2 generate
    x : process
    begin
      assert false report "syncram_dp: " & tost(2**abits) & "x" & tost(dbits) &
       " (" & tech_table(tech) & ")"
      severity note;
      wait;
    end process;
  end generate;

-- pragma translate_on

    custominx <= (others => '0');

  nocust: if syncram_has_customif(tech)=0 generate
    customoutx <= (others => '0');
  end generate;

  xcv : if (tech = virtex) generate
    x0 : virtex_syncram_dp generic map (abits, dbits)
         port map (clk1, address1, datain1, dataout1x, xxenable1, xwrite1,
                   clk2, address2, datain2, dataout2x, xxenable2, xwrite2);
  end generate;

  xc2v : if (is_unisim(tech) = 1) and (tech /= virtex) generate
    x0 : unisim_syncram_dp generic map (abits, dbits)
         port map (clk1, address1, datain1, dataout1x, xxenable1, xwrite1,
                   clk2, address2, datain2, dataout2x, xxenable2, xwrite2);
  end generate;

  vir  : if tech = memvirage generate
    x0 : virage_syncram_dp generic map (abits, dbits)
         port map (clk1, address1, datain1, dataout1x, xxenable1, xwrite1,
                   clk2, address2, datain2, dataout2x, xxenable2, xwrite2);
  end generate;

  arti : if tech = memartisan generate
    x0 : artisan_syncram_dp generic map (abits, dbits)
         port map (clk1, address1, datain1, dataout1x, xxenable1, xwrite1,
                   clk2, address2, datain2, dataout2x, xxenable2, xwrite2);
  end generate;

  pa3  : if tech = apa3 generate
    x0 : proasic3_syncram_dp generic map (abits, dbits)
         port map (clk1, address1, datain1, dataout1x, xxenable1, xwrite1,
                   clk2, address2, datain2, dataout2x, xxenable2, xwrite2);
  end generate;

  pa3e  : if tech = apa3e generate
    x0 : proasic3e_syncram_dp generic map (abits, dbits)
         port map (clk1, address1, datain1, dataout1x, xxenable1, xwrite1,
                   clk2, address2, datain2, dataout2x, xxenable2, xwrite2);
  end generate;

  pa3l  : if tech = apa3l generate
    x0 : proasic3l_syncram_dp generic map (abits, dbits)
         port map (clk1, address1, datain1, dataout1x, xxenable1, xwrite1,
                   clk2, address2, datain2, dataout2x, xxenable2, xwrite2);
  end generate;

  igl2  : if tech = igloo2 generate
    x0 : igloo2_syncram_dp generic map (abits, dbits)
         port map (clk1, address1, datain1, dataout1x, xxenable1, xwrite1,
                   clk2, address2, datain2, dataout2x, xxenable2, xwrite2);
  end generate;

  rt4  : if tech = rtg4 generate
    x0 : rtg4_syncram_dp generic map (abits, dbits)
         port map (clk1, address1, datain1, dataout1x, xxenable1, xwrite1, open,
                   clk2, address2, datain2, dataout2x, xxenable2, xwrite2, open,
                   vgnd(0));
  end generate;

  saed  : if tech = saed32 generate
    x0 : saed32_syncram_dp generic map (abits, dbits)
         port map (clk1, address1, datain1, dataout1x, xxenable1, xwrite1,
                   clk2, address2, datain2, dataout2x, xxenable2, xwrite2);
  end generate;

  rhs  : if tech = rhs65 generate
    x0 : rhs65_syncram_dp generic map (abits, dbits)
         port map (clk1, address1, datain1, dataout1x, xxenable1, xwrite1,
                   clk2, address2, datain2, dataout2x, xxenable2, xwrite2);
  end generate;

  dar   : if tech = dare generate
    x0 : dare_syncram_dp generic map (abits, dbits)
         port map (clk1, address1, datain1, dataout1x, xxenable1, xwrite1,
                   clk2, address2, datain2, dataout2x, xxenable2, xwrite2);
  end generate;

  fus  : if tech = actfus generate
    x0 : fusion_syncram_dp generic map (abits, dbits)
         port map (clk1, address1, datain1, dataout1x, xxenable1, xwrite1,
                   clk2, address2, datain2, dataout2x, xxenable2, xwrite2);
  end generate;

  alt : if (tech = altera) or (tech = stratix1) or (tech = stratix2) or
	(tech = stratix3) or (tech = stratix4) or (tech = cyclone3) or
        (tech = stratix5) generate
    x0 : altera_syncram_dp generic map (abits, dbits)
         port map (clk1, address1, datain1, dataout1x, xxenable1, xwrite1,
                   clk2, address2, datain2, dataout2x, xxenable2, xwrite2);
  end generate;

  lat  : if tech = lattice generate
    x0 : ec_syncram_dp generic map (abits, dbits)
         port map (clk1, address1, datain1, dataout1x, xxenable1, xwrite1,
                   clk2, address2, datain2, dataout2x, xxenable2, xwrite2);
  end generate;

  vir90  : if tech = memvirage90 generate
    x0 : virage90_syncram_dp generic map (abits, dbits)
         port map (clk1, address1, datain1, dataout1x, xxenable1, xwrite1,
                   clk2, address2, datain2, dataout2x, xxenable2, xwrite2);
  end generate;

  atrh : if tech = atc18rha generate
    x0 : atc18rha_syncram_dp generic map (abits, dbits)
         port map (clk1, address1, datain1, dataout1x, xxenable1, xwrite1,
                   clk2, address2, datain2, dataout2x, xxenable2, xwrite2,
                   testin(TESTIN_WIDTH-1 downto TESTIN_WIDTH-4));
  end generate;

  smic : if tech = smic013 generate
    x0 : smic13_syncram_dp generic map (abits, dbits)
         port map (clk1, address1, datain1, dataout1x, xxenable1, xwrite1,
                   clk2, address2, datain2, dataout2x, xxenable2, xwrite2);
  end generate;

  tm65gplu  : if tech = tm65gplus generate
    x0 : tm65gplus_syncram_dp generic map (abits, dbits)
         port map (clk1, address1, datain1, dataout1x, xxenable1, xwrite1,
                   clk2, address2, datain2, dataout2x, xxenable2, xwrite2);
   end generate;

  n2x : if tech = easic45 generate
    x0 : n2x_syncram_dp generic map (abits => abits, dbits => dbits, sepclk => 1)
      port map (clk1, address1, datain1, dataout1x, xxenable1, xwrite1,
                clk2, address2, datain2, dataout2x, xxenable2, xwrite2);
  end generate;

  ut9 : if tech = ut90 generate
    x0 : ut90nhbd_syncram_dp generic map (abits => abits, dbits => dbits)
      port map (clk1, address1, datain1, dataout1x, xxenable1, xwrite1,
                clk2, address2, datain2, dataout2x, xxenable2, xwrite2,
                testin(TESTIN_WIDTH-3));
  end generate;

end;

