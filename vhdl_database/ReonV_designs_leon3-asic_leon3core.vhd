-----------------------------------------------------------------------------
--  LEON3 Demonstration design
--  Copyright (C) 2013 Fredrik Ringhage, Aeroflex Gaisler
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
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;

library techmap;
use techmap.gencomp.all;

library gaisler;
use gaisler.memctrl.all;
use gaisler.leon3.all;
use gaisler.uart.all;
use gaisler.i2c.all;
use gaisler.spi.all;
use gaisler.misc.all;
use gaisler.jtag.all;
use gaisler.spacewire.all;
use gaisler.net.all;

library esa;
use esa.memoryctrl.all;

use work.config.all;

entity leon3core is
  generic (
    fabtech     : integer := CFG_FABTECH;
    memtech     : integer := CFG_MEMTECH;
    padtech     : integer := CFG_PADTECH;
    clktech     : integer := CFG_CLKTECH;
    disas       : integer := CFG_DISAS; -- Enable disassembly to console
    dbguart     : integer := CFG_DUART; -- Print UART on console
    pclow       : integer := CFG_PCLOW;
    scantest    : integer := CFG_SCAN
  );
  port (
    resetn      : in  std_ulogic;
    clksel      : in  std_logic_vector(1 downto 0);
    clk         : in  std_ulogic;
    clkapb      : in  std_ulogic;
    clklock     : in  std_ulogic;
    errorn      : out std_ulogic;
    address     : out std_logic_vector(27 downto 0);
    datain      : in  std_logic_vector(31 downto 0);
    dataout     : out std_logic_vector(31 downto 0);
    dataen      : out std_logic_vector(31 downto 0);
    cbin        : in  std_logic_vector(7 downto 0);
    cbout       : out std_logic_vector(7 downto 0);
    cben        : out std_logic_vector(7 downto 0);
    sdcsn       : out std_logic_vector (1 downto 0);    -- sdram chip select
    sdwen       : out std_ulogic;                       -- sdram write enable
    sdrasn      : out std_ulogic;                       -- sdram ras
    sdcasn      : out std_ulogic;                       -- sdram cas
    sddqm       : out std_logic_vector (3 downto 0);    -- sdram dqm
    dsutx       : out std_ulogic;       -- DSU tx data
    dsurx       : in  std_ulogic;       -- DSU rx data
    dsuen       : in  std_ulogic;
    dsubre      : in  std_ulogic;
    dsuact      : out std_ulogic;
    txd1        : out std_ulogic;       -- UART1 tx data
    rxd1        : in  std_ulogic;       -- UART1 rx data
    txd2        : out std_ulogic;       -- UART2 tx data
    rxd2        : in  std_ulogic;       -- UART2 rx data
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
    gpioin      : in  std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0);   -- I/O port
    gpioout     : out std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0);  -- I/O port
    gpioen      : out std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0);  -- I/O port
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
    spw_clksel  : in  std_logic_vector(1 downto 0);
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
    trst        : in  std_ulogic;
    tck         : in  std_ulogic;
    tms         : in  std_ulogic;
    tdi         : in  std_ulogic;
    tdo         : out std_ulogic;
    tdoen       : out std_ulogic;
    scanen      : in  std_ulogic;
    testen      : in  std_ulogic;
    testrst     : in  std_ulogic;
    testoen     : in  std_ulogic;
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

architecture rtl of leon3core is

--constant is_asic : integer := 1 - is_fpga(fabtech);
--constant blength : integer := 12;

--constant CFG_NCLKS : integer := 7;
constant maxahbmsp : integer := CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_GRETH;
constant maxahbm : integer := (CFG_SPW_NUM*CFG_SPW_EN) + maxahbmsp;

signal vcc, gnd : std_logic_vector(4 downto 0);
signal memi  : memory_in_type;
signal memo  : memory_out_type;
signal wpo   : wprot_out_type;
signal sdi   : sdctrl_in_type;
signal sdo   : sdram_out_type;

signal apbi  : apb_slv_in_type;
signal apbo  : apb_slv_out_vector := (others => apb_none);
signal ahbsi : ahb_slv_in_type;
signal ahbso : ahb_slv_out_vector := (others => ahbs_none);
signal ahbmi : ahb_mst_in_type;
signal ahbmo : ahb_mst_out_vector := (others => ahbm_none);

signal rstn, rstraw : std_ulogic;
signal rstapbn, rstapbraw : std_ulogic;
signal u1i, u2i, dui : uart_in_type;
signal u1o, u2o, duo : uart_out_type;

