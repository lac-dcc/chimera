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
library grlib;
use grlib.stdlib.all;
library techmap;
use techmap.gencomp.all;
library gaisler;
use gaisler.misc.all;
use gaisler.jtag.all;
use work.config.all;

entity core is
  generic (
    fabtech   : integer := CFG_FABTECH;
    memtech   : integer := CFG_MEMTECH;
    padtech   : integer := CFG_PADTECH;
    clktech   : integer := CFG_CLKTECH;
    disas     : integer := CFG_DISAS; -- Enable disassembly to console
    dbguart   : integer := CFG_DUART; -- Print UART on console
    pclow     : integer := CFG_PCLOW;
    scantest  : integer := CFG_SCAN;
    bscanen   : integer := CFG_BOUNDSCAN_EN;
    oepol     : integer := 0
  );
  port (
    resetn      : in  std_ulogic;
    clksel      : in  std_logic_vector (1 downto 0);
    clk         : in  std_ulogic;
    lock        : out std_ulogic;
    errorn      : out std_ulogic;
    address     : out std_logic_vector(27 downto 0);
    datain      : in  std_logic_vector(31 downto 0);
    dataout     : out std_logic_vector(31 downto 0);
    dataen      : out std_logic_vector(31 downto 0);
    cbin        : in  std_logic_vector(7 downto 0);
    cbout       : out std_logic_vector(7 downto 0);
    cben        : out std_logic_vector(7 downto 0);
    sdclk       : out std_ulogic;
    sdcsn       : out std_logic_vector (1 downto 0);
    sdwen       : out std_ulogic;
    sdrasn      : out std_ulogic;
    sdcasn      : out std_ulogic;
    sddqm       : out std_logic_vector (3 downto 0);
    dsutx       : out std_ulogic;
    dsurx       : in  std_ulogic;
    dsuen       : in  std_ulogic;
    dsubre      : in  std_ulogic;
    dsuact      : out std_ulogic;
    txd1        : out std_ulogic;
    rxd1        : in  std_ulogic;
    txd2        : out std_ulogic;
    rxd2        : in  std_ulogic;
    ramsn       : out std_logic_vector (4 downto 0);
    ramoen      : out std_logic_vector (4 downto 0);
    rwen        : out std_logic_vector (3 downto 0);
    oen         : out std_ulogic;
    writen      : out std_ulogic;
    read        : out std_ulogic;
    iosn        : out std_ulogic;
    romsn       : out std_logic_vector (1 downto 0);
    brdyn       : in  std_ulogic;
    bexcn       : in  std_ulogic;
    wdogn       : out std_ulogic;
    gpioin      : in  std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0);
    gpioout     : out std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0);
    gpioen      : out std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0);
    i2c_sclout  : out std_ulogic;
    i2c_sclen   : out std_ulogic;
    i2c_sclin   : in  std_ulogic;
    i2c_sdaout  : out std_ulogic;
    i2c_sdaen   : out std_ulogic;
    i2c_sdain   : in  std_ulogic;
    spi_miso    : in  std_ulogic;
    spi_mosi    : out std_ulogic;
    spi_sck     : out std_ulogic;
    spi_slvsel  : out std_logic_vector(CFG_SPICTRL_SLVS-1 downto 0);
    prom32      : in  std_ulogic;
    spw_clksel  : in  std_logic_vector (1 downto 0);
    spw_clk     : in  std_ulogic;
    spw_rxd     : in  std_logic_vector(0 to CFG_SPW_NUM-1);
    spw_rxs     : in  std_logic_vector(0 to CFG_SPW_NUM-1);
    spw_txd     : out std_logic_vector(0 to CFG_SPW_NUM-1);
    spw_txs     : out std_logic_vector(0 to CFG_SPW_NUM-1);
    gtx_clk     : in  std_ulogic;
    erx_clk     : in  std_ulogic;
    erxd        : in  std_logic_vector(7 downto 0);
    erx_dv      : in  std_ulogic;
    etx_clk     : in  std_ulogic;
    etxd        : out std_logic_vector(7 downto 0);
    etx_en      : out std_ulogic;
    etx_er      : out std_ulogic;
    erx_er      : in  std_ulogic;
    erx_col     : in  std_ulogic;
    erx_crs     : in  std_ulogic;
    emdint      : in  std_ulogic;
    emdioin     : in  std_logic;
    emdioout    : out std_logic;
    emdioen     : out std_logic;
    emdc        : out std_ulogic;
    testen      : in  std_ulogic;
    trst        : in  std_ulogic;
    tck         : in  std_ulogic;
    tms         : in  std_ulogic;
    tdi         : in  std_ulogic;
    tdo         : out std_ulogic;
    tdoen       : out std_ulogic;
    chain_tck   : out std_ulogic;
    chain_tckn  : out std_ulogic;
    chain_tdi   : out std_ulogic;
    chain_tdo   : in  std_ulogic;
    bsshft      : out std_ulogic;
    bscapt      : out std_ulogic;
    bsupdi      : out std_ulogic;
    bsupdo      : out std_ulogic;
    bsdrive     : out std_ulogic;
    bshighz     : out std_ulogic
  );
