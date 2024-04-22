------------------------------------------------------------------------------
--  LEON3 Demonstration design
--  Copyright (C) 2016 Cobham Gaisler
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
use techmap.allclkgen.all;

library gaisler;
use gaisler.memctrl.all;
use gaisler.leon3.all;
use gaisler.uart.all;
use gaisler.misc.all;
use gaisler.spi.all;
use gaisler.net.all;
use gaisler.jtag.all;
use gaisler.ddrpkg.all;

--pragma translate_off
use gaisler.sim.all;
library unisim;
use unisim.all;
--pragma translate_on

library esa;
use esa.memoryctrl.all;

use work.config.all;

entity leon3mp is
  generic (
    fabtech                 : integer := CFG_FABTECH;
    memtech                 : integer := CFG_MEMTECH;
    padtech                 : integer := CFG_PADTECH;
    clktech                 : integer := CFG_CLKTECH;
    disas                   : integer := CFG_DISAS;     -- Enable disassembly to console
    dbguart                 : integer := CFG_DUART;     -- Print UART on console
    pclow                   : integer := CFG_PCLOW;
    SIM_BYPASS_INIT_CAL     : string := "OFF";
    SIMULATION              : string := "FALSE";
    USE_MIG_INTERFACE_MODEL : boolean := false
    );
  port (
    sysclk             : in    std_ulogic;
    -- LEDs
    led                : out   std_logic_vector(7 downto 0);
    -- Buttons
    btnc               : in    std_ulogic;
    btnd               : in    std_ulogic;
    btnl               : in    std_ulogic;
    btnr               : in    std_ulogic;
    cpu_resetn         : in    std_ulogic;
    -- Switches
    sw                 : in    std_logic_vector(7 downto 0);    
    -- USB-RS232 interface
    uart_tx_in         : in    std_logic;
    uart_rx_out        : out   std_logic;
    -- DDR3
    ddr3_dq           : inout std_logic_vector(15 downto 0);
    ddr3_dqs_p        : inout std_logic_vector(1 downto 0);
    ddr3_dqs_n        : inout std_logic_vector(1 downto 0);
    ddr3_addr         : out   std_logic_vector(14 downto 0);
    ddr3_ba           : out   std_logic_vector(2 downto 0);
    ddr3_ras_n        : out   std_logic;
    ddr3_cas_n        : out   std_logic;
    ddr3_we_n         : out   std_logic;
    ddr3_reset_n      : out   std_logic;
    ddr3_ck_p         : out   std_logic_vector(0 downto 0);
    ddr3_ck_n         : out   std_logic_vector(0 downto 0);
    ddr3_cke          : out   std_logic_vector(0 downto 0);
    ddr3_dm           : out   std_logic_vector(1 downto 0);
    ddr3_odt          : out   std_logic_vector(0 downto 0);
    -- Ethernet
    --eth_int_b          : in std_logic;
    --eth_mdc            : out std_logic;
    --eth_mdio           : inout std_logic;
    --eth_pme_b          : out std_ulogic;
    --eth_rst_b          : out std_logic;
    --eth_rxck           : in std_logic;
    --eth_rxctl          : in std_logic; 
    --eth_rxd            : in std_logic_vector(3 downto 0);
    --eth_txck           : in std_logic;
    --eth_txctl          : out std_logic; 
    --eth_txd            : out std_logic_vector(3 downto 0);
    phy_txclk       : out   std_logic;
    phy_txd         : out   std_logic_vector(3 downto 0);
    phy_txctl_txen  : out   std_ulogic;
    phy_rxd         : in    std_logic_vector(3 downto 0);
    phy_rxctl_rxdv  : in    std_ulogic;
    phy_rxclk       : in    std_ulogic;
    phy_reset       : out   std_ulogic;
    phy_mdio        : inout std_logic;
    phy_mdc         : out   std_ulogic;
    phy_int         : in    std_ulogic;  
    -- Fan PWM
    fan_pwm            : out std_ulogic;    
    -- SPI
    qspi_cs            : out   std_ulogic;
    qspi_dq            : inout std_logic_vector(3 downto 0);
    scl                : out   std_ulogic
    );