signal irqi : irq_in_vector(0 to CFG_NCPU-1);
signal irqo : irq_out_vector(0 to CFG_NCPU-1);

signal dbgi : l3_debug_in_vector(0 to CFG_NCPU-1);
signal dbgo : l3_debug_out_vector(0 to CFG_NCPU-1);

signal dsui : dsu_in_type;
signal dsuo : dsu_out_type;

signal gpti : gptimer_in_type;
signal gpto : gptimer_out_type;

signal gpioi, gpioi2 : gpio_in_type;
signal gpioo, gpioo2 : gpio_out_type;

signal i2ci : i2c_in_type;
signal i2co : i2c_out_type;

signal spii : spi_in_type;
signal spio : spi_out_type;

signal ethi : eth_in_type;
signal etho : eth_out_type;

-- signal tck, tms, tdi, tdo : std_ulogic;
signal jtck, jtckn, jtdi, jrst, jtdo, jcapt, jshft, jupd, jiupd: std_ulogic;
signal jninst: std_logic_vector(7 downto 0);

signal spwi : grspw_in_type_vector(0 to CFG_SPW_NUM-1);
signal spwo : grspw_out_type_vector(0 to CFG_SPW_NUM-1);
signal spw_rxclk : std_logic_vector(CFG_SPW_NUM*2-1 downto 0);
signal dtmp : std_logic_vector(0 to CFG_SPW_NUM-1);
signal stmp : std_logic_vector(0 to CFG_SPW_NUM-1);

signal stati : ahbstat_in_type;

-- SPW Clock Gating signals
signal enphy     : std_logic_vector(CFG_SPW_NUM-1 downto 0);
signal spwrstn   : std_logic_vector(CFG_SPW_NUM-1 downto 0);
signal gspwclk   : std_logic_vector(CFG_SPW_NUM-1 downto 0);
signal rxclko    : std_logic_vector(CFG_SPW_NUM-1 downto 0);
signal lspwclkn  : std_logic_vector(CFG_SPW_NUM-1 downto 0);
signal spwclkn   : std_logic_vector(CFG_SPW_NUM-1 downto 0);
signal rxclkphyo : std_logic_vector(CFG_SPW_NUM-1 downto 0);

signal disclk    : std_logic_vector(CFG_SPW_NUM-1 downto 0);
signal disrxclk0 : std_logic_vector(CFG_SPW_NUM-1 downto 0);
signal disrxclk1 : std_logic_vector(CFG_SPW_NUM-1 downto 0);
signal distxclk  : std_logic_vector(CFG_SPW_NUM-1 downto 0);
signal distxclkn : std_logic_vector(CFG_SPW_NUM-1 downto 0);
signal gclk      : std_logic_vector(CFG_SPW_NUM-1 downto 0);
signal grxclk0   : std_logic_vector(CFG_SPW_NUM-1 downto 0);
signal grxclk1   : std_logic_vector(CFG_SPW_NUM-1 downto 0);
signal gtxclk    : std_logic_vector(CFG_SPW_NUM-1 downto 0);
signal gtxclkn   : std_logic_vector(CFG_SPW_NUM-1 downto 0);
signal grst      : std_logic_vector(CFG_SPW_NUM-1 downto 0);

signal crst      : std_logic_vector(CFG_SPW_NUM-1 downto 0);

constant IOAEN : integer := 0;
constant CFG_SDEN : integer := CFG_MCTRL_LEON2;
constant CFG_INVCLK : integer := CFG_MCTRL_INVCLK;

constant BOARD_FREQ : integer := 50000; -- Board frequency in KHz

constant sysfreq : integer := (CFG_CLKMUL/CFG_CLKDIV)*40000;
constant OEPOL : integer := padoen_polarity(padtech);
constant CPU_FREQ : integer := 100000;

begin

----------------------------------------------------------------------
---  Reset and Clock generation  -------------------------------------
----------------------------------------------------------------------

  vcc <= (others => '1'); gnd <= (others => '0');
  wpo.wprothit <= '0'; -- no write protection

  rstgen0 : rstgen      -- reset generator
  generic map (syncrst => CFG_NOASYNC, scanen => scantest, syncin => 1)
  port map (resetn, clk, clklock, rstn, rstraw, testrst);

  rstgen1 : rstgen      -- reset generator
  generic map (syncrst => CFG_NOASYNC, scanen => scantest, syncin => 1)
  port map (resetn, clkapb, clklock, rstapbn, rstapbraw, testrst);

