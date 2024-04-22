-----------------------------------------------------------------------------
--  LEON3 Demonstration design
--  Copyright (C) 2013 Aeroflex Gaisler AB
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
------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use work.config.all;
library techmap;
use techmap.gencomp.all;

entity pads is
  generic (
    padtech              : integer := 0;
    padlevel             : integer := 0;
    padvoltage           : integer := 0;
    padfilter            : integer := 0;
    padstrength          : integer := 0;
    padslew              : integer := 0;
    padclkarch           : integer := 0;
    padhf                : integer := 0;
    spw_input_type       : integer := 0;
    jtag_padfilter       : integer := 0;
    testen_padfilter     : integer := 0;
    resetn_padfilter     : integer := 0;
    clk_padfilter        : integer := 0;
    spw_padstrength      : integer := 0;
    jtag_padstrength     : integer := 0;
    uart_padstrength     : integer := 0;
    dsu_padstrength      : integer := 0;
    oepol                : integer := 0
  );
  port (
    ----------------------------------------------------------------------------
    --to chip boundary
    ----------------------------------------------------------------------------
    resetn      : in    std_ulogic;
    clksel      : in    std_logic_vector (1 downto 0);
    clk         : in    std_ulogic;
    lock        : out   std_ulogic;
    errorn      : inout std_ulogic;
    address     : out   std_logic_vector(27 downto 0);
    data        : inout std_logic_vector(31 downto 0);
    cb          : inout std_logic_vector(7 downto 0);
    sdclk       : out   std_ulogic;
    sdcsn       : out   std_logic_vector (1 downto 0);
    sdwen       : out   std_ulogic;
    sdrasn      : out   std_ulogic;
    sdcasn      : out   std_ulogic;
    sddqm       : out   std_logic_vector (3 downto 0);
    dsutx       : out   std_ulogic;
    dsurx       : in    std_ulogic;
    dsuen       : in    std_ulogic;
    dsubre      : in    std_ulogic;
    dsuact      : out   std_ulogic;
    txd1        : out   std_ulogic;
    rxd1        : in    std_ulogic;
    txd2        : out   std_ulogic;
    rxd2        : in    std_ulogic;
    ramsn       : out   std_logic_vector (4 downto 0);
    ramoen      : out   std_logic_vector (4 downto 0);
    rwen        : out   std_logic_vector (3 downto 0);
    oen         : out   std_ulogic;
    writen      : out   std_ulogic;
    read        : out   std_ulogic;
    iosn        : out   std_ulogic;
    romsn       : out   std_logic_vector (1 downto 0);
    brdyn       : in    std_ulogic;
    bexcn       : in    std_ulogic;
    wdogn       : inout std_ulogic;
    gpio        : inout std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0);
    i2c_scl     : inout std_ulogic;
    i2c_sda     : inout std_ulogic;
    spi_miso    : in    std_ulogic;
    spi_mosi    : out   std_ulogic;
    spi_sck     : out   std_ulogic;
    spi_slvsel  : out   std_logic_vector(CFG_SPICTRL_SLVS-1 downto 0);
    prom32      : in    std_ulogic;
    spw_clksel  : in    std_logic_vector (1 downto 0);
    spw_clk     : in    std_ulogic;
    spw_rxd     : in    std_logic_vector(0 to CFG_SPW_NUM-1);
    spw_rxs     : in    std_logic_vector(0 to CFG_SPW_NUM-1);
    spw_txd     : out   std_logic_vector(0 to CFG_SPW_NUM-1);
    spw_txs     : out   std_logic_vector(0 to CFG_SPW_NUM-1);
    gtx_clk     : in    std_ulogic;
    erx_clk     : in    std_ulogic;
    erxd        : in    std_logic_vector(7 downto 0);
    erx_dv      : in    std_ulogic;
    etx_clk     : in    std_ulogic;
    etxd        : out   std_logic_vector(7 downto 0);
    etx_en      : out   std_ulogic;
    etx_er      : out   std_ulogic;
    erx_er      : in    std_ulogic;
    erx_col     : in    std_ulogic;
    erx_crs     : in    std_ulogic;
    emdint      : in    std_ulogic;
    emdio       : inout std_logic;
    emdc        : out   std_ulogic;
    testen      : in    std_ulogic;
    trst        : in    std_ulogic;
    tck         : in    std_ulogic;
    tms         : in    std_ulogic;
    tdi         : in    std_ulogic;
    tdo         : out   std_ulogic;
    ---------------------------------------------------------------------------
    --to core
    ---------------------------------------------------------------------------
    lresetn     : out   std_ulogic;
    lclksel     : out   std_logic_vector (1 downto 0);
    lclk        : out   std_ulogic;
    llock       : in    std_ulogic;
    lerrorn     : in    std_ulogic;
    laddress    : in    std_logic_vector(27 downto 0);
    ldatain     : out   std_logic_vector(31 downto 0);
    ldataout    : in    std_logic_vector(31 downto 0);
    ldataen     : in    std_logic_vector(31 downto 0);
    lcbin       : out   std_logic_vector(7 downto 0);
    lcbout      : in    std_logic_vector(7 downto 0);
    lcben       : in    std_logic_vector(7 downto 0);
    lsdclk      : in    std_ulogic;
    lsdcsn      : in    std_logic_vector (1 downto 0);
    lsdwen      : in    std_ulogic;
    lsdrasn     : in    std_ulogic;
    lsdcasn     : in    std_ulogic;
    lsddqm      : in    std_logic_vector (3 downto 0);
    ldsutx      : in    std_ulogic;
    ldsurx      : out   std_ulogic;
    ldsuen      : out   std_ulogic;
    ldsubre     : out   std_ulogic;
    ldsuact     : in    std_ulogic;
    ltxd1       : in    std_ulogic;
    lrxd1       : out   std_ulogic;
    ltxd2       : in    std_ulogic;
    lrxd2       : out   std_ulogic;
    lramsn      : in    std_logic_vector (4 downto 0);
    lramoen     : in    std_logic_vector (4 downto 0);
    lrwen       : in    std_logic_vector (3 downto 0);
    loen        : in    std_ulogic;
    lwriten     : in    std_ulogic;
    lread       : in    std_ulogic;
    liosn       : in    std_ulogic;
    lromsn      : in    std_logic_vector (1 downto 0);
    lbrdyn      : out   std_ulogic;
    lbexcn      : out   std_ulogic;
    lwdogn      : in    std_ulogic;
    lgpioin     : out   std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0);
    lgpioout    : in    std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0);
    lgpioen     : in    std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0);
    li2c_sclout : in    std_ulogic;
    li2c_sclen  : in    std_ulogic;
    li2c_sclin  : out   std_ulogic;
    li2c_sdaout : in    std_ulogic;
    li2c_sdaen  : in    std_ulogic;
    li2c_sdain  : out   std_ulogic;
    lspi_miso   : out   std_ulogic;
    lspi_mosi   : in    std_ulogic;
    lspi_sck    : in    std_ulogic;
    lspi_slvsel : in    std_logic_vector(CFG_SPICTRL_SLVS-1 downto 0);
    lprom32     : out   std_ulogic;
    lspw_clksel : out   std_logic_vector (1 downto 0);
    lspw_clk    : out   std_ulogic;
    lspw_rxd    : out   std_logic_vector(0 to CFG_SPW_NUM-1);
    lspw_rxs    : out   std_logic_vector(0 to CFG_SPW_NUM-1);
    lspw_txd    : in    std_logic_vector(0 to CFG_SPW_NUM-1);
    lspw_txs    : in    std_logic_vector(0 to CFG_SPW_NUM-1);
    lgtx_clk    : out   std_ulogic;
    lerx_clk    : out   std_ulogic;
    lerxd       : out   std_logic_vector(7 downto 0);
    lerx_dv     : out   std_ulogic;
    letx_clk    : out   std_ulogic;
    letxd       : in    std_logic_vector(7 downto 0);
    letx_en     : in    std_ulogic;
    letx_er     : in    std_ulogic;
    lerx_er     : out   std_ulogic;
    lerx_col    : out   std_ulogic;
    lerx_crs    : out   std_ulogic;
    lemdint     : out   std_ulogic;
    lemdioin    : out   std_logic;
    lemdioout   : in    std_logic;
    lemdioen    : in    std_logic;
    lemdc       : in    std_ulogic;
    ltesten     : out   std_ulogic;
    ltrst       : out   std_ulogic;
    ltck        : out   std_ulogic;
    ltms        : out   std_ulogic;
    ltdi        : out   std_ulogic;
    ltdo        : in    std_ulogic;
    ltdoen      : in    std_ulogic
  );
