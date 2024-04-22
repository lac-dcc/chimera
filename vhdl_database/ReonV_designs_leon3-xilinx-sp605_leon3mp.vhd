-----------------------------------------------------------------------------
--  LEON3 Xilinx SP605 Demonstration design
--  Copyright (C) 2011 Jiri Gaisler, Aeroflex Gaisler
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
use unisim.ODDR2;
-- pragma translate_on


library esa;
use esa.memoryctrl.all;

use work.config.all;
use work.pcie.all;

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
    reset       : in  std_ulogic;
    clk27       : in  std_ulogic;    -- 27 MHz clock
    clk200p     : in  std_ulogic;    -- 200 MHz clock
    clk200n     : in  std_ulogic;    -- 200 MHz clock
    clk33       : in  std_ulogic;    -- 32 MHz clock from sysace
    address     : out std_logic_vector(23 downto 0);
    data        : inout std_logic_vector(15 downto 0);
    oen         : out std_ulogic;
    writen      : out std_ulogic;
    romsn       : out std_logic;

    ddr_clk        : out std_logic;
    ddr_clkb       : out std_logic;
    ddr_cke        : out std_logic;
    ddr_odt        : out std_logic;
    ddr_reset_n    : out std_logic;
    ddr_we         : out std_ulogic;                       -- ddr write enable
    ddr_ras        : out std_ulogic;                       -- ddr ras

    ddr_cas        : out std_ulogic;                       -- ddr cas
    ddr_dm         : out std_logic_vector (1 downto 0);    -- ddr dm
    ddr_dqs        : inout std_logic_vector (1 downto 0);  -- ddr dqs
    ddr_dqs_n      : inout std_logic_vector (1 downto 0);  -- ddr dqs_n
    ddr_ad         : out std_logic_vector (12 downto 0);   -- ddr address
    ddr_ba         : out std_logic_vector (2 downto 0);    -- ddr bank address
    ddr_dq         : inout std_logic_vector (15 downto 0); -- ddr data
    ddr_rzq        : inout std_ulogic;                       
    ddr_zio        : inout std_ulogic;                       
   
    txd1        : out std_ulogic;          -- UART1 tx data
    rxd1        : in  std_ulogic;           -- UART1 rx data
    ctsn1       : in  std_ulogic;           -- UART1 ctsn
    rtsn1       : out std_ulogic;           -- UART1 trsn
    button       : inout std_logic_vector(3 downto 0);    -- I/O port
    switch       : inout std_logic_vector(3 downto 0);    -- I/O port
    led          : out std_logic_vector(3 downto 0);    -- I/O port

    phy_gtx_clk     : out std_logic;
    phy_mii_data    : inout std_logic;		-- ethernet PHY interface
    phy_tx_clk 	    : in std_ulogic;
    phy_rx_clk 	    : in std_ulogic;
    phy_rx_data	    : in std_logic_vector(7 downto 0);   
    phy_dv  	    : in std_ulogic; 
    phy_rx_er	    : in std_ulogic; 
    phy_col 	    : in std_ulogic;
    phy_crs 	    : in std_ulogic;
    phy_tx_data     : out std_logic_vector(7 downto 0);   
    phy_tx_en 	    : out std_ulogic; 
    phy_tx_er 	    : out std_ulogic; 
    phy_mii_clk	    : out std_ulogic;
    phy_rst_n	    : out std_ulogic;
    phy_mii_int_n   : in std_ulogic;

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
   
    -- SPI flash
    spi_sel_n : inout std_ulogic;
    spi_clk   : out   std_ulogic;
    spi_mosi  : out   std_ulogic;

   --pcie
    pci_exp_txp : out std_logic;
    pci_exp_txn : out std_logic;
    pci_exp_rxp : in  std_logic;
    pci_exp_rxn : in  std_logic;
    sys_clk_p   : in  std_logic;
    sys_clk_n   : in  std_logic;
    sys_reset_n : in  std_logic;
   
    sysace_mpa      : out std_logic_vector(6 downto 0);
    sysace_mpce     : out std_ulogic;
    sysace_mpirq    : in  std_ulogic;
    sysace_mpoe     : out std_ulogic;
    sysace_mpwe     : out std_ulogic;
    sysace_d        : inout std_logic_vector(7 downto 0)
   );
end;

architecture rtl of leon3mp is