end;

architecture rtl of core is

  signal vcc             : std_logic_vector(15 downto 0);
  signal gnd             : std_ulogic;
  signal clk1x           : std_ulogic;
  signal clk2x           : std_ulogic;
  signal clk4x           : std_ulogic;
  signal clk8x           : std_ulogic;
  signal lclk            : std_ulogic;
--  signal lclkapb         : std_ulogic;
  signal lspw_clk        : std_ulogic;
  signal cgi             : clkgen_in_type;
  signal cgo             : clkgen_out_type;
  signal lgtx_clk        : std_ulogic;
  signal lerx_clk        : std_ulogic;
  signal letx_clk        : std_ulogic;
  
  signal llock           : std_ulogic;

  signal scanen          : std_ulogic;
  signal testrst         : std_ulogic;
  signal testoen         : std_ulogic;
  
  signal lgpioen         : std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0);

begin

  -- Scan test mux logic not connected boundary scan chain
  scanen  <= dsubre when (testen = '1' and scantest = 1) else '0';
  testrst <= dsuen  when (testen = '1' and scantest = 1) else '1';
  testoen <= dsurx  when (testen = '1' and scantest = 1) else '0';

  -- PLL for system clock
  clkgen0: clkgen
    generic map(
      tech      => CFG_CLKTECH,
      clk_mul   => CFG_CLKMUL,
      clk_div   => CFG_CLKDIV,
      noclkfb   => CFG_CLK_NOFB,
      freq      => 50000)
    port map(
      clkin     => clk,
      pciclkin  => clk,
      clk       => clk1x,
      clkn      => open,
      clk2x     => clk2x,
      sdclk     => open,
      pciclk    => open,
      cgi       => cgi,
      cgo       => cgo,
      clk4x     => clk4x,
      clk1xu    => open,
      clk2xu    => open,
      clkb      => open,
      clkc      => open,
      clk8x     => open);

  cgi.pllrst  <= resetn;
  cgi.pllref  <= lclk;  -- Note: Used as fbclk if CFG_CLK_NOFB = 0
  cgi.clksel  <= (others => '0');

  -- PLL is bypassed, and disabled,  when either testen(0) = 1 or clksel =
  -- "00". Bit 0 of pllctrl input is used as the disable signal
  cgi.pllctrl(0) <= '1' when (clksel = "00" or (testen = '1' and scantest = 1)) else '0';
  cgi.pllctrl(1) <= '0';

  -- Simulate lock signal when PLL not used
  llock <= '1' when (clksel = "00" or (testen = '1' and scantest = 1)) else cgo.clklock;
  lock  <= llock;

  -- Clock muxing inside boundary scan chain for CORE clock
  core_clock_mux : entity work.core_clock_mux
    generic map(
      tech      => fabtech,
      scantest  => scantest)
    port map(
      clksel => clksel,
      testen => testen,
      clkin  => clk,
      clk1x  => clk1x,
      clk2x  => clk2x,
      clk4x  => clk4x,
      clkout => lclk);

  -- Clock muxing inside boundary scan chain for APB CORE clock
  --apb_core_clock_mux : entity work.core_clock_mux
  --  generic map(
  --    tech      => fabtech,
  --    scantest  => scantest)
  --  port map(
  --    clksel => clksel,
  --    testen => testen,
  --    clkin  => clk,
  --    clk1x  => clk1x,
  --    clk2x  => clk1x,
  --    clk4x  => clk1x,
  --    clkout => lclkapb);

  -- Clock muxing inside boundary scan chain for SPW clock
  spw_core_clock_mux : entity work.core_clock_mux
    generic map(
      tech      => fabtech,
      scantest  => scantest)
    port map(
      clksel => spw_clksel,
      testen => testen,
      clkin  => clk,
      clk1x  => spw_clk,
      clk2x  => spw_clk,
      clk4x  => spw_clk,
      clkout => lspw_clk);

  -- Ethernet Clock Mux for scan test
  gtxclkmux   : clkmux generic map (tech => fabtech) port map (gtx_clk,clk,testen,lgtx_clk);
  rxclkclkmux : clkmux generic map (tech => fabtech) port map (erx_clk,clk,testen,lerx_clk);
  txclkclkmux : clkmux generic map (tech => fabtech) port map (etx_clk,clk,testen,letx_clk);

  -- Clock outputs
  sdclk <= lclk;

  -- Control the GPIO direction during test
  -- Scantest mode. Lower half of the gpio are scan chain inputs in testmode 
  -- and upper half of the gpio are outputs, i.e. maximum number of scan 
  -- chains is the half number of GPIOs
  -- Note: testen and testoen should have priority over resetn because the registers
  -- in the reset generator are part of the scan chain, and the direction
  -- of gpio(23:12) would then depend on the value of a register in the
  -- scan chain.
  gpioen(CFG_GRGPIO_WIDTH-1 downto (CFG_GRGPIO_WIDTH/2)) <= lgpioen(CFG_GRGPIO_WIDTH-1 downto (CFG_GRGPIO_WIDTH/2)) 
    when (testoen = '0') else (others => '0') when oepol = 1 else (others => '1');
  gpioen((CFG_GRGPIO_WIDTH/2)-1 downto 0)                <= lgpioen((CFG_GRGPIO_WIDTH/2)-1 downto 0) 
    when (testoen = '0') else (others => '1') when oepol = 1 else (others => '0');

  leon3core0 : entity work.leon3core
    generic map ( fabtech, memtech, padtech, clktech, disas, dbguart,
    pclow, scantest*(1 - is_fpga(fabtech)))
  port map (
    resetn, clksel, lclk, lclk, --lclkapb,
    llock, errorn,
    address, datain, dataout, dataen, cbin, cbout, cben,
    sdcsn, sdwen, sdrasn, sdcasn, sddqm,
    dsutx, dsurx, dsuen, dsubre, dsuact,
    txd1, rxd1, txd2, rxd2,
    ramsn, ramoen, rwen, oen, writen, read, iosn, romsn, brdyn, bexcn,
    wdogn, gpioin, gpioout, lgpioen, 
    i2c_sclout, i2c_sclen, i2c_sclin, i2c_sdaout, i2c_sdaen, i2c_sdain,
    spi_miso, spi_mosi, spi_sck, spi_slvsel,
    prom32, 
    spw_clksel,lspw_clk, spw_rxd, spw_rxs, spw_txd, spw_txs,
    lgtx_clk, lerx_clk, erxd, erx_dv, letx_clk, etxd, etx_en, etx_er, erx_er, erx_col, erx_crs, emdint, emdioin, emdioout, emdioen, emdc ,
    trst, tck, tms, tdi, tdo, tdoen,
    scanen, testen, testrst, testoen,
    chain_tck, chain_tckn, chain_tdi, chain_tdo, 
    bsshft, bscapt, bsupdi, bsupdo, bsdrive, bshighz);

end;

