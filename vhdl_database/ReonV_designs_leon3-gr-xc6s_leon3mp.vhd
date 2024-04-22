-----------------------------------------------------------------------------
--  LEON3 Demonstration design
--  Copyright (C) 2011 Jiri Gaisler, Gaisler Research
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
use grlib.amba.all;
use grlib.stdlib.all;
use techmap.gencomp.all;
use techmap.allclkgen.all;
library gaisler;
use gaisler.memctrl.all;
use gaisler.leon3.all;
use gaisler.uart.all;
use gaisler.misc.all;
use gaisler.spi.all;
use gaisler.i2c.all;
use gaisler.can.all;
use gaisler.net.all;
use gaisler.jtag.all;
use gaisler.spacewire.all;
-- pragma translate_off
use gaisler.sim.all;
library unisim;
use unisim.all;
-- pragma translate_on

library esa;
use esa.memoryctrl.all;

use work.config.all;

entity leon3mp is
  generic (
    fabtech       : integer := CFG_FABTECH;
    memtech       : integer := CFG_MEMTECH;
    padtech       : integer := CFG_PADTECH;
    clktech       : integer := CFG_CLKTECH;
    disas         : integer := CFG_DISAS;   -- Enable disassembly to console
    dbguart       : integer := CFG_DUART;   -- Print UART on console
    pclow         : integer := CFG_PCLOW
  );
  port (
    resetn      : in  std_ulogic;
    clk         : in  std_ulogic;    -- 50 MHz main clock
    clk2        : in  std_ulogic;    -- User clock
    clk125      : in  std_ulogic;    -- 125 MHz clock from PHY
    wdogn       : out std_ulogic;
    address     : out std_logic_vector(24 downto 0);
    data        : inout std_logic_vector(31 downto 24);
    oen         : out std_ulogic;
    writen      : out std_ulogic;
    romsn       : out std_logic;

    ddr_clk        : out std_logic;
    ddr_clkb       : out std_logic;
    ddr_cke        : out std_logic;
    ddr_odt        : out std_logic;
    ddr_we         : out std_ulogic;                       -- ddr write enable
    ddr_ras        : out std_ulogic;                       -- ddr ras

    ddr_csn        : out std_ulogic;                       -- ddr csn
    ddr_cas        : out std_ulogic;                       -- ddr cas
    ddr_dm         : out std_logic_vector (1 downto 0);    -- ddr dm
    ddr_dqs        : inout std_logic_vector (1 downto 0);  -- ddr dqs
    ddr_dqsn       : inout std_logic_vector (1 downto 0);  -- ddr dqs n
    ddr_ad         : out std_logic_vector (12 downto 0);   -- ddr address
    ddr_ba         : out std_logic_vector (2 downto 0);    -- ddr bank address
    ddr_dq         : inout std_logic_vector (15 downto 0); -- ddr data
    ddr_rzq        : inout std_ulogic;
    ddr_zio        : inout std_ulogic;

    txd1        : out std_ulogic;          -- UART1 tx data
    rxd1        : in  std_ulogic;           -- UART1 rx data
    ctsn1       : in  std_ulogic;           -- UART1 ctsn
    rtsn1       : out std_ulogic;           -- UART1 trsn
    txd2        : out std_ulogic;          -- UART2 tx data
    rxd2        : in  std_ulogic;           -- UART2 rx data
    ctsn2       : in  std_ulogic;           -- UART2 ctsn
    rtsn2       : out std_ulogic;           -- UART2 rtsn

    pio          : inout std_logic_vector(17 downto 0);    -- I/O port
    genio        : inout std_logic_vector(59 downto 0);    -- I/O port
    switch       : in std_logic_vector(9 downto 0);    -- I/O port
    led          : out std_logic_vector(3 downto 0);    -- I/O port

    erx_clk      : in std_ulogic;
    emdio        : inout std_logic;      -- ethernet PHY interface
    erxd         : in std_logic_vector(3 downto 0);
    erx_dv       : in std_ulogic;
    emdint       : in std_ulogic;
    etx_clk      : out std_ulogic;
    etxd         : out std_logic_vector(3 downto 0);
    etx_en       : out std_ulogic;
    emdc         : out std_ulogic;

    ps2clk        : inout std_logic_vector(1 downto 0);
    ps2data       : inout std_logic_vector(1 downto 0);

    iic_scl       : inout std_ulogic;
    iic_sda       : inout std_ulogic;

    ddc_scl       : inout std_ulogic;
    ddc_sda       : inout std_ulogic;

    dvi_iic_scl   : inout std_logic;
    dvi_iic_sda   : inout std_logic;

    tft_lcd_data    : out std_logic_vector(11 downto 0);
    tft_lcd_clk_p   : out std_ulogic;
    tft_lcd_clk_n   : out std_ulogic;
    tft_lcd_hsync   : out std_ulogic;
    tft_lcd_vsync   : out std_ulogic;
    tft_lcd_de      : out std_ulogic;
    tft_lcd_reset_b : out std_ulogic;

    spw_clk         : in  std_ulogic;
    spw_rxdp        : in  std_logic_vector(0 to CFG_SPW_NUM-1);
    spw_rxdn        : in  std_logic_vector(0 to CFG_SPW_NUM-1);
    spw_rxsp        : in  std_logic_vector(0 to CFG_SPW_NUM-1);
    spw_rxsn        : in  std_logic_vector(0 to CFG_SPW_NUM-1);
    spw_txdp        : out std_logic_vector(0 to CFG_SPW_NUM-1);
    spw_txdn        : out std_logic_vector(0 to CFG_SPW_NUM-1);
    spw_txsp        : out std_logic_vector(0 to CFG_SPW_NUM-1);
    spw_txsn        : out std_logic_vector(0 to CFG_SPW_NUM-1);

    -- SPI flash
    spi_sel_n : inout std_ulogic;
    spi_clk   : out   std_ulogic;
    spi_mosi  : out   std_ulogic

   );
end;

architecture rtl of leon3mp is

component BUFG port (O : out std_logic; I : in std_logic); end component;

component IODELAY2
  generic (
     COUNTER_WRAPAROUND : string := "WRAPAROUND";
     DATA_RATE : string := "SDR";
     DELAY_SRC : string := "IO";
     IDELAY2_VALUE : integer := 0;
     IDELAY_MODE : string := "NORMAL";
     IDELAY_TYPE : string := "DEFAULT";
     IDELAY_VALUE : integer := 0;
     ODELAY_VALUE : integer := 0;
     SERDES_MODE : string := "NONE";
     SIM_TAPDELAY_VALUE : integer := 75
  );
  port (
     BUSY : out std_ulogic;
     DATAOUT : out std_ulogic;
     DATAOUT2 : out std_ulogic;
     DOUT : out std_ulogic;
     TOUT : out std_ulogic;
     CAL : in std_ulogic;
     CE : in std_ulogic;
     CLK : in std_ulogic;
     IDATAIN : in std_ulogic;
     INC : in std_ulogic;
     IOCLK0 : in std_ulogic;
     IOCLK1 : in std_ulogic;
     ODATAIN : in std_ulogic;
     RST : in std_ulogic;
     T : in std_ulogic
  );
end component;

attribute syn_netlist_hierarchy : boolean;
attribute syn_netlist_hierarchy of rtl : architecture is false;

constant use_eth_input_delay : integer := 1;
constant use_eth_output_delay : integer := 1;
constant use_eth_data_output_delay : integer := 1;
constant use_eth_input_delay_clk : integer := 0;
constant use_gtx_clk : integer := 0;

constant blength : integer := 12;
constant fifodepth : integer := 8;
constant maxahbm : integer := CFG_NCPU+CFG_AHB_UART+CFG_GRETH+
   CFG_AHB_JTAG+CFG_SPW_NUM*CFG_SPW_EN;


signal vcc, gnd   : std_logic;
signal memi  : memory_in_type;
signal memo  : memory_out_type;
signal wpo   : wprot_out_type;
signal sdi   : sdctrl_in_type;
signal sdo   : sdram_out_type;