--attribute syn_netlist_hierarchy : boolean;
--attribute syn_netlist_hierarchy of rtl : architecture is false;

component ODDR2
  generic (
     DDR_ALIGNMENT : string := "NONE";
     INIT : bit := '0';
     SRTYPE : string := "SYNC"
  );
  port (
     Q : out std_ulogic;
     C0 : in std_ulogic;
     C1 : in std_ulogic;
     CE : in std_ulogic := 'H';
     D0 : in std_ulogic;
     D1 : in std_ulogic;
     R : in std_ulogic := 'L';
     S : in std_ulogic := 'L'
  );
end component;

constant blength : integer := 12;
constant fifodepth : integer := 8;
constant maxahbm : integer := CFG_NCPU+CFG_GRETH+CFG_AHB_JTAG+CFG_PCIEXP;
   
signal vcc, gnd   : std_logic;
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
signal vahbmi : ahb_mst_in_type;
signal ahbmo : ahb_mst_out_vector := (others => ahbm_none);
signal vahbmo : ahb_mst_out_type;

signal clkm, rstn, rstraw, sdclkl : std_ulogic;
signal clk_200 : std_ulogic;
signal clk25, clk40, clk65 : std_ulogic;

signal cgi, cgi2   : clkgen_in_type;
signal cgo, cgo2   : clkgen_out_type;
signal u1i, u2i, dui : uart_in_type;
signal u1o, u2o, duo : uart_out_type;

signal irqi : irq_in_vector(0 to CFG_NCPU-1);
signal irqo : irq_out_vector(0 to CFG_NCPU-1);

signal dbgi : l3_debug_in_vector(0 to CFG_NCPU-1);
signal dbgo : l3_debug_out_vector(0 to CFG_NCPU-1);

signal dsui : dsu_in_type;
signal dsuo : dsu_out_type; 

signal ethi : eth_in_type;
signal etho : eth_out_type;
signal egtx_clk :std_ulogic;
signal negtx_clk :std_ulogic;

signal gpti : gptimer_in_type;
signal gpto : gptimer_out_type;

signal gpioi : gpio_in_type;
signal gpioo : gpio_out_type;

signal clklock, elock, ulock : std_ulogic;

signal lock, calib_done, clkml, lclk, rst, ndsuact : std_ulogic;
signal tck, tckn, tms, tdi, tdo : std_ulogic;

signal ethclk : std_ulogic;

signal vgao  : apbvga_out_type;
signal lcd_datal : std_logic_vector(11 downto 0);
signal lcd_hsyncl, lcd_vsyncl, lcd_del, lcd_reset_bl : std_ulogic;

signal i2ci, dvi_i2ci : i2c_in_type;
signal i2co, dvi_i2co : i2c_out_type;

signal spmi : spimctrl_in_type;
signal spmo : spimctrl_out_type;

signal spmi2 : spimctrl_in_type;
signal spmo2 : spimctrl_out_type;

constant BOARD_FREQ : integer := 33000;   -- input frequency in KHz
constant CPU_FREQ : integer := BOARD_FREQ * CFG_CLKMUL / CFG_CLKDIV;  -- cpu frequency in KHz
constant IOAEN : integer := CFG_GRACECTRL;
constant DDR2_FREQ  : integer := 200000;                               -- DDR2 input frequency in KHz

signal stati : ahbstat_in_type;

signal fpi : grfpu_in_vector_type;
signal fpo : grfpu_out_vector_type;

  -- Used for connecting input/output signals to the DDR2 controller
  signal core_ddr_clk  : std_logic_vector(2 downto 0);
  signal core_ddr_clkb : std_logic_vector(2 downto 0);
  signal core_ddr_cke  : std_logic_vector(1 downto 0);
  signal core_ddr_csb  : std_logic_vector(1 downto 0);
  signal core_ddr_ad   : std_logic_vector(13 downto 0);
  signal core_ddr_odt  : std_logic_vector(1 downto 0);
  

signal video_clk : std_ulogic;  -- signals to vga_clkgen.
signal clk_sel : std_logic_vector(1 downto 0);
signal clkvga, clkvga_p, clkvga_n : std_ulogic;

signal acei   : gracectrl_in_type;
signal aceo   : gracectrl_out_type;