----------------------------------------------------------------------
---  AHB CONTROLLER --------------------------------------------------
----------------------------------------------------------------------

  ahbctrl0 : ahbctrl    -- AHB arbiter/multiplexer
  generic map (defmast => CFG_DEFMST, split => CFG_SPLIT,
  rrobin => CFG_RROBIN, ioaddr => CFG_AHBIO,
  ioen => IOAEN, nahbm => maxahbm, nahbs => 8)
  port map (rstn, clk, ahbmi, ahbmo, ahbsi, ahbso,
    testen, testrst, scanen, testoen);

----------------------------------------------------------------------
---  LEON3 processor and DSU -----------------------------------------
----------------------------------------------------------------------

  cpu : for i in 0 to CFG_NCPU-1 generate
      leon3s0 : leon3cg     -- LEON3 processor
      generic map (i, fabtech, memtech, CFG_NWIN, CFG_DSU, CFG_FPU, CFG_V8,
  0, CFG_MAC, pclow, CFG_NOTAG, CFG_NWP, CFG_ICEN, CFG_IREPL, CFG_ISETS, CFG_ILINE,
  CFG_ISETSZ, CFG_ILOCK, CFG_DCEN, CFG_DREPL, CFG_DSETS, CFG_DLINE, CFG_DSETSZ,
  CFG_DLOCK, CFG_DSNOOP, CFG_ILRAMEN, CFG_ILRAMSZ, CFG_ILRAMADDR, CFG_DLRAMEN,
        CFG_DLRAMSZ, CFG_DLRAMADDR, CFG_MMUEN, CFG_ITLBNUM, CFG_DTLBNUM, CFG_TLB_TYPE, CFG_TLB_REP,
        CFG_LDDEL, disas, CFG_ITBSZ, CFG_PWD, CFG_SVT, CFG_RSTADDR, CFG_NCPU-1,
        CFG_DFIXED, CFG_SCAN, CFG_MMU_PAGE, CFG_BP, CFG_NP_ASI, CFG_WRPSR)
      port map (clk, rstn, ahbmi, ahbmo(i), ahbsi, ahbso,
        irqi(i), irqo(i), dbgi(i), dbgo(i), clk);
  end generate;
  errorn <= dbgo(0).error when OEPOL = 0 else not dbgo(0).error;

  dsugen : if CFG_DSU = 1 generate
    dsu0 : dsu3     -- LEON3 Debug Support Unit
    generic map (hindex => 2, haddr => 16#900#, hmask => 16#F00#,
       ncpu => CFG_NCPU, tbits => 30, tech => memtech, irq => 0, kbytes => CFG_ATBSZ)
    port map (rstn, clk, ahbmi, ahbsi, ahbso(2), dbgo, dbgi, dsui, dsuo);
    dsui.enable <= dsuen; dsui.break <= dsubre; dsuact <= dsuo.active;
  end generate;
  nodsu : if CFG_DSU = 0 generate
    ahbso(2) <= ahbs_none; dsuo.tstop <= '0'; dsuo.active <= '0';
  end generate;

  dcomgen : if CFG_AHB_UART = 1 generate
    ahbuart0: ahbuart   -- Debug UART
    generic map (hindex => CFG_NCPU, pindex => 7, paddr => 7)
    port map (rstn, clk, dui, duo, apbi, apbo(7), ahbmi, ahbmo(CFG_NCPU));
    dui.rxd <= dsurx; dsutx <= duo.txd;
  end generate;
  nouah : if CFG_AHB_UART = 0 generate apbo(7) <= apb_none; end generate;

  ahbjtaggen0 :if CFG_AHB_JTAG = 1 generate
    ahbjtag0 : ahbjtag generic map(tech => fabtech, part => JTAG_EXAMPLE_PART,
  hindex => CFG_NCPU+CFG_AHB_UART, scantest => scantest, oepol => OEPOL)
      port map(rstn, clk, tck, tms, tdi, tdo, ahbmi, ahbmo(CFG_NCPU+CFG_AHB_UART),
               jtck, jtdi, open, jrst, jcapt, jshft, jupd, jtdo, trst, tdoen, '0', jtckn, jninst, jiupd);
  end generate;

