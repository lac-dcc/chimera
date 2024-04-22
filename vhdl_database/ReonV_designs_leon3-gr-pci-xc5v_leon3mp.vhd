-----------------------------------------------------------------------------
--  LEON Demonstration design
--  Copyright (C) 2010 - 2015 Cobham Gaisler AB
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
library grlib, techmap;
use grlib.amba.all;
use grlib.stdlib.all;
use techmap.gencomp.all;
library gaisler;
use gaisler.memctrl.all;
use gaisler.leon3.all;
use gaisler.uart.all;
use gaisler.misc.all;
use gaisler.can.all;
use gaisler.pci.all;
use gaisler.net.all;
use gaisler.jtag.all;
use gaisler.spacewire.all;
use gaisler.grusb.all;
use gaisler.l2cache.all;
use gaisler.subsys.all;
use gaisler.gr1553b_pkg.all;

library esa;
use esa.memoryctrl.all;
use esa.pcicomp.all;
use work.config.all;

entity leon3mp is
  generic (
    fabtech   : integer := CFG_FABTECH;
    memtech   : integer := CFG_MEMTECH;
    padtech   : integer := CFG_PADTECH;
    clktech   : integer := CFG_CLKTECH;
    disas     : integer := CFG_DISAS;   -- Enable disassembly to console
    dbguart   : integer := CFG_DUART;   -- Print UART on console
    pclow     : integer := CFG_PCLOW
  );
  port (
    resetn      : in  std_logic;
    clk         : in  std_logic;
    pllref      : in  std_logic; 
    errorn      : out std_logic;
    wdogn       : out std_logic;

    address     : out std_logic_vector(27 downto 0);
    data        : inout std_logic_vector(31 downto 0);
    cb          : inout std_logic_vector(7 downto 0);
    sa          : out std_logic_vector(14 downto 0);
    sd          : inout std_logic_vector(63 downto 0);

    sdclk       : out std_logic;
    sdcke       : out std_logic_vector (1 downto 0);    -- sdram clock enable
    sdcsn       : out std_logic_vector (1 downto 0);    -- sdram chip select
    sdwen       : out std_logic;                       -- sdram write enable
    sdrasn      : out std_logic;                       -- sdram ras
    sdcasn      : out std_logic;                       -- sdram cas
    sddqm       : out std_logic_vector (7 downto 0);    -- sdram dqm
    dsutx       : out std_logic;                        -- DSU tx data
    dsurx       : in  std_logic;                        -- DSU rx data
    dsuen       : in std_logic;
    dsubre      : in std_logic;
    dsuact      : out std_logic;
    txd1        : out std_logic;                        -- UART1 tx data
    rxd1        : in  std_logic;                        -- UART1 rx data
    txd2        : out std_logic;                        -- UART2 tx data
    rxd2        : in  std_logic;                        -- UART2 rx data
    ramsn       : out std_logic_vector (4 downto 0);
    ramoen      : out std_logic_vector (4 downto 0);
    rwen        : out std_logic_vector (3 downto 0);
    oen         : out std_logic;
    writen      : out std_logic;
    read        : out std_logic;
    iosn        : out std_logic;
    romsn       : out std_logic_vector (1 downto 0);
    brdyn       : in  std_logic;                        -- bus ready
    bexcn       : in  std_logic;                        -- bus exception

    gpio        : inout std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0);  -- I/O port

    emdio       : inout std_logic;              -- ethernet PHY interface
    eth_macclk  : in std_logic;
    etx_clk     : in std_logic;
    erx_clk     : in std_logic;
    erxd        : in std_logic_vector(7 downto 0);   
    erx_dv      : in std_logic; 
    erx_er      : in std_logic; 
    erx_col     : in std_logic;
    erx_crs     : in std_logic;
    emdintn     : in std_logic;
    etxd        : out std_logic_vector(7 downto 0);   
    etx_en      : out std_logic; 
    etx_er      : out std_logic; 
    emdc        : out std_logic;

    pci_rst     : inout std_logic;              -- PCI bus
    pci_clk     : in std_logic;
    pci_gnt     : in std_logic;
    pci_idsel   : in std_logic; 
    pci_lock    : inout std_logic;
    pci_ad      : inout std_logic_vector(31 downto 0);
    pci_cbe     : inout std_logic_vector(3 downto 0);
    pci_frame   : inout std_logic;
    pci_irdy    : inout std_logic;
    pci_trdy    : inout std_logic;
    pci_devsel  : inout std_logic;
    pci_stop    : inout std_logic;
    pci_perr    : inout std_logic;
    pci_par     : inout std_logic;    
    pci_req     : inout std_logic;
    pci_serr    : inout std_logic;
    pci_host    : in std_logic;
    pci_66      : in std_logic;
    pci_arb_req : in  std_logic_vector(0 to 3);
    pci_arb_gnt : out std_logic_vector(0 to 3);

    can_txd     : out std_logic_vector(0 to CFG_CAN_NUM-1);
    can_rxd     : in  std_logic_vector(0 to CFG_CAN_NUM-1);
--    can_stb   : out std_logic_vector(0 to CFG_CAN_NUM-1)

    spw_clk      : in  std_logic;
    spw_rxdp     : in  std_logic_vector(0 to CFG_SPW_NUM-1);
    spw_rxdn     : in  std_logic_vector(0 to CFG_SPW_NUM-1);
    spw_rxsp     : in  std_logic_vector(0 to CFG_SPW_NUM-1);
    spw_rxsn     : in  std_logic_vector(0 to CFG_SPW_NUM-1);
    spw_txdp     : out std_logic_vector(0 to CFG_SPW_NUM-1);
    spw_txdn     : out std_logic_vector(0 to CFG_SPW_NUM-1);
    spw_txsp     : out std_logic_vector(0 to CFG_SPW_NUM-1);
    spw_txsn     : out std_logic_vector(0 to CFG_SPW_NUM-1);

    usb_clkout  : in std_logic;
    usb_d       : inout std_logic_vector(7 downto 0);
    usb_nxt     : in  std_logic;
    usb_stp     : out std_logic;
    usb_dir     : in  std_logic;
    usb_resetn  : out std_ulogic;

    busainen    : out std_logic_vector(0 to 0); 
    busainp     : in  std_logic_vector(0 to 0);
    busainn     : in  std_logic_vector(0 to 0);
    busaoutin   : out std_logic_vector(0 to 0); 
    busaoutp    : out std_logic_vector(0 to 0); 
    busaoutn    : out std_logic_vector(0 to 0); 
    busbinen    : out std_logic_vector(0 to 0); 
    busbinp     : in  std_logic_vector(0 to 0);
    busbinn     : in  std_logic_vector(0 to 0);
    busboutin   : out std_logic_vector(0 to 0); 
    busboutp    : out std_logic_vector(0 to 0); 
    busboutn    : out std_logic_vector(0 to 0)
    
    );
end;

architecture rtl of leon3mp is

constant blength : integer := 12;
constant fifodepth : integer := 8;

signal vcc, gnd   : std_logic_vector(4 downto 0);

signal lresetn : std_ulogic;

signal memi  : memory_in_type;
signal memo  : memory_out_type;
signal wpo   : wprot_out_type;
signal sdi   : sdctrl_in_type;
signal sdo   : sdram_out_type;
signal sdo2, sdo3 : sdctrl_out_type;

signal apbi  : apb_slv_in_type;
signal apbo  : apb_slv_out_vector := (others => apb_none);

signal ahbsi : ahb_slv_in_type;
signal ahbso : ahb_slv_out_vector := (others => ahbs_none);
signal ahbmi : ahb_mst_in_type;
signal ahbmo : ahb_mst_out_vector := (others => ahbm_none);
signal sdram_ahbsi : ahb_slv_in_type;
signal sdram_ahbso : ahb_slv_out_vector_type(1 downto 0);

signal clkm, rstn, rstraw, pciclk, sdclkl : std_logic;
signal cgi, cgi2 : clkgen_in_type;
signal cgo, cgo2, cgo1553 : clkgen_out_type;
signal u1i, u2i, dui : uart_in_type;
signal u1o, u2o, duo : uart_out_type;

signal irqi : irq_in_vector(0 to CFG_NCPU-1);
signal irqo : irq_out_vector(0 to CFG_NCPU-1);

signal sysi : leon_dsu_stat_base_in_type;
signal syso : leon_dsu_stat_base_out_type;

signal perf : l3stat_in_type;

signal pcii : pci_in_type;
signal pcio : pci_out_type;

signal spwi : grspw_in_type_vector(0 to CFG_SPW_NUM-1);
signal spwo : grspw_out_type_vector(0 to CFG_SPW_NUM-1);
signal spw_clkl   : std_logic;
signal spw_rxclk : std_logic_vector(0 to CFG_SPW_NUM-1);
signal dtmp : std_logic_vector(0 to CFG_SPW_NUM-1);
signal stmp : std_logic_vector(0 to CFG_SPW_NUM-1);
signal spw_rxtxclk : std_ulogic;
signal spw_rxclkn  : std_ulogic;