end;

architecture rtl of leon3mp is

component IDELAYCTRL
  port (
     RDY : out std_ulogic;
     REFCLK : in std_ulogic;
     RST : in std_ulogic
  );
end component;

component IODELAYE1
  generic (
     DELAY_SRC : string := "I";
     IDELAY_TYPE : string := "DEFAULT";
     IDELAY_VALUE : integer := 0;
     ODELAY_VALUE : integer := 0
     
  );
  port (
     CNTVALUEOUT : out std_logic_vector(4 downto 0);
     DATAOUT     : out std_ulogic;
     C           : in std_ulogic;
     CE          : in std_ulogic;
     CINVCTRL    : in std_ulogic;
     CLKIN       : in std_ulogic;
     CNTVALUEIN  : in std_logic_vector(4 downto 0);
     DATAIN      : in std_ulogic;
     IDATAIN     : in std_ulogic;
     INC         : in std_ulogic;
     ODATAIN     : in std_ulogic;
     RST         : in std_ulogic;
     T           : in std_ulogic
  );
end component;


component ODELAYE2 
 generic (
     ODELAY_VALUE : integer := 0
  );
  port (
     C           : in std_ulogic;
     REGRST      : in std_ulogic;
     LD          : in std_ulogic;
     CE          : in std_ulogic;
     INC         : in std_ulogic;
     CINVCTRL    : in std_ulogic;
     CNTVALUEIN  : in std_logic_vector(4 downto 0);
     CLKIN       : in std_ulogic;
     ODATAIN     : in std_ulogic;
     LDPIPEEN    : in std_ulogic;
     DATAOUT     : out std_ulogic;
     CNTVALUEOUT : out std_logic_vector(4 downto 0)
  );
end component;

  signal vcc : std_logic;
  signal gnd : std_logic;

  signal gpioi : gpio_in_type;
  signal gpioo : gpio_out_type;

  signal apbi  : apb_slv_in_type;
  signal apbo  : apb_slv_out_vector := (others => apb_none);
  signal ahbsi : ahb_slv_in_type;
  signal ahbso : ahb_slv_out_vector := (others => ahbs_none);
  signal ahbmi : ahb_mst_in_type;
  signal ahbmo : ahb_mst_out_vector := (others => ahbm_none);

  signal cgi : clkgen_in_type;
  signal cgo, cgo1 : clkgen_out_type;
  signal cgi2   : clkgen_in_type;
  signal cgo2   : clkgen_out_type;

  signal u1i, dui : uart_in_type;
  signal u1o, duo : uart_out_type;

  signal irqi : irq_in_vector(0 to CFG_NCPU-1);
  signal irqo : irq_out_vector(0 to CFG_NCPU-1);

  signal dbgi : l3_debug_in_vector(0 to CFG_NCPU-1);
  signal dbgo : l3_debug_out_vector(0 to CFG_NCPU-1);

  signal dsui : dsu_in_type;
  signal dsuo : dsu_out_type;
  signal ndsuact : std_ulogic;

  signal ethi : eth_in_type;
  signal etho : eth_out_type;

  signal gpti : gptimer_in_type;

  signal spmi : spimctrl_in_type;
  signal spmo : spimctrl_out_type;

  signal clkm : std_ulogic
  -- pragma translate_off 
  := '0'
  -- pragma translate_on
  ;
  
  signal clkm2x, rstn : std_ulogic;
  signal tck, tms, tdi, tdo : std_ulogic;
  signal rstraw             : std_logic;
  signal lcpu_resetn        : std_logic;
  signal lock        : std_logic;
  signal clkinmig           : std_logic;

  signal clkref, calib_done, migrstn : std_logic;

  signal gmiii : eth_in_type;
  signal gmiio : eth_out_type;

  signal rgmiii,rgmiii_buf : eth_in_type;
  signal rgmiio : eth_out_type;

  signal ethernet_phy_int : std_logic;

  signal rxd1 : std_logic;
  signal txd1 : std_logic;

  --signal ethi : eth_in_type;
  --signal etho : eth_out_type;
  signal gtx_clk,gtx_clk_nobuf,gtx_clk90 : std_ulogic;
  signal rstgtxn : std_logic;

  signal idelay_reset_cnt : std_logic_vector(3 downto 0);
  signal idelayctrl_reset : std_logic;
  signal io_ref           : std_logic;

  signal phy_txclk_delay : std_logic;

  attribute keep                     : boolean;
  attribute syn_keep                 : boolean;
  attribute syn_preserve             : boolean;
  attribute syn_keep of lock         : signal is true;
  attribute syn_keep of clkm         : signal is true;
  attribute syn_preserve of clkm     : signal is true;
  attribute keep of lock             : signal is true;
  attribute keep of clkm             : signal is true;

  constant BOARD_FREQ : integer := 100000;                                -- CLK input frequency in KHz
  constant CPU_FREQ   : integer := BOARD_FREQ * CFG_CLKMUL / CFG_CLKDIV;  -- cpu frequency in KHz