----------------------------------------------------------------------
---  Memory controllers ----------------------------------------------
----------------------------------------------------------------------

  address <= memo.address(27 downto 0);
  ramsn <= memo.ramsn(4 downto 0); romsn <= memo.romsn(1 downto 0);
  oen <= memo.oen; rwen <= memo.wrn; ramoen <= memo.ramoen(4 downto 0);
  writen <= memo.writen; read <= memo.read; iosn <= memo.iosn;
  dataout <= memo.data(31 downto 0); dataen <= memo.vbdrive(31 downto 0);
  memi.data(31 downto 0) <= datain;
  sdwen <= sdo.sdwen; sdrasn <= sdo.rasn; sdcasn <= sdo.casn;
  sddqm <= sdo.dqm(3 downto 0); sdcsn <= sdo.sdcsn;
  cbout <= memo.cb(7 downto 0); cben <= memo.vcdrive(7 downto 0);
  memi.bwidth <= prom32 & '0';

  mg2 : if CFG_MCTRL_LEON2 = 1 generate   -- LEON2 memory controller
    mctrl0 : mctrl generic map (hindex => 0, pindex => 0, paddr => 0,
  srbanks => 4+CFG_MCTRL_5CS, sden => CFG_MCTRL_SDEN,
  ram8 => CFG_MCTRL_RAM8BIT, ram16 => CFG_MCTRL_RAM16BIT,
  invclk => CFG_MCTRL_INVCLK, sepbus => CFG_MCTRL_SEPBUS,
  sdbits => 32 + 32*CFG_MCTRL_SD64, pageburst => CFG_MCTRL_PAGE,
  oepol => OEPOL)
    port map (rstn, clk, memi, memo, ahbsi, ahbso(0), apbi, apbo(0), wpo, sdo);
  end generate;

  nosd0 : if (CFG_SDEN = 0) generate  -- no SDRAM controller
    sdo.sdcsn <= (others => '1');
  end generate;

  memi.writen <= '1'; memi.wrn <= "1111";
  memi.brdyn <= brdyn; memi.bexcn <= bexcn;

  mg0 : if CFG_MCTRL_LEON2 = 0 generate -- None PROM/SRAM controller
    apbo(0) <= apb_none; ahbso(0) <= ahbs_none;
    memo.ramsn <= (others => '1'); memo.romsn <= (others => '1');
  end generate;

