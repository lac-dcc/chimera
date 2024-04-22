------------------------------------------------------------------------------
--  LEON3 Demonstration design
--  Copyright (C) 2013 Aeroflex Gaisler
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
use unisim.BUFG;
use unisim.PLLE2_ADV;
use unisim.STARTUPE2;
--pragma translate_on
library esa;
use esa.memoryctrl.all;
use work.config.all;

library testgrouppolito;
use testgrouppolito.dprc_pkg.all;

entity leon3mp is
  generic (
    fabtech  : integer := CFG_FABTECH;
    memtech  : integer := CFG_MEMTECH;
    padtech  : integer := CFG_PADTECH;
    clktech  : integer := CFG_CLKTECH;
    disas    : integer := CFG_DISAS;     -- Enable disassembly to console
    dbguart  : integer := CFG_DUART;     -- Print UART on console
    pclow    : integer := CFG_PCLOW;
    SIM_BYPASS_INIT_CAL : string := "OFF";
    SIMULATION          : string := "FALSE";
    USE_MIG_INTERFACE_MODEL : boolean := false
    );
  port (
    sys_clk_i             : in    std_ulogic;

    -- onBoard DDR2
    ddr2_dq         : inout   std_logic_vector(15 downto 0);
    ddr2_addr       : out   std_logic_vector(12 downto 0);
    ddr2_ba         : out   std_logic_vector(2 downto 0);
    ddr2_ras_n      : out   std_ulogic;
    ddr2_cas_n      : out   std_ulogic;
    ddr2_we_n       : out   std_ulogic;
    ddr2_cke        : out   std_logic_vector(0 downto 0);
    ddr2_odt        : out   std_logic_vector(0 downto 0);
    ddr2_cs_n       : out   std_logic_vector(0 downto 0);
    ddr2_dm         : out   std_logic_vector(1 downto 0);
    ddr2_dqs_p      : inout   std_logic_vector(1 downto 0);
    ddr2_dqs_n      : inout   std_logic_vector(1 downto 0);
    ddr2_ck_p       : out   std_logic_vector(0 downto 0);
    ddr2_ck_n       : out   std_logic_vector(0 downto 0);

    -- SPI
    QspiCSn         : out   std_ulogic;
    QspiDB          : inout std_logic_vector(3 downto 0);
    --pragma translate_off
    QspiClk         : out std_ulogic;
    --pragma translate_on

    -- 7 segment display
    --seg             : out   std_logic_vector(6 downto 0);
    --an              : out   std_logic_vector(7 downto 0);

    -- LEDs
    Led             : out   std_logic_vector(15 downto 0);

    -- Switches
    sw              : in    std_logic_vector(15 downto 0);

    -- Buttons
    btnCpuResetn    : in    std_ulogic;
    btn             : in    std_logic_vector(4 downto 0);

    -- VGA Connector
    --vgaRed          : out   std_logic_vector(2 downto 0);
    --vgaGreen        : out   std_logic_vector(2 downto 0);
    --vgaBlue         : out   std_logic_vector(2 downto 1);

    --Hsync           : out   std_ulogic;
    --Vsync           : out   std_ulogic;

    -- 12 pin connectors
    --ja              : inout std_logic_vector(7 downto 0);
    --jb              : inout std_logic_vector(7 downto 0);
    --jc              : inout std_logic_vector(7 downto 0);
    --jd              : inout std_logic_vector(7 downto 0);

    -- SMSC ethernet PHY
    eth_rstn         : out   std_ulogic;
    eth_crsdv        : in    std_ulogic;
    eth_refclk       : out   std_ulogic;

    eth_txd          : out   std_logic_vector(1 downto 0);
    eth_txen         : out   std_ulogic;

    eth_rxd          : in    std_logic_vector(1 downto 0);
    eth_rxerr        : in    std_ulogic;

    eth_mdc          : out   std_ulogic;
    eth_mdio         : inout std_logic;

    -- Pic USB-HID interface
    --~ PS2KeyboardData : inout std_logic;
    --~ PS2KeyboardClk  : inout std_logic;

    --~ PS2MouseData    : inout std_logic;
    --~ PS2MouseClk     : inout std_logic;

    --~ PicGpio         : out   std_logic_vector(1 downto 0);

    -- USB-RS232 interface
    uart_txd_in         : in    std_logic;
    uart_rxd_out        : out   std_logic);