begin

  vcc <= '1'; gnd <= '0';

----------------------------------------------------------------------
---  Reset and Clock generation  -------------------------------------
----------------------------------------------------------------------

  cgi.pllctrl <= "00";
  cgi.pllrst <= rstraw;

  rst_pad : inpad generic map (tech => padtech, level => cmos, voltage => x15v)
    port map (cpu_resetn, lcpu_resetn);
  
  rst0 : rstgen
    port map (lcpu_resetn, clkm, lock, rstn, rstraw);
  lock <= calib_done when CFG_MIG_7SERIES = 1 else cgo.clklock;

  rst1 : rstgen         -- reset generator
  port map (lcpu_resetn, clkm, vcc, migrstn, open);

  -- clock generator
  clkgen_gen: if (CFG_MIG_7SERIES = 0) generate
    clkgen0 : clkgen
      generic map (fabtech, CFG_CLKMUL, CFG_CLKDIV, 0, 0, 0, 0, 0, BOARD_FREQ, 0)
      port map (sysclk, gnd, clkm, open, clkm2x, open, open, cgi, cgo, open, open, open);
  end generate;

  led(7) <= lcpu_resetn;
  led(6) <= calib_done;
  led(5) <= rstn;
  led(4) <= lock;                       -- Used in TB

  
----------------------------------------------------------------------
---  AHB CONTROLLER --------------------------------------------------
----------------------------------------------------------------------

  ahb0 : ahbctrl
    generic map (defmast => CFG_DEFMST, split => CFG_SPLIT,
                 rrobin  => CFG_RROBIN, ioaddr => CFG_AHBIO, ioen => 1,
                 nahbm => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_GRETH,
                 nahbs => 8)
    port map (rstn, clkm, ahbmi, ahbmo, ahbsi, ahbso);

