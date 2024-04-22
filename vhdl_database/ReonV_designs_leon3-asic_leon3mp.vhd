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

entity leon3mp is
  generic (
    fabtech   : integer := CFG_FABTECH;
    memtech   : integer := CFG_MEMTECH;
    padtech   : integer := CFG_PADTECH;
    clktech   : integer := CFG_CLKTECH;
    disas     : integer := CFG_DISAS; -- Enable disassembly to console
    dbguart   : integer := CFG_DUART; -- Print UART on console
    pclow     : integer := CFG_PCLOW;
    scantest  : integer := CFG_SCAN
  );
  port (
    resetn      : in    std_ulogic;
    clksel      : in    std_logic_vector(1 downto 0);
    clk         : in    std_ulogic;
    lock        : out   std_ulogic;
    errorn      : inout std_ulogic;
    wdogn       : inout std_ulogic;
    address     : out   std_logic_vector(27 downto 0);
    data        : inout std_logic_vector(31 downto 0);
    cb          : inout std_logic_vector(7 downto 0);
    sdclk       : out   std_ulogic;
    sdcsn       : out   std_logic_vector (1 downto 0);    -- sdram chip select
    sdwen       : out   std_ulogic;                       -- sdram write enable
    sdrasn      : out   std_ulogic;                       -- sdram ras
    sdcasn      : out   std_ulogic;                       -- sdram cas
    sddqm       : out   std_logic_vector (3 downto 0);    -- sdram dqm
    dsutx       : out   std_ulogic;                       -- DSU tx data / scanout
    dsurx       : in    std_ulogic;                       -- DSU rx data / scanin
    dsuen       : in    std_ulogic;
    dsubre      : in    std_ulogic;                        -- DSU break / scanen
    dsuact      : out   std_ulogic;                       -- DSU active / NT
    txd1        : out   std_ulogic;                       -- UART1 tx data
    rxd1        : in    std_ulogic;                       -- UART1 rx data
    txd2        : out   std_ulogic;                       -- UART2 tx data
    rxd2        : in    std_ulogic;                       -- UART2 rx data
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
    gpio        : inout std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0);  -- I/O port
    i2c_scl     : inout std_ulogic;
    i2c_sda     : inout std_ulogic;
    spi_miso    : in    std_ulogic;
    spi_mosi    : out   std_ulogic;
    spi_sck     : out   std_ulogic;
    spi_slvsel  : out   std_logic_vector(CFG_SPICTRL_SLVS-1 downto 0);
    prom32      : in    std_ulogic;
    spw_clksel  : in    std_logic_vector(1 downto 0);
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
    tdo         : out   std_ulogic
  );
end;

architecture rtl of leon3mp is

