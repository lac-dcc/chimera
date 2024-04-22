------------------------------------------------------------------------------
--  LEON3 Demonstration design
--  Copyright (C) 2011 - 2012 Jan Andersson, Aeroflex Gaisler
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

library techmap;
use techmap.gencomp.all;

library gaisler;
use gaisler.memctrl.all;
use gaisler.ddrpkg.all;
use gaisler.leon3.all;
use gaisler.uart.all;
use gaisler.misc.all;
use gaisler.spi.all;
use gaisler.net.all;
use gaisler.jtag.all;
--pragma translate_off
use gaisler.sim.all;
--pragma translate_on

use work.config.all;

entity leon3mp is
  generic (
    fabtech : integer := CFG_FABTECH;
    memtech : integer := CFG_MEMTECH;
    padtech : integer := CFG_PADTECH;
    clktech : integer := CFG_CLKTECH;
    ncpu    : integer := CFG_NCPU;
    disas   : integer := CFG_DISAS;     -- Enable disassembly to console
    dbguart : integer := CFG_DUART;     -- Print UART on console
    pclow   : integer := CFG_PCLOW;
    freq    : integer := 50000         -- frequency of main clock (used for PLLs)
    );
  port (
    cpu_rst_n    : in  std_ulogic;
    clk_fpga_50m : in  std_ulogic;
    
    -- DDR SDRAM
    ram_a        : out std_logic_vector (13 downto 0);   -- ddr address
    ram_ck_p     : out std_logic;
    ram_ck_n     : out std_logic;
    ram_cke      : out std_logic;
    ram_cs_n     : out std_logic;
    ram_ws_n     : out std_ulogic;                       -- ddr write enable
    ram_ras_n    : out std_ulogic;                       -- ddr ras
    ram_cas_n    : out std_ulogic;                       -- ddr cas
    ram_dm       : out std_logic_vector(1 downto 0);     -- ram_udm & ram_ldm
    ram_dqs      : inout std_logic_vector (1 downto 0);  -- ram_udqs & ram_lqds
    ram_ba       : out std_logic_vector (1 downto 0);    -- ddr bank address
    ram_d        : inout std_logic_vector (15 downto 0); -- ddr data

    -- Ethernet PHY
    txd          : out std_logic_vector(3 downto 0);
    rxd          : in  std_logic_vector(3 downto 0);
    tx_clk       : in  std_logic;
    rx_clk       : in  std_logic;
    tx_en        : out std_logic;
    rx_dv        : in  std_logic;
    eth_crs      : in  std_logic;
    rx_er        : in  std_logic;
    eth_col      : in  std_logic;
    mdio         : inout std_logic;
    mdc          : out std_logic;
    eth_reset_n  : out std_logic;

    -- Temperature sensor
    temp_sc      : inout std_logic;
    temp_cs_n    : out std_logic;
    temp_sio     : inout std_logic;

    -- LEDs
    f_led        : inout std_logic_vector(7 downto 0);

    -- User push-button
    pbsw_n       : in std_logic;
    
    -- Reconfig SW1 and SW2
    reconfig_sw  : in std_logic_vector(2 downto 1);
    
    -- SD card interface
    sd_dat0      : inout std_logic;
    sd_dat1      : inout std_logic;
    sd_dat2      : inout std_logic;
    sd_dat3      : inout std_logic;
    sd_cmd       : inout std_logic;
    sd_clk       : inout std_logic;

    -- EPCS
    epcs_data    : in    std_ulogic;
    epcs_dclk    : out   std_ulogic;
    epcs_csn     : out   std_ulogic;
    epcs_asdi    : out   std_ulogic
    
    -- Expansion connector on card edge (set as reserved in design's QSF)
    --reset_exp_n     : out   std_logic;
    --exp_present     : in    std_logic;
    --p               : inout std_logic_vector(64 downto 1)
    );
end;

architecture rtl of leon3mp is

  constant maxahbm : integer := NCPU+CFG_AHB_JTAG+CFG_GRETH;
  constant maxahbs : integer := 6
--pragma translate_off
                                +1      -- one more in simulation (AHBREP)
--pragma translate_on
                                ;
  
  signal vcc, gnd      : std_logic_vector(7 downto 0);

  signal clkm, clkml   : std_ulogic;

  signal lclk, resetn  : std_ulogic;
  
  signal clklock, lock : std_ulogic;
  
  signal rstn, rawrstn : std_ulogic;
  
  signal ddr_clkv      : std_logic_vector(2 downto 0);
  signal ddr_clkbv     : std_logic_vector(2 downto 0);
  signal ddr_ckev      : std_logic_vector(1 downto 0);
  signal ddr_csbv      : std_logic_vector(1 downto 0);
  
  signal tck           : std_ulogic;
  signal tckn          : std_ulogic;
  signal tms           : std_ulogic;
  signal tdi           : std_ulogic;
  signal tdo           : std_ulogic;
  
  signal apbi          : apb_slv_in_type;
  signal apbo          : apb_slv_out_vector := (others => apb_none);
  signal ahbsi         : ahb_slv_in_type;
  signal ahbso         : ahb_slv_out_vector := (others => ahbs_none);
  signal ahbmi         : ahb_mst_in_type;
  signal ahbmo         : ahb_mst_out_vector := (others => ahbm_none);

  signal cgi           : clkgen_in_type;
  signal cgo           : clkgen_out_type;

  signal u0i           : uart_in_type;
  signal u0o           : uart_out_type;
  
  signal irqi          : irq_in_vector(0 to NCPU-1);
  signal irqo          : irq_out_vector(0 to NCPU-1);

  signal dbgi          : l3_debug_in_vector(0 to NCPU-1);
  signal dbgo          : l3_debug_out_vector(0 to NCPU-1);

  signal dsui          : dsu_in_type;
  signal dsuo          : dsu_out_type;

  signal gpti          : gptimer_in_type;
  signal gpioi         : gpio_in_type;
  signal gpioo         : gpio_out_type;

  signal spii          : spi_in_type;
  signal spio          : spi_out_type;
  signal slvsel        : std_logic_vector(CFG_SPICTRL_SLVS-1 downto 0);

  signal spii2         : spi_in_type;
  signal spio2         : spi_out_type;
  signal slvsel2       : std_logic_vector(0 downto 0);
  
  signal spmi          : spimctrl_in_type;
  signal spmo          : spimctrl_out_type;

  signal ethi          : eth_in_type;
  signal etho          : eth_out_type;
  
  constant IOAEN       : integer := 1;
  constant BOARD_FREQ  : integer := 50000;   -- input frequency in KHz
  constant CPU_FREQ    : integer := BOARD_FREQ * CFG_CLKMUL / CFG_CLKDIV;  -- cpu frequency in KHz
  
  signal dsu_breakn    : std_ulogic;
  
  attribute syn_keep : boolean;
  attribute syn_keep of clkm : signal is true;
  attribute syn_keep of clkml : signal is true;
    
begin

  vcc <= (others => '1'); gnd <= (others => '0');
  
----------------------------------------------------------------------
---  Reset and Clock generation  -------------------------------------
----------------------------------------------------------------------

  cgi.pllctrl <= "00"; cgi.pllrst <= not rawrstn; cgi.pllref <= '0'; 
  clklock <= cgo.clklock and lock;
  
  clk_pad : clkpad generic map (tech => padtech)
    port map (clk_fpga_50m, lclk);

  clkgen0 : clkgen  -- clock generator using toplevel generic 'freq'
    generic map (
      tech     => CFG_CLKTECH,
      clk_mul  => CFG_CLKMUL,
      clk_div  => CFG_CLKDIV,
      sdramen  => 0,
      freq     => freq)
    port map (
      clkin    => lclk,
      pciclkin => gnd(0),
      clk      => clkm,
      clkn     => open,
      clk2x    => open,
      sdclk    => open,
      pciclk   => open,
      cgi      => cgi,
      cgo      => cgo);
  
  reset_pad : inpad generic map (tech  => padtech) port map (cpu_rst_n, resetn);
  
  rst0 : rstgen                         -- reset generator
    port map (
      rstin     => resetn,
      clk       => clkm,
      clklock   => clklock,
      rstout    => rstn,
      rstoutraw => rawrstn);

---------------------------------------------------------------------- 
---  AHB CONTROLLER --------------------------------------------------
----------------------------------------------------------------------

  ahb0 : ahbctrl 		-- AHB arbiter/multiplexer
    generic map (
      defmast => CFG_DEFMST,
      split   => CFG_SPLIT, 
      rrobin  => CFG_RROBIN,
      ioaddr  => CFG_AHBIO,
      ioen    => IOAEN,
      nahbm   => maxahbm,
      nahbs   => maxahbs)
    port map (
      rst  => rstn,
      clk  => clkm,
      msti => ahbmi,
      msto => ahbmo,
      slvi => ahbsi,
      slvo => ahbso);

----------------------------------------------------------------------
---  LEON3 processor and DSU -----------------------------------------
----------------------------------------------------------------------

  l3 : if CFG_LEON3 = 1 generate
    cpu : for i in 0 to NCPU-1 generate
      u0 : leon3s                         -- LEON3 processor
        generic map (
          hindex     => i,
          fabtech    => fabtech,
          memtech    => memtech,
          nwindows   => CFG_NWIN,
          dsu        => CFG_DSU,
          fpu        => CFG_FPU,
          v8         => CFG_V8,
          cp         => 0,
          mac        => CFG_MAC,
          pclow      => pclow,
          notag      => CFG_NOTAG,
          nwp        => CFG_NWP,
          icen       => CFG_ICEN,
          irepl      => CFG_IREPL,
          isets      => CFG_ISETS,
          ilinesize  => CFG_ILINE,
          isetsize   => CFG_ISETSZ,
          isetlock   => CFG_ILOCK,
          dcen       => CFG_DCEN,
          drepl      => CFG_DREPL,
          dsets      => CFG_DSETS,
          dlinesize  => CFG_DLINE,
          dsetsize   => CFG_DSETSZ,
          dsetlock   => CFG_DLOCK,
          dsnoop     => CFG_DSNOOP,
          ilram      => CFG_ILRAMEN,
          ilramsize  => CFG_ILRAMSZ,
          ilramstart => CFG_ILRAMADDR,
          dlram      => CFG_DLRAMEN,
          dlramsize  => CFG_DLRAMSZ,
          dlramstart => CFG_DLRAMADDR,
          mmuen      => CFG_MMUEN,
          itlbnum    => CFG_ITLBNUM,
          dtlbnum    => CFG_DTLBNUM,
          tlb_type   => CFG_TLB_TYPE,
          tlb_rep    => CFG_TLB_REP,
          lddel      => CFG_LDDEL,
          disas      => disas,
          tbuf       => CFG_ITBSZ,
          pwd        => CFG_PWD,
          svt        => CFG_SVT,
          rstaddr    => CFG_RSTADDR,
          smp        => NCPU-1,
          cached     => CFG_DFIXED,
          scantest   => CFG_SCAN,
          mmupgsz    => CFG_MMU_PAGE,
          bp         => CFG_BP,
          npasi      => CFG_NP_ASI,
          pwrpsr     => CFG_WRPSR)
        port map (
          clk   => clkm,
          rstn  => rstn,
          ahbi  => ahbmi,
          ahbo  => ahbmo(i),
          ahbsi => ahbsi,
          ahbso => ahbso,
          irqi  => irqi(i),
          irqo  => irqo(i),
          dbgi  => dbgi(i),
          dbgo  => dbgo(i));
    end generate;
    errorn_pad : toutpad generic map (tech => padtech) port map (f_led(6), gnd(0), dbgo(0).error);

    dsugen : if CFG_DSU = 1 generate
      dsu0 : dsu3                         -- LEON3 Debug Support Unit
        generic map (
          hindex => 2,
          haddr  => 16#900#,
          hmask  => 16#F00#,
          ncpu   => NCPU,
          tbits  => 30,
          tech   => memtech,
          irq    => 0,
          kbytes => CFG_ATBSZ)
        port map (
          rst   => rstn,
          clk   => clkm,
          ahbmi => ahbmi,
          ahbsi => ahbsi,
          ahbso => ahbso(2),
          dbgi  => dbgo,
          dbgo  => dbgi,
          dsui  => dsui,
          dsuo  => dsuo);
    
      dsui.enable <= '1';

      dsui.break <= not dsu_breakn;     -- Switch polarity
      dsubre_pad : inpad generic map (tech  => padtech) port map (pbsw_n, dsu_breakn);
      dsuact_pad : toutpad generic map (tech => padtech) port map (f_led(7), gnd(0), dsuo.active);
    end generate;
  end generate;
  nodsu : if CFG_DSU = 0 generate 
    ahbso(2) <= ahbs_none; dsuo.tstop <= '0'; dsuo.active <= '0';
  end generate;

  ahbjtaggen0 :if CFG_AHB_JTAG = 1 generate
    ahbjtag0 : ahbjtag generic map(tech => fabtech, hindex => NCPU+CFG_AHB_UART)
      port map(
        rst => rstn,
        clk => clkm,
        tck => tck,
        tms => tms,
        tdi => tdi,
        tdo => tdo,
        ahbi => ahbmi,
        ahbo => ahbmo(NCPU+CFG_AHB_UART),
        tapo_tck  => open,
        tapo_tdi  => open,
        tapo_inst => open,
        tapo_rst  => open,
        tapo_capt => open,
        tapo_shft => open,
        tapo_upd  => open,
        tapi_tdo  => gnd(0));
  end generate;

----------------------------------------------------------------------
---  Memory controllers ----------------------------------------------
----------------------------------------------------------------------

  -- DDR memory controller
  ddrsp0 : if (CFG_DDRSP /= 0) generate 
    ddrc0 : ddrspa
      generic map (
        fabtech   => fabtech,
        memtech   => memtech, 
        hindex    => 0,
        haddr     => 16#400#,
        hmask     => 16#F00#,
        ioaddr    => 1, 
	pwron     => CFG_DDRSP_INIT,
        MHz       => BOARD_FREQ/1000,
        rskew     => CFG_DDRSP_RSKEW,
	clkmul    => CFG_DDRSP_FREQ/5,
        clkdiv    => 10,
        ahbfreq   => CPU_FREQ/1000,
	col       => CFG_DDRSP_COL,
        Mbyte     => CFG_DDRSP_SIZE,
        ddrbits   => 16,
        regoutput => 1,
        mobile    => 0)
     port map (
	rst_ddr        => rawrstn,
        rst_ahb        => rstn,
        clk_ddr        => lclk,
        clk_ahb        => clkm,
        lock           => lock,
        clkddro        => clkml,
        clkddri        => clkml,
        ahbsi          => ahbsi,
        ahbso          => ahbso(0),
	ddr_clk        => ddr_clkv,
        ddr_clkb       => ddr_clkbv,
        ddr_clk_fb_out => open,
        ddr_clk_fb     => gnd(0),
	ddr_cke        => ddr_ckev,
        ddr_csb        => ddr_csbv,
        ddr_web        => ram_ws_n,
        ddr_rasb       => ram_ras_n,
        ddr_casb       => ram_cas_n, 
	ddr_dm         => ram_dm,
        ddr_dqs        => ram_dqs,
        ddr_ad         => ram_a,
        ddr_ba         => ram_ba,
        ddr_dq         => ram_d);
  end generate;

  ram_ck_p <= ddr_clkv(0);
  ram_ck_n <= ddr_clkbv(0);
  ram_cke  <= ddr_ckev(0);
  ram_cs_n <= ddr_csbv(0);
  
  ddrsp1 : if (CFG_DDRSP = 0) generate 
    ahbso(0) <= ahbs_none;
    lock <= '1';
    ddr_clkv <= (others => '0');
    ddr_clkbv <= (others => '0');
    ddr_ckev <= (others => '1');
    ddr_csbv <= (others => '1');
  end generate;

  -- SPI Memory Controller
  spimc: if CFG_SPIMCTRL /= 0 and CFG_AHBROMEN = 0 generate
    spimctrl0 : spimctrl
      generic map (
        hindex     => 4,
        hirq       => 9,
        faddr      => 16#000#,
        fmask      => 16#f00#,
        ioaddr     => 16#002#,
        iomask     => 16#fff#,
        spliten    => CFG_SPLIT,
        oepol      => 0,
        sdcard     => CFG_SPIMCTRL_SDCARD,
        readcmd    => CFG_SPIMCTRL_READCMD,
        dummybyte  => CFG_SPIMCTRL_DUMMYBYTE,
        dualoutput => CFG_SPIMCTRL_DUALOUTPUT,
        scaler     => CFG_SPIMCTRL_SCALER,
        altscaler  => CFG_SPIMCTRL_ASCALER,
        pwrupcnt   => CFG_SPIMCTRL_PWRUPCNT,
        offset     => CFG_SPIMCTRL_OFFSET)
      port map (
        rstn  => rstn,
        clk   => clkm,
        ahbsi => ahbsi,
        ahbso => ahbso(4),
        spii  => spmi,
        spio  => spmo);
  end generate;

  epcs_miso_pad : inpad generic map (tech => padtech)
    port map (epcs_data, spmi.miso);
  epcs_mosi_pad : outpad generic map (tech => padtech)
    port map (epcs_asdi, spmo.mosi);
  epcs_sck_pad  : outpad generic map (tech => padtech)
    port map (epcs_dclk, spmo.sck);
  epcs_slvsel0_pad : outpad generic map (tech => padtech)
    port map (epcs_csn, spmo.csn);

  nospimc : if CFG_SPIMCTRL /= 1 or CFG_AHBROMEN /= 0 generate
    spmo <=  spimctrl_out_none;
  end generate;
  
----------------------------------------------------------------------
---  APB Bridge and various periherals -------------------------------
----------------------------------------------------------------------

  -- AHB/APB bridge
  apb0 : apbctrl
    generic map (
      hindex  => 1,
      haddr   => CFG_APBADDR,
      nslaves => 7)
    port map (
      rst  => rstn,
      clk  => clkm,
      ahbi => ahbsi,
      ahbo => ahbso(1),
      apbi => apbi,
      apbo => apbo);

  -- 8-bit UART, not connected off-chip, use in loopback with GRMON
  ua1 : if CFG_UART1_ENABLE /= 0 generate
    uart1 : apbuart                     -- UART 1
      generic map (
        pindex   => 1,
        paddr    => 1,
        pirq     => 2,
        console  => dbguart,
        fifosize => CFG_UART1_FIFO)
      port map (
        rst   => rstn,
        clk   => clkm,
        apbi  => apbi,
        apbo  => apbo(1),
        uarti => u0i,
        uarto => u0o);
    
  end generate;
  u0i.rxd <= '0'; u0i.ctsn <= '0'; u0i.extclk <= '0';
  noua0 : if CFG_UART1_ENABLE = 0 generate apbo(1) <= apb_none; end generate;

  -- Interrupt controller
  irqctrl : if CFG_IRQ3_ENABLE /= 0 generate
    irqctrl0 : irqmp                    -- interrupt controller
      generic map (
        pindex => 2,
        paddr  => 2,
        ncpu   => NCPU)
      port map (
        rst  => rstn,
        clk  => clkm,
        apbi => apbi,
        apbo => apbo(2),
        irqi => irqo,
        irqo => irqi);
  end generate;
  noirqctrl : if CFG_IRQ3_ENABLE = 0 generate
    x : for i in 0 to NCPU-1 generate
      irqi(i).irl <= "0000";
    end generate;
    apbo(2) <= apb_none;
  end generate;

  -- Timer unit
  gpt : if CFG_GPT_ENABLE /= 0 generate
    timer0 : gptimer
      generic map (
        pindex  => 3,
        paddr   => 3,
        pirq    => CFG_GPT_IRQ,
        sepirq  => CFG_GPT_SEPIRQ,
        sbits   => CFG_GPT_SW,
        ntimers => CFG_GPT_NTIM,
        nbits   => CFG_GPT_TW)
      port map (
        rst  => rstn,
        clk  => clkm,
        apbi => apbi,
        apbo => apbo(3),
        gpti => gpti,
        gpto => open);
  end generate;

  gpti <= gpti_dhalt_drive(dsuo.tstop);
  
  notim : if CFG_GPT_ENABLE = 0 generate
    apbo(3) <= apb_none;
  end generate;
  
  -- GPIO unit
  gpio0 : if CFG_GRGPIO_ENABLE /= 0 generate
    grgpio0: grgpio
      generic map(
        pindex => 0,
        paddr  => 0,
        imask  => CFG_GRGPIO_IMASK,
        nbits  => CFG_GRGPIO_WIDTH)
      port map(
        rst => rstn,
        clk => clkm,
        apbi => apbi,
        apbo => apbo(0),
        gpioi => gpioi,
        gpioo => gpioo);
  end generate;

  gpio_pads : iopadvv generic map (tech => padtech, width => 6)
    port map (f_led(5 downto 0), gpioo.dout(5 downto 0),
              gpioo.oen(5 downto 0), gpioi.din(5 downto 0));
  gpioi.din(31 downto 6) <= (others => '0');

  nogpio : if CFG_GRGPIO_ENABLE = 0 generate
    apbo(0) <= apb_none;
  end generate;

  -- SPI controller connected to temperature sensor
  spic: if CFG_SPICTRL_ENABLE /= 0 generate
    spi1 : spictrl
      generic map (
        pindex   => 4,
        paddr    => 4,
        pmask    => 16#fff#,
        pirq     => 9,
        fdepth   => CFG_SPICTRL_FIFO,
        slvselen => CFG_SPICTRL_SLVREG,
        slvselsz => CFG_SPICTRL_SLVS,
        odmode   => CFG_SPICTRL_ODMODE,
        automode => CFG_SPICTRL_AM,
        aslvsel  => CFG_SPICTRL_ASEL,
        twen     => 1,
        maxwlen  => CFG_SPICTRL_MAXWLEN,
        netlist  => 0,
        syncram  => CFG_SPICTRL_SYNCRAM,
        ft       => CFG_SPICTRL_FT)
      port map (
        rstn   => rstn,
        clk    => clkm,
        apbi   => apbi,
        apbo   => apbo(4),
        spii   => spii,
        spio   => spio,
        slvsel => slvsel);
  end generate spic;

  -- MISO signal not used
  spii.miso <= '0';
  mosi_pad : iopad generic map (tech => padtech)
    port map (temp_sio, spio.mosi, spio.mosioen, spii.mosi);
  sck_pad  : iopad generic map (tech => padtech)
    port map (temp_sc, spio.sck, spio.sckoen, spii.sck);
  slvsel_pad : outpad generic map (tech => padtech)
    port map (temp_cs_n, slvsel(0));
  spii.spisel <= '1';                 -- Master only
  
  nospic : if CFG_SPICTRL_ENABLE = 0 generate
    apbo(4) <= apb_none;
    spio.misooen <= '1';
    spio.mosioen <= '1';
    spio.sckoen  <= '1';
    slvsel <= (others => '1');
  end generate;

  -- SPI controller connected to SD card slot
  spic2: if CFG_SPICTRL_ENABLE /= 0 and CFG_SPICTRL_NUM > 1 generate
    spi1 : spictrl
      generic map (
        pindex   => 5,
        paddr    => 5,
        pmask    => 16#fff#,
        pirq     => 11,
        fdepth   => CFG_SPICTRL_FIFO,
        slvselen => 1,
        slvselsz => 1,
        odmode   => CFG_SPICTRL_ODMODE,
        automode => CFG_SPICTRL_AM,
        aslvsel  => CFG_SPICTRL_ASEL,
        twen     => 0,
        maxwlen  => CFG_SPICTRL_MAXWLEN,
        netlist  => 0,
        syncram  => CFG_SPICTRL_SYNCRAM,
        ft       => CFG_SPICTRL_FT)
      port map (
        rstn   => rstn,
        clk    => clkm,
        apbi   => apbi,
        apbo   => apbo(5),
        spii   => spii2,
        spio   => spio2,
        slvsel => slvsel2);
    
    miso_pad : iopad generic map (tech => padtech)
      port map (sd_dat0, spio2.miso, spio2.misooen, spii2.miso);
    mosi_pad : iopad generic map (tech => padtech)
      port map (sd_cmd, spio2.mosi, spio2.mosioen, spii2.mosi);
    sck_pad  : iopad generic map (tech => padtech)
      port map (sd_clk, spio2.sck, spio2.sckoen, spii2.sck);
    slvsel_pad : outpad generic map (tech => padtech)
      port map (sd_dat3, slvsel2(0));
    spii2.spisel <= '1';                 -- Master only
  end generate;

  nospic2 : if CFG_SPICTRL_ENABLE = 0 or CFG_SPICTRL_NUM < 2 generate
    apbo(5) <= apb_none;
    spio2.misooen <= '1';
    spio2.mosioen <= '1';
    spio2.sckoen  <= '1';
    slvsel2(0) <= '0';
  end generate;
  
  -- sd_dat1 and sd_dat2 are unused
  unuseddat1_pad : iopad generic map (tech => padtech)
    port map (sd_dat1, gnd(0), vcc(1), open);
  unuseddat2_pad : iopad generic map (tech => padtech)
    port map (sd_dat2, gnd(0), vcc(1), open);
  
-----------------------------------------------------------------------
---  ETHERNET ---------------------------------------------------------
-----------------------------------------------------------------------

  eth0 : if CFG_GRETH /= 0 generate -- Gaisler Ethernet MAC
    e1 : grethm
      generic map(
        hindex      => CFG_NCPU+CFG_AHB_JTAG,
        pindex      => 6,
        paddr       => 6,
        pirq        => 10,
        memtech     => memtech,
        mdcscaler   => CPU_FREQ/(4*1000)-1,
        enable_mdio => 1,
        fifosize    => CFG_ETH_FIFO,
        nsync       => 1,
        edcl        => CFG_DSU_ETH,
        edclbufsz   => CFG_ETH_BUF,
        macaddrh    => CFG_ETH_ENM,
        macaddrl    => CFG_ETH_ENL,
        phyrstadr   => 1,
        ipaddrh     => CFG_ETH_IPM,
        ipaddrl     => CFG_ETH_IPL,
        giga        => CFG_GRETH1G)
      port map(
        rst => rstn,
        clk => clkm,
        ahbmi => ahbmi,
        ahbmo => ahbmo(CFG_NCPU+CFG_AHB_JTAG),
        apbi => apbi,
        apbo => apbo(6),
        ethi => ethi,
        etho => etho); 

    emdio_pad : iopad generic map (tech => padtech) 
      port map (mdio, etho.mdio_o, etho.mdio_oe, ethi.mdio_i);
    etxc_pad : clkpad generic map (tech => padtech, arch => 2) 
      port map (tx_clk, ethi.tx_clk);
    erxc_pad : clkpad generic map (tech => padtech, arch => 2) 
      port map (rx_clk, ethi.rx_clk);
    erxd_pad : inpadv generic map (tech => padtech, width => 4) 
      port map (rxd, ethi.rxd(3 downto 0));
    erxdv_pad : inpad generic map (tech => padtech) 
      port map (rx_dv, ethi.rx_dv);
    erxer_pad : inpad generic map (tech => padtech) 
      port map (rx_er, ethi.rx_er);
    erxco_pad : inpad generic map (tech => padtech) 
      port map (eth_col, ethi.rx_col);
    erxcr_pad : inpad generic map (tech => padtech) 
      port map (eth_crs, ethi.rx_crs);
    etxd_pad : outpadv generic map (tech => padtech, width => 4) 
      port map (txd, etho.txd(3 downto 0));
    etxen_pad : outpad generic map (tech => padtech) 
      port map (tx_en, etho.tx_en);
    emdc_pad : outpad generic map (tech => padtech) 
      port map (mdc, etho.mdc);
    erst_pad : outpad generic map (tech => padtech) 
      port map (eth_reset_n, rawrstn);
  end generate;

  noeth : if CFG_GRETH = 0 generate
    apbo(6) <= apb_none;
    ethi <= eth_in_none;
    etho <= eth_out_none;
  end generate;
  
-----------------------------------------------------------------------
---  AHB ROM ----------------------------------------------------------
-----------------------------------------------------------------------

  bpromgen : if CFG_AHBROMEN /= 0 generate
    brom : entity work.ahbrom
      generic map (
        hindex => 3,
        haddr  => CFG_AHBRODDR,
        pipe   => CFG_AHBROPIP)
      port map (
        rst   => rstn,
        clk   => clkm,
        ahbsi => ahbsi,
        ahbso => ahbso(3));
  end generate;
  nobpromgen : if CFG_AHBROMEN = 0 generate
     ahbso(3) <= ahbs_none;
  end generate;

-----------------------------------------------------------------------
---  AHB RAM ----------------------------------------------------------
-----------------------------------------------------------------------

  ahbramgen : if CFG_AHBRAMEN = 1 generate
    ahbram0 : ahbram
      generic map (
        hindex => 5,
        haddr  => CFG_AHBRADDR,
        tech   => CFG_MEMTECH,
        kbytes => CFG_AHBRSZ,
        pipe => CFG_AHBRPIPE)
      port map (
        rst   => rstn,
        clk   => clkm,
        ahbsi => ahbsi,
        ahbso => ahbso(5));
  end generate;
  nram : if CFG_AHBRAMEN = 0 generate ahbso(5) <= ahbs_none; end generate;

-----------------------------------------------------------------------
--  AHB Report Module for simulation ----------------------------------
-----------------------------------------------------------------------

--pragma translate_off
  test0 : ahbrep generic map (hindex => 6, haddr => 16#200#)
    port map (rstn, clkm, ahbsi, ahbso(6));
--pragma translate_on
  
-----------------------------------------------------------------------
---  Drive unused bus elements  ---------------------------------------
-----------------------------------------------------------------------

  driveahbm : for i in maxahbm to NAHBMST-1 generate
    ahbmo(i) <= ahbm_none;
  end generate;
  
  driveahbs : for i in maxahbs to NAHBSLV-1 generate
    ahbso(i) <= ahbs_none;
  end generate;
  
  driveapb : for i in 7 to NAPBSLV-1 generate
    apbo(i) <= apb_none;
  end generate;
  
-----------------------------------------------------------------------
---  Boot message  ----------------------------------------------------
-----------------------------------------------------------------------

-- pragma translate_off
  x : report_design
  generic map (
   msg1 => "LEON3 BeMicro SDK Design",
   fabtech => tech_table(fabtech), memtech => tech_table(memtech),
   mdel => 1
  );
-- pragma translate_on

end;