----------------------------------------------------------------------
---  LEON3 processor and DSU -----------------------------------------
----------------------------------------------------------------------

  -- LEON3 processor
  leon3gen : if CFG_LEON3 = 1 generate
    cpu : for i in 0 to CFG_NCPU-1 generate
      u0 : leon3s
        generic map (i, fabtech, memtech, CFG_NWIN, CFG_DSU, CFG_FPU, CFG_V8,
                     0, CFG_MAC, pclow, CFG_NOTAG, CFG_NWP, CFG_ICEN, CFG_IREPL, CFG_ISETS, CFG_ILINE,
                     CFG_ISETSZ, CFG_ILOCK, CFG_DCEN, CFG_DREPL, CFG_DSETS, CFG_DLINE, CFG_DSETSZ,
                     CFG_DLOCK, CFG_DSNOOP, CFG_ILRAMEN, CFG_ILRAMSZ, CFG_ILRAMADDR, CFG_DLRAMEN,
                     CFG_DLRAMSZ, CFG_DLRAMADDR, CFG_MMUEN, CFG_ITLBNUM, CFG_DTLBNUM, CFG_TLB_TYPE, CFG_TLB_REP,
                     CFG_LDDEL, disas, CFG_ITBSZ, CFG_PWD, CFG_SVT, CFG_RSTADDR,
                     CFG_NCPU-1, CFG_DFIXED, CFG_SCAN, CFG_MMU_PAGE, CFG_BP, CFG_NP_ASI, CFG_WRPSR,
                     CFG_REX, CFG_ALTWIN)
        port map (clkm, rstn, ahbmi, ahbmo(i), ahbsi, ahbso, irqi(i), irqo(i), dbgi(i), dbgo(i));
    end generate;

    led(3)  <= not dbgo(0).error;
    led(2)  <= not dsuo.active;

    -- LEON3 Debug Support Unit
    dsugen : if CFG_DSU = 1 generate
      dsu0 : dsu3
        generic map (hindex => 2, haddr => 16#900#, hmask => 16#F00#, ahbpf => CFG_AHBPF,
                     ncpu   => CFG_NCPU, tbits => 30, tech => memtech, irq => 0, kbytes => CFG_ATBSZ)
        port map (rstn, clkm, ahbmi, ahbsi, ahbso(2), dbgo, dbgi, dsui, dsuo);

      --dsubre_pad : inpad generic map (tech  => padtech) port map (dsubre, dsui.break);

      dsui.enable <= '1';

    end generate;
  end generate;
  nodsu : if CFG_DSU = 0 generate
    ahbso(2) <= ahbs_none; dsuo.tstop <= '0'; dsuo.active <= '0';
  end generate;

  -- Debug UART
  dcomgen : if CFG_AHB_UART = 1 generate
    dcom0 : ahbuart
      generic map (hindex => CFG_NCPU, pindex => 4, paddr => 7)
      port map (rstn, clkm, dui, duo, apbi, apbo(4), ahbmi, ahbmo(CFG_NCPU));
    dsurx_pad : inpad generic map (tech  => padtech) port map (uart_tx_in, dui.rxd);
    dsutx_pad : outpad generic map (tech => padtech) port map (uart_rx_out, duo.txd);
    led(0) <= not dui.rxd;
    led(1) <= not duo.txd;
  end generate;
  nouah : if CFG_AHB_UART = 0 generate apbo(4) <= apb_none; end generate;

  ahbjtaggen0 :if CFG_AHB_JTAG = 1 generate
    ahbjtag0 : ahbjtag generic map(tech => fabtech, hindex => CFG_NCPU+CFG_AHB_UART)
      port map(rstn, clkm, tck, tms, tdi, tdo, ahbmi, ahbmo(CFG_NCPU+CFG_AHB_UART),
               open, open, open, open, open, open, open, gnd);
  end generate;

----------------------------------------------------------------------
---  DDR3 Memory controller ------------------------------------------
----------------------------------------------------------------------
  