signal stati : ahbstat_in_type;

signal ethi, ethi1, ethi2 : eth_in_type;
signal etho, etho1, etho2 : eth_out_type;

signal ethclk, egtx_clk_fb : std_logic;
signal egtx_clk, legtx_clk, l2egtx_clk : std_logic;

signal gpti : gptimer_in_type;
signal gpto : gptimer_out_type;
signal wdog : std_logic;

signal gpioi : gpio_in_type;
signal gpioo : gpio_out_type;

signal clklock, elock, ulock : std_ulogic;
signal can_lrx, can_ltx   : std_logic_vector(0 to 7);
signal lclk, pci_lclk : std_logic;
signal pci_arb_req_n, pci_arb_gnt_n   : std_logic_vector(0 to 3);
signal pci_dirq : std_logic_vector(3 downto 0);

signal tck, tms, tdi, tdo : std_logic;

signal usbi : grusb_in_vector(0 downto 0);
signal usbo : grusb_out_vector(0 downto 0);
signal uclk : std_ulogic := '0';

type milout_array is array (0 to 0) of gr1553b_txout_type;
type milin_array is array (0 to 0) of gr1553b_rxin_type;

signal clk1553,rst1553: std_ulogic;
signal milout: milout_array;
signal milin: milin_array;

constant BOARD_FREQ : integer := 50000; -- Board frequency in KHz
constant CPU_FREQ : integer := BOARD_FREQ * CFG_CLKMUL / CFG_CLKDIV;  -- cpu frequency in KHz
constant IOAEN : integer := CFG_CAN + CFG_GRPCI2_MASTER + CFG_GRUSBHC +
                            CFG_GRUSBDC+1;
constant CFG_SDEN : integer := CFG_MCTRL_SDEN + CFG_SDCTRL + CFG_MCTRLFT_SDEN;
constant CFG_INVCLK : integer := CFG_MCTRL_INVCLK + CFG_MCTRLFT_INVCLK + CFG_SDCTRL_INVCLK;
constant OEPOL : integer := padoen_polarity(padtech);

attribute syn_keep : boolean;
attribute syn_preserve : boolean;
attribute keep : boolean;

begin

----------------------------------------------------------------------
---  Reset and Clock generation  -------------------------------------
----------------------------------------------------------------------
  
  vcc <= (others => '1'); gnd <= (others => '0');
  cgi.pllctrl <= "00"; cgi.pllrst <= rstraw;

  pllref_pad : clkpad generic map (tech => padtech) port map (pllref, cgi.pllref); 
  clk_pad : clkpad generic map (tech => padtech) port map (clk, lclk); 
  pci_clk_pad : clkpad generic map (tech => padtech, level => pci33) 
            port map (pci_clk, pci_lclk); 
  clkgen0 : clkgen              -- clock generator
    generic map (clktech, CFG_CLKMUL, CFG_CLKDIV, CFG_SDEN, 
        CFG_INVCLK, CFG_GRPCI2_MASTER+CFG_GRPCI2_TARGET, CFG_PCIDLL, CFG_PCISYSCLK, BOARD_FREQ)
    port map (lclk, pci_lclk, clkm, open, open, sdclkl, pciclk, cgi, cgo);
  sdclk_pad : outpad generic map (tech => padtech, slew => 1) 
        port map (sdclk, sdclkl);

  resetn_pad : inpad generic map (tech => padtech) port map (resetn, lresetn);
  
  rst0 : rstgen                 -- reset generator
    port map (lresetn, clkm, clklock, rstn, rstraw);
  clklock <= cgo.clklock and elock and ulock;

----------------------------------------------------------------------
---  AHB CONTROLLER --------------------------------------------------
----------------------------------------------------------------------

  ahb0 : ahbctrl                -- AHB arbiter/multiplexer
  generic map (defmast => CFG_DEFMST, split => CFG_SPLIT, fpnpen => 1, 
        rrobin => CFG_RROBIN, ioaddr => CFG_AHBIO, ioen => IOAEN,
        nahbm => CFG_NCPU+CFG_AHB_UART+CFG_GRPCI2_TARGET+CFG_GRPCI2_DMA+CFG_AHB_JTAG+
               CFG_GRETH+CFG_SPW_EN*CFG_SPW_NUM+
               CFG_GRUSBHC*(CFG_GRUSBHC_EHC+CFG_GRUSBHC_UHC)+
               CFG_GRUSBDC*CFG_GRUSBDC_AIFACE+
               CFG_GRUSB_DCL,
        nahbs => 8+CFG_GRUSBHC*CFG_GRUSBHC_UHC+CFG_GRUSBDC,
        enbusmon => CFG_AHB_MON, assertwarn => CFG_AHB_MONWAR,
        asserterr => CFG_AHB_MONERR, ahbtrace => CFG_AHB_DTRACE)
  port map (rstn, clkm, ahbmi, ahbmo, ahbsi, ahbso);