signal lresetn     : std_ulogic;
signal lclksel     : std_logic_vector (1 downto 0);
signal lclk        : std_ulogic;
signal llock       : std_ulogic;
signal lerrorn     : std_ulogic;
signal laddress    : std_logic_vector(27 downto 0);
signal ldatain     : std_logic_vector(31 downto 0);
signal ldataout    : std_logic_vector(31 downto 0);
signal ldataen     : std_logic_vector(31 downto 0);
signal lcbin       : std_logic_vector(7 downto 0);
signal lcbout      : std_logic_vector(7 downto 0);
signal lcben       : std_logic_vector(7 downto 0);
signal lsdclk      : std_ulogic;
signal lsdcsn      : std_logic_vector (1 downto 0);
signal lsdwen      : std_ulogic;
signal lsdrasn     : std_ulogic;
signal lsdcasn     : std_ulogic;
signal lsddqm      : std_logic_vector (3 downto 0);
signal ldsutx      : std_ulogic;
signal ldsurx      : std_ulogic;
signal ldsuen      : std_ulogic;
signal ldsubre     : std_ulogic;
signal ldsuact     : std_ulogic;
signal ltxd1       : std_ulogic;
signal lrxd1       : std_ulogic;
signal ltxd2       : std_ulogic;
signal lrxd2       : std_ulogic;
signal lramsn      : std_logic_vector (4 downto 0);
signal lramoen     : std_logic_vector (4 downto 0);
signal lrwen       : std_logic_vector (3 downto 0);
signal loen        : std_ulogic;
signal lwriten     : std_ulogic;
signal lread       : std_ulogic;
signal liosn       : std_ulogic;
signal lromsn      : std_logic_vector (1 downto 0);
signal lbrdyn      : std_ulogic;
signal lbexcn      : std_ulogic;
signal lwdogn      : std_ulogic;
signal lgpioin     : std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0);
signal lgpioout    : std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0);
signal lgpioen     : std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0);
signal li2c_sclout : std_ulogic;
signal li2c_sclen  : std_ulogic;
signal li2c_sclin  : std_ulogic;
signal li2c_sdaout : std_ulogic;
signal li2c_sdaen  : std_ulogic;
signal li2c_sdain  : std_ulogic;
signal lspi_miso   : std_ulogic;
signal lspi_mosi   : std_ulogic;
signal lspi_sck    : std_ulogic;
signal lspi_slvsel : std_logic_vector(CFG_SPICTRL_SLVS-1 downto 0);
signal lprom32     : std_ulogic;
signal lspw_clksel : std_logic_vector (1 downto 0);
signal lspw_clk    : std_ulogic;
signal lspw_rxd    : std_logic_vector(0 to CFG_SPW_NUM-1);
signal lspw_rxs    : std_logic_vector(0 to CFG_SPW_NUM-1);
signal lspw_txd    : std_logic_vector(0 to CFG_SPW_NUM-1);
signal lspw_txs    : std_logic_vector(0 to CFG_SPW_NUM-1);
signal lgtx_clk    : std_ulogic;
signal lerx_clk    : std_ulogic;
signal lerxd       : std_logic_vector(7 downto 0);
signal lerx_dv     : std_ulogic;
signal letx_clk    : std_ulogic;
signal letxd       : std_logic_vector(7 downto 0);
signal letx_en     : std_ulogic;
signal letx_er     : std_ulogic;
signal lerx_er     : std_ulogic;
signal lerx_col    : std_ulogic;
signal lerx_crs    : std_ulogic;
signal lemdint     : std_ulogic;
signal lemdioin    : std_logic;
signal lemdioout   : std_logic;
signal lemdioen    : std_logic;
signal lemdc       : std_ulogic;
signal ltesten     : std_ulogic;
signal ltrst       : std_ulogic;
signal ltck        : std_ulogic;
signal ltms        : std_ulogic;
signal ltdi        : std_ulogic;
signal ltdo        : std_ulogic;
signal ltdoen      : std_ulogic;

-- Use for ASIC
--constant padvoltage  : integer := x33v;
--constant padlevel    : integer := ttl;

-- Use for FPGA
constant padvoltage  : integer := x18v;
constant padlevel    : integer := cmos;