attribute keep : boolean;
attribute syn_keep : boolean;
attribute syn_preserve : boolean;
attribute syn_keep of video_clk : signal is true;
attribute syn_preserve of video_clk : signal is true;
attribute keep of video_clk : signal is true;
attribute syn_preserve of clkm : signal is true;
attribute keep of clkm : signal is true;

begin

----------------------------------------------------------------------
---  Reset and Clock generation  -------------------------------------
----------------------------------------------------------------------
  
  vcc <= '1'; gnd <= '0';
  cgi.pllctrl <= "00"; cgi.pllrst <= rstraw;

  ethclk <= lclk;
  clk_pad : clkpad generic map (tech => padtech) port map (clk33, lclk); 
  clkgen0 : clkgen        -- clock generator
    generic map (clktech, CFG_CLKMUL, CFG_CLKDIV, CFG_MCTRL_SDEN,
   CFG_CLK_NOFB, 0, 0, 0, BOARD_FREQ)
    port map (lclk, lclk, clkm, open, open, sdclkl, open, cgi, cgo, open, open, open);

  reset_pad : inpad generic map (tech => padtech) port map (reset, rst); 
  rst0 : rstgen         -- reset generator
  generic map (acthigh => 1)
  port map (rst, clkm, lock, rstn, rstraw);
  lock <= cgo.clklock and calib_done when CFG_MIG_DDR2 = 1 else cgo.clklock;

----------------------------------------------------------------------
---  AHB CONTROLLER --------------------------------------------------
----------------------------------------------------------------------

  ahb0 : ahbctrl       -- AHB arbiter/multiplexer
  generic map (defmast => CFG_DEFMST, split => CFG_SPLIT, 
   rrobin => CFG_RROBIN, ioaddr => CFG_AHBIO, fpnpen => CFG_FPNPEN,
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
	  CFG_CACHE_ERRINJ, CFG_DFIXED, CFG_LEON3_NETLIST, CFG_SCAN, CFG_MMU_PAGE,
          CFG_BP, CFG_NP_ASI, CFG_WRPSR)
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

  led1_pad : odpad generic map (tech => padtech) port map (led(1), dbgo(0).error);
    
  dsugen : if CFG_DSU = 1 generate
      dsu0 : dsu3         -- LEON3 Debug Support Unit
      generic map (hindex => 2, haddr => 16#900#, hmask => 16#F00#, 
         ncpu => CFG_NCPU, tbits => 30, tech => memtech, irq => 0, kbytes => CFG_ATBSZ)
      port map (rstn, clkm, ahbmi, ahbsi, ahbso(2), dbgo, dbgi, dsui, dsuo);
      dsui.enable <= '1'; 
      dsui.break <= button(3); 
      dsuact_pad : outpad generic map (tech => padtech) port map (led(0), ndsuact);
      ndsuact <= not dsuo.active;
  end generate;

  nodsu : if CFG_DSU = 0 generate 
    dsuo.tstop <= '0'; dsuo.active <= '0'; ahbso(2) <= ahbs_none;
  end generate;

  ahbjtaggen0 :if CFG_AHB_JTAG = 1 generate
    ahbjtag0 : ahbjtag generic map(tech => fabtech, hindex => CFG_NCPU)
      port map(rstn, clkm, tck, tms, tdi, tdo, ahbmi, ahbmo(CFG_NCPU),
               open, open, open, open, open, open, open, gnd);
  end generate;
  