--  nomig : if (CFG_MIG_7SERIES = 0) generate end generate;

  mig_gen : if (CFG_MIG_7SERIES = 1) generate
    gen_mig : if (USE_MIG_INTERFACE_MODEL /= true) generate
      ddrc : ahb2mig_7series_ddr3_dq16_ad15_ba3 generic map(
          hindex => 5, haddr => 16#400#, hmask => 16#F00#, pindex => 5, paddr => 5,
          SIM_BYPASS_INIT_CAL => SIM_BYPASS_INIT_CAL, SIMULATION => SIMULATION,
          USE_MIG_INTERFACE_MODEL => USE_MIG_INTERFACE_MODEL)
        port map(
          ddr3_dq         => ddr3_dq,
          ddr3_dqs_p      => ddr3_dqs_p,
          ddr3_dqs_n      => ddr3_dqs_n,
          ddr3_addr       => ddr3_addr,
          ddr3_ba         => ddr3_ba,
          ddr3_ras_n      => ddr3_ras_n,
          ddr3_cas_n      => ddr3_cas_n,
          ddr3_we_n       => ddr3_we_n,
          ddr3_reset_n    => ddr3_reset_n,
          ddr3_ck_p       => ddr3_ck_p,
          ddr3_ck_n       => ddr3_ck_n,
          ddr3_cke        => ddr3_cke,
          ddr3_dm         => ddr3_dm,
          ddr3_odt        => ddr3_odt,
          ahbsi           => ahbsi,
          ahbso           => ahbso(5),
          apbi            => apbi,
          apbo            => apbo(5),
          calib_done      => calib_done,
          rst_n_syn       => migrstn,
          rst_n_async     => cgo1.clklock,--rstraw,
          clk_amba        => clkm,
          sys_clk_i       => clkinmig,
 --          clk_ref_i       => clkref,
          ui_clk          => clkm, -- 100 MHz clk , DDR at 400 MHz
          ui_clk_sync_rst => open);
  
    clkgenmigin : clkgen
      generic map (clktech, 8, 4, 0, CFG_CLK_NOFB, 0, 0, 0, 100000)
      port map (sysclk, sysclk, clkinmig, open, open, open, open, cgi, cgo1, open, open, open);
  end generate gen_mig;
  
  gen_mig_model : if (USE_MIG_INTERFACE_MODEL = true) generate
    -- pragma translate_off
  
    mig_ahbram : ahbram_sim
      generic map (
        hindex   => 5,
        haddr    => 16#400#,
        hmask    => 16#F80#,
        tech     => 0,
        kbytes   => 1000,
        pipe     => 0,
        maccsz   => AHBDW,
        fname    => "ram.srec"
        )
      port map(
        rst     => rstn,
        clk     => clkm,
        ahbsi   => ahbsi,
        ahbso   => ahbso(5)
        );
  
    ddr3_dq           <= (others => 'Z');
    ddr3_dqs_p        <= (others => 'Z');
    ddr3_dqs_n        <= (others => 'Z');
    ddr3_addr         <= (others => '0');
    ddr3_ba           <= (others => '0');
    ddr3_ras_n        <= '0';
    ddr3_cas_n        <= '0';
    ddr3_we_n         <= '0';
    ddr3_ck_p         <= (others => '0');
    ddr3_ck_n         <= (others => '0');
    ddr3_cke          <= (others => '0');
    ddr3_dm           <= (others => '0');
    ddr3_odt          <= (others => '0');
  
    --calib_done        : out   std_logic;
    calib_done <= '1';
       
    --ui_clk            : out   std_logic;
    clkm <= not clkm after 10.0 ns;
      
    --ui_clk_sync_rst   : out   std_logic
    -- n/a
    -- pragma translate_on
  
  end generate gen_mig_model;    end generate;