----------------------------------------------------------------------
---  LEON processor and DSU -----------------------------------------
----------------------------------------------------------------------

  leon : leon_dsu_stat_base
    generic map (
      leon => CFG_LEON, ncpu => CFG_NCPU, fabtech => fabtech, memtech => memtech,
      nwindows => CFG_NWIN, dsu => CFG_DSU, fpu => CFG_FPU, v8 => CFG_V8, cp => 0,
      mac => CFG_MAC, pclow => pclow, notag => 0, nwp => CFG_NWP, icen => CFG_ICEN,
      irepl => CFG_IREPL, isets => CFG_ISETS, ilinesize => CFG_ILINE,
      isetsize => CFG_ISETSZ, isetlock => CFG_ILOCK, dcen => CFG_DCEN,
      drepl => CFG_DREPL, dsets => CFG_DSETS, dlinesize => CFG_DLINE,
      dsetsize => CFG_DSETSZ, dsetlock => CFG_DLOCK, dsnoop => CFG_DSNOOP,
      ilram => CFG_ILRAMEN, ilramsize => CFG_ILRAMSZ, ilramstart => CFG_ILRAMADDR,
      dlram => CFG_DLRAMEN, dlramsize => CFG_DLRAMSZ, dlramstart => CFG_DLRAMADDR,
      mmuen => CFG_MMUEN, itlbnum => CFG_ITLBNUM, dtlbnum => CFG_DTLBNUM,
      tlb_type => CFG_TLB_TYPE, tlb_rep => CFG_TLB_REP, lddel => CFG_LDDEL,
      disas => disas, tbuf => CFG_ITBSZ, pwd => CFG_PWD, svt => CFG_SVT,
      rstaddr => CFG_RSTADDR, smp => CFG_NCPU-1, cached => CFG_DFIXED,
      wbmask => CFG_BWMASK, busw => CFG_CACHEBW, netlist => CFG_LEON_NETLIST,
      ft => CFG_LEONFT_EN, npasi => CFG_NP_ASI, pwrpsr => CFG_WRPSR,
      rex => CFG_REX, altwin => CFG_ALTWIN, mmupgsz => CFG_MMU_PAGE,
      grfpush => CFG_GRFPUSH,
      dsu_hindex => 2, dsu_haddr => 16#900#, dsu_hmask => 16#F00#, atbsz => CFG_ATBSZ,
      stat => CFG_STAT_ENABLE, stat_pindex => 12, stat_paddr => 16#100#,
      stat_pmask => 16#ffc#, stat_ncnt => CFG_STAT_CNT, stat_nmax => CFG_STAT_NMAX)
    port map (
      rstn => rstn, ahbclk => clkm, cpuclk => clkm, hclken => vcc(0),
      leon_ahbmi => ahbmi, leon_ahbmo => ahbmo(CFG_NCPU-1 downto 0),
      leon_ahbsi => ahbsi, leon_ahbso => ahbso,
      irqi => irqi, irqo => irqo,
      stat_apbi => apbi, stat_apbo => apbo(12), stat_ahbsi => ahbsi,
      stati => perf,
      dsu_ahbsi => ahbsi, dsu_ahbso => ahbso(2),
      dsu_tahbmi => ahbmi, dsu_tahbsi => ahbsi,
      sysi => sysi, syso => syso);

  dsuen_pad : inpad generic map (tech => padtech) port map (dsuen, sysi.dsu_enable); 
  dsubre_pad : inpad generic map (tech => padtech) port map (dsubre, sysi.dsu_break); 
  dsuact_pad : outpad generic map (tech => padtech) port map (dsuact, syso.dsu_active);

  errorn_pad : odpad generic map (tech => padtech) port map (errorn, syso.proc_error);

  dcomgen : if CFG_AHB_UART = 1 generate
    dcom0: ahbuart              -- Debug UART
    generic map (hindex => CFG_NCPU, pindex => 7, paddr => 7)
    port map (rstn, clkm, dui, duo, apbi, apbo(7), ahbmi, ahbmo(CFG_NCPU));
    dsurx_pad : inpad generic map (tech => padtech) port map (dsurx, dui.rxd); 
    dsutx_pad : outpad generic map (tech => padtech) port map (dsutx, duo.txd);
  end generate;
--  nouah : if CFG_AHB_UART = 0 generate apbo(7) <= apb_none; end generate;

  ahbjtaggen0 :if CFG_AHB_JTAG = 1 generate
    ahbjtag0 : ahbjtag generic map(tech => fabtech, hindex => CFG_NCPU+CFG_AHB_UART)
      port map(rstn, clkm, tck, tms, tdi, tdo, ahbmi, ahbmo(CFG_NCPU+CFG_AHB_UART),
               open, open, open, open, open, open, open, gnd(0));
  end generate;
  
-----------------------------------------------------------------------
---  L2-Cache  --------------------------------------------------------
-----------------------------------------------------------------------

  l2cen : if CFG_L2_EN /= 0 generate
    l2cblock : block
      signal mem_ahbsi : ahb_slv_in_type;
      signal mem_ahbso : ahb_slv_out_vector := (others => ahbs_none);
      signal mem_ahbmi : ahb_mst_in_type;
      signal mem_ahbmo : ahb_mst_out_vector := (others => ahbm_none);
      signal l2c_stato : std_logic_vector(10 downto 0);
    begin
      l2c0 : l2c generic map (
        hslvidx => 0, hmstidx => 0, cen => CFG_L2_PEN, 
        haddr => 16#400#, hmask => 16#c00#, ioaddr => 16#FF0#, 
        cached => CFG_L2_MAP, repl => CFG_L2_RAN, ways => CFG_L2_WAYS, 
        linesize => CFG_L2_LSZ, waysize => CFG_L2_SIZE,
        memtech => memtech, bbuswidth => AHBDW,
        bioaddr => 16#FFE#, biomask => 16#fff#, 
        sbus => 0, mbus => 1, arch => CFG_L2_SHARE,
        ft => CFG_L2_EDAC)
        port map(rst => rstn, clk => clkm, ahbsi => ahbsi, ahbso => ahbso(0),
                 ahbmi => mem_ahbmi, ahbmo => mem_ahbmo(0), ahbsov => mem_ahbso,
                 sto => l2c_stato);

      memahb0 : ahbctrl                -- AHB arbiter/multiplexer
        generic map (defmast => CFG_DEFMST, split => CFG_SPLIT, 
                     rrobin => CFG_RROBIN, ioaddr => 16#FFE#,
                     ioen => 1, nahbm => 1, nahbs => 2)
        port map (rstn, clkm, mem_ahbmi, mem_ahbmo, mem_ahbsi, mem_ahbso);

      mem_ahbso(1 downto 0) <= sdram_ahbso;
      sdram_ahbsi <= mem_ahbsi;

      perf.event(15 downto 7) <= (others => '0');
      perf.esource(15 downto 7) <= (others => (others => '0'));
      perf.event(6)  <= l2c_stato(10);  -- Data uncorrectable error
      perf.event(5)  <= l2c_stato(9);   -- Data correctable error
      perf.event(4)  <= l2c_stato(8);   -- Tag uncorrectable error
      perf.event(3)  <= l2c_stato(7);   -- Tag correctable error
      perf.event(2)  <= l2c_stato(2);   -- Bus access
      perf.event(1)  <= l2c_stato(1);   -- Miss
      perf.event(0)  <= l2c_stato(0);   -- Hit
      perf.esource(6 downto 3) <= (others => (others => '0'));
      perf.esource(2 downto 0) <= (others => l2c_stato(6 downto 3));
      perf.req <= (others => '0');
      perf.sel <= (others => '0');
      perf.latcnt <= '0';
      --perf.timer  <= dbgi(0).timer(31 downto 0);
    end block l2cblock;
  end generate l2cen;
  nol2c : if CFG_L2_EN = 0 generate
    ahbso(1 downto 0) <= sdram_ahbso;
    sdram_ahbsi <= ahbsi;
    perf <= l3stat_in_none;
  end generate;

----------------------------------------------------------------------
---  Memory controllers ----------------------------------------------
----------------------------------------------------------------------

  memi.edac <= gpioo.val(2); memi.bwidth <= gpioo.val(1 downto 0);

  src : if CFG_SRCTRL = 1 generate      -- 32-bit PROM/SRAM controller
    sr0 : srctrl generic map (hindex => 0, ramws => CFG_SRCTRL_RAMWS, 
        romws => CFG_SRCTRL_PROMWS, ramaddr => 16#400#, 
        rammask => 16#E00#*(1-CFG_SDCTRL), romasel => CFG_SRCTRL_ROMASEL,
        prom8en => CFG_SRCTRL_8BIT, rmw => CFG_SRCTRL_RMW)
    port map (rstn, clkm, sdram_ahbsi, sdram_ahbso(0), memi, memo, sdo3);
    apbo(0) <= apb_none;
    addr_pad : outpadv generic map (width => 28, tech => padtech) 
        port map (address, memo.address(27 downto 0)); 
    rams_pad : outpadv generic map (width => 5, tech => padtech) 
        port map (ramsn, memo.ramsn(4 downto 0)); 
    roms_pad : outpadv generic map (width => 2, tech => padtech) 
        port map (romsn, memo.romsn(1 downto 0)); 
    oen_pad  : outpad generic map (tech => padtech) 
        port map (oen, memo.oen);
    rwen_pad : outpadv generic map (width => 4, tech => padtech) 
        port map (rwen, memo.wrn); 
    roen_pad : outpadv generic map (width => 5, tech => padtech) 
        port map (ramoen, memo.ramoen(4 downto 0));
    wri_pad  : outpad generic map (tech => padtech) 
        port map (writen, memo.writen);
    read_pad : outpad generic map (tech => padtech) 
        port map (read, memo.read); 
    iosn_pad : outpad generic map (tech => padtech) 
        port map (iosn, memo.iosn);
    data_pad : iopadvv generic map (tech => padtech, width => 32, oepol => OEPOL)
      port map (data, memo.data, memo.vbdrive, memi.data);
    brdyn_pad : inpad generic map (tech => padtech) port map (brdyn, memi.brdyn); 
    bexcn_pad : inpad generic map (tech => padtech) port map (bexcn, memi.bexcn); 
    memi.writen <= '1'; memi.wrn <= "1111";

  end generate;

  sdc : if CFG_SDCTRL = 1 generate
      sdc : sdctrl64 generic map (hindex => 1, haddr => 16#400#, hmask => 16#C00#, 
        ioaddr => 1, fast => 0, pwron => 0, invclk => CFG_SDCTRL_INVCLK)
      port map (rstn, clkm, sdram_ahbsi, sdram_ahbso(1), sdi, sdo2);
      sa_pad : outpadv generic map (tech => padtech, width => 15) 
           port map (sa, sdo2.address);
      sd_pad : iopadv generic map (width => 32, tech => padtech) 
           port map (sd(31 downto 0), sdo2.data(31 downto 0), sdo2.bdrive, sdi.data(31 downto 0));
--      sd2 : if CFG_SDCTRL_SD64 = 1 generate
        sd_pad2 : iopadv generic map (width => 32) 
             port map (sd(63 downto 32), sdo2.data(63 downto 32), sdo2.bdrive, sdi.data(63 downto 32));
--      end generate;
      sdcke_pad : outpadv generic map (width =>2, tech => padtech) 
           port map (sdcke, sdo2.sdcke); 
      sdwen_pad : outpad generic map (tech => padtech) 
           port map (sdwen, sdo2.sdwen);
      sdcsn_pad : outpadv generic map (width =>2, tech => padtech) 
           port map (sdcsn, sdo2.sdcsn); 
      sdras_pad : outpad generic map (tech => padtech) 
           port map (sdrasn, sdo2.rasn);
      sdcas_pad : outpad generic map (tech => padtech) 
           port map (sdcasn, sdo2.casn);
      sddqm_pad : outpadv generic map (width =>8, tech => padtech) 
           port map (sddqm, sdo2.dqm(7 downto 0));
  end generate;


  mctrl0 : if CFG_MCTRL_LEON2 = 1 generate      -- LEON2 memory controller
    sr1 : mctrl generic map (hindex => 0, pindex => 0, paddr => 0, 
        srbanks => 4, sden => CFG_MCTRL_SDEN, ram8 => CFG_MCTRL_RAM8BIT, 
        ram16 => CFG_MCTRL_RAM16BIT, invclk => CFG_MCTRL_INVCLK, 
        sepbus => CFG_MCTRL_SEPBUS, oepol => OEPOL, 
        sdbits => 32 + 32*CFG_MCTRL_SD64, pageburst => CFG_MCTRL_PAGE)
    port map (rstn, clkm, memi, memo, sdram_ahbsi, sdram_ahbso(0), apbi, apbo(0), wpo, sdo);

    addr_pad : outpadv generic map (width => 28, tech => padtech) 
        port map (address, memo.address(27 downto 0)); 
    rams_pad : outpadv generic map (width => 5, tech => padtech) 
        port map (ramsn, memo.ramsn(4 downto 0)); 
    roms_pad : outpadv generic map (width => 2, tech => padtech) 
        port map (romsn, memo.romsn(1 downto 0)); 
    oen_pad  : outpad generic map (tech => padtech) 
        port map (oen, memo.oen);
    rwen_pad : outpadv generic map (width => 4, tech => padtech) 
        port map (rwen, memo.wrn); 
    roen_pad : outpadv generic map (width => 5, tech => padtech) 
        port map (ramoen, memo.ramoen(4 downto 0));
    wri_pad  : outpad generic map (tech => padtech) 
        port map (writen, memo.writen);
    read_pad : outpad generic map (tech => padtech) 
        port map (read, memo.read); 
    iosn_pad : outpad generic map (tech => padtech) 
        port map (iosn, memo.iosn);
    data_pad : iopadvv generic map (tech => padtech, width => 32, oepol => OEPOL)
      port map (data, memo.data, memo.vbdrive, memi.data);
    brdyn_pad : inpad generic map (tech => padtech) port map (brdyn, memi.brdyn); 
    bexcn_pad : inpad generic map (tech => padtech) port map (bexcn, memi.bexcn); 
    memi.writen <= '1'; memi.wrn <= "1111";

    sdpads : if CFG_MCTRL_SDEN = 1 generate             -- SDRAM controller
      sd2 : if CFG_MCTRL_SEPBUS = 1 generate
        sa_pad : outpadv generic map (tech => padtech, width => 15) port map (sa, memo.sa);
          sd_pad : iopadvv generic map (tech => padtech, width => 32, oepol => OEPOL)
          port map (sd(31 downto 0), memo.sddata(31 downto 0),
                memo.svbdrive(31 downto 0), memi.sd(31 downto 0));
          sd2 : if CFG_MCTRL_SD64 = 1 generate
            sd_pad2 : iopadvv generic map (tech => padtech, width => 32)
            port map (sd(63 downto 32), memo.sddata(63 downto 32),
                memo.svbdrive(63 downto 32), memi.sd(63 downto 32));
        end generate;
      end generate;
      sdwen_pad : outpad generic map (tech => padtech) 
           port map (sdwen, sdo.sdwen);
      sdras_pad : outpad generic map (tech => padtech) 
           port map (sdrasn, sdo.rasn);
      sdcas_pad : outpad generic map (tech => padtech) 
           port map (sdcasn, sdo.casn);
      sddqm_pad : outpadv generic map (width => 8, tech => padtech) 
           port map (sddqm, sdo.dqm);
      sdcke_pad : outpadv generic map (width => 2, tech => padtech) 
           port map (sdcke, sdo.sdcke); 
      sdcsn_pad : outpadv generic map (width => 2, tech => padtech) 
           port map (sdcsn, sdo.sdcsn); 
    end generate;
  end generate;

   mg2 : if CFG_MCTRLFT = 1 generate    -- FT memory controller
    sr1 : ftmctrl generic map (hindex => 0, pindex => 0, 
        paddr => 0, srbanks => 4, sden => CFG_MCTRLFT_SDEN, ram8 => CFG_MCTRLFT_RAM8BIT, 
        ram16 => CFG_MCTRLFT_RAM16BIT, invclk => CFG_MCTRLFT_INVCLK, 
        sepbus => CFG_MCTRLFT_SEPBUS, oepol => OEPOL, 
        sdbits => 32 + 32*CFG_MCTRL_SD64, pageburst => CFG_MCTRL_PAGE,
        edac => CFG_MCTRLFT_EDAC)
    port map (rstn, clkm, memi, memo, sdram_ahbsi, sdram_ahbso(0), apbi, apbo(0), wpo, sdo);
    addr_pad : outpadv generic map (width => 28, tech => padtech) 
        port map (address, memo.address(27 downto 0)); 
    rams_pad : outpadv generic map (width => 5, tech => padtech) 
        port map (ramsn, memo.ramsn(4 downto 0)); 
    roms_pad : outpadv generic map (width => 2, tech => padtech) 
        port map (romsn, memo.romsn(1 downto 0)); 
    oen_pad  : outpad generic map (tech => padtech) 
        port map (oen, memo.oen);
    rwen_pad : outpadv generic map (width => 4, tech => padtech) 
        port map (rwen, memo.wrn); 
    roen_pad : outpadv generic map (width => 5, tech => padtech) 
        port map (ramoen, memo.ramoen(4 downto 0));
    wri_pad  : outpad generic map (tech => padtech) 
        port map (writen, memo.writen);
    read_pad : outpad generic map (tech => padtech) 
        port map (read, memo.read); 
    iosn_pad : outpad generic map (tech => padtech) 
        port map (iosn, memo.iosn);
    data_pad : iopadvv generic map (tech => padtech, width => 32, oepol => OEPOL)
      port map (data, memo.data, memo.vbdrive, memi.data);
    cb_pad : iopadvv generic map (tech => padtech, width => 8, oepol => OEPOL)
    port map (cb, memo.cb(7 downto 0), memo.vcdrive(7 downto 0), memi.cb(7 downto 0));
    brdyn_pad : inpad generic map (tech => padtech) port map (brdyn, memi.brdyn); 
    bexcn_pad : inpad generic map (tech => padtech) port map (bexcn, memi.bexcn); 
    memi.writen <= '1'; memi.wrn <= "1111";

    sdpads : if CFG_MCTRLFT_SDEN = 1 generate           -- SDRAM controller
      sd2 : if CFG_MCTRLFT_SEPBUS = 1 generate
        sa_pad : outpadv generic map (tech => padtech, width => 15) port map (sa, memo.sa);
          sd_pad : iopadvv generic map (tech => padtech, width => 32)
          port map (sd(31 downto 0), memo.sddata(31 downto 0),
                memo.svbdrive(31 downto 0), memi.sd(31 downto 0));
        cbbits : if CFG_MCTRLFT_EDAC /= 0 generate
          scb_pad : iopadvv generic map (tech => padtech, width => 16, oepol => OEPOL)
          port map (sd(47 downto 32), memo.scb(15 downto 0), memo.svcdrive(15 downto 0), memi.scb(15 downto 0));
          sd_pad : iopadvv generic map (tech => padtech, width => 16)
          port map (sd(63 downto 48), memo.sddata(63 downto 48),
                memo.svbdrive(63 downto 48), memi.sd(63 downto 48));
        end generate;
        sd64bits : if CFG_MCTRLFT_EDAC = 0 generate
          sd_pad : iopadvv generic map (tech => padtech, width => 32)
          port map (sd(63 downto 32), memo.sddata(63 downto 32),
                memo.svbdrive(63 downto 32), memi.sd(63 downto 32));
        end generate;
      end generate;
      sdwen_pad : outpad generic map (tech => padtech) 
           port map (sdwen, sdo.sdwen);
      sdras_pad : outpad generic map (tech => padtech) 
           port map (sdrasn, sdo.rasn);
      sdcas_pad : outpad generic map (tech => padtech) 
           port map (sdcasn, sdo.casn);
      sddqm_pad : outpadv generic map (width =>8, tech => padtech) 
           port map (sddqm, sdo.dqm);
      sdcke_pad : outpadv generic map (width =>2, tech => padtech) 
           port map (sdcke, sdo.sdcke); 
      sdcsn_pad : outpadv generic map (width =>2, tech => padtech) 
           port map (sdcsn, sdo.sdcsn); 
    end generate;
  end generate;

  nosd0 : if (CFG_SDEN = 0) generate            -- no SDRAM controller
      sdcke_pad : outpadv generic map (width =>2, tech => padtech) 
           port map (sdcke, vcc(1 downto 0)); 
      sdcsn_pad : outpadv generic map (width =>2, tech => padtech) 
           port map (sdcsn, vcc(1 downto 0)); 
  end generate;

  -- No PROM/SRAM controller
  mg0 : if (CFG_MCTRL_LEON2 + CFG_MCTRLFT + CFG_SRCTRL) = 0 generate
    rams_pad : outpadv generic map (width => 5, tech => padtech) 
        port map (ramsn, vcc); 
    roms_pad : outpadv generic map (width => 2, tech => padtech) 
        port map (romsn, vcc(1 downto 0)); 
  end generate;

----------------------------------------------------------------------
---  APB Bridge and various periherals -------------------------------
----------------------------------------------------------------------

  apb0 : apbctrl                                -- AHB/APB bridge
  generic map (hindex => 3, haddr => CFG_APBADDR)
  port map (rstn, clkm, ahbsi, ahbso(3), apbi, apbo );

  ua1 : if CFG_UART1_ENABLE /= 0 generate
    uart1 : apbuart                     -- UART 1
    generic map (pindex => 1, paddr => 1,  pirq => 2, console => dbguart,
        fifosize => CFG_UART1_FIFO)
    port map (rstn, clkm, apbi, apbo(1), u1i, u1o);
    u1i.ctsn <= '0'; u1i.extclk <= '0';
    txd1_pad : outpad generic map (tech => padtech) 
        port map (txd1, u1o.txd);
    rxd1_pad : inpad generic map (tech => padtech) 
        port map (rxd1, u1i.rxd);
  end generate;
  noua0 : if CFG_UART1_ENABLE = 0 generate apbo(1) <= apb_none; end generate;

  ua2 : if CFG_UART2_ENABLE /= 0 generate
    uart2 : apbuart                     -- UART 2
    generic map (pindex => 6, paddr => 6,  pirq => 3, fifosize => CFG_UART2_FIFO)
    port map (rstn, clkm, apbi, apbo(6), u2i, u2o);
    u2i.ctsn <= '0'; u2i.extclk <= '0';
    txd1_pad : outpad generic map (tech => padtech) 
        port map (txd2, u2o.txd);
    rxd1_pad : inpad generic map (tech => padtech) 
        port map (rxd2, u2i.rxd);
  end generate;
  noua1 : if CFG_UART2_ENABLE = 0 generate apbo(6) <= apb_none; end generate;

  irqctrl : if CFG_IRQ3_ENABLE /= 0 generate
    irqctrl0 : irqmp                    -- interrupt controller
    generic map (pindex => 2, paddr => 2, ncpu => CFG_NCPU)
    port map (rstn, clkm, apbi, apbo(2), irqo, irqi);
  end generate;
  irq3 : if CFG_IRQ3_ENABLE = 0 generate
    x : for i in 0 to CFG_NCPU-1 generate
      irqi(i).irl <= "0000";
    end generate;
--    apbo(2) <= apb_none;
  end generate;
  pci_dirq(3 downto 1) <= (others => '0');
  pci_dirq(0) <= orv(irqi(0).irl);

  gpt : if CFG_GPT_ENABLE /= 0 generate
    timer0 : gptimer                    -- timer unit
    generic map (pindex => 3, paddr => 3, pirq => CFG_GPT_IRQ, 
        sepirq => CFG_GPT_SEPIRQ, sbits => CFG_GPT_SW, ntimers => CFG_GPT_NTIM, 
        wdog => CFG_GPT_WDOGEN*CFG_GPT_WDOG, nbits => CFG_GPT_TW)
    port map (rstn, clkm, apbi, apbo(3), gpti, gpto);
    gpti <= gpti_dhalt_drive(syso.dsu_tstop);
    wdog <= gpto.wdogn when OEPOL = 0 else gpto.wdog;
    wdogn_pad : odpad generic map (tech => padtech, oepol => OEPOL) port map (wdogn, wdog);
  end generate;
--  notim : if CFG_GPT_ENABLE = 0 generate apbo(3) <= apb_none; end generate;

  gpio0 : if CFG_GRGPIO_ENABLE /= 0 generate     -- GR GPIO unit
    grgpio0: grgpio
      generic map( pindex => 9, paddr => 9, imask => CFG_GRGPIO_IMASK, 
        nbits => CFG_GRGPIO_WIDTH)
      port map( rstn, clkm, apbi, apbo(9), gpioi, gpioo);

      pio_pads : for i in 0 to CFG_GRGPIO_WIDTH-1 generate
        pio_pad : iopad generic map (tech => padtech)
            port map (gpio(i), gpioo.dout(i), gpioo.oen(i), gpioi.din(i));
      end generate;
   end generate;

  ahbs : if CFG_AHBSTAT = 1 generate    -- AHB status register
    stati.cerror(0) <= memo.ce;
    ahbstat0 : ahbstat generic map (pindex => 15, paddr => 15, pirq => 1,
        nftslv => CFG_AHBSTATN)
      port map (rstn, clkm, ahbmi, ahbsi, stati, apbi, apbo(15));
  end generate;
  nop2 : if CFG_AHBSTAT = 0 generate apbo(15) <= apb_none; end generate;

-----------------------------------------------------------------------
---  PCI   ------------------------------------------------------------
-----------------------------------------------------------------------
  pci : if (CFG_GRPCI2_MASTER+CFG_GRPCI2_TARGET) /= 0 generate

    grpci2xt : if (CFG_GRPCI2_TARGET) /= 0 and (CFG_GRPCI2_MASTER+CFG_GRPCI2_DMA) = 0 generate
      pci0 : grpci2 
        generic map (
          memtech => memtech, oepol => OEPOL,
          hmindex => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG,
          hdmindex => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+1,
          hsindex => 4,     haddr => 16#C00#, hmask => 16#E00#, ioaddr => 16#400#, 
          pindex => 4,      paddr => 4,       irq => 4,         irqmode => 0,      
          master => CFG_GRPCI2_MASTER,        target => CFG_GRPCI2_TARGET,
          dma => CFG_GRPCI2_DMA,              tracebuffer => CFG_GRPCI2_TRACE,
          vendorid => CFG_GRPCI2_VID,         deviceid => CFG_GRPCI2_DID,
          classcode => CFG_GRPCI2_CLASS,      revisionid => CFG_GRPCI2_RID,
          cap_pointer => CFG_GRPCI2_CAP,      ext_cap_pointer => CFG_GRPCI2_NCAP,
          iobase => CFG_AHBIO,                extcfg => CFG_GRPCI2_EXTCFG,
          bar0 => CFG_GRPCI2_BAR0,            bar1 => CFG_GRPCI2_BAR1,
          bar2 => CFG_GRPCI2_BAR2,            bar3 => CFG_GRPCI2_BAR3,
          bar4 => CFG_GRPCI2_BAR4,            bar5 => CFG_GRPCI2_BAR5,
          fifo_depth => CFG_GRPCI2_FDEPTH,    fifo_count => CFG_GRPCI2_FCOUNT,
          conv_endian => CFG_GRPCI2_ENDIAN,   deviceirq => CFG_GRPCI2_DEVINT,
          deviceirqmask => CFG_GRPCI2_DEVINTMSK, hostirq => CFG_GRPCI2_HOSTINT,
          hostirqmask => CFG_GRPCI2_HOSTINTMSK, 
          nsync => 2,       hostrst => 1,     bypass => CFG_GRPCI2_BYPASS,
          debug => 0,       tbapben => 0,     tbpindex => 5,    tbpaddr => 16#400#,
          tbpmask => 16#C00#)
        port map (
          rstn, clkm, pciclk, pci_dirq, pcii, pcio, apbi, apbo(4), ahbsi, open, ahbmi,
          ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG), ahbmi, 
          open, open, open, open, open);
    end generate;

    grpci2xmt : if (CFG_GRPCI2_MASTER+CFG_GRPCI2_TARGET) > 1 and (CFG_GRPCI2_DMA) = 0 generate
      pci0 : grpci2 
        generic map (
          memtech => memtech, oepol => OEPOL,
          hmindex => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG,
          hdmindex => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+1,
          hsindex => 4,     haddr => 16#C00#, hmask => 16#E00#, ioaddr => 16#400#, 
          pindex => 4,      paddr => 4,       irq => 4,         irqmode => 0,      
          master => CFG_GRPCI2_MASTER,        target => CFG_GRPCI2_TARGET,
          dma => CFG_GRPCI2_DMA,              tracebuffer => CFG_GRPCI2_TRACE,
          vendorid => CFG_GRPCI2_VID,         deviceid => CFG_GRPCI2_DID,
          classcode => CFG_GRPCI2_CLASS,      revisionid => CFG_GRPCI2_RID,
          cap_pointer => CFG_GRPCI2_CAP,      ext_cap_pointer => CFG_GRPCI2_NCAP,
          iobase => CFG_AHBIO,                extcfg => CFG_GRPCI2_EXTCFG,
          bar0 => CFG_GRPCI2_BAR0,            bar1 => CFG_GRPCI2_BAR1,
          bar2 => CFG_GRPCI2_BAR2,            bar3 => CFG_GRPCI2_BAR3,
          bar4 => CFG_GRPCI2_BAR4,            bar5 => CFG_GRPCI2_BAR5,
          fifo_depth => CFG_GRPCI2_FDEPTH,    fifo_count => CFG_GRPCI2_FCOUNT,
          conv_endian => CFG_GRPCI2_ENDIAN,   deviceirq => CFG_GRPCI2_DEVINT,
          deviceirqmask => CFG_GRPCI2_DEVINTMSK, hostirq => CFG_GRPCI2_HOSTINT,
          hostirqmask => CFG_GRPCI2_HOSTINTMSK, 
          nsync => 2,       hostrst => 1,     bypass => CFG_GRPCI2_BYPASS,
          debug => 0,       tbapben => 0,     tbpindex => 5,    tbpaddr => 16#400#,
          tbpmask => 16#C00#)
        port map (
          rstn, clkm, pciclk, pci_dirq, pcii, pcio, apbi, apbo(4), ahbsi, ahbso(4), ahbmi,
          ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG), ahbmi, 
          open, open, open, open, open);
    end generate;

    grpci2xd : if (CFG_GRPCI2_MASTER+CFG_GRPCI2_TARGET) /= 0 and CFG_GRPCI2_DMA /= 0 generate
      
      pci0 : grpci2 
        generic map (
          memtech => memtech, oepol => OEPOL,
          hmindex => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG,
          hdmindex => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+1,
          hsindex => 4,     haddr => 16#C00#, hmask => 16#E00#, ioaddr => 16#400#, 
          pindex => 4,      paddr => 4,       irq => 4,         irqmode => 0,      
          master => CFG_GRPCI2_MASTER,        target => CFG_GRPCI2_TARGET,
          dma => CFG_GRPCI2_DMA,              tracebuffer => CFG_GRPCI2_TRACE,
          vendorid => CFG_GRPCI2_VID,         deviceid => CFG_GRPCI2_DID,
          classcode => CFG_GRPCI2_CLASS,      revisionid => CFG_GRPCI2_RID,
          cap_pointer => CFG_GRPCI2_CAP,      ext_cap_pointer => CFG_GRPCI2_NCAP,
          iobase => CFG_AHBIO,                extcfg => CFG_GRPCI2_EXTCFG,
          bar0 => CFG_GRPCI2_BAR0,            bar1 => CFG_GRPCI2_BAR1,
          bar2 => CFG_GRPCI2_BAR2,            bar3 => CFG_GRPCI2_BAR3,
          bar4 => CFG_GRPCI2_BAR4,            bar5 => CFG_GRPCI2_BAR5,
          fifo_depth => CFG_GRPCI2_FDEPTH,    fifo_count => CFG_GRPCI2_FCOUNT,
          conv_endian => CFG_GRPCI2_ENDIAN,   deviceirq => CFG_GRPCI2_DEVINT,
          deviceirqmask => CFG_GRPCI2_DEVINTMSK, hostirq => CFG_GRPCI2_HOSTINT,
          hostirqmask => CFG_GRPCI2_HOSTINTMSK, 
          nsync => 2,       hostrst => 1,     bypass => CFG_GRPCI2_BYPASS,
          debug => 0,       tbapben => 0,     tbpindex => 5,    tbpaddr => 16#400#,
          tbpmask => 16#C00#)
        port map (
          rstn, clkm, pciclk, pci_dirq, pcii, pcio, apbi, apbo(4), ahbsi, ahbso(4), ahbmi,
          ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG), ahbmi, 
          ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+1),
          open, open, open, open);
    end generate;  

    pcia0 : if CFG_PCI_ARB = 1 generate -- PCI arbiter
      pciarb0 : pciarb generic map (pindex => 10, paddr => 10, 
                                    apb_en => CFG_PCI_ARBAPB)
       port map ( clk => pciclk, rst_n => pcii.rst,
         req_n => pci_arb_req_n, frame_n => pcii.frame,
         gnt_n => pci_arb_gnt_n, pclk => clkm, 
         prst_n => rstn, apbi => apbi, apbo => apbo(10)
       );
      pgnt_pad : outpadv generic map (tech => padtech, width => 4) 
        port map (pci_arb_gnt, pci_arb_gnt_n);
      preq_pad : inpadv generic map (tech => padtech, width => 4) 
        port map (pci_arb_req, pci_arb_req_n);
    end generate;

    pcipads0 : pcipads generic map (padtech => padtech, host => 0) -- PCI pads
    port map ( pci_rst, pci_gnt, pci_idsel, pci_lock, pci_ad, pci_cbe,
      pci_frame, pci_irdy, pci_trdy, pci_devsel, pci_stop, pci_perr,
      pci_par, pci_req, pci_serr, pci_host, pci_66, pcii, pcio );

  end generate;