----------------------------------------------------------------------
---  Memory controllers ----------------------------------------------
----------------------------------------------------------------------

  memi.writen <= '1'; memi.wrn <= "1111"; memi.bwidth <= "01";
  memi.brdyn <= '0'; memi.bexcn <= '1';

  mctrl_gen : if CFG_MCTRL_LEON2 /= 0 generate
    mctrl0 : mctrl generic map (hindex => 0, pindex => 0,
     paddr => 0, srbanks => 2, ram8 => CFG_MCTRL_RAM8BIT, 
     ram16 => CFG_MCTRL_RAM16BIT, sden => CFG_MCTRL_SDEN, 
     invclk => CFG_CLK_NOFB, sepbus => CFG_MCTRL_SEPBUS,
     pageburst => CFG_MCTRL_PAGE, rammask => 0, iomask => 0)
    port map (rstn, clkm, memi, memo, ahbsi, ahbso(0), apbi, apbo(0), wpo, sdo);
  
    addr_pad : outpadv generic map (width => 24, tech => padtech) 
     port map (address, memo.address(24 downto 1)); 
    roms_pad : outpad generic map (tech => padtech) 
     port map (romsn, memo.romsn(0)); 
    oen_pad  : outpad generic map (tech => padtech) 
     port map (oen, memo.oen);
    wri_pad  : outpad generic map (tech => padtech) 
     port map (writen, memo.writen);
    data_pad : iopadvv generic map (tech => padtech, width => 16)
        port map (data(15 downto 0), memo.data(31 downto 16),
     memo.vbdrive(31 downto 16), memi.data(31 downto 16));
  end generate;
  nomctrl : if CFG_MCTRL_LEON2 = 0 generate
    roms_pad : outpad generic map (tech => padtech) 
     port map (romsn, vcc); --ahbso(0) <= ahbso_none;
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
  
  mig_gen : if (CFG_MIG_DDR2 = 1) generate 
    ddrc : entity work.ahb2mig_sp605 generic map( 
	hindex => 4, haddr => 16#400#, hmask => 16#F80#, 
	pindex => 4, paddr => 4,
	vgamst => CFG_SVGA_ENABLE, vgaburst => 64)  
    port map(
   	mcb3_dram_dq  	=> ddr_dq,
   	mcb3_dram_a	=> ddr_ad,
   	mcb3_dram_ba  	=> ddr_ba,
   	mcb3_dram_ras_n	=> ddr_ras,
   	mcb3_dram_cas_n	=> ddr_cas,
   	mcb3_dram_we_n	=> ddr_we,
   	mcb3_dram_odt	=> ddr_odt,
   	mcb3_dram_reset_n=> ddr_reset_n,
   	mcb3_dram_cke	=> ddr_cke,
   	mcb3_dram_dm	=> ddr_dm(0),
   	mcb3_dram_udqs	=> ddr_dqs(1),
   	mcb3_dram_udqs_n=> ddr_dqs_n(1),
   	mcb3_rzq	=> ddr_rzq,
   	mcb3_zio	=> ddr_zio,
   	mcb3_dram_udm	=> ddr_dm(1),
	mcb3_dram_dqs	=> ddr_dqs(0),
	mcb3_dram_dqs_n	=> ddr_dqs_n(0),
   	mcb3_dram_ck	=> ddr_clk,
   	mcb3_dram_ck_n	=> ddr_clkb,
	ahbsi		=> ahbsi,
	ahbso		=> ahbso(4),
	ahbmi		=> vahbmi,
	ahbmo		=> vahbmo,
	apbi 		=> apbi,
	apbo 		=> apbo(4),
	calib_done	=> calib_done,
	rst_n_syn	=> rstn,
	rst_n_async	=> rstraw,  
	clk_amba	=> clkm,
	clk_mem_p	=> clk200p,
	clk_mem_n	=> clk200n,
        clk_125         => egtx_clk,
        clk_50          => video_clk
	);
  end generate;

  led(2) <= calib_done;
  led(3) <= lock;

  noddr : if CFG_MIG_DDR2 = 0 generate lock <= '1'; end generate;


-----------------PCI-EXPRESS-Master-Target------------------------------------------
    pcie_mt : if CFG_PCIE_TYPE = 1 generate	-- master/target without fifo
EP:pcie_master_target_sp605
  generic map (
    master     => CFG_PCIE_SIM_MAS,
    hmstndx    => CFG_NCPU+CFG_GRETH+CFG_AHB_JTAG,
    hslvndx    => 7,
    abits      => 21,
    device_id  => CFG_PCIEXPDID,		-- PCIE device ID
    vendor_id  => CFG_PCIEXPVID,	  -- PCIE vendor ID
    nsync      => 2,                -- 1 or 2 sync regs between clocks
    pcie_bar_mask => 16#FFE#,
    haddr      => 16#a00#,    
    hmask      => 16#fff#,   
    pindex     => 5,   
    paddr      => 5,   
    pmask      => 16#fff#    
          )
  port map( 
    rst          => rstn,
    clk          => clkm,
    -- System Interface
    sys_clk_p    => sys_clk_p,
    sys_clk_n    => sys_clk_n,
    sys_reset_n  => sys_reset_n,
    -- PCI Express Fabric Interface
    pci_exp_txp  => pci_exp_txp,
    pci_exp_txn  => pci_exp_txn,
    pci_exp_rxp  => pci_exp_rxp,
    pci_exp_rxn  => pci_exp_rxn,
    
    ahbso        => ahbso(7),        
    ahbsi        => ahbsi,         
    apbi         => apbi,	      
    apbo         => apbo(5),	      
    ahbmi        => ahbmi,
    ahbmo        => ahbmo(CFG_NCPU+CFG_GRETH+CFG_AHB_JTAG)
    
  );
    end generate;