begin

  -- TODO: Move PAD options to 'xconfig'
  pads0 : entity work.pads
    generic map (
      padtech          => CFG_PADTECH,
      padlevel         => padlevel,
      padstrength      => 10,
      jtag_padfilter   => pullup,
      testen_padfilter => pulldown,
      resetn_padfilter => schmitt,
      clk_padfilter    => 0,
      spw_padstrength  => 12,
      jtag_padstrength => 6,
      uart_padstrength => 6,
      dsu_padstrength  => 6,
      padvoltage       => padvoltage,
      spw_input_type   => CFG_SPW_INPUT,
      oepol            => padoen_polarity(CFG_PADTECH)
    )
    port map (
      ---------------------------
      --to chip boundary
      ---------------------------
      resetn       => resetn    ,
      clksel       => clksel    ,
      clk          => clk       ,
      lock         => lock      ,
      errorn       => errorn    ,
      address      => address   ,
      data         => data      ,
      cb           => cb        ,
      sdclk        => sdclk     ,
      sdcsn        => sdcsn     ,
      sdwen        => sdwen     ,
      sdrasn       => sdrasn    ,
      sdcasn       => sdcasn    ,
      sddqm        => sddqm     ,
      dsutx        => dsutx     ,
      dsurx        => dsurx     ,
      dsuen        => dsuen     ,
      dsubre       => dsubre    ,
      dsuact       => dsuact    ,
      txd1         => txd1      ,
      rxd1         => rxd1      ,
      txd2         => txd2      ,
      rxd2         => rxd2      ,
      ramsn        => ramsn     ,
      ramoen       => ramoen    ,
      rwen         => rwen      ,
      oen          => oen       ,
      writen       => writen    ,
      read         => read      ,
      iosn         => iosn      ,
      romsn        => romsn     ,
      brdyn        => brdyn     ,
      bexcn        => bexcn     ,
      wdogn        => wdogn     ,
      gpio         => gpio      ,
      i2c_scl      => i2c_scl   ,
      i2c_sda      => i2c_sda   ,
      spi_miso     => spi_miso  ,
      spi_mosi     => spi_mosi  ,
      spi_sck      => spi_sck   ,
      spi_slvsel   => spi_slvsel,
      prom32       => prom32    ,
      spw_clksel   => spw_clksel,
      spw_clk      => spw_clk   ,
      spw_rxd      => spw_rxd   ,
      spw_rxs      => spw_rxs   ,
      spw_txd      => spw_txd   ,
      spw_txs      => spw_txs   ,
      gtx_clk      => gtx_clk   ,
      erx_clk      => erx_clk   ,
      erxd         => erxd      ,
      erx_dv       => erx_dv    ,
      etx_clk      => etx_clk   ,
      etxd         => etxd      ,
      etx_en       => etx_en    ,
      etx_er       => etx_er    ,
      erx_er       => erx_er    ,
      erx_col      => erx_col   ,
      erx_crs      => erx_crs   ,
      emdint       => emdint    ,
      emdio        => emdio     ,
      emdc         => emdc      ,
      testen       => testen    ,
      trst         => trst      ,
      tck          => tck       ,
      tms          => tms       ,
      tdi          => tdi       ,
      tdo          => tdo       ,
      ------------------------- ---
      --to core
      ----------------------------
      lresetn      => lresetn    ,
      lclksel      => lclksel    ,
      lclk         => lclk       ,
      llock        => llock      ,
      lerrorn      => lerrorn    ,
      laddress     => laddress   ,
      ldatain      => ldatain    ,
      ldataout     => ldataout   ,
      ldataen      => ldataen    ,
      lcbin        => lcbin      ,
      lcbout       => lcbout     ,
      lcben        => lcben      ,
      lsdclk       => lsdclk     ,
      lsdcsn       => lsdcsn     ,
      lsdwen       => lsdwen     ,
      lsdrasn      => lsdrasn    ,
      lsdcasn      => lsdcasn    ,
      lsddqm       => lsddqm     ,
      ldsutx       => ldsutx     ,
      ldsurx       => ldsurx     ,
      ldsuen       => ldsuen     ,
      ldsubre      => ldsubre    ,
      ldsuact      => ldsuact    ,
      ltxd1        => ltxd1      ,
      lrxd1        => lrxd1      ,
      ltxd2        => ltxd2      ,
      lrxd2        => lrxd2      ,
      lramsn       => lramsn     ,
      lramoen      => lramoen    ,
      lrwen        => lrwen      ,
      loen         => loen       ,
      lwriten      => lwriten    ,
      lread        => lread      ,
      liosn        => liosn      ,
      lromsn       => lromsn     ,
      lbrdyn       => lbrdyn     ,
      lbexcn       => lbexcn     ,
      lwdogn       => lwdogn     ,
      lgpioin      => lgpioin    ,
      lgpioout     => lgpioout   ,
      lgpioen      => lgpioen    ,
      li2c_sclout  => li2c_sclout,
      li2c_sclen   => li2c_sclen ,
      li2c_sclin   => li2c_sclin ,
      li2c_sdaout  => li2c_sdaout,
      li2c_sdaen   => li2c_sdaen ,
      li2c_sdain   => li2c_sdain ,
      lspi_miso    => lspi_miso  ,
      lspi_mosi    => lspi_mosi  ,
      lspi_sck     => lspi_sck   ,
      lspi_slvsel  => lspi_slvsel,
      lprom32      => lprom32    ,
      lspw_clksel  => lspw_clksel,
      lspw_clk     => lspw_clk   ,
      lspw_rxd     => lspw_rxd   ,
      lspw_rxs     => lspw_rxs   ,
      lspw_txd     => lspw_txd   ,
      lspw_txs     => lspw_txs   ,
      lgtx_clk     => lgtx_clk   ,
      lerx_clk     => lerx_clk   ,
      lerxd        => lerxd      ,
      lerx_dv      => lerx_dv    ,
      letx_clk     => letx_clk   ,
      letxd        => letxd      ,
      letx_en      => letx_en    ,
      letx_er      => letx_er    ,
      lerx_er      => lerx_er    ,
      lerx_col     => lerx_col   ,
      lerx_crs     => lerx_crs   ,
      lemdint      => lemdint    ,
      lemdioin     => lemdioin   ,
      lemdioout    => lemdioout  ,
      lemdioen     => lemdioen   ,
      lemdc        => lemdc      ,
      ltesten      => ltesten    ,
      ltrst        => ltrst      ,
      ltck         => ltck       ,
      ltms         => ltms       ,
      ltdi         => ltdi       ,
      ltdo         => ltdo       ,
      ltdoen       => ltdoen
    );
  
  -- ASIC Core
  core0 : entity work.core
    generic map (
      fabtech  => CFG_FABTECH,
      memtech  => CFG_MEMTECH,
      padtech  => CFG_PADTECH,
      clktech  => CFG_CLKTECH,
      disas    => CFG_DISAS,
      dbguart  => CFG_DUART,
      pclow    => CFG_PCLOW,
      scantest => CFG_SCAN,
      bscanen  => CFG_BOUNDSCAN_EN,
      oepol    => padoen_polarity(CFG_PADTECH)
    )
    port map (
      ----------------------------
      -- ASIC Ports/Pads
      ----------------------------
      resetn      => lresetn    ,
      clksel      => lclksel    ,
      clk         => lclk       ,
      lock        => llock      ,
      errorn      => lerrorn    ,
      address     => laddress   ,
      datain      => ldatain    ,
      dataout     => ldataout   ,
      dataen      => ldataen    ,
      cbin        => lcbin      ,
      cbout       => lcbout     ,
      cben        => lcben      ,
      sdclk       => lsdclk     ,
      sdcsn       => lsdcsn     ,
      sdwen       => lsdwen     ,
      sdrasn      => lsdrasn    ,
      sdcasn      => lsdcasn    ,
      sddqm       => lsddqm     ,
      dsutx       => ldsutx     ,
      dsurx       => ldsurx     ,
      dsuen       => ldsuen     ,
      dsubre      => ldsubre    ,
      dsuact      => ldsuact    ,
      txd1        => ltxd1      ,
      rxd1        => lrxd1      ,
      txd2        => ltxd2      ,
      rxd2        => lrxd2      ,
      ramsn       => lramsn     ,
      ramoen      => lramoen    ,
      rwen        => lrwen      ,
      oen         => loen       ,
      writen      => lwriten    ,
      read        => lread      ,
      iosn        => liosn      ,
      romsn       => lromsn     ,
      brdyn       => lbrdyn     ,
      bexcn       => lbexcn     ,
      wdogn       => lwdogn     ,
      gpioin      => lgpioin    ,
      gpioout     => lgpioout   ,
      gpioen      => lgpioen    ,
      i2c_sclout  => li2c_sclout,
      i2c_sclen   => li2c_sclen ,
      i2c_sclin   => li2c_sclin ,
      i2c_sdaout  => li2c_sdaout,
      i2c_sdaen   => li2c_sdaen ,
      i2c_sdain   => li2c_sdain ,
      spi_miso    => lspi_miso  ,
      spi_mosi    => lspi_mosi  ,
      spi_sck     => lspi_sck   ,
      spi_slvsel  => lspi_slvsel,
      prom32      => lprom32    ,
      spw_clksel  => lspw_clksel,
      spw_clk     => lspw_clk   ,
      spw_rxd     => lspw_rxd   ,
      spw_rxs     => lspw_rxs   ,
      spw_txd     => lspw_txd   ,
      spw_txs     => lspw_txs   ,
      gtx_clk     => lgtx_clk   ,
      erx_clk     => lerx_clk   ,
      erxd        => lerxd      ,
      erx_dv      => lerx_dv    ,
      etx_clk     => letx_clk   ,
      etxd        => letxd      ,
      etx_en      => letx_en    ,
      etx_er      => letx_er    ,
      erx_er      => lerx_er    ,
      erx_col     => lerx_col   ,
      erx_crs     => lerx_crs   ,
      emdint      => lemdint    ,
      emdioin     => lemdioin   ,
      emdioout    => lemdioout  ,
      emdioen     => lemdioen   ,
      emdc        => lemdc      ,
      testen      => ltesten    ,
      trst        => ltrst      ,
      tck         => ltck       ,
      tms         => ltms       ,
      tdi         => ltdi       ,
      tdo         => ltdo       ,
      tdoen       => ltdoen     ,
      ----------------------------
      -- BSCAN
      ----------------------------
      chain_tck   => OPEN ,
      chain_tckn  => OPEN ,
      chain_tdi   => OPEN ,
      chain_tdo   => '0',
      bsshft      => OPEN ,
      bscapt      => OPEN ,
      bsupdi      => OPEN ,
      bsupdo      => OPEN ,
      bsdrive     => OPEN ,
      bshighz     => OPEN 
    );

  -- BSCAN
  -- TODO: ADD BSCAN


end;