--  noarb : if CFG_PCI_ARB = 0 generate apbo(10) <= apb_none; end generate;


-----------------------------------------------------------------------
---  ETHERNET ---------------------------------------------------------
-----------------------------------------------------------------------
  eth1 : if CFG_GRETH = 1 generate -- Gaisler ethernet MAC
    e1 : grethm generic map(
      hindex => CFG_NCPU+CFG_AHB_UART+CFG_GRPCI2_TARGET+CFG_GRPCI2_DMA+CFG_AHB_JTAG,
      pindex => 14, paddr => 14, pirq => 7, memtech => memtech,
      mdcscaler => CPU_FREQ/1000, enable_mdio => 1, fifosize => CFG_ETH_FIFO,
      nsync => 1, edcl => CFG_DSU_ETH, edclbufsz => CFG_ETH_BUF,
      macaddrh => CFG_ETH_ENM, macaddrl => CFG_ETH_ENL, phyrstadr => 1,
      ipaddrh => CFG_ETH_IPM, ipaddrl => CFG_ETH_IPL, giga => CFG_GRETH1G,
      enable_mdint => 1)
      port map(
        rst => rstn, clk => clkm, ahbmi => ahbmi,
        ahbmo => ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_GRPCI2_TARGET+CFG_GRPCI2_DMA+CFG_AHB_JTAG), apbi => apbi,
        apbo => apbo(14), ethi => ethi, etho => etho);

    greth1g: if CFG_GRETH1G = 1 generate
      eth_macclk_pad : clkpad
        generic map (tech => padtech, arch => 3, hf => 1)
        port map (eth_macclk, egtx_clk, cgo.clklock, elock);
    end generate greth1g;
    
    emdio_pad : iopad generic map (tech => padtech) 
      port map (emdio, etho.mdio_o, etho.mdio_oe, ethi.mdio_i);
    
    etxc_pad : clkpad generic map (tech => padtech, arch => 2) 
      port map (etx_clk, ethi.tx_clk);
    erxc_pad : clkpad generic map (tech => padtech, arch => 2)
      port map (erx_clk, ethi.rx_clk);
    erxd_pad : inpadv generic map (tech => padtech, width => 8) 
      port map (erxd, ethi.rxd(7 downto 0));
    erxdv_pad : inpad generic map (tech => padtech)
      port map (erx_dv, ethi.rx_dv);
    erxer_pad : inpad generic map (tech => padtech) 
      port map (erx_er, ethi.rx_er);
    erxco_pad : inpad generic map (tech => padtech) 
      port map (erx_col, ethi.rx_col);
    erxcr_pad : inpad generic map (tech => padtech) 
      port map (erx_crs, ethi.rx_crs);
    emdintn_pad : inpad generic map (tech => padtech) 
      port map (emdintn, ethi.mdint);
    
    etxd_pad : outpadv generic map (tech => padtech, width => 8)
      port map (etxd, etho.txd(7 downto 0));
    etxen_pad : outpad generic map (tech => padtech)
      port map ( etx_en, etho.tx_en);
    etxer_pad : outpad generic map (tech => padtech) 
      port map (etx_er, etho.tx_er);
    emdc_pad : outpad generic map (tech => padtech)
      port map (emdc, etho.mdc);
    