----------------------------------------------------------------------
---  APB Bridge and various periherals -------------------------------
----------------------------------------------------------------------

  apbctrl0 : apbctrl        -- AHB/APB bridge
  generic map (hindex => 1, haddr => CFG_APBADDR)
  port map (rstapbn, clkapb, ahbsi, ahbso(1), apbi, apbo );

  ua1 : if CFG_UART1_ENABLE /= 0 generate
    apbuart0 : apbuart      -- UART 1
      generic map (pindex => 1, paddr => 1,  pirq => 2, console => dbguart,
       fifosize => CFG_UART1_FIFO)
      port map (rstapbn, clkapb, apbi, apbo(1), u1i, u1o);
    u1i.ctsn <= '0'; u1i.extclk <= '0';
    txd1 <= u1o.txd; u1i.rxd <= rxd1;
  end generate;
  noua0 : if CFG_UART1_ENABLE = 0 generate apbo(1) <= apb_none; end generate;

  ua2 : if CFG_UART2_ENABLE /= 0 generate
    uart2 : apbuart     -- UART 2
      generic map (pindex => 9, paddr => 9,  pirq => 9, fifosize => CFG_UART2_FIFO)
      port map (rstapbn, clkapb, apbi, apbo(9), u2i, u2o);
    u2i.rxd <= rxd2; u2i.ctsn <= '0'; u2i.extclk <= '0'; txd2 <= u2o.txd;
  end generate;
  noua1 : if CFG_UART2_ENABLE = 0 generate apbo(9) <= apb_none; end generate;

  irqctrl : if CFG_IRQ3_ENABLE /= 0 generate
    irqctrl0 : irqmp      -- interrupt controller
      generic map (pindex => 2, paddr => 2, ncpu => CFG_NCPU)
      port map (rstn, clk, apbi, apbo(2), irqo, irqi);
  end generate;
  irq3 : if CFG_IRQ3_ENABLE = 0 generate
    x : for i in 0 to CFG_NCPU-1 generate
      irqi(i).irl <= "0000";
    end generate;
    apbo(2) <= apb_none;
  end generate;

  gpt : if CFG_GPT_ENABLE /= 0 generate
    gptimer0 : gptimer      -- timer unit
      generic map (pindex => 3, paddr => 3, pirq => CFG_GPT_IRQ,
       sepirq => CFG_GPT_SEPIRQ, sbits => CFG_GPT_SW, ntimers => CFG_GPT_NTIM,
       nbits => CFG_GPT_TW, wdog => CFG_GPT_WDOGEN*CFG_GPT_WDOG)
      port map (rstapbn, clkapb, apbi, apbo(3), gpti, gpto);
    gpti <= gpti_dhalt_drive(dsuo.tstop);
    wdogn <= gpto.wdogn when OEPOL = 0 else gpto.wdog;
  end generate;
  notim : if CFG_GPT_ENABLE = 0 generate apbo(3) <= apb_none; end generate;

  gpio0 : if CFG_GRGPIO_ENABLE /= 0 generate     -- GR GPIO unit
    grgpio0: grgpio
      generic map( pindex => 6, paddr => 6, imask => CFG_GRGPIO_IMASK,
       nbits => CFG_GRGPIO_WIDTH, oepol => OEPOL, syncrst => CFG_NOASYNC)
      port map( rstapbn, clkapb, apbi, apbo(6), gpioi, gpioo);
    gpioout <= gpioo.dout(CFG_GRGPIO_WIDTH-1 downto 0);
    gpioen <= gpioo.oen(CFG_GRGPIO_WIDTH-1 downto 0);
    gpioi.din(CFG_GRGPIO_WIDTH-1 downto 0) <= gpioin;
  end generate;
  nogpio : if CFG_GRGPIO_ENABLE = 0 generate apbo(5) <= apb_none; end generate;

  i2cm: if CFG_I2C_ENABLE = 1 generate  -- I2C master
    i2c0 : i2cmst generic map (pindex => 5, paddr => 5, pmask => 16#FFF#, pirq => 13, filter => 9)
      port map (rstapbn, clkapb, apbi, apbo(5), i2ci, i2co);
     i2c_sclout <= i2co.scl;
     i2c_sclen  <= i2co.scloen;
     i2ci.scl   <= i2c_sclin;
     i2c_sdaout <= i2co.sda;
     i2c_sdaen  <= i2co.sdaoen;
     i2ci.sda   <= i2c_sdain;
  end generate i2cm;
  noi2cm: if CFG_I2C_ENABLE = 0 generate apbo(5) <= apb_none; end generate;

  spic: if CFG_SPICTRL_ENABLE = 1 generate  -- SPI controller
    spictrl0 : spictrl
        generic map(
          pindex      => 8,
          paddr       => 8,
          pmask       => 16#fff#,
          pirq        => 8,
          fdepth      => CFG_SPICTRL_FIFO,
          slvselen    => CFG_SPICTRL_SLVREG,
          slvselsz    => CFG_SPICTRL_SLVS,
          oepol       => oepol,
          odmode      => CFG_SPICTRL_ODMODE,
          automode    => CFG_SPICTRL_AM,
          aslvsel     => CFG_SPICTRL_ASEL,
          twen        => CFG_SPICTRL_TWEN,
          maxwlen     => CFG_SPICTRL_MAXWLEN,
          syncram     => CFG_SPICTRL_SYNCRAM,
          memtech     => memtech,
          ft          => CFG_SPICTRL_FT,
          scantest    => scantest)
        port map(
          rstn        => rstapbn,
          clk         => clkapb,
          apbi        => apbi,
          apbo        => apbo(8),
          spii        => spii,
          spio        => spio,
          slvsel      => spi_slvsel);

    spii.sck     <= '0';
    spii.mosi    <= '0';
    spii.miso    <= spi_miso;
    spi_mosi     <= spio.mosi;
    spi_sck      <= spio.sck;

    spii.astart  <= '0'; --unused
    spii.spisel  <= '1'; --unused (master only)
  end generate spic;
  nospi: if CFG_SPICTRL_ENABLE = 0 generate  apbo(14) <= apb_none; end generate;

  ahbs : if CFG_AHBSTAT = 1 generate  -- AHB status register
    stati.cerror(0) <= memo.ce;
    ahbstat0 : ahbstat
      generic map (pindex => 15, paddr => 15, pirq => 1, nftslv => CFG_AHBSTATN)
      port map (rstn, clk, ahbmi, ahbsi, stati, apbi, apbo(15));
  end generate;
  nop2 : if CFG_AHBSTAT = 0 generate apbo(15) <= apb_none; end generate;

-------------------------------------------------------------------------------
-- JTAG Boundary scan
-------------------------------------------------------------------------------

  bscangen: if CFG_BOUNDSCAN_EN /= 0 generate

    xtapgen: if CFG_AHB_JTAG = 0 generate
      t0: tap
        generic map (tech => fabtech, irlen => 6, scantest => scantest, oepol => OEPOL)
        port map (trst,tck,tms,tdi,tdo,
                  jtck,jtdi,open,jrst,jcapt,jshft,jupd,open,open,'1',jtdo,'0',jninst,jiupd,jtckn,testen,testrst,testoen,tdoen,'0');
    end generate;

    bc0: bscanctrl
      port map (
        trst,jtck,jtckn,jtdi,jninst,jiupd,jrst,jcapt,jshft,jupd,jtdo,
        chain_tdi, chain_tdo, bsshft, bscapt, bsupdi, bsupdo, bsdrive, bshighz,
        gnd(0), gnd(0), testen, testrst, open, gnd(0));

    chain_tck <= jtck;
    chain_tckn <= jtckn;

  end generate;

  nobscangen: if CFG_BOUNDSCAN_EN = 0 generate

    chain_tck  <= '0';
    chain_tckn <= '0';
    chain_tdi  <= '0';
    bsshft <= '0';
    bscapt <= '0';
    bsupdi <= '0';
    bsupdo <= '0';
    bsdrive <= '0';
    bshighz <= '0';
  end generate;


-----------------------------------------------------------------------
---  SPACEWIRE  -------------------------------------------------------
-----------------------------------------------------------------------

  spw : if CFG_SPW_EN > 0 generate
    swloop : for i in 0 to CFG_SPW_NUM-1 generate
      spwi(i).clkdiv10 <=
        "000"   & gpioo.val(10 downto 8) & "11" when spw_clksel(1 downto 0) = "11" else
        "0000"  & gpioo.val(10 downto 8) & '1'  when spw_clksel(1 downto 0) = "10" else
        "00000" & gpioo.val(10 downto 8);

      spwi(i).timerrstval <=
        '0'   & gpioo.val(15 downto 11) & "111111" when clksel(1 downto 0) = "11" else
        "00"  & gpioo.val(15 downto 11) & "11111"  when clksel(1 downto 0) = "10" else
        "000" & gpioo.val(15 downto 11) & "1111";

      spwi(i).dcrstval <=
        "00"   & gpioo.val(15 downto 11) & "111" when clksel(1 downto 0) = "11" else
        "000"  & gpioo.val(15 downto 11) & "10"  when clksel(1 downto 0) = "10" else
        "0000" & gpioo.val(15 downto 11) & '0';

      -- GRSPW PHY #1
      spw1_input: if CFG_SPW_GRSPW = 1 generate
         x : process
         begin
           assert false
           report  "ASIC Leon3 Ref design do not support GRSPW #1"
           severity failure;
           wait;
         end process;
      end generate spw1_input;

      -- GRSPW PHY #2
      spw2_input: if CFG_SPW_GRSPW = 2 generate
         ------------------------------------------------------------------------------
         -- SpW Physical layer
         ------------------------------------------------------------------------------
         --phy_loop : for i in 0 to CFG_SPWRTR_SPWPORTS-1 generate

           rstphy0 : rstgen
               generic map(
                 acthigh    => 0, -- CFG_RSTGEN_ACTHIGH,
                 syncrst    => CFG_NOASYNC, -- CFG_RSTGEN_SYNCRST,
                 scanen     => scantest,
                 syncin     => 1)
               port map (
                 rstin      => rstn,
                 clk        => spw_clk,
                 clklock    => clklock,
                 rstout     => spwrstn(i),
                 rstoutraw  => open,
                 testrst    => testrst,
                 testen     => testen);

           -- Only add clockgating to tech lib which supports clock gates
           clkgatephygen : if (has_clkand(fabtech) = 1)  generate
              -- Sync clock to clock domain
              spwclkreg : process(spw_clk) is
              begin
                if rising_edge(spw_clk) then
                  -- Only disable phy when rx and tx is disabled
                  -- TODO: Add SW register to enable/disable the router
                  enphy(i) <= '1';
                end if;
              end process;

             -- Disable spw phy clock when port is not used
             spw_phy0_enable  : clkand
               generic map (
                 tech => fabtech,
                 ren  => 0)
               port map (
                 i     => spw_clk,
                 en    => enphy(i),
                 o     => gspwclk(i),
                 tsten => testen);

             -- Select rx clock (Should be removed by optimization if RX and TX clock is same i.e. normal case for ASIC)
             spw_rxclk(i) <= spw_clk when (CFG_SPW_RTSAME = 1) else rxclkphyo(i);
           end generate;

           noclkgategen : if (has_clkand(fabtech) = 0) generate
             enphy(i)     <= '1';
             gspwclk(i)   <= spw_clk;
             spw_rxclk(i) <= spw_clk when (CFG_SPW_RTSAME = 1) else rxclkphyo(i);
           end generate;

           notecclkmux : if (has_clkmux(fabtech) = 0) generate
              spwclkn(i) <= spw_clk when (testen = '1' and scantest = 1) else not spw_clk;
           end generate;
           tecclkmux : if (has_clkmux(fabtech) = 1) generate
              -- Use SET protected cells
              spwclkni0:  clkinv generic map (tech => fabtech) port map (spw_clk, lspwclkn(i));
              spwclknm0 : clkmux generic map (tech => fabtech) port map (lspwclkn(i),spw_clk,testen,spwclkn(i));
           end generate;

           spw_phy0 : grspw2_phy
             generic map(
               scantest     => scantest,
               tech         => fabtech,
               input_type   => CFG_SPW_INPUT,
               rxclkbuftype => 0)
             port map(
               rstn       => spwrstn(i),
               rxclki     => gspwclk(i),
               rxclkin    => spwclkn(i),
               nrxclki    => spwclkn(i),
               di         => dtmp(i),
               si         => stmp(i),
               do         => spwi(i).d(1 downto 0),
               dov        => spwi(i).dv(1 downto 0),
               dconnect   => spwi(i).dconnect(1 downto 0),
               rxclko     => rxclkphyo(i),
               testrst    => testrst,
               testen     => testen);

            dtmp(i) <= spw_rxd(i); stmp(i) <= spw_rxs(i);
            spw_txd(i) <= spwo(i).d(0); spw_txs(i) <= spwo(i).s(0);

            spwi(i).nd <= (others => '0');  -- Only used in GRSPW
            spwi(i).dv(3 downto 2) <= "00";  -- For second port
         --end generate;
      end generate spw2_input;

      spw1_codec: if CFG_SPW_GRSPW = 1 generate
         x : process
         begin
           assert false
           report  "ASIC Leon3 Ref design do not support GRSPW #1"
           severity failure;
           wait;
         end process;
      end generate spw1_codec;

      spw2_codec: if CFG_SPW_GRSPW = 2 generate

       rstcodec0 : rstgen
        generic map(
          acthigh    => 0, -- CFG_RSTGEN_ACTHIGH,
          syncrst    => CFG_NOASYNC, -- CFG_RSTGEN_SYNCRST,
          scanen     => scantest,
          syncin     => 1)
        port map (
          rstin      => rstn,
          clk        => spw_clk,
          clklock    => clklock,
          rstout     => crst(i),
          rstoutraw  => open,
          testrst    => testrst,
          testen     => testen);

      -- TODO: Fix SW control signals
      disclk(i)    <= '0';
      disrxclk0(i) <= '0';
      disrxclk1(i) <= '0';
      distxclk(i)  <= '0';
      distxclkn(i) <= '0';

      port0_clkgate : grspw_codec_clockgate
        generic map (
          tech         => fabtech,
          scantest     => scantest,
          ports        => CFG_SPW_PORTS,
          output_type  => CFG_SPW_OUTPUT,
          clkgate      => 1
          )
        port map (
          rst           => crst(i),
          clk           => spw_clk,
          rxclk0        => spw_rxclk(i),
          rxclk1        => '0',
          txclk         => spw_clk,
          txclkn        => '0',
          testen        => testen,
          testrst       => testrst,
          disableclk    => disclk(i),
          disablerxclk0 => disrxclk0(i),
          disablerxclk1 => disrxclk1(i),
          disabletxclk  => distxclk(i),
          disabletxclkn => distxclkn(i),
          grst          => grst(i),
          gclk          => gclk(i),
          grxclk0       => grxclk0(i),
          grxclk1       => grxclk1(i),
          gtxclk        => gtxclk(i),
          gtxclkn       => gtxclkn(i)
        );

       grspw0 :  grspw2
        generic map(
          tech         => fabtech,         -- : integer range 0 to NTECH     := inferred;
          hindex       => maxahbmsp+i,     -- : integer range 0 to NAHBMST-1 := 0;
          pindex       => i+10,            -- : integer range 0 to NAPBSLV-1 := 0;
          paddr        => i+10,            -- : integer range 0 to 16#FFF#   := 0;
          --pmask        : integer range 0 to 16#FFF#   := 16#FFF#;
          pirq         => i+10,            -- : integer range 0 to NAHBIRQ-1 := 0;
          rmap         => CFG_SPW_RMAP,    -- : integer range 0 to 2  := 0;
          rmapcrc      => CFG_SPW_RMAPCRC, -- : integer range 0 to 1  := 0;
          fifosize1    => CFG_SPW_AHBFIFO, -- : integer range 4 to 32 := 32;
          fifosize2    => CFG_SPW_RXFIFO,  -- : integer range 16 to 64 := 64;
          rxunaligned  => CFG_SPW_RXUNAL,  -- : integer range 0 to 1 := 0;
          rmapbufs     => CFG_SPW_RMAPBUF, -- : integer range 2 to 8 := 4;
          ft           => CFG_SPW_FT,      -- : integer range 0 to 2 := 0;
          scantest     => scantest,        -- : integer range 0 to 1 := 0;
          ports        => CFG_SPW_PORTS,   -- : integer range 1 to 2 := 1;
          dmachan      => CFG_SPW_DMACHAN, -- : integer range 1 to 4 := 1;
          memtech      => memtech,         -- : integer range 0 to NTECH := DEFMEMTECH;
          techfifo     => has_2pram(memtech), -- : integer range 0 to 1 := 1;
          input_type   => CFG_SPW_INPUT,   -- : integer range 0 to 4 := 0;
          output_type  => CFG_SPW_OUTPUT,  -- : integer range 0 to 2 := 0;
          rxtx_sameclk => CFG_SPW_RTSAME,  -- : integer range 0 to 1 := 0;
          netlist      => CFG_SPW_NETLIST -- : integer range 0 to 1 := 0;
        )
        port map (
          rst        => grst(i),
          clk        => gclk(i),
          rxclk0     => grxclk0(i),
          rxclk1     => grxclk1(i),
          txclk      => gtxclk(i),
          txclkn     => gtxclkn(i),
          ahbmi      => ahbmi,
          ahbmo      => ahbmo(maxahbmsp+i),
          apbi       => apbi,              
          apbo       => apbo(i+10),        
          swni       => spwi(i),
          swno       => spwo(i)
        );
      end generate spw2_codec;

    end generate;
  end generate;

  nospw : if CFG_SPW_EN = 0 generate
    spw_txd <= (others => '0');
    spw_txs <= (others => '0');
  end generate;

-----------------------------------------------------------------------
---  ETHERNET ---------------------------------------------------------
-----------------------------------------------------------------------

  eth0 : if CFG_GRETH = 1 generate -- Gaisler ethernet MAC
    e1 : grethm
      generic map(hindex => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG,
        pindex => 13, paddr => 13, pirq => 12, memtech => memtech,
        mdcscaler => CPU_FREQ/1000, enable_mdio => 1, fifosize => CFG_ETH_FIFO,
        nsync => 1, edcl => CFG_DSU_ETH, edclbufsz => CFG_ETH_BUF,
        macaddrh => CFG_ETH_ENM, macaddrl => CFG_ETH_ENL, phyrstadr => 7,
        ipaddrh => CFG_ETH_IPM, ipaddrl => CFG_ETH_IPL, giga => CFG_GRETH1G,
        enable_mdint => 1)
      port map(rst => rstn, clk => clk, ahbmi => ahbmi,
               ahbmo => ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG),
               apbi => apbi, apbo => apbo(13), ethi => ethi, etho => etho);

  ethi.gtx_clk         <= gtx_clk;
  ethi.rx_clk          <= erx_clk;
  ethi.rxd(7 downto 0) <= erxd;
  ethi.rx_dv           <= erx_dv;
  ethi.tx_clk          <= etx_clk;
  etxd                 <= etho.txd(7 downto 0);
  etx_en               <= etho.tx_en;
  etx_er               <= etho.tx_er;
  ethi.mdint           <= emdint;
  ethi.mdio_i          <= emdioin;
  emdioout             <= etho.mdio_o;
  emdioen              <= etho.mdio_oe;
  emdc                 <= etho.mdc;
  ethi.rx_er           <= erx_er;
  ethi.rx_col          <= erx_col;
  ethi.rx_crs          <= erx_crs;

  end generate;




-----------------------------------------------------------------------
---  Drive unused bus elements  ---------------------------------------
-----------------------------------------------------------------------

  noam1 : for i in maxahbm to NAHBMST-1 generate
    ahbmo(i) <= ahbm_none;
  end generate;
--  noap0 : for i in 12+(CFG_SPW_NUM*CFG_SPW_EN) to NAPBSLV-1-CFG_AHBSTAT
--  generate apbo(i) <= apb_none; end generate;
  noah0 : for i in 9 to NAHBSLV-1 generate ahbso(i) <= ahbs_none; end generate;

-----------------------------------------------------------------------
---  Boot message  ----------------------------------------------------
-----------------------------------------------------------------------

-- pragma translate_off
  x : report_design
  generic map (
   msg1 => "LEON3 ASIC Demonstration design",
   fabtech => tech_table(fabtech), memtech => tech_table(memtech),
   mdel => 1
  );
-- pragma translate_on
end;