end;

architecture rtl of leon3mp is
  component PLLE2_ADV
  generic (
     BANDWIDTH : string := "OPTIMIZED";
     CLKFBOUT_MULT : integer := 5;
     CLKFBOUT_PHASE : real := 0.0;
     CLKIN1_PERIOD : real := 0.0;
     CLKIN2_PERIOD : real := 0.0;
     CLKOUT0_DIVIDE : integer := 1;
     CLKOUT0_DUTY_CYCLE : real := 0.5;
     CLKOUT0_PHASE : real := 0.0;
     CLKOUT1_DIVIDE : integer := 1;
     CLKOUT1_DUTY_CYCLE : real := 0.5;
     CLKOUT1_PHASE : real := 0.0;
     CLKOUT2_DIVIDE : integer := 1;
     CLKOUT2_DUTY_CYCLE : real := 0.5;
     CLKOUT2_PHASE : real := 0.0;
     CLKOUT3_DIVIDE : integer := 1;
     CLKOUT3_DUTY_CYCLE : real := 0.5;
     CLKOUT3_PHASE : real := 0.0;
     CLKOUT4_DIVIDE : integer := 1;
     CLKOUT4_DUTY_CYCLE : real := 0.5;
     CLKOUT4_PHASE : real := 0.0;
     CLKOUT5_DIVIDE : integer := 1;
     CLKOUT5_DUTY_CYCLE : real := 0.5;
     CLKOUT5_PHASE : real := 0.0;
     COMPENSATION : string := "ZHOLD";
     DIVCLK_DIVIDE : integer := 1;
     REF_JITTER1 : real := 0.0;
     REF_JITTER2 : real := 0.0;
     STARTUP_WAIT : string := "FALSE"
  );
  port (
     CLKFBOUT : out std_ulogic := '0';
     CLKOUT0 : out std_ulogic := '0';
     CLKOUT1 : out std_ulogic := '0';
     CLKOUT2 : out std_ulogic := '0';
     CLKOUT3 : out std_ulogic := '0';
     CLKOUT4 : out std_ulogic := '0';
     CLKOUT5 : out std_ulogic := '0';
     DO : out std_logic_vector (15 downto 0);
     DRDY : out std_ulogic := '0';
     LOCKED : out std_ulogic := '0';
     CLKFBIN : in std_ulogic;
     CLKIN1 : in std_ulogic;
     CLKIN2 : in std_ulogic;
     CLKINSEL : in std_ulogic;
     DADDR : in std_logic_vector(6 downto 0);
     DCLK : in std_ulogic;
     DEN : in std_ulogic;
     DI : in std_logic_vector(15 downto 0);
     DWE : in std_ulogic;
     PWRDWN : in std_ulogic;
     RST : in std_ulogic
  );
  end component;

 component STARTUPE2
 generic (
    PROG_USR : string := "FALSE";
    SIM_CCLK_FREQ : real := 0.0
  );
  port (
    CFGCLK               : out std_ulogic;
    CFGMCLK              : out std_ulogic;
    EOS                  : out std_ulogic;
    PREQ                 : out std_ulogic;
    CLK                  : in std_ulogic;
    GSR                  : in std_ulogic;
    GTS                  : in std_ulogic;
    KEYCLEARB            : in std_ulogic;
    PACK                 : in std_ulogic;
    USRCCLKO             : in std_ulogic;
    USRCCLKTS            : in std_ulogic;
    USRDONEO             : in std_ulogic;
    USRDONETS            : in std_ulogic
  );
  end component;

  component BUFG port (O : out std_logic; I : in std_logic); end component;

  signal CLKFBOUT      : std_logic;
  signal CLKFBIN       : std_logic;
  signal eth_pll_rst   : std_logic;
  signal eth_clk_nobuf : std_logic;
  signal eth_clk90_nobuf : std_logic;
  signal eth_clk       : std_logic;
  signal eth_clk90     : std_logic;

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

  signal spii : spi_in_type;
  signal spio : spi_out_type;

  signal spmi : spimctrl_in_type;
  signal spmo : spimctrl_out_type;

  signal clkm : std_ulogic
  -- pragma translate_off 
  := '0'
  -- pragma translate_on
  ;
  
  signal clkm2x, clk200, clkfb, pllrst, rstn, clkml  : std_ulogic;
  signal tck, tms, tdi, tdo : std_ulogic;
  signal rstraw             : std_logic;
  signal btnCpuReset        : std_logic;
  signal lock, lock0        : std_logic;
  signal clkinmig           : std_logic;

  signal ddr0_clkv        : std_logic_vector(2 downto 0);
  signal ddr0_clkbv       : std_logic_vector(2 downto 0);
  signal ddr0_cke         : std_logic_vector(1 downto 0);
  signal ddr0_csb         : std_logic_vector(1 downto 0);
  signal ddr0_odt         : std_logic_vector(1 downto 0);
  signal ddr0_addr        : std_logic_vector(13 downto 0);
  signal ddr0_clk_fb      : std_logic;

  signal clkref, calib_done, migrstn : std_logic;

  -- RS232 APB Uart
  signal rxd1 : std_logic;
  signal txd1 : std_logic;

  attribute keep                     : boolean;
  attribute syn_keep                 : boolean;
  attribute syn_preserve             : boolean;
  attribute syn_keep of lock         : signal is true;
  attribute syn_keep of clkml        : signal is true;
  attribute syn_keep of clkm         : signal is true;
  attribute syn_preserve of clkml    : signal is true;
  attribute syn_preserve of clkm     : signal is true;
  attribute keep of lock             : signal is true;
  attribute keep of clkml            : signal is true;
  attribute keep of clkm             : signal is true;

  constant BOARD_FREQ : integer := 100000;                                -- CLK input frequency in KHz
  constant CPU_FREQ   : integer := BOARD_FREQ * CFG_CLKMUL / CFG_CLKDIV;  -- cpu frequency in KHz

  ----------------------------------------------------------------------
  ---  FIR component declaration  --------------------------------------
  ----------------------------------------------------------------------
  component fir_ahb_dma_apb is
  generic (
    hindex  : integer := 0;
    pindex  : integer := 0;
    paddr : integer := 0;
    pmask : integer := 16#fff#;
    technology : integer := virtex4);
  port ( 
    clk   : in  std_logic; 
    rstn    : in  std_logic; 
    apbi  : in  apb_slv_in_type; 
    apbo  : out apb_slv_out_type;
    ahbin : in  ahb_mst_in_type;
    ahbout  : out ahb_mst_out_type;
    rm_reset:   in  std_logic
  );
  end component;
  
  signal rm_reset : std_logic_vector(31 downto 0);