--      emdis_pad : outpad generic map (tech => padtech) 
--      port map (emddis, vcc(0));
--      eepwrdwn_pad : outpad generic map (tech => padtech) 
--      port map (epwrdwn, gnd(0));
--      esleep_pad : outpad generic map (tech => padtech) 
--      port map (esleep, gnd(0));
--      epause_pad : outpad generic map (tech => padtech) 
--      port map (epause, gnd(0));
--      ereset_pad : outpad generic map (tech => padtech) 
--      port map (ereset, gnd(0));
        
    ethi.gtx_clk <= egtx_clk;
  end generate;
  noeth: if CFG_GRETH = 0 or CFG_GRETH1G = 0 generate
    elock <= '1';
  end generate noeth;

-----------------------------------------------------------------------
---  CAN --------------------------------------------------------------
-----------------------------------------------------------------------

   can0 : if CFG_CAN = 1 generate 
     can0 : can_mc generic map (slvndx => 6, ioaddr => CFG_CANIO,
        iomask => 16#FF0#, irq => CFG_CANIRQ, memtech => memtech,
        ncores => CFG_CAN_NUM, sepirq => CFG_CANSEPIRQ)
        port map (rstn, clkm, ahbsi, ahbso(6), can_lrx, can_ltx );

     can_pads : for i in 0 to CFG_CAN_NUM-1 generate
         can_tx_pad : outpad generic map (tech => padtech)
            port map (can_txd(i), can_ltx(i));
         can_rx_pad : inpad generic map (tech => padtech)
            port map (can_rxd(i), can_lrx(i));
     end generate;
   end generate;