----------------------------------------------------------------------
---  SPI Memory controller -------------------------------------------
----------------------------------------------------------------------
  spi_gen: if CFG_SPIMCTRL = 1 generate
    -- OPTIONALY set the offset generic (only affect reads).
    -- The first 4MB are used for loading the FPGA.
    -- For dual ouptut: readcmd => 16#3B#, dualoutput => 1
    spimctrl1 : spimctrl
      generic map (hindex => 7, hirq => 7, faddr => 16#000#, fmask => 16#ff0#,
                   ioaddr => 16#700#, iomask => 16#fff#, spliten => CFG_SPLIT,
                   sdcard => CFG_SPIMCTRL_SDCARD, readcmd => CFG_SPIMCTRL_READCMD,
                   dummybyte => CFG_SPIMCTRL_DUMMYBYTE, 
                   dualoutput => CFG_SPIMCTRL_DUALOUTPUT, scaler => CFG_SPIMCTRL_SCALER,
                   altscaler => CFG_SPIMCTRL_ASCALER)
      port map (rstn, clkm, ahbsi, ahbso(7), spmi, spmo);

    qspi_dq(3) <= '1'; qspi_dq(2) <= '1';
    spi_mosi_pad : outpad generic map (tech => padtech)
      port map (qspi_dq(0), spmo.mosi);
    spi_miso_pad : inpad generic map (tech => padtech)
      port map (qspi_dq(1), spmi.miso);
    spi_slvsel0_pad : outpad generic map (tech => padtech)
      port map (qspi_cs, spmo.csn);
    spi_sck_pad : outpad generic map (tech => padtech)
      port map (scl, spmo.sck);
  end generate;

  nospi: if CFG_SPIMCTRL = 0 generate
      ahbso(7) <= ahbs_none;
  end generate;

----------------------------------------------------------------------
---  APB Bridge and various periherals -------------------------------
----------------------------------------------------------------------

  -- APB Bridge
  apb0 : apbctrl
    generic map (hindex => 1, haddr => CFG_APBADDR)
    port map (rstn, clkm, ahbsi, ahbso(1), apbi, apbo);

  -- Interrupt controller
  irqctrl : if CFG_IRQ3_ENABLE /= 0 generate
    irqctrl0 : irqmp
      generic map (pindex => 2, paddr => 2, ncpu => CFG_NCPU)
      port map (rstn, clkm, apbi, apbo(2), irqo, irqi);
  end generate;
  irq3 : if CFG_IRQ3_ENABLE = 0 generate
    x : for i in 0 to CFG_NCPU-1 generate
      irqi(i).irl <= "0000";
    end generate;
    apbo(2) <= apb_none;
  end generate;

  -- Timer Unit
  gpt : if CFG_GPT_ENABLE /= 0 generate
    timer0 : gptimer
      generic map (pindex => 3, paddr => 3, pirq => CFG_GPT_IRQ,
                   sepirq => CFG_GPT_SEPIRQ, sbits => CFG_GPT_SW,
                   ntimers => CFG_GPT_NTIM, nbits  => CFG_GPT_TW)
      port map (rstn, clkm, apbi, apbo(3), gpti, open);
    gpti <= gpti_dhalt_drive(dsuo.tstop);
  end generate;
  notim : if CFG_GPT_ENABLE = 0 generate apbo(3) <= apb_none; end generate;

  ua1 : if CFG_UART1_ENABLE /= 0 generate
    uart1 : apbuart                     -- UART 1
      generic map (pindex   => 1, paddr => 1, pirq => 2, console => dbguart, fifosize => CFG_UART1_FIFO)
      port map (rstn, clkm, apbi, apbo(1), u1i, u1o);
    u1i.rxd    <= rxd1;
    u1i.ctsn   <= '0';
    u1i.extclk <= '0';
    txd1       <= u1o.txd;
  end generate;
  noua0 : if CFG_UART1_ENABLE = 0 generate apbo(1) <= apb_none; end generate;