signal apbi, apbi2  : apb_slv_in_type;
signal apbo, apbo2  : apb_slv_out_vector := (others => apb_none);
signal ahbsi : ahb_slv_in_type;
signal ahbso : ahb_slv_out_vector := (others => ahbs_none);
signal ahbmi : ahb_mst_in_type;
signal vahbmi : ahb_mst_in_type;
signal ahbmo : ahb_mst_out_vector := (others => ahbm_none);
signal vahbmo : ahb_mst_out_type;

signal clkm, rstn, rstraw, sdclkl : std_ulogic;
signal clk_200 : std_ulogic;
signal clk25, clk40, clk65 : std_ulogic;

signal cgi, cgi2, cgi3   : clkgen_in_type;
signal cgo, cgo2, cgo3   : clkgen_out_type;
signal u1i, u2i, dui : uart_in_type;
signal u1o, u2o, duo : uart_out_type;

signal irqi : irq_in_vector(0 to CFG_NCPU-1);
signal irqo : irq_out_vector(0 to CFG_NCPU-1);

signal dbgi : l3_debug_in_vector(0 to CFG_NCPU-1);
signal dbgo : l3_debug_out_vector(0 to CFG_NCPU-1);

signal dsui : dsu_in_type;
signal dsuo : dsu_out_type;

signal gmiii, rgmiii, rgmiii_buf, rgmii_pad : eth_in_type;
signal gmiio, rgmiio : eth_out_type;

signal gpti : gptimer_in_type;
signal gpto : gptimer_out_type;

signal gpioi : gpio_in_type;
signal gpioo : gpio_out_type;

signal gpioi2 : gpio_in_type;
signal gpioo2 : gpio_out_type;

signal gpioi3 : gpio_in_type;
signal gpioo3 : gpio_out_type;

signal can_lrx, can_ltx   : std_logic_vector(0 to 7);

signal lock, calib_done, clkml, lclk, rst, ndsuact, wdogl : std_ulogic := '0';
signal tck, tckn, tms, tdi, tdo : std_ulogic;

signal ethclk, ddr2clk : std_ulogic;

signal kbdi  : ps2_in_type;
signal kbdo  : ps2_out_type;
signal moui  : ps2_in_type;
signal mouo  : ps2_out_type;
signal vgao  : apbvga_out_type;
signal lcd_datal : std_logic_vector(11 downto 0);
signal lcd_hsyncl, lcd_vsyncl, lcd_del, lcd_reset_bl : std_ulogic;

signal i2ci, dvi_i2ci : i2c_in_type;
signal i2co, dvi_i2co : i2c_out_type;

signal spmi : spimctrl_in_type;
signal spmo : spimctrl_out_type;

signal spmi2 : spimctrl_in_type;
signal spmo2 : spimctrl_out_type;

constant BOARD_FREQ : integer := 50000;   -- input frequency in KHz
constant CPU_FREQ : integer := BOARD_FREQ * CFG_CLKMUL / CFG_CLKDIV;  -- cpu frequency in KHz
constant IOAEN : integer := CFG_CAN;
constant DDR2_FREQ  : integer := 200000;                               -- DDR2 input frequency in KHz


signal spwi : grspw_in_type_vector(0 to CFG_SPW_NUM-1);
signal spwo : grspw_out_type_vector(0 to CFG_SPW_NUM-1);
signal dtmp    : std_logic_vector(CFG_SPW_NUM*CFG_SPW_PORTS-1 downto 0);
signal stmp    : std_logic_vector(CFG_SPW_NUM*CFG_SPW_PORTS-1 downto 0);
signal spw_rxtxclk : std_ulogic;
signal spw_rxclkn  : std_ulogic;
signal spw_rxclk : std_logic_vector(0 to CFG_SPW_NUM*CFG_SPW_PORTS);
signal spw_rstn  : std_ulogic;
signal spw_rstn_sync  : std_ulogic;

signal stati : ahbstat_in_type;

signal fpi : grfpu_in_vector_type;
signal fpo : grfpu_out_vector_type;

signal rstgtxn          : std_logic;
signal idelay_reset_cnt : std_logic_vector(3 downto 0);
signal idelay_cal_cnt   : std_logic_vector(3 downto 0);
signal idelayctrl_reset : std_logic;
signal idelayctrl_cal   : std_logic;
signal rgmiii_rx_clk_n  : std_logic;
signal rgmiii_rx_clk_n_buf : std_logic;
signal rgmiio_tx_clk,rgmiio_tx_en : std_logic;
signal rgmiio_txd       : std_logic_vector(3 downto 0);

  -- Used for connecting input/output signals to the DDR2 controller
  signal core_ddr_clk  : std_logic_vector(2 downto 0);
  signal core_ddr_clkb : std_logic_vector(2 downto 0);
  signal core_ddr_cke  : std_logic_vector(1 downto 0);
  signal core_ddr_csb  : std_logic_vector(1 downto 0);
  signal core_ddr_ad   : std_logic_vector(13 downto 0);
  signal core_ddr_odt  : std_logic_vector(1 downto 0);


constant SPW_LOOP_BACK : integer := 0;

signal video_clk, clk50, clk100, spw100 : std_logic;  -- signals to vga_clkgen.
signal clk_sel : std_logic_vector(1 downto 0);
signal clkvga, clkvga_p, clkvga_n : std_ulogic;
signal clk_125, clk_125_pll, clk_125_bufg : std_ulogic;
signal nerror : std_ulogic;

attribute keep : boolean;
attribute syn_keep : boolean;
attribute syn_preserve : boolean;
attribute syn_keep of clk50 : signal is true;
attribute syn_preserve of clk50 : signal is true;
attribute keep of clk50 : signal is true;
attribute syn_keep of video_clk : signal is true;
attribute syn_preserve of video_clk : signal is true;
attribute keep of video_clk : signal is true;
attribute syn_preserve of ddr2clk : signal is true;
attribute keep of ddr2clk : signal is true;
attribute syn_keep of ddr2clk : signal is true;
attribute syn_preserve of spw100 : signal is true;
attribute keep of spw100 : signal is true;
attribute syn_preserve of clkm : signal is true;
attribute keep of clkm : signal is true;

begin

----------------------------------------------------------------------
---  Reset and Clock generation  -------------------------------------
----------------------------------------------------------------------

  vcc <= '1'; gnd <= '0';
  cgi.pllctrl <= "00"; cgi.pllrst <= rstraw;

  clk_pad : clkpad generic map (tech => padtech) port map (clk, lclk);
  ddr2clk <= lclk;
  ethclk  <= lclk;

 no_clk_mig : if CFG_MIG_DDR2 = 0 generate

  clkgen0 : clkgen        -- clock generator
    generic map (clktech, CFG_CLKMUL, CFG_CLKDIV, CFG_MCTRL_SDEN,
   CFG_CLK_NOFB, 0, 0, 0, BOARD_FREQ)
    port map (lclk, lclk, clkm, open, open, sdclkl, open, cgi, cgo, open, clk50, clk100);

  rst0 : rstgen         -- reset generator
   generic map(syncin => 1)
   port map (rst, clkm, lock, rstn, rstraw);

 end generate;

 clk_mig : if CFG_MIG_DDR2 = 1 generate
   clk50 <= clkm;
   rstraw <= rst;
   cgo.clklock <= '1';
 end generate;

  resetn_pad : inpad generic map (tech => padtech) port map (resetn, rst);

  lock <= cgo.clklock and calib_done;

----------------------------------------------------------------------
---  AHB CONTROLLER --------------------------------------------------
----------------------------------------------------------------------

  ahb0 : ahbctrl       -- AHB arbiter/multiplexer
  generic map (defmast => CFG_DEFMST, split => CFG_SPLIT,
   rrobin => CFG_RROBIN, ioaddr => CFG_AHBIO,
   ioen => IOAEN, nahbm => maxahbm, nahbs => 16)
  port map (rstn, clkm, ahbmi, ahbmo, ahbsi, ahbso);