--   can_stb <= '0';   -- no standby
   ncan : if CFG_CAN = 0 generate ahbso(6) <= ahbs_none; end generate;

-----------------------------------------------------------------------
---  AHB RAM ----------------------------------------------------------
-----------------------------------------------------------------------

--  ocram : if CFG_AHBRAMEN = 1 generate 
--    ahbram0 : ftahbram generic map (hindex => 7, haddr => CFG_AHBRADDR, 
--      tech => CFG_MEMTECH, kbytes => CFG_AHBRSZ, pindex => 6,
--      paddr => 6, edacen => CFG_AHBRAEDAC, autoscrub => CFG_AHBRASCRU,
--      errcnten => CFG_AHBRAECNT, cntbits => CFG_AHBRAEBIT)
--    port map ( rstn, clkm, ahbsi, ahbso(7), apbi, apbo(6), open);
--  end generate;
--
--  nram : if CFG_AHBRAMEN = 0 generate ahbso(7) <= ahbs_none; end generate;

-----------------------------------------------------------------------
---  SPACEWIRE  -------------------------------------------------------
-----------------------------------------------------------------------
  spw : if CFG_SPW_EN > 0 generate
    spw_clk_pad : clkpad generic map (tech => padtech) port map (spw_clk, spw_clkl); 