----------------------------------------------------------------------


-----------------PCI-EXPRESS-Master-FIFO------------------------------------------
    pcie_mf_dma : if CFG_PCIE_TYPE = 3 generate	-- master with fifo and DMA
dma:pciedma
      generic map (memtech => memtech, dmstndx => CFG_NCPU+CFG_GRETH+CFG_AHB_JTAG, 
	  dapbndx => 7, dapbaddr => 7,dapbmask => 16#FFF#,  dapbirq => 4, blength => 12, 
	  device_id => CFG_PCIEXPDID, vendor_id => CFG_PCIEXPVID,
	  slvndx => 7, apbndx => 5, apbaddr => 5, apbmask =>16#FFF#,  haddr => 16#A00#, hmask => 16#FFF#, 
	  nsync => 2, pcie_bar_mask => 16#FFE#
          )
port map( 
    rst           => rstn,
    clk           => clkm,
    -- System Interface
    sys_clk_p     => sys_clk_p,
    sys_clk_n     => sys_clk_n,
    sys_reset_n   => sys_reset_n,
    -- PCI Express Fabric Interface
    pci_exp_txp   => pci_exp_txp,
    pci_exp_txn   => pci_exp_txn,
    pci_exp_rxp   => pci_exp_rxp,
    pci_exp_rxn   => pci_exp_rxn,
    
    dapbo     => apbo(7),
    dahbmo    =>ahbmo(CFG_NCPU+CFG_GRETH+CFG_AHB_JTAG),
    apbi      =>apbi,
    apbo      =>apbo(5),
    ahbmi     =>ahbmi,
    ahbsi     =>ahbsi,
    ahbso     =>ahbso(7)
  
  );
    end generate;

  pcie_mf: if CFG_PCIE_TYPE = 2 generate	-- master with fifo 
    EP:pcie_master_fifo_sp605 
   generic map (
     memtech       => memtech,
     hslvndx       => 7,
     device_id     => CFG_PCIEXPDID,              -- PCIE device ID
     vendor_id     => CFG_PCIEXPVID,              -- PCIE vendor ID
     nsync         => 2, -- 1 or 2 sync regs between clocks
     pcie_bar_mask => 16#FFE#,
     haddr         => 16#A00#,
     hmask         => 16#fff#,
     pindex        => 5,
     paddr         => 5,
     pmask         => 16#fff#)
   port map( 
    rst            => rstn,  
    clk            => clkm,  
    -- System In
    sys_clk_p      => sys_clk_p, 
    sys_clk_n      => sys_clk_n, 
    sys_reset_n    => sys_reset_n,
    -- PCI Expre
    pci_exp_txp    => pci_exp_txp,
    pci_exp_txn    => pci_exp_txn,
    pci_exp_rxp    => pci_exp_rxp,
    pci_exp_rxn    => pci_exp_rxn,
    ahbso          => ahbso(7),  
    ahbsi          => ahbsi,
    apbi           => apbi,
    apbo           => apbo(5)
  );
end generate; 
----------------------------------------------------------------------
----------------------------------------------------------------------


----------------------------------------------------------------------
---  SPI Memory Controller--------------------------------------------
----------------------------------------------------------------------

  spimc: if CFG_SPICTRL_ENABLE = 0 and CFG_SPIMCTRL = 1 generate
    spimctrl0 : spimctrl        -- SPI Memory Controller
      generic map (hindex => 3, hirq => 5, faddr => 16#e00#, fmask => 16#ff8#,
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
    spmi.miso <= memi.data(16);
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
---  System ACE I/F Controller ---------------------------------------
----------------------------------------------------------------------
  
  grace: if CFG_GRACECTRL = 1 generate
    grace0 : gracectrl generic map (hindex => 8, hirq => 10,
        haddr => 16#002#, hmask => 16#fff#, split => CFG_SPLIT, mode => 2)
      port map (rstn, clkm, lclk, ahbsi, ahbso(8), acei, aceo);
  end generate;
  nograce: if CFG_GRACECTRL /= 1 generate
    aceo <= gracectrl_none;
  end generate;
  
  sysace_mpa_pads : outpadv generic map (width => 7, tech => padtech) 
    port map (sysace_mpa, aceo.addr); 
  sysace_mpce_pad : outpad generic map (tech => padtech)
    port map (sysace_mpce, aceo.cen); 
  sysace_d_pads : iopadv generic map (tech => padtech, width => 8)
    port map (sysace_d, aceo.do(7 downto 0), aceo.doen, acei.di(7 downto 0));
  acei.di(15 downto 8) <= (others => '0');
  sysace_mpoe_pad : outpad generic map (tech => padtech)
    port map (sysace_mpoe, aceo.oen);
  sysace_mpwe_pad : outpad generic map (tech => padtech)
    port map (sysace_mpwe, aceo.wen); 
  sysace_mpirq_pad : inpad generic map (tech => padtech)
    port map (sysace_mpirq, acei.irq); 

  
----------------------------------------------------------------------
---  APB Bridge and various periherals -------------------------------
----------------------------------------------------------------------

  apb0 : apbctrl            -- AHB/APB bridge
  generic map (hindex => 1, haddr => CFG_APBADDR, nslaves => 16)
  port map (rstn, clkm, ahbsi, ahbso(1), apbi, apbo );

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
   nbits => CFG_GPT_TW, wdog => 0)
    port map (rstn, clkm, apbi, apbo(3), gpti, gpto);
    gpti <= gpti_dhalt_drive(dsuo.tstop);
  end generate;

  nogpt : if CFG_GPT_ENABLE = 0 generate apbo(3) <= apb_none; end generate;

  vga : if CFG_VGA_ENABLE /= 0 generate
    vga0 : apbvga generic map(memtech => memtech, pindex => 6, paddr => 6)
       port map(rstn, clkm, ethclk, apbi, apbo(6), vgao);
--    video_clk <= not ethclk;
   end generate;
  
  svga : if CFG_SVGA_ENABLE /= 0 generate
    svga0 : svgactrl generic map(memtech => memtech, pindex => 6, paddr => 6,
        hindex => CFG_NCPU+CFG_AHB_JTAG, 
   	clk0 => 20000, clk1 => 0, --1000000000/((BOARD_FREQ * CFG_CLKMUL)/CFG_CLKDIV),
	clk2 => 0, clk3 => 0, burstlen => 6)
       port map(rstn, clkm, video_clk, apbi, apbo(6), vgao, vahbmi, 
      vahbmo, clk_sel);
  end generate;
  
  vgadvi : if (CFG_VGA_ENABLE + CFG_SVGA_ENABLE) /= 0 generate 
--    b0 : techbuf generic map (2, fabtech) port map (clk50, video_clk);
    dvi0 : entity work.svga2ch7301c generic map (tech => fabtech, dynamic => 1)
      port map (clkm, vgao, video_clk, clkvga_p, clkvga_n, 
                lcd_datal, lcd_hsyncl, lcd_vsyncl, lcd_del);
    i2cdvi : i2cmst
      generic map (pindex => 9, paddr => 9, pmask => 16#FFF#, pirq => 11)
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
    generic map(pindex => 10, paddr => 10, imask => CFG_GRGPIO_IMASK, nbits => 7)
    port map(rst => rstn, clk => clkm, apbi => apbi, apbo => apbo(10),
    gpioi => gpioi, gpioo => gpioo);
    pio_pads : for i in 0 to 3 generate
        pio_pad : iopad generic map (tech => padtech)
            port map (switch(i), gpioo.dout(i), gpioo.oen(i), gpioi.din(i));
    end generate;
    pio_pads2 : for i in 4 to 6 generate
        pio_pad : iopad generic map (tech => padtech)
            port map (button(i-4), gpioo.dout(i), gpioo.oen(i), gpioi.din(i));
    end generate;
  end generate;	
  
  ahbs : if CFG_AHBSTAT = 1 generate   -- AHB status register
    stati <= ahbstat_in_none;
    ahbstat0 : ahbstat generic map (pindex => 15, paddr => 15, pirq => 7,
   nftslv => CFG_AHBSTATN)
      port map (rstn, clkm, ahbmi, ahbsi, stati, apbi, apbo(15));
  end generate;

-----------------------------------------------------------------------
---  ETHERNET ---------------------------------------------------------
-----------------------------------------------------------------------

    eth0 : if CFG_GRETH = 1 generate -- Gaisler ethernet MAC
      negtx_clk <= not egtx_clk;
      x0 : ODDR2 port map ( Q => phy_gtx_clk, C0 => egtx_clk, 
		C1 => negtx_clk, CE => vcc,
		D0 => vcc, D1 => gnd, R => gnd, S => gnd);

    e1 : grethm generic map( hindex => CFG_NCPU+CFG_AHB_JTAG, 
   	pindex => 14, paddr => 14, pirq => 12, memtech => memtech,
        mdcscaler => CPU_FREQ/1000, rmii => 0, enable_mdio => 1, fifosize => CFG_ETH_FIFO,
        nsync => 1, edcl => CFG_DSU_ETH, edclbufsz => CFG_ETH_BUF, phyrstadr => 7,
        macaddrh => CFG_ETH_ENM, macaddrl => CFG_ETH_ENL, enable_mdint => 1,
	ipaddrh => CFG_ETH_IPM, ipaddrl => CFG_ETH_IPL,
	giga => CFG_GRETH1G)
      port map( rst => rstn, clk => clkm, ahbmi => ahbmi,
        ahbmo => ahbmo(CFG_NCPU+CFG_AHB_JTAG), apbi => apbi, apbo => apbo(14),
	ethi => ethi, etho => etho); 

      emdio_pad : iopad generic map (tech => padtech) 
      port map (phy_mii_data, etho.mdio_o, etho.mdio_oe, ethi.mdio_i);
      etxc_pad : clkpad generic map (tech => padtech, arch => 2) 
	port map (phy_tx_clk, ethi.tx_clk);
      erxc_pad : clkpad generic map (tech => padtech, arch => 2) 
	port map (phy_rx_clk, ethi.rx_clk);
      erxd_pad : inpadv generic map (tech => padtech, width => 8) 
	port map (phy_rx_data, ethi.rxd(7 downto 0));
      erxdv_pad : inpad generic map (tech => padtech) 
	port map (phy_dv, ethi.rx_dv);
      erxer_pad : inpad generic map (tech => padtech) 
	port map (phy_rx_er, ethi.rx_er);
      erxco_pad : inpad generic map (tech => padtech) 
	port map (phy_col, ethi.rx_col);
      erxcr_pad : inpad generic map (tech => padtech) 
	port map (phy_crs, ethi.rx_crs);

      etxd_pad : outpadv generic map (tech => padtech, width => 8) 
	port map (phy_tx_data, etho.txd(7 downto 0));
      etxen_pad : outpad generic map (tech => padtech) 
	port map ( phy_tx_en, etho.tx_en);
      etxer_pad : outpad generic map (tech => padtech) 
	port map (phy_tx_er, etho.tx_er);
      emdc_pad : outpad generic map (tech => padtech) 
	port map (phy_mii_clk, etho.mdc);
      erst_pad : outpad generic map (tech => padtech) 
	port map (phy_rst_n, rstn);
      emdintn_pad : inpad generic map (tech => padtech) 
        port map (phy_mii_int_n, ethi.mdint);

      ethi.gtx_clk <= egtx_clk;

    end generate;

-----------------------------------------------------------------------
---  AHB ROM ----------------------------------------------------------
-----------------------------------------------------------------------

  bpromgen : if CFG_AHBROMEN /= 0 generate
    brom : entity work.ahbrom
      generic map (hindex => 5, haddr => CFG_AHBRODDR, pipe => CFG_AHBROPIP)
      port map ( rstn, clkm, ahbsi, ahbso(5));
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
 ---  Drive unused bus elements  ---------------------------------------
 -----------------------------------------------------------------------
 
 --  nam1 : for i in (CFG_NCPU+CFG_GRETH+CFG_AHB_JTAG+CFG_PCIEXP) to NAHBMST-1 generate
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
    msg1 => "LEON3 Xilinx SP605 Demonstration design",
    fabtech => tech_table(fabtech), memtech => tech_table(memtech),
    mdel => 1
   );
 -- pragma translate_on
 end;
 