begin

----------------------------------------------------------------------
---  Reset and Clock generation  -------------------------------------
----------------------------------------------------------------------

  vcc <= '1';
  gnd <= '0';

  led(15 downto 6) <= (others =>'0'); -- unused leds off

  btnCpuReset<= not btnCpuResetn;
  cgi.pllctrl <= "00";
  cgi.pllrst <= rstraw;
  pllrst <= not cgi.pllrst;

  rst0 : rstgen generic map (acthigh => 1)
    port map (btnCpuReset, clkm, lock, rstn, rstraw);
  lock <= calib_done when CFG_MIG_7SERIES = 1 else cgo.clklock and lock0;
  led(4) <= lock;
  led(5) <= lock0;

  rst1 : rstgen         -- reset generator
  generic map (acthigh => 1)
  port map (btnCpuReset, clkm, lock, migrstn, open);

  -- clock generator
  clkgen_gen: if (CFG_MIG_7SERIES = 0) generate
    clkgen0 : clkgen
      generic map (fabtech, CFG_CLKMUL, CFG_CLKDIV, 0, 0, 0, 0, 0, BOARD_FREQ, 0)
      port map (sys_clk_i, gnd, clkm, open, clkm2x, open, open, cgi, cgo, open, open, open);
  end generate;

----------------------------------------------------------------------
---  AHB CONTROLLER --------------------------------------------------
----------------------------------------------------------------------

  ahb0 : ahbctrl
    generic map (defmast => CFG_DEFMST, split => CFG_SPLIT,
                 rrobin  => CFG_RROBIN, ioaddr => CFG_AHBIO, ioen => 1,
                 nahbm => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_GRETH+CFG_PRC*2,
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
                     CFG_NCPU-1, CFG_DFIXED, CFG_SCAN, CFG_MMU_PAGE, CFG_BP, CFG_NP_ASI, CFG_WRPSR)
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
    dsurx_pad : inpad generic map (tech  => padtech) port map (uart_txd_in, dui.rxd);
    dsutx_pad : outpad generic map (tech => padtech) port map (uart_rxd_out, duo.txd);
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
---  DDR2 Memory controller ------------------------------------------
----------------------------------------------------------------------
  ddr2gen: if (CFG_DDR2SP = 1) and (CFG_MIG_7SERIES = 0) generate
    ddrc : ddr2spa generic map (fabtech => fabtech, memtech => memtech, 
             hindex => 5, haddr => 16#400#, hmask => 16#F80#, ioaddr => 1, rstdel => 200, -- iomask generic default value
             MHz => CPU_FREQ/1000, TRFC => CFG_DDR2SP_TRFC, clkmul => 12,
             clkdiv => 6, col => CFG_DDR2SP_COL, Mbyte => CFG_DDR2SP_SIZE, 
             pwron => CFG_DDR2SP_INIT, ddrbits => CFG_DDR2SP_DATAWIDTH, raspipe => 0,
             ahbfreq => CPU_FREQ/1000, readdly => 0, rskew => 0, oepol => 0,
             ddelayb0 => CFG_DDR2SP_DELAY0, ddelayb1 => CFG_DDR2SP_DELAY1, 
             ddelayb2 => CFG_DDR2SP_DELAY2, ddelayb3 => CFG_DDR2SP_DELAY3,
             ddelayb4 => CFG_DDR2SP_DELAY4, ddelayb5 => CFG_DDR2SP_DELAY5, 
             ddelayb6 => CFG_DDR2SP_DELAY6, ddelayb7 => CFG_DDR2SP_DELAY7, -- cbdelayb0-3 generics not used in non-ft mode
             numidelctrl => 1, norefclk => 1, -- dqsse, ahbbits, bigmem, nclk, scantest and octen default
             nosync => CFG_DDR2SP_NOSYNC, eightbanks => 1, odten => 3, dqsgating => 0,
             burstlen => 8, ft => CFG_DDR2SP_FTEN, ftbits => CFG_DDR2SP_FTWIDTH)
            port map (
              btnCpuResetn, rstn, clkm, clkm, clkm, lock0, clkml, clkml, ahbsi, ahbso(5),
              ddr0_clkv, ddr0_clkbv, ddr0_clk_fb, ddr0_clk_fb,
              ddr0_cke, ddr0_csb, ddr2_we_n, ddr2_ras_n, ddr2_cas_n,
              ddr2_dm, ddr2_dqs_p, ddr2_dqs_n, ddr0_addr, ddr2_ba, ddr2_dq, ddr0_odt,open);
  
    ddr2_addr <= ddr0_addr(12 downto 0);
    ddr2_cke  <= ddr0_cke(0 downto 0); 
    ddr2_cs_n  <= ddr0_csb(0 downto 0);
    ddr2_ck_p(0) <= ddr0_clkv(0);
    ddr2_ck_n(0) <= ddr0_clkbv(0);
    ddr2_odt  <= ddr0_odt(0 downto 0);
  end generate;
  
  noddr2 : if (CFG_DDR2SP = 0) and (CFG_MIG_7SERIES = 0) generate lock0 <= '1'; end generate;

  mig_gen : if (CFG_DDR2SP = 0) and (CFG_MIG_7SERIES = 1) generate
    gen_mig : if (USE_MIG_INTERFACE_MODEL /= true) generate
      ddrc : ahb2mig_7series_ddr2_dq16_ad13_ba3 generic map(
          hindex => 5, haddr => 16#400#, hmask => 16#F80#, pindex => 5, paddr => 5,
          SIM_BYPASS_INIT_CAL => SIM_BYPASS_INIT_CAL, SIMULATION => SIMULATION, USE_MIG_INTERFACE_MODEL => USE_MIG_INTERFACE_MODEL)
        port map(
          ddr2_dq         => ddr2_dq,
          ddr2_dqs_p      => ddr2_dqs_p,
          ddr2_dqs_n      => ddr2_dqs_n,
          ddr2_addr       => ddr2_addr,
          ddr2_ba         => ddr2_ba,
          ddr2_ras_n      => ddr2_ras_n,
          ddr2_cas_n      => ddr2_cas_n,
          ddr2_we_n       => ddr2_we_n,
          ddr2_reset_n    => open,
          ddr2_ck_p       => ddr2_ck_p,
          ddr2_ck_n       => ddr2_ck_n,
          ddr2_cke        => ddr2_cke,
          ddr2_cs_n       => ddr2_cs_n,
          ddr2_dm         => ddr2_dm,
          ddr2_odt        => ddr2_odt,
          ahbsi           => ahbsi,
          ahbso           => ahbso(5),
          apbi            => apbi,
          apbo            => apbo(5),
          calib_done      => calib_done,
          rst_n_syn       => migrstn,
          rst_n_async     => cgo1.clklock,--rstraw,
          clk_amba        => clkm,
          sys_clk_i       => clkinmig,
          clk_ref_i       => clkref,
          ui_clk          => clkm, -- 70 MHz clk , DDR at 280 MHz (560 Mbps)
          ui_clk_sync_rst => open);
  
      clkgenmigref0 : clkgen
        generic map (clktech, 16, 8, 0,CFG_CLK_NOFB, 0, 0, 0, 100000)
        port map (sys_clk_i, sys_clk_i, clkref, open, open, open, open, cgi, cgo, open, open, open);

      clkgenmigin : clkgen
        generic map (clktech, 14, 20, 0,CFG_CLK_NOFB, 0, 0, 0, 100000)
        port map (sys_clk_i, sys_clk_i, clkinmig, open, open, open, open, cgi, cgo1, open, open, open);
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
  
       ddr2_dq           <= (others => 'Z');
       ddr2_dqs_p        <= (others => 'Z');
       ddr2_dqs_n        <= (others => 'Z');
       ddr2_addr         <= (others => '0');
       ddr2_ba           <= (others => '0');
       ddr2_ras_n        <= '0';
       ddr2_cas_n        <= '0';
       ddr2_we_n         <= '0';
       ddr2_ck_p         <= (others => '0');
       ddr2_ck_n         <= (others => '0');
       ddr2_cke          <= (others => '0');
       ddr2_cs_n         <= (others => '0');
       ddr2_dm           <= (others => '0');
       ddr2_odt          <= (others => '0');
  
      --calib_done        : out   std_logic;
       calib_done <= '1';
       
      --ui_clk            : out   std_logic;
      clkm <= not clkm after 13.333 ns;
      
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
    sdcard => CFG_SPIMCTRL_SDCARD, readcmd => CFG_SPIMCTRL_READCMD, dummybyte => CFG_SPIMCTRL_DUMMYBYTE, 
    dualoutput => CFG_SPIMCTRL_DUALOUTPUT, scaler => CFG_SPIMCTRL_SCALER, altscaler => CFG_SPIMCTRL_ASCALER)
  port map (rstn, clkm, ahbsi, ahbso(7), spmi, spmo);

  QspiDB(3) <= '1'; QspiDB(2) <= '1';