--   spw_clkl <= pciclk;
    spw_rxtxclk <= spw_clkl;
    spw_rxclkn <= not spw_rxtxclk;
    
   swloop : for i in 0 to CFG_SPW_NUM-1 generate
     -- GRSPW2 PHY
     spw2_input : if CFG_SPW_GRSPW = 2 generate
       spw_phy0 : grspw2_phy
         generic map(
           scantest     => 0,
           tech         => fabtech,
           input_type   => CFG_SPW_INPUT,
           rxclkbuftype => 1)
         port map(
           rstn       => rstn,
           rxclki     => spw_rxtxclk,
           rxclkin    => spw_rxclkn,
           nrxclki    => spw_rxtxclk,
           di         => dtmp(i),
           si         => stmp(i),
           do         => spwi(i).d(1 downto 0),
           dov        => spwi(i).dv(1 downto 0),
           dconnect   => spwi(i).dconnect(1 downto 0),
           rxclko     => spw_rxclk(i));
       spwi(i).nd <= (others => '0');  -- Only used in GRSPW
       spwi(i).dv(3 downto 2) <= "00";  -- For second port
     end generate spw2_input;
     
     -- GRSPW PHY
     spw1_input: if CFG_SPW_GRSPW = 1 generate
       spw_phy0 : grspw_phy
         generic map(
           tech         => fabtech,
           rxclkbuftype => 1,
           scantest     => 0)
         port map(
           rxrst      => spwo(i).rxrst,
           di         => dtmp(i),
           si         => stmp(i),
           rxclko     => spw_rxclk(i),
           do         => spwi(i).d(0),
           ndo        => spwi(i).nd(4 downto 0),
           dconnect   => spwi(i).dconnect(1 downto 0));
       spwi(i).d(1) <= '0';           -- For second ports
       spwi(i).dv <= (others => '0');  -- Only used in GRSPW2
       spwi(i).nd(9 downto 5) <= "00000";  -- For second port
     end generate spw1_input;

     spwi(i).d(3 downto 2) <= "00";   -- For GRSPW2 second port
     spwi(i).dconnect(3 downto 2) <= "00";  -- For second port     
     spwi(i).s(1 downto 0) <= "00";  -- Only used in PHY
     
   sw0 : grspwm generic map(tech => memtech,
     hindex => CFG_NCPU+CFG_AHB_UART+CFG_GRPCI2_TARGET+CFG_GRPCI2_DMA+CFG_AHB_JTAG+CFG_GRETH+i,
     pindex => 10+i, 
     paddr => 10+i, pirq => 10+i, 
     sysfreq => CPU_FREQ, nsync => 1, rmap => CFG_SPW_RMAP, 
     rmapcrc => CFG_SPW_RMAPCRC, fifosize1 => CFG_SPW_AHBFIFO, 
     fifosize2 => CFG_SPW_RXFIFO, rxclkbuftype => 1, 
     rmapbufs => CFG_SPW_RMAPBUF,ft => CFG_SPW_FT, ports => 1,
     dmachan => CFG_SPW_DMACHAN,
     netlist => CFG_SPW_NETLIST, spwcore => CFG_SPW_GRSPW,
     input_type => CFG_SPW_INPUT, output_type => CFG_SPW_OUTPUT,
     rxtx_sameclk => CFG_SPW_RTSAME)
     port map(rstn, clkm, spw_rxclk(i), spw_rxclk(i), spw_rxtxclk, spw_rxtxclk,
              ahbmi,
              ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_GRPCI2_TARGET+CFG_GRPCI2_DMA+CFG_AHB_JTAG+CFG_GRETH+i),
              apbi, apbo(10+i), spwi(i), spwo(i));
     spwi(i).tickin <= '0'; spwi(i).rmapen <= '0';
     spwi(i).clkdiv10 <= conv_std_logic_vector(CPU_FREQ/10000-1, 8);
     spwi(i).dcrstval <= (others => '0');
     spwi(i).timerrstval <= (others => '0');
     spw_rxd_pad : inpad_ds generic map (padtech, lvds, x25v)
         port map (spw_rxdp(i), spw_rxdn(i), dtmp(i));
     spw_rxs_pad : inpad_ds generic map (padtech, lvds, x25v)
         port map (spw_rxsp(i), spw_rxsn(i), stmp(i));
     spw_txd_pad : outpad_ds generic map (padtech, lvds, x25v)
         port map (spw_txdp(i), spw_txdn(i), spwo(i).d(0), gnd(0));
     spw_txs_pad : outpad_ds generic map (padtech, lvds, x25v)
         port map (spw_txsp(i), spw_txsn(i), spwo(i).s(0), gnd(0));
   end generate;
  end generate;
  nospw : if CFG_SPW_EN = 0 generate
     spw_rxd_pad : inpad_ds generic map (padtech, lvds, x25v)
         port map (spw_rxdp(0), spw_rxdn(0), spwi(0).d(0));
     spw_rxs_pad : inpad_ds generic map (padtech, lvds, x25v)
         port map (spw_rxsp(0), spw_rxsn(0), spwi(0).s(0));
     spw_txd_pad : outpad_ds generic map (padtech, lvds, x25v)
         port map (spw_txdp(0), spw_txdn(0), spwi(0).d(0), gnd(0));
     spw_txs_pad : outpad_ds generic map (padtech, lvds, x25v)
         port map (spw_txsp(0), spw_txsn(0), spwi(0).s(0), gnd(0));
  end generate;