end;

architecture rtl of pads is

signal vcc,gnd : std_logic;

begin

  vcc <= '1';
  gnd <= '0';

  ------------------------------------------------------------------------------
  -- Clocking and clock pads
  ------------------------------------------------------------------------------

  reset_pad : inpad
    generic map (
      tech       => padtech,
      level      => padlevel,
      voltage    => padvoltage,
      filter     => resetn_padfilter,
      strength   => padstrength)
    port map (
      pad        => resetn,
      o          => lresetn);
   
  clk_pad : clkpad
    generic map (
      tech       => padtech,
      level      => padlevel,
      voltage    => padvoltage,
      arch       => padclkarch,
      hf         => padhf,
      filter     => clk_padfilter)
    port map (
      pad        => clk,
      o          => lclk);

  clksel_pad : inpadv
    generic map(
      tech       => padtech,
      level      => padlevel,
      voltage    => padvoltage,
      filter     => padfilter,
      strength   => padstrength,
      width      => 2)
    port map(
      pad        => clksel,
      o          => lclksel);

  spwclk_pad : clkpad
    generic map (
      tech       => padtech,
      level      => padlevel,
      voltage    => padvoltage,
      arch       => padclkarch,
      hf         => padhf,
      filter     => clk_padfilter)
    port map (
      pad        => spw_clk,
      o          => lspw_clk);

  spwclksel_pad : inpadv
    generic map(
      tech       => padtech,
      level      => padlevel,
      voltage    => padvoltage,
      filter     => padfilter,
      strength   => padstrength,
      width      => 2)
    port map(
      pad        => spw_clksel,
      o          => lspw_clksel);

  ------------------------------------------------------------------------------
  -- Test / Misc pads
  ------------------------------------------------------------------------------

  wdogn_pad : toutpad
    generic map (
      tech     => padtech,
      level    => padlevel,
      slew     => padslew,
      voltage  => padvoltage,
      strength => padstrength,
      oepol    => oepol)
    port map(
      pad    => wdogn,
      en     => lwdogn,
      i      => gnd);
      
  testen_pad : inpad
    generic map(
      tech       => padtech,
      level      => padlevel,
      voltage    => padvoltage,
      filter     => testen_padfilter,
      strength   => padstrength)
    port map(
      pad        => testen,
      o          => ltesten);

 lockpad : outpad
    generic map (
      tech     => padtech,
      level    => padlevel,
      slew     => padslew,
      voltage  => padvoltage,
      strength => padstrength)
    port map (
      pad      => lock,
      i        => llock);

  errorn_pad : toutpad
    generic map (
      tech     => padtech,
      level    => padlevel,
      slew     => padslew,
      voltage  => padvoltage,
      strength => padstrength,
      oepol    => oepol)
    port map(
      pad    => errorn,
      en     => lerrorn,
      i      => gnd);

  ------------------------------------------------------------------------------
  -- JTAG pads
  ------------------------------------------------------------------------------

  trst_pad : inpad
    generic map (
      tech     => padtech,
      level    => padlevel,
      voltage  => padvoltage,
      filter   => jtag_padfilter)
    port map (
      pad      => trst,
      o        => ltrst);

  tck_pad : inpad
    generic map (
      tech     => padtech,
      level    => padlevel,
      voltage  => padvoltage,
      filter   => jtag_padfilter)
    port map (
      pad      => tck,
      o        => ltck);
  
  tms_pad : inpad
    generic map (
      tech     => padtech,
      level    => padlevel,
      voltage  => padvoltage,
      filter   => jtag_padfilter)
    port map (
      pad      => tms,
      o        => ltms);
  
  tdi_pad : inpad
    generic map (
      tech     => padtech,
      level    => padlevel,
      voltage  => padvoltage,
      filter   => jtag_padfilter)
    port map (
      pad      => tdi,
      o        => ltdi);
  
  tdo_pad : outpad
    generic map (
      tech     => padtech,
      level    => padlevel,
      slew     => padslew,
      voltage  => padvoltage,
      strength => jtag_padstrength)
    port map (
      pad      => tdo, 
      i        => ltdo);
  

  ------------------------------------------------------------------------------
  -- DSU pads
  ------------------------------------------------------------------------------

 dsuen_pad : inpad
    generic map (
      tech     => padtech,
      level    => padlevel,
      voltage  => padvoltage,
      filter   => padfilter)
    port map (
      pad      => dsuen,
      o        => ldsuen);

 dsubre_pad : inpad
    generic map (
      tech     => padtech,
      level    => padlevel,
      voltage  => padvoltage,
      filter   => padfilter)
    port map (
      pad      => dsubre,
      o        => ldsubre);

  dsuact_pad : outpad
    generic map (
      tech     => padtech,
      level    => padlevel,
      slew     => padslew,
      voltage  => padvoltage,
      strength => dsu_padstrength)
    port map (
      pad      => dsuact, 
      i        => ldsuact);

 dsurx_pad : inpad
    generic map (
      tech     => padtech,
      level    => padlevel,
      voltage  => padvoltage,
      filter   => padfilter)
    port map (
      pad      => dsurx,
      o        => ldsurx);

  dsutx_pad : outpad
    generic map (
      tech     => padtech,
      level    => padlevel,
      slew     => padslew,
      voltage  => padvoltage,
      strength => dsu_padstrength)
    port map (
      pad      => dsutx, 
      i        => ldsutx);

  ------------------------------------------------------------------------------
  -- UART pads
  ------------------------------------------------------------------------------

 rxd1_pad : inpad
    generic map (
      tech     => padtech,
      level    => padlevel,
      voltage  => padvoltage,
      filter   => padfilter,
      strength => padstrength)
    port map (
      pad      => rxd1,
      o        => lrxd1);

  txd1_pad : outpad
    generic map (
      tech     => padtech,
      level    => padlevel,
      slew     => padslew,
      voltage  => padvoltage,
      strength => uart_padstrength)
    port map (
      pad      => txd1, 
      i        => ltxd1);

 rxd2_pad : inpad
    generic map (
      tech     => padtech,
      level    => padlevel,
      voltage  => padvoltage,
      filter   => padfilter,
      strength => padstrength)
    port map (
      pad      => rxd2,
      o        => lrxd2);

  txd2_pad : outpad
    generic map (
      tech     => padtech,
      level    => padlevel,
      slew     => padslew,
      voltage  => padvoltage,
      strength => uart_padstrength)
    port map (
      pad      => txd2, 
      i        => ltxd2);

  ------------------------------------------------------------------------------
  -- SPI pads
  ------------------------------------------------------------------------------

  miso_pad : inpad
    generic map (
      tech       => padtech,
      level      => padlevel,
      voltage    => padvoltage,
      filter     => padfilter,
      strength   => padstrength)
    port map(
      pad     => spi_miso,
      o       => lspi_miso);
  
  mosi_pad : outpad
    generic map (
      tech     => padtech,
      level    => padlevel,
      slew     => padslew,
      voltage  => padvoltage,
      strength => padstrength)
    port map(
      pad    => spi_mosi,
      i      => lspi_mosi);
  
  sck_pad : outpad
    generic map (
      tech     => padtech,
      level    => padlevel,
      slew     => padslew,
      voltage  => padvoltage,
      strength => padstrength)
    port map(
      pad    => spi_sck,
      i      => lspi_sck);
   
   slvsel_pad : outpadv
    generic map (
      width    => CFG_SPICTRL_SLVS,
      tech     => padtech,
      level    => padlevel,
      slew     => padslew,
      voltage  => padvoltage,
      strength => padstrength)
    port map (
      pad      => spi_slvsel,
      i        => lspi_slvsel);

  ------------------------------------------------------------------------------
  -- I2C pads
  ------------------------------------------------------------------------------

   scl_pad : iopad
      generic map (
        tech     => padtech,
        level    => padlevel,
        voltage  => padvoltage,
        oepol    => oepol,
        strength => padstrength)
      port map (
        pad     => i2c_scl,
        i       => li2c_sclout,
        en      => li2c_sclen,
        o       => li2c_sclin);

   sda_pad : iopad
      generic map (
        tech     => padtech,
        level    => padlevel,
        voltage  => padvoltage,
        oepol    => oepol,
        strength => padstrength)
      port map (
        pad     => i2c_sda,
        i       => li2c_sdaout,
        en      => li2c_sdaen,
        o       => li2c_sdain);

  ------------------------------------------------------------------------------
  -- Memory Interface pads
  ------------------------------------------------------------------------------

  addr_pad   : outpadv generic map (width => 28, tech => padtech, level => padlevel, slew => padslew, voltage => padvoltage, strength => padstrength) port map (address, laddress);

  data_pad : iopadvv generic map (width => 32, tech => padtech, level => padlevel, voltage => padvoltage, oepol => oepol, strength => padstrength) port map (pad => data, i => ldataout, en => ldataen, o => ldatain);

  rams_pad   : outpadv generic map (width =>  5, tech => padtech, level => padlevel, slew => padslew, voltage => padvoltage, strength => padstrength) port map (ramsn, lramsn);
  roms_pad   : outpadv generic map (width =>  2, tech => padtech, level => padlevel, slew => padslew, voltage => padvoltage, strength => padstrength) port map (romsn, lromsn);
  ramoen_pad : outpadv generic map (width =>  5, tech => padtech, level => padlevel, slew => padslew, voltage => padvoltage, strength => padstrength) port map (ramoen, lramoen);
  rwen_pad   : outpadv generic map (width =>  4, tech => padtech, level => padlevel, slew => padslew, voltage => padvoltage, strength => padstrength) port map (rwen, lrwen);

  oen_pad    : outpad  generic map (tech => padtech, level => padlevel, slew => padslew, voltage => padvoltage, strength => padstrength) port map (oen, loen);
  wri_pad    : outpad  generic map (tech => padtech, level => padlevel, slew => padslew, voltage => padvoltage, strength => padstrength) port map (writen, lwriten);
  read_pad   : outpad  generic map (tech => padtech, level => padlevel, slew => padslew, voltage => padvoltage, strength => padstrength) port map (read, lread);
  iosn_pad   : outpad  generic map (tech => padtech, level => padlevel, slew => padslew, voltage => padvoltage, strength => padstrength) port map (iosn, liosn);
  
  cb_pad : iopadvv generic map (width => 8, tech => padtech, level => padlevel, voltage => padvoltage, oepol => oepol, strength => padstrength) port map (pad => cb, i => lcbout, en => lcben, o => lcbin);

  sdpads : if CFG_MCTRL_SDEN = 1 generate
    sdclk_pad : outpad  generic map (tech => padtech, level => padlevel, slew => padslew, voltage => padvoltage, strength => padstrength) port map (sdclk, lsdclk);
    sdwen_pad : outpad  generic map (tech => padtech, level => padlevel, slew => padslew, voltage => padvoltage, strength => padstrength) port map (sdwen, lsdwen);
    sdras_pad : outpad  generic map (tech => padtech, level => padlevel, slew => padslew, voltage => padvoltage, strength => padstrength) port map (sdrasn, lsdrasn);
    sdcas_pad : outpad  generic map (tech => padtech, level => padlevel, slew => padslew, voltage => padvoltage, strength => padstrength) port map (sdcasn, lsdcasn);
    sddqm_pad : outpadv generic map (width =>  4, tech => padtech, level => padlevel, slew => padslew, voltage => padvoltage, strength => padstrength) port map (sddqm, lsddqm);
    sdcsn_pad : outpadv generic map (width =>  2, tech => padtech, level => padlevel, slew => padslew, voltage => padvoltage, strength => padstrength) port map (sdcsn, lsdcsn);
  end generate;

  brdyn_pad : inpad
    generic map (
      tech     => padtech,
      level    => padlevel,
      voltage  => padvoltage,
      filter   => pullup)
    port map (
      pad      => brdyn,
      o        => lbrdyn);

  bexcn_pad : inpad
    generic map (
      tech     => padtech,
      level    => padlevel,
      voltage  => padvoltage,
      filter   => pullup)
    port map (
      pad      => bexcn,
      o        => lbexcn);

  prom32_pad : inpad
    generic map (
      tech     => padtech,
      level    => padlevel,
      voltage  => padvoltage,
      filter   => pullup)
    port map (
      pad      => prom32,
      o        => lprom32);

  ------------------------------------------------------------------------------
  -- GPIO pads
  ------------------------------------------------------------------------------

  gpio_pads : iopadvv
    generic map (
      width    => CFG_GRGPIO_WIDTH,
      tech     => padtech,
      level    => padlevel,
      voltage  => padvoltage,
      oepol    => oepol,
      strength => padstrength)
    port map (
      pad     => gpio,
      i       => lgpioout,
      en      => lgpioen,
      o       => lgpioin);

  ------------------------------------------------------------------------------
  -- SpW pads
  ------------------------------------------------------------------------------

  spwpads0 : if CFG_SPW_EN > 0 generate
   spwlvttl_pads :  entity work.spw_lvttl_pads
     generic map(
       padtech    => padtech,
       strength   => spw_padstrength,
       input_type => spw_input_type,
       voltage    => padvoltage,
       level      => padlevel)
     port map(
         spw_rxd  => spw_rxd,
         spw_rxs  => spw_rxs,
         spw_txd  => spw_txd,
         spw_txs  => spw_txs,
         lspw_rxd => lspw_rxd,
         lspw_rxs => lspw_rxs,
         lspw_txd => lspw_txd,
         lspw_txs => lspw_txs);
  end generate;

  nospwpads0 : if CFG_SPW_EN = 0 generate
    spw_txd  <= (others => '0');
    spw_txs  <= (others => '0');
    lspw_rxd <= (others => '0');
    lspw_rxs <= (others => '0');
  end generate;

  ------------------------------------------------------------------------------
  -- ETHERNET 
  ------------------------------------------------------------------------------

  greth1g: if CFG_GRETH1G = 1 generate
   gtx_pad : clkpad
    generic map (
      tech       => padtech,
      level      => padlevel,
      voltage    => padvoltage,
      arch       => padclkarch,
      hf         => padhf,
      filter     => clk_padfilter)
    port map (
      pad        => gtx_clk,
      o          => lgtx_clk);
  end generate;

  nogreth1g: if CFG_GRETH1G = 0 generate
    lgtx_clk <= '0';
  end generate;

  ethpads : if (CFG_GRETH = 1) generate

    etxc_pad : clkpad
     generic map (
      tech       => padtech,
      level      => padlevel,
      voltage    => padvoltage,
      arch       => padclkarch,
      hf         => padhf,
      filter     => clk_padfilter)
      port map (etx_clk, letx_clk);
      
    erxc_pad : clkpad
     generic map (
      tech       => padtech,
      level      => padlevel,
      voltage    => padvoltage,
      arch       => padclkarch,
      hf         => padhf,
      filter     => clk_padfilter)
     port map (erx_clk, lerx_clk);
      
    erxd_pad : inpadv
     generic map(
      tech       => padtech,
      level      => padlevel,
      voltage    => padvoltage,
      filter     => padfilter,
      strength   => padstrength,
      width      => 8)
     port map (erxd, lerxd);
      
    erxdv_pad : inpad
     generic map (
      tech       => padtech,
      level      => padlevel,
      voltage    => padvoltage,
      filter     => padfilter,
      strength   => padstrength)
     port map (erx_dv, lerx_dv);
    
    erxer_pad : inpad
     generic map (
      tech       => padtech,
      level      => padlevel,
      voltage    => padvoltage,
      filter     => padfilter,
      strength   => padstrength)
     port map (erx_er, lerx_er);
    
    erxco_pad : inpad
     generic map (
      tech       => padtech,
      level      => padlevel,
      voltage    => padvoltage,
      filter     => padfilter,
      strength   => padstrength)
     port map (erx_col, lerx_col);
    
    erxcr_pad : inpad
     generic map (
      tech       => padtech,
      level      => padlevel,
      voltage    => padvoltage,
      filter     => padfilter,
      strength   => padstrength)
     port map (erx_crs, lerx_crs);

    etxd_pad : outpadv
     generic map(
      width    => 8,
      tech     => padtech,
      level    => padlevel,
      slew     => padslew,
      voltage  => padvoltage,
      strength => padstrength)
     port map (etxd, letxd);
     
    etxen_pad : outpad generic map (tech => padtech, level => padlevel, slew => padslew, voltage => padvoltage, strength => padstrength)
      port map (etx_en, letx_en);

    etxer_pad : outpad generic map (tech => padtech, level => padlevel, slew => padslew, voltage => padvoltage, strength => padstrength)
      port map (etx_er, letx_er);

    emdc_pad : outpad generic map (tech => padtech, level => padlevel, slew => padslew, voltage => padvoltage, strength => padstrength)
      port map (emdc, lemdc);
      
    emdio_pad : iopad generic map (tech => padtech, level => padlevel, slew => padslew, voltage => padvoltage, strength => padstrength)
      port map (emdio, lemdioout, lemdioen, lemdioin);

    emdint_pad : inpad
     generic map (
      tech       => padtech,
      level      => padlevel,
      voltage    => padvoltage,
      filter     => padfilter,
      strength   => padstrength)
     port map (emdint, lemdint);

  end generate;


end;