--  spi_bdr : iopad generic map (tech => padtech)
--    port map (QspiDB(0), spmo.mosi, spmo.mosioen, spmi.mosi);
  spi_mosi_pad : outpad generic map (tech => padtech)
    port map (QspiDB(0), spmo.mosi);
  spi_miso_pad : inpad generic map (tech => padtech)
    port map (QspiDB(1), spmi.miso);
  spi_slvsel0_pad : outpad generic map (tech => padtech)
    port map (QspiCSn, spmo.csn);

  -- MACRO for assigning the SPI output clock
  spicclk: STARTUPE2
  port map (--CFGCLK => open, CFGMCLK => open, EOS => open, PREQ => open,
    CLK => '0', GSR => '0', GTS => '0', KEYCLEARB => '0', PACK => '0',
    USRCCLKO =>  spmo.sck, USRCCLKTS => '0', USRDONEO => '1', USRDONETS => '0' );
  --pragma translate_off
  QspiClk <= spmo.sck;
  --pragma translate_on
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

  -- Time Unit
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
--    serrx_pad : inpad generic map (tech  => padtech) port map (dsurx, rxd1);
--    sertx_pad : outpad generic map (tech => padtech) port map (dsutx, txd1);
--    led(0) <= not rxd1;
--    led(1) <= not txd1;
  end generate;
  noua0 : if CFG_UART1_ENABLE = 0 generate apbo(1) <= apb_none; end generate;