-------------------------------------------------------------------------------
-- USB ------------------------------------------------------------------------
-------------------------------------------------------------------------------
  -- Note that more than one USB component can not be instantiated at the same
  -- time (board has only one USB transceiver), therefore they share AHB
  -- master/slave indexes
  -----------------------------------------------------------------------------
  -- Shared pads
  -----------------------------------------------------------------------------
  usbpads: if (CFG_GRUSBHC + CFG_GRUSBDC + CFG_GRUSB_DCL) /= 0 generate
    -- Incoming 60 MHz clock from transceiver, arch 3 = through BUFGDLL or
    -- similiar.
    usb_clkout_pad : clkpad
      generic map (tech => padtech, arch => 3)
      port map (usb_clkout, uclk, cgo.clklock, ulock);

    usb_d_pad: iopadv
      generic map(tech => padtech, width => 8)
      port map (usb_d, usbo(0).dataout(7 downto 0), usbo(0).oen,
                usbi(0).datain(7 downto 0));
    usb_nxt_pad : inpad generic map (tech => padtech)
      port map (usb_nxt, usbi(0).nxt);
    usb_dir_pad : inpad generic map (tech => padtech)
      port map (usb_dir, usbi(0).dir);
    usb_resetn_pad : outpad generic map (tech => padtech)
      port map (usb_resetn, usbo(0).reset);
    usb_stp_pad : outpad generic map (tech => padtech)
      port map (usb_stp, usbo(0).stp);
  end generate usbpads;
  nousb: if (CFG_GRUSBHC + CFG_GRUSBDC + CFG_GRUSB_DCL) = 0 generate
    ulock <= '1';
  end generate nousb;
  
  -----------------------------------------------------------------------------
  -- USB 2.0 Host Controller
  -----------------------------------------------------------------------------
  usbhc0: if CFG_GRUSBHC = 1 generate
    usbhc0 : grusbhc
      generic map (
        ehchindex => CFG_NCPU+CFG_AHB_UART+CFG_GRPCI2_TARGET+CFG_GRPCI2_DMA+CFG_AHB_JTAG+CFG_GRETH+CFG_SPW_EN*CFG_SPW_NUM,
        ehcpindex => 13, ehcpaddr => 13, ehcpirq => 13, ehcpmask => 16#fff#,
        uhchindex => CFG_NCPU+CFG_AHB_UART+CFG_GRPCI2_TARGET+CFG_GRPCI2_DMA+CFG_AHB_JTAG+CFG_GRETH+CFG_SPW_EN*CFG_SPW_NUM+1,
        uhchsindex => 8, uhchaddr => 16#A00#, uhchmask => 16#fff#, uhchirq => 9, tech => fabtech,
        memtech => memtech, ehcgen => CFG_GRUSBHC_EHC, uhcgen => CFG_GRUSBHC_UHC,
        endian_conv => CFG_GRUSBHC_ENDIAN, be_regs => CFG_GRUSBHC_BEREGS,
        be_desc => CFG_GRUSBHC_BEDESC, uhcblo => CFG_GRUSBHC_BLO,
        bwrd => CFG_GRUSBHC_BWRD, vbusconf => CFG_GRUSBHC_VBUSCONF)
      port map (
        clkm,uclk,rstn,apbi,apbo(13),ahbmi,ahbsi,
        ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_GRPCI2_TARGET+CFG_GRPCI2_DMA+CFG_AHB_JTAG+CFG_GRETH+CFG_SPW_EN*CFG_SPW_NUM),
        ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_GRPCI2_TARGET+CFG_GRPCI2_DMA+CFG_AHB_JTAG+CFG_GRETH+CFG_SPW_EN*CFG_SPW_NUM+1
              downto
              CFG_NCPU+CFG_AHB_UART+CFG_GRPCI2_TARGET+CFG_GRPCI2_DMA+CFG_AHB_JTAG+CFG_GRETH+CFG_SPW_EN*CFG_SPW_NUM+1),
        ahbso(8 downto 8),
        usbo,usbi);    
  end generate usbhc0;

  -----------------------------------------------------------------------------
  -- USB 2.0 Device Controller
  -----------------------------------------------------------------------------
  usbdc0: if CFG_GRUSBDC = 1 generate
    usbdc0: grusbdc
      generic map(
        hsindex => 8, hirq => 6, haddr => 16#004#, hmask => 16#FFC#,        
        hmindex => CFG_NCPU+CFG_AHB_UART+CFG_GRPCI2_TARGET+CFG_GRPCI2_DMA+CFG_AHB_JTAG+CFG_GRETH+CFG_SPW_EN*CFG_SPW_NUM,
        aiface => CFG_GRUSBDC_AIFACE, uiface => 1,
        nepi => CFG_GRUSBDC_NEPI, nepo => CFG_GRUSBDC_NEPO,
        i0 => CFG_GRUSBDC_I0, i1 => CFG_GRUSBDC_I1,
        i2 => CFG_GRUSBDC_I2, i3 => CFG_GRUSBDC_I3,
        i4 => CFG_GRUSBDC_I4, i5 => CFG_GRUSBDC_I5,
        i6 => CFG_GRUSBDC_I6, i7 => CFG_GRUSBDC_I7,
        i8 => CFG_GRUSBDC_I8, i9 => CFG_GRUSBDC_I9,
        i10 => CFG_GRUSBDC_I10, i11 => CFG_GRUSBDC_I11,
        i12 => CFG_GRUSBDC_I12, i13 => CFG_GRUSBDC_I13,
        i14 => CFG_GRUSBDC_I14, i15 => CFG_GRUSBDC_I15,
        o0 => CFG_GRUSBDC_O0, o1 => CFG_GRUSBDC_O1,
        o2 => CFG_GRUSBDC_O2, o3 => CFG_GRUSBDC_O3,
        o4 => CFG_GRUSBDC_O4, o5 => CFG_GRUSBDC_O5,
        o6 => CFG_GRUSBDC_O6, o7 => CFG_GRUSBDC_O7,
        o8 => CFG_GRUSBDC_O8, o9 => CFG_GRUSBDC_O9,
        o10 => CFG_GRUSBDC_O10, o11 => CFG_GRUSBDC_O11,
        o12 => CFG_GRUSBDC_O12, o13 => CFG_GRUSBDC_O13,
        o14 => CFG_GRUSBDC_O14, o15 => CFG_GRUSBDC_O15,
        memtech => memtech, keepclk => 1)
      port map(
        uclk  => uclk,
        usbi  => usbi(0),
        usbo  => usbo(0),
        hclk  => clkm,
        hrst  => rstn,
        ahbmi => ahbmi,
        ahbmo => ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_GRPCI2_TARGET+CFG_GRPCI2_DMA+CFG_AHB_JTAG+CFG_GRETH+CFG_SPW_EN*CFG_SPW_NUM),
        ahbsi => ahbsi,
        ahbso => ahbso(8)
        );
  end generate usbdc0;

  -----------------------------------------------------------------------------
  -- USB DCL
  -----------------------------------------------------------------------------
  usb_dcl0: if CFG_GRUSB_DCL = 1 generate
    usb_dcl0: grusb_dcl
      generic map (
        hindex => CFG_NCPU+CFG_AHB_UART+CFG_GRPCI2_TARGET+CFG_GRPCI2_DMA+CFG_AHB_JTAG+CFG_GRETH+CFG_SPW_EN*CFG_SPW_NUM,
        memtech => memtech, keepclk => 1, uiface => 1)
      port map (
        uclk, usbi(0), usbo(0), clkm, rstn, ahbmi,
        ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_GRPCI2_TARGET+CFG_GRPCI2_DMA+CFG_AHB_JTAG+CFG_GRETH+CFG_SPW_EN*CFG_SPW_NUM));
  end generate usb_dcl0;

-------------------------------------------------------------------------------
-- MIL-STD-1553B
-------------------------------------------------------------------------------

  mil: if CFG_GR1553B_ENABLE /= 0 generate

    milclk: entity work.lfclkgen
      generic map (dv_div => 2.0, fx_mul => 4, fx_div => BOARD_FREQ/10000)
      port map(resetin => rstraw, clkin => lclk, clk => clk1553, resetout => cgo1553.clklock);

    milrst: rstgen
      port map (resetn, clk1553, cgo1553.clklock, rst1553, open);
        
    gr1553b0: gr1553b
      generic map (
        hindex => CFG_NCPU+CFG_AHB_UART+CFG_GRPCI2_TARGET+CFG_GRPCI2_DMA+CFG_AHB_JTAG+CFG_GRETH+CFG_SPW_EN*CFG_SPW_NUM+1, pindex => 12, paddr => 12, pirq => 6,
        bc_enable => CFG_GR1553B_BCEN, rt_enable => CFG_GR1553B_RTEN,
        bm_enable => CFG_GR1553B_BMEN,
        bc_rtbusmask => 1)
      port map (
        clk => clkm, rst => rstn,
        ahbmi => ahbmi, ahbmo => ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_GRPCI2_TARGET+CFG_GRPCI2_DMA+CFG_AHB_JTAG+CFG_GRETH+CFG_SPW_EN*CFG_SPW_NUM+1),
        apbsi => apbi, apbso => apbo(12),
        auxin => gr1553b_auxin_zero, auxout => open,
        codec_clk => clk1553, codec_rst => rst1553,
        txout => milout(0), txout_fb => milout(0), rxin => milin(0)
        );
    
  end generate;

  nmil: if CFG_GR1553B_ENABLE = 0 generate
    clk1553 <= '0'; rst1553 <= '0';
    milout(0) <= (others => '0');
  end generate;

  -- milout(1) <= (others => '0');
  
  milpads: for x in 0 to 0 generate
    p: gr1553b_pads
      generic map (padtech => padtech, outen_pol => 1)
      port map (milout(x), milin(x),
                busainen(x), busainp(x), busainn(x), busaoutin(x), busaoutp(x), busaoutn(x),
                busbinen(x), busbinp(x), busbinn(x), busboutin(x), busboutp(x), busboutn(x));
  end generate;

  
-----------------------------------------------------------------------
---  Drive unused bus elements  ---------------------------------------
-----------------------------------------------------------------------

--  nam1 : for i in (CFG_NCPU+CFG_AHB_UART+CFG_GRPCI2_TARGET+CFG_GRPCI2_DMA+CFG_AHB_JTAG) to NAHBMST-1 generate
--    ahbmo(i) <= ahbm_none;
--  end generate;
--  nam2 : if CFG_PCI > 1 generate
--    ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+log2x(CFG_PCI)-1) <= ahbm_none;
--  end generate;
--  nap0 : for i in 11 to NAPBSLV-1 generate apbo(i) <= apb_none; end generate;
--  apbo(6) <= apb_none;

-----------------------------------------------------------------------
---  Boot message  ----------------------------------------------------
-----------------------------------------------------------------------

-- pragma translate_off
  x : report_design
  generic map (
   msg1 => "LEON GR-PCI-XC5V Demonstration design",
   fabtech => tech_table(fabtech), memtech => tech_table(memtech),
   mdel => 1
  );
-- pragma translate_on
end;