----------------------------------------------------------------------
---  LEON3 processor and DSU -----------------------------------------
----------------------------------------------------------------------

  nosh : if CFG_GRFPUSH = 0 generate
    cpu : for i in 0 to CFG_NCPU-1 generate
      l3ft : if CFG_LEON3FT_EN /= 0 generate
        leon3ft0 : leon3ft		-- LEON3 processor
        generic map (i, fabtech, memtech, CFG_NWIN, CFG_DSU, CFG_FPU*(1-CFG_GRFPUSH), CFG_V8,
  	  0, CFG_MAC, pclow, CFG_NOTAG, CFG_NWP, CFG_ICEN, CFG_IREPL, CFG_ISETS, CFG_ILINE,
	  CFG_ISETSZ, CFG_ILOCK, CFG_DCEN, CFG_DREPL, CFG_DSETS, CFG_DLINE, CFG_DSETSZ,
	  CFG_DLOCK, CFG_DSNOOP, CFG_ILRAMEN, CFG_ILRAMSZ, CFG_ILRAMADDR, CFG_DLRAMEN,
          CFG_DLRAMSZ, CFG_DLRAMADDR, CFG_MMUEN, CFG_ITLBNUM, CFG_DTLBNUM, CFG_TLB_TYPE, CFG_TLB_REP,
          CFG_LDDEL, disas, CFG_ITBSZ, CFG_PWD, CFG_SVT, CFG_RSTADDR, CFG_NCPU-1,
	  CFG_IUFT_EN, CFG_FPUFT_EN, CFG_CACHE_FT_EN, CFG_RF_ERRINJ,
	  CFG_CACHE_ERRINJ, CFG_DFIXED, CFG_LEON3_NETLIST, CFG_SCAN, CFG_MMU_PAGE, CFG_BP,
          CFG_NP_ASI, CFG_WRPSR)
        port map (clkm, rstn, ahbmi, ahbmo(i), ahbsi, ahbso,
    		irqi(i), irqo(i), dbgi(i), dbgo(i), clkm);
      end generate;

      l3s : if CFG_LEON3FT_EN = 0 generate
        u0 : leon3s 		-- LEON3 processor
        generic map (i, fabtech, memtech, CFG_NWIN, CFG_DSU, CFG_FPU*(1-CFG_GRFPUSH), CFG_V8,
	  0, CFG_MAC, pclow, CFG_NOTAG, CFG_NWP, CFG_ICEN, CFG_IREPL, CFG_ISETS, CFG_ILINE,
	  CFG_ISETSZ, CFG_ILOCK, CFG_DCEN, CFG_DREPL, CFG_DSETS, CFG_DLINE, CFG_DSETSZ,
	  CFG_DLOCK, CFG_DSNOOP, CFG_ILRAMEN, CFG_ILRAMSZ, CFG_ILRAMADDR, CFG_DLRAMEN,
          CFG_DLRAMSZ, CFG_DLRAMADDR, CFG_MMUEN, CFG_ITLBNUM, CFG_DTLBNUM, CFG_TLB_TYPE, CFG_TLB_REP,
          CFG_LDDEL, disas, CFG_ITBSZ, CFG_PWD, CFG_SVT, CFG_RSTADDR, CFG_NCPU-1,
	  CFG_DFIXED, CFG_SCAN, CFG_MMU_PAGE, CFG_BP, CFG_NP_ASI, CFG_WRPSR)
        port map (clkm, rstn, ahbmi, ahbmo(i), ahbsi, ahbso,
    		irqi(i), irqo(i), dbgi(i), dbgo(i));
      end generate;
    end generate;
  end generate;

  sh : if CFG_GRFPUSH = 1 generate
    cpu : for i in 0 to CFG_NCPU-1 generate
      l3ft : if CFG_LEON3FT_EN /= 0 generate
        leon3ft0 : leon3ftsh		-- LEON3 processor
        generic map (i, fabtech, memtech, CFG_NWIN, CFG_DSU, CFG_FPU, CFG_V8,
  	  0, CFG_MAC, pclow, CFG_NOTAG, CFG_NWP, CFG_ICEN, CFG_IREPL, CFG_ISETS, CFG_ILINE,
	  CFG_ISETSZ, CFG_ILOCK, CFG_DCEN, CFG_DREPL, CFG_DSETS, CFG_DLINE, CFG_DSETSZ,
	  CFG_DLOCK, CFG_DSNOOP, CFG_ILRAMEN, CFG_ILRAMSZ, CFG_ILRAMADDR, CFG_DLRAMEN,
          CFG_DLRAMSZ, CFG_DLRAMADDR, CFG_MMUEN, CFG_ITLBNUM, CFG_DTLBNUM, CFG_TLB_TYPE, CFG_TLB_REP,
          CFG_LDDEL, disas, CFG_ITBSZ, CFG_PWD, CFG_SVT, CFG_RSTADDR, CFG_NCPU-1,
	  CFG_IUFT_EN, CFG_FPUFT_EN, CFG_CACHE_FT_EN, CFG_RF_ERRINJ,
	  CFG_CACHE_ERRINJ, CFG_DFIXED, CFG_LEON3_NETLIST, CFG_SCAN, CFG_MMU_PAGE,
          CFG_BP, CFG_NP_ASI, CFG_WRPSR)
        port map (clkm, rstn, ahbmi, ahbmo(i), ahbsi, ahbso,
    		irqi(i), irqo(i), dbgi(i), dbgo(i), clkm,  fpi(i), fpo(i));

      end generate;
      l3s : if CFG_LEON3FT_EN = 0 generate
        u0 : leon3sh 		-- LEON3 processor
        generic map (i, fabtech, memtech, CFG_NWIN, CFG_DSU, CFG_FPU, CFG_V8,
	  0, CFG_MAC, pclow, CFG_NOTAG, CFG_NWP, CFG_ICEN, CFG_IREPL, CFG_ISETS, CFG_ILINE,
	  CFG_ISETSZ, CFG_ILOCK, CFG_DCEN, CFG_DREPL, CFG_DSETS, CFG_DLINE, CFG_DSETSZ,
	  CFG_DLOCK, CFG_DSNOOP, CFG_ILRAMEN, CFG_ILRAMSZ, CFG_ILRAMADDR, CFG_DLRAMEN,
          CFG_DLRAMSZ, CFG_DLRAMADDR, CFG_MMUEN, CFG_ITLBNUM, CFG_DTLBNUM, CFG_TLB_TYPE, CFG_TLB_REP,
          CFG_LDDEL, disas, CFG_ITBSZ, CFG_PWD, CFG_SVT, CFG_RSTADDR, CFG_NCPU-1,
	  CFG_DFIXED, CFG_SCAN, CFG_MMU_PAGE, CFG_BP, CFG_NP_ASI, CFG_WRPSR)
        port map (clkm, rstn, ahbmi, ahbmo(i), ahbsi, ahbso,
    		irqi(i), irqo(i), dbgi(i), dbgo(i), fpi(i), fpo(i));
      end generate;
    end generate;

    grfpush0 : grfpushwx generic map ((CFG_FPU-1), CFG_NCPU, fabtech)
    port map (clkm, rstn, fpi, fpo);

  end generate;

  nerror <= dbgo(0).error;
  led1_pad : odpad generic map (tech => padtech) port map (led(1), nerror);

  dsugen : if CFG_DSU = 1 generate
      dsu0 : dsu3         -- LEON3 Debug Support Unit
      generic map (hindex => 2, haddr => 16#900#, hmask => 16#F00#,
         ncpu => CFG_NCPU, tbits => 30, tech => memtech, irq => 0, kbytes => CFG_ATBSZ)
      port map (rstn, clkm, ahbmi, ahbsi, ahbso(2), dbgo, dbgi, dsui, dsuo);
      dsuen_pad : inpad generic map (tech => padtech) port map (switch(7), dsui.enable);
      dsubre_pad : inpad generic map (tech => padtech) port map (switch(8), dsui.break);
      dsuact_pad : outpad generic map (tech => padtech) port map (led(0), ndsuact);
      ndsuact <= not dsuo.active;
  end generate;

  nodsu : if CFG_DSU = 0 generate
    dsuo.tstop <= '0'; dsuo.active <= '0'; ahbso(2) <= ahbs_none;
  end generate;

  dcomgen : if CFG_AHB_UART = 1 generate
    dcom0: ahbuart      -- Debug UART
    generic map (hindex => CFG_NCPU, pindex => 7, paddr => 7)
    port map (rstn, clkm, dui, duo, apbi, apbo(7), ahbmi, ahbmo(CFG_NCPU));
    dsurx_pad : inpad generic map (tech => padtech) port map (rxd2, dui.rxd);
    dsutx_pad : outpad generic map (tech => padtech) port map (txd2, duo.txd);
  end generate;
  nouah : if CFG_AHB_UART = 0 generate apbo(7) <= apb_none; end generate;

  ahbjtaggen0 :if CFG_AHB_JTAG = 1 generate
    ahbjtag0 : ahbjtag generic map(tech => fabtech, hindex => CFG_NCPU+CFG_AHB_UART)
      port map(rstn, clkm, tck, tms, tdi, tdo, ahbmi, ahbmo(CFG_NCPU+CFG_AHB_UART),
               open, open, open, open, open, open, open, gnd);
  end generate;