-----------------------------------------------------------------------
---  ETHERNET ---------------------------------------------------------
-----------------------------------------------------------------------

  eth0 : if CFG_GRETH = 1 generate -- Gaisler ethernet MAC
    e1 : grethm
      generic map(hindex => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG,
                  pindex => 15, paddr => 15, pirq => 12, memtech => memtech,
                  mdcscaler => CPU_FREQ/1000, enable_mdio => 1, fifosize => CFG_ETH_FIFO,
                  nsync => 1, edcl => CFG_DSU_ETH, edclbufsz => CFG_ETH_BUF,
                  macaddrh => CFG_ETH_ENM, macaddrl => CFG_ETH_ENL, phyrstadr => 1,
                  ipaddrh => CFG_ETH_IPM, ipaddrl => CFG_ETH_IPL, giga => CFG_GRETH1G, rmii => 1)
      port map(rst => rstn, clk => clkm, ahbmi => ahbmi,
               ahbmo => ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG),
               apbi => apbi, apbo => apbo(15), ethi => ethi, etho => etho);
      eth_rstn<=rstn;
  end generate;
  etxc_pad : outpad generic map (tech => padtech)
      port map (eth_refclk, eth_clk);
  ethpads : if (CFG_GRETH = 1) generate
    emdio_pad : iopad generic map (tech => padtech)
      port map (eth_mdio, etho.mdio_o, etho.mdio_oe, ethi.mdio_i);
	ethi.rmii_clk<=eth_clk90;
    erxd_pad : inpadv generic map (tech => padtech, width => 2) --8
      port map (eth_rxd, ethi.rxd(1 downto 0));
    erxer_pad : inpad generic map (tech => padtech)
      port map (eth_rxerr, ethi.rx_er);
    erxcr_pad : inpad generic map (tech => padtech)
      port map (eth_crsdv, ethi.rx_crs);
	etxd_pad : outpadv generic map (tech => padtech, width => 2)
      port map (eth_txd, etho.txd(1 downto 0));
    etxen_pad : outpad generic map (tech => padtech)
      port map (eth_txen, etho.tx_en);
    emdc_pad : outpad generic map (tech => padtech)
      port map (eth_mdc, etho.mdc);
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
---  DYNAMIC PARTIAL RECONFIGURATION  ---------------------------------
-----------------------------------------------------------------------
  prc : if CFG_PRC = 1 generate
    p1 : dprc generic map(hindex => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_GRETH, pindex => 14, paddr => 14, clk_sel => 1, edac_en => CFG_EDAC_EN, pirq => 14,
                          technology => CFG_FABTECH, crc_en => CFG_CRC_EN, words_block => CFG_WORDS_BLOCK, fifo_dcm_inst => CFG_DCM_FIFO, fifo_depth => CFG_DPR_FIFO)
       port map(rstn => rstn, clkm => clkm, clkraw => '0', clk100 => sys_clk_i, ahbmi => ahbmi, ahbmo => ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_GRETH), 
                apbi => apbi, apbo => apbo(14), rm_reset => rm_reset);

  --------------------------------------------------------------------
  --  FIR component instantiation (for dprc demo)  -------------------
  --------------------------------------------------------------------
   fir_ex : FIR_AHB_DMA_APB
     generic map (hindex=>CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_GRETH+CFG_PRC, pindex=>13, paddr=>13, 
                     pmask=>16#fff#, technology =>CFG_FABTECH)
     port map (rstn=>rstn, clk=>clkm, apbi=>apbi, apbo=>apbo(13), ahbin=>ahbmi, 
                  ahbout=>ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_GRETH+CFG_PRC), rm_reset => rm_reset(0));
  end generate;


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

  nam1 : for i in (CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_GRETH+CFG_PRC*2+1) to NAHBMST-1 generate
    ahbmo(i) <= ahbm_none;
  end generate;