-----------------------------------------------------------------------
---  ETHERNET ---------------------------------------------------------
-----------------------------------------------------------------------

    eth0 : if CFG_GRETH = 1 generate -- Gaisler ethernet MAC
      e1 : grethm
       generic map(
        hindex => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG,
        pindex => 15, paddr => 15, pirq => 12, memtech => memtech,
        mdcscaler => CPU_FREQ/1000, rmii => 0, enable_mdio => 1, fifosize => CFG_ETH_FIFO,
        nsync => 2, edcl => CFG_DSU_ETH, edclbufsz => CFG_ETH_BUF, phyrstadr => 1,
        macaddrh => CFG_ETH_ENM, macaddrl => CFG_ETH_ENL, enable_mdint => 1,
        ipaddrh => CFG_ETH_IPM, ipaddrl => CFG_ETH_IPL,
        giga => CFG_GRETH1G, ramdebug => 0, gmiimode => 1)
       port map( rst => rstn, clk => clkm, ahbmi => ahbmi,
        ahbmo => ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG),
        apbi => apbi, apbo => apbo(15), ethi => ethi, etho => etho);

    -----------------------------------------------------------------------------
    -- An IDELAYCTRL primitive needs to be instantiated for the Fixed Tap Delay
    -- mode of the IDELAY.
    -- All IDELAYs in Fixed Tap Delay mode and the IDELAYCTRL primitives have
    -- to be LOC'ed in the UCF file.
    -----------------------------------------------------------------------------
    dlyctrl0 : IDELAYCTRL port map (
       RDY    => OPEN,
       REFCLK => sysclk,
       RST    => idelayctrl_reset
    );

      delay_rgmii_rx_ctl0 : IODELAYE1 generic map(
         DELAY_SRC   => "I",
         IDELAY_TYPE => "FIXED",
         IDELAY_VALUE => 20,
         ODELAY_VALUE => 20
      )
      port map(
         IDATAIN     => rgmiii_buf.rx_dv,
         ODATAIN     => '0',
         DATAOUT     => rgmiii.rx_dv,
         DATAIN      => '0',
         C           => '0',
         T           => '1',
         CE          => '0',
         INC         => '0',
         CINVCTRL    => '0',
         CLKIN       => '0',
         CNTVALUEIN  => "00000",
         CNTVALUEOUT => OPEN,
         RST         => '0'
      );

     rgmii_rxd : for i in 0 to 3 generate
      delay_rgmii_rxd0 : IODELAYE1 generic map(
         DELAY_SRC   => "I",
         IDELAY_TYPE => "FIXED",
         IDELAY_VALUE => 20,
         ODELAY_VALUE => 20
      )
      port map(
         IDATAIN     => rgmiii_buf.rxd(i),
         ODATAIN     => '0',
         DATAOUT     => rgmiii.rxd(i),
         DATAIN      => '0',
         C           => '0',
         T           => '1',
         CE          => '0',
         INC         => '0',
         CINVCTRL    => '0',
         CLKIN       => '0',
         CNTVALUEIN  => "00000",
         CNTVALUEOUT => OPEN,
         RST         => '0'
      );
     end generate;

   phy_txclk_delay <= rgmiio.tx_clk;
  
   -- Generate a synchron delayed reset for Xilinx IO delay
   rst1 : rstgen
    generic map (acthigh => 1)
    port map (lcpu_resetn, sysclk, lock, rstgtxn, OPEN);

   process (sysclk,rstgtxn)
    begin
     if (rstgtxn = '0') then
       idelay_reset_cnt <= (others => '0');
       idelayctrl_reset <= '1';
     elsif rising_edge(sysclk) then
       if (idelay_reset_cnt > "1110") then
          idelay_reset_cnt <= (others => '1');
          idelayctrl_reset <= '0';
       else
          idelay_reset_cnt <= idelay_reset_cnt + 1;
          idelayctrl_reset <= '1';
       end if;
     end if;
   end process;

    -- RGMII Interface
    rgmii0 : rgmii generic map (pindex => 11, paddr => 16#010#, pmask => 16#ff0#, tech => fabtech,
                               gmii => CFG_GRETH1G, debugmem => 1, abits => 8, no_clk_mux => 0,
                               pirq => 11, use90degtxclk => 0, mode100 => 1)
      port map (rstn, ethi, etho, rgmiii, rgmiio, clkm, rstn, apbi, apbo(11));

      egtxc_pad : outpad generic map (tech => padtech, level => cmos, voltage => x25v, slew => 1) 
        port map (phy_txclk, phy_txclk_delay);
      erxc_pad : clkpad generic map (tech => padtech, level => cmos, voltage => x25v, arch => 1) 
        port map (phy_rxclk, rgmiii.rx_clk);

      erxd_pad : inpadv generic map (tech => padtech, level => cmos, voltage => x25v, width => 4) 
        port map (phy_rxd, rgmiii_buf.rxd(3 downto 0));
      erxdv_pad : inpad generic map (tech => padtech, level => cmos, voltage => x25v) 
        port map (phy_rxctl_rxdv, rgmiii_buf.rx_dv);

      etxd_pad : outpadv generic map (tech => padtech, level => cmos, voltage => x25v, slew => 1, width => 4) 
        port map (phy_txd, rgmiio.txd(3 downto 0));
      etxen_pad : outpad generic map (tech => padtech, level => cmos, voltage => x25v, slew => 1) 
        port map (phy_txctl_txen, rgmiio.tx_en);

      emdio_pad : iopad generic map (tech => padtech, level => cmos, voltage => x25v) 
        port map (phy_mdio, rgmiio.mdio_o, rgmiio.mdio_oe, rgmiii.mdio_i);
      emdc_pad : outpad generic map (tech => padtech, level => cmos, voltage => x25v) 
        port map (phy_mdc, rgmiio.mdc);

      eint_pad : inpad generic map (tech => padtech, level => cmos, voltage => x25v) 
        port map (phy_int, rgmiii.mdint);

      erst_pad : outpad generic map (tech => padtech, level => cmos, voltage => x25v) 
        port map (phy_reset, rgmiio.reset);

      -- Use system clock for RGMII interface
      rgmiii.gtx_clk   <= clkm;
      
    end generate;

    noeth0 : if CFG_GRETH = 0 generate
      -- TODO:
    end generate;