----------------------------------------------------------------------
---  Memory controllers ----------------------------------------------
----------------------------------------------------------------------

  memi.writen <= '1'; memi.wrn <= "1111"; memi.bwidth <= "00";
  memi.brdyn <= '0'; memi.bexcn <= '1';

  mctrl0 : if CFG_MCTRL_LEON2 /= 0 generate
    mctrl0 : mctrl generic map (hindex => 0, pindex => 0,
     paddr => 0, srbanks => 2, ram8 => CFG_MCTRL_RAM8BIT,
     ram16 => CFG_MCTRL_RAM16BIT, sden => CFG_MCTRL_SDEN,
     invclk => CFG_CLK_NOFB, sepbus => CFG_MCTRL_SEPBUS,
     pageburst => CFG_MCTRL_PAGE, rammask => 0, iomask => 0)
    port map (rstn, clkm, memi, memo, ahbsi, ahbso(0), apbi, apbo(0), wpo, sdo);

    addr_pad : outpadv generic map (width => 25, tech => padtech)
     port map (address, memo.address(24 downto 0));
    roms_pad : outpad generic map (tech => padtech)
     port map (romsn, memo.romsn(0));
    oen_pad  : outpad generic map (tech => padtech)
     port map (oen, memo.oen);
    wri_pad  : outpad generic map (tech => padtech)
     port map (writen, memo.writen);
    bdr : for i in 0 to 0 generate
        data_pad : iopadv generic map (tech => padtech, width => 8)
        port map (data(31-i*8 downto 24-i*8), memo.data(31-i*8 downto 24-i*8),
     memo.bdrive(i), memi.data(31-i*8 downto 24-i*8));
    end generate;
  end generate;
  nomctrl : if CFG_MCTRL_LEON2 = 0 generate
    romsn <= '1';  ahbso(0) <= ahbs_none;
  end generate;

-----------------------------------------------------------------------
---  Test report module  ----------------------------------------------
-----------------------------------------------------------------------