-----------------------------------------------------------------------
---  Boot message  ----------------------------------------------------
-----------------------------------------------------------------------

-- pragma translate_off
  x : report_design
    generic map (
      msg1 => "LEON3 Demonstration design for Digilent NEXYS 4 DDR board",
      fabtech => tech_table(fabtech), memtech => tech_table(memtech),
      mdel => 1
      );
-- pragma translate_on

-----------------------------------------------------------------------
---  Ethernet Clock Generation  ---------------------------------------
-----------------------------------------------------------------------

ethclk : if CFG_GRETH = 1 generate
  -- 50 MHz clock for output
  bufgclk0  : BUFG port map (I => eth_clk_nobuf, O => eth_clk);

  -- 50 MHz with +90 deg phase for Rx GRETH
  bufgclk45 : BUFG port map (I => eth_clk90_nobuf, O => eth_clk90);

  CLKFBIN <= CLKFBOUT;
  eth_pll_rst <= not cgi.pllrst;

  PLLE2_ADV_inst : PLLE2_ADV generic map (
    BANDWIDTH          => "OPTIMIZED",  -- OPTIMIZED, HIGH, LOW
    CLKFBOUT_MULT      => 8,   -- Multiply value for all CLKOUT, (2-64)
    CLKFBOUT_PHASE     => 0.0, -- Phase offset in degrees of CLKFB, (-360.000-360.000).
    -- CLKIN_PERIOD: Input clock period in nS to ps resolution (i.e. 33.333 is 30 MHz).
    CLKIN1_PERIOD      => 1000000.0/real(100000.0),
    CLKIN2_PERIOD      => 0.0,
    -- CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for CLKOUT (1-128)
    CLKOUT0_DIVIDE     => 16,
    CLKOUT1_DIVIDE     => 16,
    CLKOUT2_DIVIDE     => 1,
    CLKOUT3_DIVIDE     => 1,
    CLKOUT4_DIVIDE     => 1,
    CLKOUT5_DIVIDE     => 1,
    -- CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for CLKOUT outputs (0.001-0.999).
    CLKOUT0_DUTY_CYCLE => 0.5,
    CLKOUT1_DUTY_CYCLE => 0.5,
    CLKOUT2_DUTY_CYCLE => 0.5,
    CLKOUT3_DUTY_CYCLE => 0.5,
    CLKOUT4_DUTY_CYCLE => 0.5,
    CLKOUT5_DUTY_CYCLE => 0.5,
    -- CLKOUT0_PHASE - CLKOUT5_PHASE: Phase offset for CLKOUT outputs (-360.000-360.000).
    CLKOUT0_PHASE      => 0.0,
    CLKOUT1_PHASE      => 90.0,
    CLKOUT2_PHASE      => 0.0,
    CLKOUT3_PHASE      => 0.0,
    CLKOUT4_PHASE      => 0.0,
    CLKOUT5_PHASE      => 0.0,
    COMPENSATION       => "ZHOLD", -- ZHOLD, BUF_IN, EXTERNAL, INTERNAL
    DIVCLK_DIVIDE      => 1, -- Master division value (1-56)
    -- REF_JITTER: Reference input jitter in UI (0.000-0.999).
    REF_JITTER1        => 0.0,
    REF_JITTER2        => 0.0,
    STARTUP_WAIT       => "TRUE" -- Delay DONE until PLL Locks, ("TRUE"/"FALSE")
  )
  port map (
    -- Clock Outputs: 1-bit (each) output: User configurable clock outputs
    CLKOUT0           => eth_clk_nobuf,
    CLKOUT1           => eth_clk90_nobuf,
    CLKOUT2           => open,
    CLKOUT3           => open,
    CLKOUT4           => open,
    CLKOUT5           => open,
    -- DRP Ports: 16-bit (each) output: Dynamic reconfigration ports
    DO                => open,
    DRDY              => open,
    -- Feedback Clocks: 1-bit (each) output: Clock feedback ports
    CLKFBOUT          => CLKFBOUT,
    -- Status Ports: 1-bit (each) output: PLL status ports
    LOCKED            => open,
    -- Clock Inputs: 1-bit (each) input: Clock inputs
    CLKIN1            => sys_clk_i,
    CLKIN2            => '0',
    -- Con trol Ports: 1-bit (each) input: PLL control ports
    CLKINSEL          => '1',
    PWRDWN            => '0',
    RST               => eth_pll_rst,
    -- DRP Ports: 7-bit (each) input: Dynamic reconfigration ports
    DADDR             => "0000000",
    DCLK              => '0',
    DEN               => '0',
    DI                => "0000000000000000",
    DWE               => '0',
    -- Feedback Clocks: 1-bit (each) input: Clock feedback ports
    CLKFBIN           => CLKFBIN
  );
end generate;

end rtl;