-----------------------------------------------------------------------
---  AHB ROM ----------------------------------------------------------
-----------------------------------------------------------------------

  bpromgen : if CFG_AHBROMEN /= 0 generate
    brom : entity work.ahbrom
      generic map (hindex => 6, haddr => CFG_AHBRODDR, pipe => CFG_AHBROPIP)
      port map ( rstn, clkm, ahbsi, ahbso(6));
  end generate;
  nobpromgen : if CFG_AHBROMEN = 0 generate
     ahbso(6) <= ahbs_none;
  end generate;

-----------------------------------------------------------------------
---  AHB RAM ----------------------------------------------------------
-----------------------------------------------------------------------

  ahbramgen : if CFG_AHBRAMEN = 1 generate
    ahbram0 : ahbram
      generic map (hindex => 3, haddr => CFG_AHBRADDR, tech => CFG_MEMTECH,
                   kbytes => CFG_AHBRSZ, pipe => CFG_AHBRPIPE)
      port map (rstn, clkm, ahbsi, ahbso(3));
  end generate;
  nram : if CFG_AHBRAMEN = 0 generate ahbso(3) <= ahbs_none; end generate;

-----------------------------------------------------------------------
--  Test report module, only used for simulation ----------------------
-----------------------------------------------------------------------

--pragma translate_off
  test0 : ahbrep generic map (hindex => 4, haddr => 16#200#)
    port map (rstn, clkm, ahbsi, ahbso(4));
--pragma translate_on

-----------------------------------------------------------------------
---  Drive unused bus elements  ---------------------------------------
-----------------------------------------------------------------------

  nam1 : for i in (CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_GRETH+1) to NAHBMST-1 generate
    ahbmo(i) <= ahbm_none;
  end generate;

-----------------------------------------------------------------------
---  Boot message  ----------------------------------------------------
-----------------------------------------------------------------------

-- pragma translate_off
  x : report_design
    generic map (
      msg1 => "LEON3 Demonstration design for Digilent Nexys Video board",
      fabtech => tech_table(fabtech), memtech => tech_table(memtech),
      mdel => 1
      );
-- pragma translate_on

end rtl;