-- pragma translate_off

  test0 : ahbrep generic map (hindex => 6, haddr => 16#200#)
	port map (rstn, clkm, ahbsi, ahbso(6));

-- pragma translate_on

----------------------------------------------------------------------
---  DDR2 memory controller ------------------------------------------
----------------------------------------------------------------------

  ddr_csn <= '0';

  mig_gen : if (CFG_MIG_DDR2 = 1) generate
    ddrc : entity work.ahb2mig_grxc6s_2p
    generic map(
     hindex => 4, haddr => 16#400#, hmask => 16#F80#,
     pindex => 0, paddr => 0, vgamst => CFG_SVGA_ENABLE, vgaburst => 64,
     clkdiv => 10)
    port map(
     mcb3_dram_dq  	=> ddr_dq,
     mcb3_dram_a	=> ddr_ad,
     mcb3_dram_ba  	=> ddr_ba,
     mcb3_dram_ras_n	=> ddr_ras,
     mcb3_dram_cas_n	=> ddr_cas,
     mcb3_dram_we_n	=> ddr_we,
     mcb3_dram_odt	=> ddr_odt,
     mcb3_dram_cke	=> ddr_cke,
     mcb3_dram_dm	=> ddr_dm(0),
     mcb3_dram_udqs	=> ddr_dqs(1),
     mcb3_dram_udqs_n	=> ddr_dqsn(1),
     mcb3_rzq	=> ddr_rzq,
     mcb3_zio	=> ddr_zio,
     mcb3_dram_udm	=> ddr_dm(1),
     mcb3_dram_dqs	=> ddr_dqs(0),
     mcb3_dram_dqs_n	=> ddr_dqsn(0),
     mcb3_dram_ck	=> ddr_clk,
     mcb3_dram_ck_n	=> ddr_clkb,
     ahbsi => ahbsi,
     ahbso => ahbso(4),
     ahbmi => vahbmi,
     ahbmo => vahbmo,
     apbi  => apbi2,
     apbo  => apbo2(0),
     calib_done	=> calib_done,
     rst_n_syn	=> rstn,
     rst_n_async	=> rstraw,
     clk_amba	=> clkm,
     clk_mem_n	=> ddr2clk,
     clk_mem_p	=> ddr2clk,
     test_error	=> open,
     clk_125   	=> clk_125,
     clk_100   	=> clk100
    );
  end generate;

  noddr : if (CFG_DDR2SP+CFG_MIG_DDR2) = 0 generate calib_done <= '1'; end generate;

----------------------------------------------------------------------
---  SPI Memory Controller--------------------------------------------
----------------------------------------------------------------------

  spimc: if CFG_SPICTRL_ENABLE = 0 and CFG_SPIMCTRL = 1 generate
    spimctrl0 : spimctrl        -- SPI Memory Controller
      generic map (hindex => 3, hirq => 7, faddr => 16#e00#, fmask => 16#ff8#,
                   ioaddr => 16#002#, iomask => 16#fff#,
                   spliten => CFG_SPLIT, oepol  => 0,
                   sdcard => CFG_SPIMCTRL_SDCARD,
                   readcmd => CFG_SPIMCTRL_READCMD,
                   dummybyte => CFG_SPIMCTRL_DUMMYBYTE,
                   dualoutput => CFG_SPIMCTRL_DUALOUTPUT,
                   scaler => CFG_SPIMCTRL_SCALER,
                   altscaler => CFG_SPIMCTRL_ASCALER,
                   pwrupcnt => CFG_SPIMCTRL_PWRUPCNT)
      port map (rstn, clkm, ahbsi, ahbso(3), spmi, spmo);


    -- MISO is shared with Flash data 0
    spmi.miso <= memi.data(24);
    mosi_pad : outpad generic map (tech => padtech)
      port map (spi_mosi, spmo.mosi);
    sck_pad  : outpad generic map (tech => padtech)
      port map (spi_clk, spmo.sck);
    slvsel0_pad : odpad generic map (tech => padtech)
      port map (spi_sel_n, spmo.csn);
  end generate;

  nospimc: if ((CFG_SPICTRL_ENABLE = 0 and CFG_SPIMCTRL = 0) or
               (CFG_SPICTRL_ENABLE = 1 and CFG_SPIMCTRL = 1) or
               (CFG_SPICTRL_ENABLE = 1 and CFG_SPIMCTRL = 0))generate
    mosi_pad : outpad generic map (tech => padtech)
      port map (spi_mosi, '0');
    sck_pad  : outpad generic map (tech => padtech)
      port map (spi_clk, '0');
  end generate;

----------------------------------------------------------------------
---  APB Bridge and various periherals -------------------------------
----------------------------------------------------------------------

  apb0 : apbctrl            -- AHB/APB bridge
  generic map (hindex => 1, haddr => CFG_APBADDR, nslaves => 16)
  port map (rstn, clkm, ahbsi, ahbso(1), apbi, apbo );

  apb1 : apbctrl            -- AHB/APB bridge
  generic map (hindex => 13, haddr => CFG_APBADDR+1, nslaves => 16)
  port map (rstn, clkm, ahbsi, ahbso(13), apbi2, apbo2 );

  ua1 : if CFG_UART1_ENABLE /= 0 generate
    uart1 : apbuart         -- UART 1
    generic map (pindex => 1, paddr => 1,  pirq => 2, console => dbguart,
   fifosize => CFG_UART1_FIFO)
    port map (rstn, clkm, apbi, apbo(1), u1i, u1o);
    u1i.extclk <= '0';
    rxd1_pad : inpad generic map (tech => padtech) port map (rxd1, u1i.rxd);
    txd1_pad : outpad generic map (tech => padtech) port map (txd1, u1o.txd);
    cts1_pad : inpad generic map (tech => padtech) port map (ctsn1, u1i.ctsn);
    rts1_pad : outpad generic map (tech => padtech) port map (rtsn1, u1o.rtsn);
  end generate;
  noua0 : if CFG_UART1_ENABLE = 0 generate apbo(1) <= apb_none; end generate;
  rts1_pad : outpad generic map (tech => padtech) port map (rtsn2, '0');

  irqctrl : if CFG_IRQ3_ENABLE /= 0 generate
    irqctrl0 : irqmp         -- interrupt controller
    generic map (pindex => 2, paddr => 2, ncpu => CFG_NCPU)
    port map (rstn, clkm, apbi, apbo(2), irqo, irqi);
  end generate;
  irq3 : if CFG_IRQ3_ENABLE = 0 generate
    x : for i in 0 to CFG_NCPU-1 generate
      irqi(i).irl <= "0000";
    end generate;
    apbo(2) <= apb_none;
  end generate;

  gpt : if CFG_GPT_ENABLE /= 0 generate
    timer0 : gptimer          -- timer unit
    generic map (pindex => 3, paddr => 3, pirq => CFG_GPT_IRQ,
   sepirq => CFG_GPT_SEPIRQ, sbits => CFG_GPT_SW, ntimers => CFG_GPT_NTIM,
   nbits => CFG_GPT_TW, wdog => CFG_GPT_WDOGEN*CFG_GPT_WDOG)
    port map (rstn, clkm, apbi, apbo(3), gpti, gpto);
    gpti <= gpti_dhalt_drive(dsuo.tstop);
  end generate;
  wden : if CFG_GPT_WDOGEN /= 0 generate
    wdogl <= gpto.wdogn or not rstn;
    --wdogn_pad : odpad generic map (tech => padtech) port map (wdogn, wdogl);
    wdogn_pad : outpad generic map (tech => padtech) port map (wdogn, wdogl);
  end generate;
  wddis : if CFG_GPT_WDOGEN = 0 generate
    --wdogn_pad : odpad generic map (tech => padtech) port map (wdogn, vcc);
    wdogn_pad : outpad generic map (tech => padtech) port map (wdogn, vcc);
  end generate;

  nogpt : if CFG_GPT_ENABLE = 0 generate apbo(3) <= apb_none; end generate;

  kbd : if CFG_KBD_ENABLE /= 0 generate
    ps21 : apbps2 generic map(pindex => 4, paddr => 4, pirq => 4)
      port map(rstn, clkm, apbi, apbo(4), moui, mouo);
    ps20 : apbps2 generic map(pindex => 5, paddr => 5, pirq => 5)
      port map(rstn, clkm, apbi, apbo(5), kbdi, kbdo);
  end generate;
  nokbd : if CFG_KBD_ENABLE = 0 generate
   apbo(4) <= apb_none; mouo <= ps2o_none;
   apbo(5) <= apb_none; kbdo <= ps2o_none;
  end generate;
  kbdclk_pad : iopad generic map (tech => padtech)
      port map (ps2clk(1),kbdo.ps2_clk_o, kbdo.ps2_clk_oe, kbdi.ps2_clk_i);
  kbdata_pad : iopad generic map (tech => padtech)
        port map (ps2data(1), kbdo.ps2_data_o, kbdo.ps2_data_oe, kbdi.ps2_data_i);
  mouclk_pad : iopad generic map (tech => padtech)
      port map (ps2clk(0),mouo.ps2_clk_o, mouo.ps2_clk_oe, moui.ps2_clk_i);
  mouata_pad : iopad generic map (tech => padtech)
        port map (ps2data(0), mouo.ps2_data_o, mouo.ps2_data_oe, moui.ps2_data_i);

  vga : if CFG_VGA_ENABLE /= 0 generate
    vga0 : apbvga generic map(memtech => memtech, pindex => 6, paddr => 6)
       port map(rstn, clkm, ethclk, apbi, apbo(6), vgao);
    video_clk <= not ethclk;
   end generate;

  svga : if CFG_SVGA_ENABLE /= 0 generate
    svga0 : svgactrl generic map(memtech => memtech, pindex => 6, paddr => 6,
        hindex => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG,
   	clk0 => 20000, clk1 => 0, --1000000000/((BOARD_FREQ * CFG_CLKMUL)/CFG_CLKDIV),
	clk2 => 0, clk3 => 0, burstlen => 6)
       port map(rstn, clkm, video_clk, apbi, apbo(6), vgao, vahbmi,
      vahbmo, clk_sel);
  end generate;

  --b0 : techbuf generic map (2, fabtech) port map (clk50, video_clk);
  video_clk <= clk50;
  vgadvi : if (CFG_VGA_ENABLE + CFG_SVGA_ENABLE) /= 0 generate
    dvi0 : entity work.svga2ch7301c generic map (tech => fabtech, dynamic => 1)
      port map (clkm, vgao, video_clk, clkvga_p, clkvga_n,
                lcd_datal, lcd_hsyncl, lcd_vsyncl, lcd_del);
    i2cdvi : i2cmst
      generic map (pindex => 9, paddr => 9, pmask => 16#FFF#, pirq => 3)
      port map (rstn, clkm, apbi, apbo(9), dvi_i2ci, dvi_i2co);
  end generate;

  novga : if (CFG_VGA_ENABLE = 0 and CFG_SVGA_ENABLE = 0) generate
    apbo(6) <= apb_none; vgao <= vgao_none;
  end generate;

  tft_lcd_data_pad : outpadv generic map (width => 12, tech => padtech)
        port map (tft_lcd_data, lcd_datal);
  tft_lcd_clkp_pad : outpad generic map (tech => padtech)
    port map (tft_lcd_clk_p, clkvga_p);
  tft_lcd_clkn_pad : outpad generic map (tech => padtech)
    port map (tft_lcd_clk_n, clkvga_n);
  tft_lcd_hsync_pad : outpad generic map (tech => padtech)
    port map (tft_lcd_hsync, lcd_hsyncl);
  tft_lcd_vsync_pad : outpad generic map (tech => padtech)
    port map (tft_lcd_vsync, lcd_vsyncl);
  tft_lcd_de_pad : outpad generic map (tech => padtech)
    port map (tft_lcd_de, lcd_del);
  tft_lcd_reset_pad : outpad generic map (tech => padtech)
    port map (tft_lcd_reset_b, rstn);
  dvi_i2c_scl_pad : iopad generic map (tech => padtech)
    port map (dvi_iic_scl, dvi_i2co.scl, dvi_i2co.scloen, dvi_i2ci.scl);
  dvi_i2c_sda_pad : iopad generic map (tech => padtech)
    port map (dvi_iic_sda, dvi_i2co.sda, dvi_i2co.sdaoen, dvi_i2ci.sda);

  gpio0 : if CFG_GRGPIO_ENABLE /= 0 generate     -- GPIO unit
    grgpio0: grgpio
    generic map(pindex => 10, paddr => 10, imask => CFG_GRGPIO_IMASK, nbits => 16)
    port map(rst => rstn, clk => clkm, apbi => apbi, apbo => apbo(10),
    gpioi => gpioi, gpioo => gpioo);
    p0 : if (CFG_CAN = 0) or (CFG_CAN_NUM = 1) generate
      pio_pads : for i in 1 to 2 generate
        pio_pad : iopad generic map (tech => padtech)
            port map (pio(i), gpioo.dout(i), gpioo.oen(i), gpioi.din(i));
      end generate;
    end generate;
    p1 : if (CFG_CAN = 0) generate
      pio_pads : for i in 4 to 5 generate
        pio_pad : iopad generic map (tech => padtech)
            port map (pio(i), gpioo.dout(i), gpioo.oen(i), gpioi.din(i));
      end generate;
    end generate;
    pio_pad0 : iopad generic map (tech => padtech)
            port map (pio(0), gpioo.dout(0), gpioo.oen(0), gpioi.din(0));
    pio_pad1 : iopad generic map (tech => padtech)
            port map (pio(3), gpioo.dout(3), gpioo.oen(3), gpioi.din(3));
    pio_pads : for i in 6 to 15 generate
        pio_pad : iopad generic map (tech => padtech)
            port map (pio(i), gpioo.dout(i), gpioo.oen(i), gpioi.din(i));
    end generate;
  end generate;


  -- make an additonal 32 bit GPIO port for genio(31..0)

  gpio1 : if CFG_GRGPIO_ENABLE /= 0 generate     -- GPIO unit
    grgpio1: grgpio
    generic map(pindex => 11, paddr => 11, imask => CFG_GRGPIO_IMASK, nbits => 32)
    port map(rst => rstn, clk => clkm, apbi => apbi, apbo => apbo(11),
    gpioi => gpioi2, gpioo => gpioo2);
        pio_pads : for i in 0 to 31 generate
        pio_pad : iopad generic map (tech => padtech)
            port map (genio(i), gpioo2.dout(i), gpioo2.oen(i), gpioi2.din(i));
    end generate;

  end generate;

   gpio2 : if CFG_GRGPIO_ENABLE /= 0 generate     -- GPIO unit
    grgpio2: grgpio
    generic map(pindex => 12, paddr => 12, imask => CFG_GRGPIO_IMASK, nbits => 28)
    port map(rst => rstn, clk => clkm, apbi => apbi, apbo => apbo(12),
    gpioi => gpioi3, gpioo => gpioo3);
        pio_pads : for i in 0 to 27 generate
        pio_pad : iopad generic map (tech => padtech)
            port map (genio(i+32), gpioo3.dout(i), gpioo3.oen(i), gpioi3.din(i));
    end generate;

  end generate;

  ahbs : if CFG_AHBSTAT = 1 generate   -- AHB status register
    stati <= ahbstat_in_none;
    ahbstat0 : ahbstat generic map (pindex => 13, paddr => 13, pirq => 1,
   nftslv => CFG_AHBSTATN)
      port map (rstn, clkm, ahbmi, ahbsi, stati, apbi, apbo(13));
  end generate;

-----------------------------------------------------------------------
---  ETHERNET ---------------------------------------------------------
-----------------------------------------------------------------------

  eth0 : if CFG_GRETH = 1 generate -- Gaisler ethernet MAC
    e1 : grethm generic map(
      hindex => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG,
      pindex => 14, paddr => 14, pirq => 6, memtech => memtech,
      mdcscaler => CPU_FREQ/1000, rmii => 0, enable_mdio => 1, fifosize => CFG_ETH_FIFO,
      nsync => 2, edcl => CFG_DSU_ETH, edclbufsz => CFG_ETH_BUF, phyrstadr => 1,
      macaddrh => CFG_ETH_ENM, macaddrl => CFG_ETH_ENL, enable_mdint => 1,
      ipaddrh => CFG_ETH_IPM, ipaddrl => CFG_ETH_IPL,
      giga => CFG_GRETH1G)
    port map( rst => rstn, clk => clkm, ahbmi => ahbmi,
      ahbmo => ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG),
      apbi => apbi, apbo => apbo(14), ethi => gmiii, etho => gmiio);
  end generate;

  led(3 downto 2) <= not (gmiio.gbit & gmiio.speed);

  noethindelay0 : if (use_eth_input_delay = 0) generate
     rgmiii.rx_dv <= rgmiii_buf.rx_dv;
     rgmiii.rxd   <= rgmiii_buf.rxd;
  end generate;

  noethoutdelay0 : if (use_eth_output_delay = 0) generate
     rgmiio_tx_clk <= rgmiio.tx_clk;
  end generate;

  noethdataoutdelay0 : if (use_eth_data_output_delay = 0) generate
      rgmiio_tx_en  <= rgmiio.tx_en;
     rgmiio_txd    <= rgmiio.txd(3 downto 0);
  end generate;

  ethindelay0 : if (use_eth_input_delay /= 0) generate

   erx_clk0 : if (use_eth_input_delay_clk /= 0) generate
    delay_rgmii_rx_clk : IODELAY2 generic map(
       DELAY_SRC    => "IDATAIN",
       IDELAY_TYPE  => "FIXED",
       DATA_RATE    => "DDR",
       IDELAY_VALUE => 0 -- (See table 39 in Xilinx ds162.pdf)
    )
    port map(
       IDATAIN     => rgmiii_buf.rx_clk,
       T           => '1',
       ODATAIN     => '0',
       CAL         => '0',
       IOCLK0      => '0',
       IOCLK1      => '0',
       CLK         => '0',
       INC         => '0',
       CE          => '0',
       RST         => '0',
       BUSY        => OPEN,
       DATAOUT     => rgmiii.rx_clk,
       DATAOUT2    => OPEN,
       TOUT        => OPEN,
       DOUT        => OPEN
    );
   end generate;

    delay_rgmii_rx_ctl0 : IODELAY2 generic map(
       DELAY_SRC    => "IDATAIN",
       IDELAY_TYPE  => "FIXED",
       DATA_RATE    => "DDR",
       IDELAY_VALUE => 80 -- (See table 39 in Xilinx ds162.pdf)
    )
    port map(
       IDATAIN     => rgmiii_buf.rx_dv,
       T           => '1',
       ODATAIN     => '0',
       CAL         => '0',
       IOCLK0      => '0',
       IOCLK1      => '0',
       CLK         => '0',
       INC         => '0',
       CE          => '0',
       RST         => '0',
       BUSY        => OPEN,
       DATAOUT     => rgmiii.rx_dv,
       DATAOUT2    => OPEN,
       TOUT        => OPEN,
       DOUT        => OPEN
    );

    rgmii_rxd : for i in 0 to 3 generate
     delay_rgmii_rxd0 : IODELAY2 generic map(
       DELAY_SRC    => "IDATAIN",
       IDELAY_TYPE  => "FIXED",
       DATA_RATE    => "DDR",
       IDELAY_VALUE => 80 -- (See table 39 in Xilinx ds162.pdf)
     )
     port map(
       IDATAIN     => rgmiii_buf.rxd(i),
       T           => '1',
       ODATAIN     => '0',
       CAL         => '0',
       IOCLK0      => '0',
       IOCLK1      => '0',
       CLK         => '0',
       INC         => '0',
       CE          => '0',
       RST         => '0',
       BUSY        => OPEN,
       DATAOUT     => rgmiii.rxd(i),
       DATAOUT2    => OPEN,
       TOUT        => OPEN,
       DOUT        => OPEN
     );
    end generate;
  end generate;

  ethoutdelay0 : if (use_eth_output_delay /= 0) generate
    delay_rgmii_tx_clk0 : IODELAY2 generic map(
       DELAY_SRC    => "ODATAIN",
       IDELAY_TYPE  => "FIXED",
       DATA_RATE    => "DDR",
       ODELAY_VALUE => 30 -- (See table 39 in Xilinx ds162.pdf)
    )
    port map(
       IDATAIN     => '0',
       T           => '1',
       ODATAIN     => rgmiio.tx_clk,
       CAL         => '0',
       IOCLK0      => '0',
       IOCLK1      => '0',
       CLK         => '0',
       INC         => '0',
       CE          => '0',
       RST         => '0',
       BUSY        => OPEN,
       DATAOUT     => OPEN,
       DATAOUT2    => OPEN,
       TOUT        => OPEN,
       DOUT        => rgmiio_tx_clk
    );
  end generate;

  ethoutdatadelay0 : if (use_eth_data_output_delay /= 0) generate    
    delay_rgmii_tx_en0 : IODELAY2 generic map(
       DELAY_SRC    => "ODATAIN",
       IDELAY_TYPE  => "FIXED",
       DATA_RATE    => "DDR",
       ODELAY_VALUE => 0
    )
    port map(
       IDATAIN     => '0',
       T           => '1',
       ODATAIN     => rgmiio.tx_en,
       CAL         => '0',
       IOCLK0      => '0',
       IOCLK1      => '0',
       CLK         => '0',
       INC         => '0',
       CE          => '0',
       RST         => '0',
       BUSY        => OPEN,
       DATAOUT     => OPEN,
       DATAOUT2    => OPEN,
       TOUT        => OPEN,
       DOUT        => rgmiio_tx_en
    );
    
    rgmii_txd : for i in 0 to 3 generate
     delay_rgmii_txd0 : IODELAY2 generic map(
       DELAY_SRC    => "ODATAIN",
       IDELAY_TYPE  => "FIXED",
       DATA_RATE    => "DDR",
       ODELAY_VALUE => 0
     )
     port map(
       IDATAIN     => '0',
       T           => '1',
       ODATAIN     => rgmiio.txd(i),
       CAL         => '0',
       IOCLK0      => '0',
       IOCLK1      => '0',
       CLK         => '0',
       INC         => '0',
       CE          => '0',
       RST         => '0',
       BUSY        => OPEN,
       DATAOUT     => OPEN,
       DATAOUT2    => OPEN,
       TOUT        => OPEN,
       DOUT        => rgmiio_txd(i)
     );
    end generate;
  end generate;

  rgmii0 : rgmii generic map (pindex => 15, paddr => 16#010#, pmask => 16#ff0#, tech => fabtech,
                              gmii => CFG_GRETH1G, debugmem => 1, abits => 8, no_clk_mux => 0,
                              pirq => 15, use90degtxclk  => 0)
    port map (rstn, gmiii, gmiio, rgmiii, rgmiio, clkm, rstn, apbi, apbo(15));

  ethpads : if (CFG_GRETH = 1) generate -- eth pads

    etxc_pad : outpad generic map (tech => padtech)
      port map (etx_clk, rgmiio_tx_clk);
      
    erx_clk1 : if (use_eth_input_delay_clk = 0) generate
      erxc_pad : clkpad generic map (tech => padtech, arch => 2)
        port map (erx_clk, rgmiii.rx_clk);
    end generate;
  
    erx_clk2 : if (use_eth_input_delay_clk /= 0) generate
     erxc_pad : inpad generic map (tech => padtech)
       port map (erx_clk, rgmii_pad.rx_clk);
     erxc_bufg0 : BUFG port map (O => rgmiii_buf.rx_clk, I => rgmii_pad.rx_clk);
    end generate;

    erxd_pad : inpadv generic map (tech => padtech, width => 4)
      port map (erxd, rgmiii_buf.rxd(3 downto 0));
    erxdv_pad : inpad generic map (tech => padtech)
      port map (erx_dv, rgmiii_buf.rx_dv);

    etxd_pad : outpadv generic map (tech => padtech, width => 4)
      port map (etxd, rgmiio_txd(3 downto 0));
    etxen_pad : outpad generic map (tech => padtech)
      port map ( etx_en, rgmiio_tx_en);

    emdio_pad : iopad generic map (tech => padtech)
      port map (emdio, rgmiio.mdio_o, rgmiio.mdio_oe, rgmiii.mdio_i);
    emdc_pad : outpad generic map (tech => padtech)
      port map (emdc, rgmiio.mdc);

    emdint_pad : inpad generic map (tech => padtech)
      port map (emdint, rgmiii.mdint);

    gtx_clk0 : if (use_gtx_clk = 0) generate
       -- Use MIG PLL
       -- Add to UCF (only if there is no BUFG left):
       --  PIN "ethpads.gtx_clk0.clk_125_bufg0.O" CLOCK_DEDICATED_ROUTE = FALSE;
       clk_125_bufg0 : BUFG port map (O => clk_125_bufg, I => clk_125);
       rgmiii.gtx_clk <= clk_125_bufg;
     end generate;

    gtx_clk1 : if (use_gtx_clk = 1) generate
     -- Incoming 125Mhz ref clock
     clk125_pad : clkpad generic map (tech => padtech, arch => 3)
       port map (clk125,  rgmiii.gtx_clk);
    end generate;

    gtx_clk2 : if (use_gtx_clk = 2) generate
       -- Use Separate PLL
       -- Add to UCF (only if there is no BUFG left):
       -- PIN "ethpads.gtx_clk2.clkgen0/xc3s.v/bufg0.O" CLOCK_DEDICATED_ROUTE =FALSE;
       -- PIN "ethpads.gtx_clk2.clk_125_bufg0.O" CLOCK_DEDICATED_ROUTE = FALSE;
       cgi2.pllctrl <= "00"; cgi2.pllrst <= rstraw;
       clkgen0 : clkgen        -- clock generator
         generic map (clktech, 5, 2, CFG_MCTRL_SDEN,CFG_CLK_NOFB, 0, 0, 0, BOARD_FREQ)
         port map (clkm, clkm, clk_125_pll, open, open, open, open, cgi2, cgo2, open, open, open);
        clk_125_bufg0 : BUFG port map (O => clk_125_bufg, I => clk_125_pll);
        rgmiii.gtx_clk <= clk_125_bufg;
     end generate;

  end generate;

-----------------------------------------------------------------------
---  AHB RAM ----------------------------------------------------------
-----------------------------------------------------------------------

  ocram : if CFG_AHBRAMEN = 1 generate
    ahbram0 : ahbram generic map (hindex => 7, haddr => CFG_AHBRADDR,
   tech => CFG_MEMTECH, kbytes => CFG_AHBRSZ, pipe => CFG_AHBRPIPE)
    port map ( rstn, clkm, ahbsi, ahbso(7));
  end generate;

-----------------------------------------------------------------------
---  Multi-core CAN ---------------------------------------------------
-----------------------------------------------------------------------

   can0 : if CFG_CAN = 1 generate
     can0 : can_mc generic map (slvndx => 4, ioaddr => CFG_CANIO,
       iomask => 16#FF0#, irq => CFG_CANIRQ, memtech => memtech,
   ncores => CFG_CAN_NUM, sepirq => CFG_CANSEPIRQ)
      port map (rstn, clkm, ahbsi, ahbso(4), can_lrx, can_ltx );
      can_tx_pad1 : iopad generic map (tech => padtech)
            port map (pio(5), can_ltx(0), gnd, gpioi.din(5));
      can_rx_pad1 : iopad generic map (tech => padtech)
            port map (pio(4), gnd, vcc, can_lrx(0));
      canpas : if CFG_CAN_NUM = 2 generate
        can_tx_pad2 : iopad generic map (tech => padtech)
            port map (pio(2), can_ltx(1), gnd, gpioi.din(2));
        can_rx_pad2 : iopad generic map (tech => padtech)
            port map (pio(1), gnd, vcc, can_lrx(1));
      end generate;
   end generate;

   -- standby controlled by pio(3) and pio(0)

-----------------------------------------------------------------------
---  SPACEWIRE  -------------------------------------------------------
-----------------------------------------------------------------------

-- temporary, just to make sure the SPW pins are instantiated correctly

  no_spw : if CFG_SPW_EN = 0 generate
  pad_gen: for i in 0 to CFG_SPW_NUM-1 generate
   spw_rxd_pad : inpad_ds generic map (padtech, lvds, x33v)
         port map (spw_rxdp(i), spw_rxdn(i), dtmp(i));
       spw_rxs_pad : inpad_ds generic map (padtech, lvds, x33v)
         port map (spw_rxsp(i), spw_rxsn(i), stmp(i));
       spw_txd_pad : outpad_ds generic map (padtech, lvds, x33v)
         port map (spw_txdp(i), spw_txdn(i), dtmp(i), gnd);
       spw_txs_pad : outpad_ds generic map (padtech, lvds, x33v)
         port map (spw_txsp(i), spw_txsn(i), stmp(i), gnd);
    end generate;
  end generate;



  spw : if CFG_SPW_EN > 0 generate
    core0: if CFG_SPW_GRSPW = 1 generate
      spw_rxtxclk <= clkm;
      spw_rstn <= rstn;
    end generate;

    core1 : if CFG_SPW_GRSPW = 2 generate
      spw_rxtxclk <= clk100;
      spw_rstn_sync_proc : process(rstn,spw_rxtxclk)
      begin
        if rstn = '0' then
          spw_rstn_sync <= '0';
          spw_rstn      <= '0';
        elsif rising_edge(spw_rxtxclk) then
          spw_rstn_sync <= '1';
          spw_rstn      <= spw_rstn_sync;
        end if;
      end process spw_rstn_sync_proc;
    end generate;

    spw_rxclkn <= not spw_rxtxclk;

    swloop : for i in 0 to CFG_SPW_NUM-1 generate
      -- GRSPW2 PHY
      spw2_input : if CFG_SPW_GRSPW = 2 generate
        spw_inputloop: for j in 0 to CFG_SPW_PORTS-1 generate
          spw_phy0 : grspw2_phy
            generic map(
              scantest     => 0,
              tech         => fabtech,
              input_type   => CFG_SPW_INPUT,
              rxclkbuftype => 2)
            port map(
              rstn       => spw_rstn,
              rxclki     => spw_rxtxclk,
              rxclkin    => spw_rxclkn,
              nrxclki    => spw_rxtxclk,
              di         => dtmp(i*CFG_SPW_PORTS+j),
              si         => stmp(i*CFG_SPW_PORTS+j),
              do         => spwi(i).d(j*2+1 downto j*2),
              dov        => spwi(i).dv(j*2+1 downto j*2),
              dconnect   => spwi(i).dconnect(j*2+1 downto j*2),
              rxclko     => spw_rxclk(i*CFG_SPW_PORTS+j));
        end generate;
        oneport : if CFG_SPW_PORTS = 1 generate
          spwi(i).d(3 downto 2) <= "00";  -- For second port
	  spwi(i).dv(3 downto 2) <= "00";  -- For second port
	  spwi(i).dconnect(3 downto 2) <= "00";  -- For second port
        end generate;
        spwi(i).nd <= (others => '0');  -- Only used in GRSPW
      end generate;

      spw1_input: if CFG_SPW_GRSPW = 1 generate
        spw_inputloop: for j in 0 to CFG_SPW_PORTS-1 generate
          spw_phy0 : grspw_phy
            generic map(
              tech         => fabtech,
              rxclkbuftype => 2,
              scantest     => 0)
            port map(
              rxrst      => spwo(i).rxrst,
              di         => dtmp(i*CFG_SPW_PORTS+j),
              si         => stmp(i*CFG_SPW_PORTS+j),
              rxclko     => spw_rxclk(i*CFG_SPW_PORTS+j),
              do         => spwi(i).d(j),
              ndo        => spwi(i).nd(j*5+4 downto j*5),
              dconnect   => spwi(i).dconnect(j*2+1 downto j*2));
        end generate spw_inputloop;
        oneport : if CFG_SPW_PORTS = 1 generate
          spwi(i).d(1) <= '0';      -- For second port
          spwi(i).d(3 downto 2) <= "00";  -- For GRSPW2 second port
	  spwi(i).nd(9 downto 5) <= "00000";  -- For second port
	  spwi(i).dconnect(3 downto 2) <= "00";  -- For second port
        end generate;
        spwi(i).dv <= (others => '0');  -- Only used in GRSPW2
      end generate spw1_input;

      sw0 : grspwm generic map(tech => memtech,
        hindex => CFG_NCPU+CFG_AHB_UART+CFG_GRETH+CFG_AHB_JTAG+i,
        sysfreq => CPU_FREQ, usegen => 1,
        pindex => 10+i, paddr => 10+i, pirq => 10+i,
        nsync => 1, rmap => CFG_SPW_RMAP, rxunaligned => CFG_SPW_RXUNAL,
        rmapcrc => CFG_SPW_RMAPCRC, fifosize1 => CFG_SPW_AHBFIFO,
        fifosize2 => CFG_SPW_RXFIFO, rxclkbuftype => 2, dmachan => CFG_SPW_DMACHAN,
        rmapbufs => CFG_SPW_RMAPBUF, ft => CFG_SPW_FT, ports => CFG_SPW_PORTS,
        spwcore => CFG_SPW_GRSPW, netlist => CFG_SPW_NETLIST,
        rxtx_sameclk => CFG_SPW_RTSAME, input_type => CFG_SPW_INPUT,
        output_type => CFG_SPW_OUTPUT)
      port map(rstn, clkm, spw_rxclk(i*CFG_SPW_PORTS), spw_rxclk(i*CFG_SPW_PORTS+1),
               spw_rxtxclk, spw_rxtxclk, ahbmi,
               ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_GRETH+CFG_AHB_JTAG+i),
               apbi2, apbo2(10+i), spwi(i), spwo(i));
      spwi(i).tickin <= '0'; spwi(i).rmapen <= '1';
      spwi(i).clkdiv10 <= conv_std_logic_vector(CPU_FREQ/10000-1, 8) when CFG_SPW_GRSPW = 1
   	else conv_std_logic_vector(10-1, 8);
      spwi(i).tickinraw <= '0';
      spwi(i).timein <= (others => '0');
      spwi(i).dcrstval <= (others => '0');
      spwi(i).timerrstval <= (others => '0');

      swportloop1: for j in 0 to CFG_SPW_PORTS-1 generate
        spwlb0 : if SPW_LOOP_BACK = 1 generate
          dtmp(i*CFG_SPW_PORTS+j) <= spwo(i).d(j); stmp(i*CFG_SPW_PORTS+j) <= spwo(i).s(j);
        end generate;
        nospwlb0 : if SPW_LOOP_BACK = 0 generate
          spw_rxd_pad : inpad_ds generic map (padtech, lvds, x33v, 1)
            port map (spw_rxdp(i*CFG_SPW_PORTS+j), spw_rxdn(i*CFG_SPW_PORTS+j), dtmp(i*CFG_SPW_PORTS+j));
          spw_rxs_pad : inpad_ds generic map (padtech, lvds, x33v, 1)
            port map (spw_rxsp(i*CFG_SPW_PORTS+j), spw_rxsn(i*CFG_SPW_PORTS+j), stmp(i*CFG_SPW_PORTS+j));
          spw_txd_pad : outpad_ds generic map (padtech, lvds, x33v)
            port map (spw_txdp(i*CFG_SPW_PORTS+j), spw_txdn(i*CFG_SPW_PORTS+j), spwo(i).d(j), gnd);
          spw_txs_pad : outpad_ds generic map (padtech, lvds, x33v)
            port map (spw_txsp(i*CFG_SPW_PORTS+j), spw_txsn(i*CFG_SPW_PORTS+j), spwo(i).s(j), gnd);
        end generate;
      end generate;
    end generate;
  end generate;

 -----------------------------------------------------------------------
 ---  Drive unused bus elements  ---------------------------------------
 -----------------------------------------------------------------------

 --  nam1 : for i in (CFG_NCPU+CFG_AHB_UART+CFG_GRETH+CFG_AHB_JTAG) to NAHBMST-1 generate
 --    ahbmo(i) <= ahbm_none;
 --  end generate;
 --  nap0 : for i in 11 to NAPBSLV-1 generate apbo(i) <= apb_none; end generate;
 --  nah0 : for i in 8 to NAHBSLV-1 generate ahbso(i) <= ahbs_none; end generate;

 -----------------------------------------------------------------------
 ---  Boot message  ----------------------------------------------------
 -----------------------------------------------------------------------

 -- pragma translate_off
   x : report_design
   generic map (
    msg1 => "LEON3 GR-XC6S-LX75 Demonstration design",
    fabtech => tech_table(fabtech), memtech => tech_table(memtech),
    mdel => 1
   );
 -- pragma translate_on
 end;

