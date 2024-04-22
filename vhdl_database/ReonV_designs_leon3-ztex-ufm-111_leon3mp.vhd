------------------------------------------------------------------------------
--  LEON3 Demonstration design
--  Copyright (C) 2011 Aeroflex Gaisler AB
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
--  Patched for ZTEX: Oleg Belousov <belousov.oleg@gmail.com>
-----------------------------------------------------------------------------

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
use gaisler.jtag.all;
--pragma translate_off
use gaisler.sim.all;
--pragma translate_on

use work.config.all;

library unisim;
use unisim.vcomponents.all;

entity leon3mp is
  generic (
    fabtech  : integer := CFG_FABTECH;
    memtech  : integer := CFG_MEMTECH;
    padtech  : integer := CFG_PADTECH;
    clktech  : integer := CFG_CLKTECH;
    disas    : integer := CFG_DISAS;     -- Enable disassembly to console
    dbguart  : integer := CFG_DUART;     -- Print UART on console
    pclow    : integer := CFG_PCLOW
    );
  port (
    reset           : in    std_ulogic;
    clk48           : in    std_ulogic;

    errorn          : out std_logic;
    
    -- DDR SDRAM
    mcb3_dram_dq    : inout std_logic_vector(15 downto 0);
    mcb3_rzq        : inout std_logic;
    mcb3_dram_udqs  : inout std_logic;
    mcb3_dram_dqs   : inout std_logic;
    mcb3_dram_a     : out   std_logic_vector(12 downto 0);
    mcb3_dram_ba    : out   std_logic_vector(1 downto 0);
    mcb3_dram_cke   : out   std_logic;
    mcb3_dram_ras_n : out   std_logic;
    mcb3_dram_cas_n : out   std_logic;
    mcb3_dram_we_n  : out   std_logic;
    mcb3_dram_dm    : out   std_logic;
    mcb3_dram_udm   : out   std_logic;
    mcb3_dram_ck    : out   std_logic;
    mcb3_dram_ck_n  : out   std_logic;

    -- Debug support unit
    dsubre          : in    std_ulogic;       -- Debug Unit break (connect to button)
    dsuact          : out   std_ulogic;       -- Debug Unit break (connect to button)

    -- AHB UART (debug link)
    dsurx           : in    std_ulogic;
    dsutx           : out   std_ulogic;

    -- UART
    rxd1            : in    std_ulogic;
    txd1            : out   std_ulogic;

    -- SD card
    sd_dat          : inout std_logic;
    sd_cmd          : inout std_logic;
    sd_sck          : inout std_logic;
    sd_dat3         : out   std_logic
    );
end;

architecture rtl of leon3mp is
  signal vcc : std_logic;
  signal gnd : std_logic;

  signal clk200			: std_logic;

  signal gpioi : gpio_in_type;
  signal gpioo : gpio_out_type;

  signal apbi  : apb_slv_in_type;
  signal apbo  : apb_slv_out_vector := (others => apb_none);
  signal ahbsi : ahb_slv_in_type;
  signal ahbso : ahb_slv_out_vector := (others => ahbs_none);
  signal ahbmi : ahb_mst_in_type;
  signal ahbmo : ahb_mst_out_vector := (others => ahbm_none);

  signal cgi : clkgen_in_type;
  signal cgo : clkgen_out_type;
  signal cgo_ddr : clkgen_out_type;

  signal u1i, dui : uart_in_type;
  signal u1o, duo : uart_out_type;

  signal irqi : irq_in_vector(0 to CFG_NCPU-1);
  signal irqo : irq_out_vector(0 to CFG_NCPU-1);

  signal dbgi : l3_debug_in_vector(0 to CFG_NCPU-1);
  signal dbgo : l3_debug_out_vector(0 to CFG_NCPU-1);

  signal dsui : dsu_in_type;
  signal dsuo : dsu_out_type;

  signal gpti : gptimer_in_type;

  signal spii : spi_in_type;
  signal spio : spi_out_type;
  signal slvsel : std_logic_vector(CFG_SPICTRL_SLVS-1 downto 0);
  
  signal lclk, lclk200      : std_ulogic;
  signal clkm, rstn, clkml  : std_ulogic;
  signal tck, tms, tdi, tdo : std_ulogic;
  signal rstraw             : std_logic;
  signal lock               : std_logic;

  -- Used for connecting input/output signals to the DDR2 controller
  signal core_ddr_clk  : std_logic_vector(2 downto 0);
  signal core_ddr_clkb : std_logic_vector(2 downto 0);
  signal core_ddr_cke  : std_logic_vector(1 downto 0);
  signal core_ddr_csb  : std_logic_vector(1 downto 0);
  signal core_ddr_ad   : std_logic_vector(13 downto 0);
  signal core_ddr_odt  : std_logic_vector(1 downto 0);

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

  constant BOARD_FREQ : integer := 48000;                                -- CLK input frequency in KHz
  constant CPU_FREQ   : integer := BOARD_FREQ * CFG_CLKMUL / CFG_CLKDIV;  -- cpu frequency in KHz
begin

----------------------------------------------------------------------
---  Reset and Clock generation  -------------------------------------
----------------------------------------------------------------------

  vcc <= '1';
  gnd <= '0';
  cgi.pllctrl <= "00";
  cgi.pllrst <= rstraw;

  rst0 : rstgen generic map (acthigh => 1)
    port map (reset, clkm, lock, rstn, rstraw);
  
  clk48_pad : clkpad generic map (tech => padtech) port map (clk48, lclk); 

  -- clock generator
  clkgen0 : clkgen
    generic map (fabtech, CFG_CLKMUL, CFG_CLKDIV, 0, 0, 0, 0, 0, BOARD_FREQ, 0)
    port map (lclk, gnd, clkm, open, open, open, open, cgi, cgo, open, open, open);

---------------------------------------------------------------------- 
---  AHB CONTROLLER --------------------------------------------------
----------------------------------------------------------------------

  ahb0 : ahbctrl
    generic map (defmast => CFG_DEFMST, split => CFG_SPLIT,
                 rrobin  => CFG_RROBIN, ioaddr => CFG_AHBIO, ioen => 1, 
                 nahbm => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG, 
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

    errorn_pad : outpad generic map (tech => padtech) port map (errorn, dbgo(0).error);
    
    -- LEON3 Debug Support Unit    
    dsugen : if CFG_DSU = 1 generate
      dsu0 : dsu3
        generic map (hindex => 2, haddr => 16#900#, hmask => 16#F00#,
                     ncpu   => CFG_NCPU, tbits => 30, tech => memtech, irq => 0, kbytes => CFG_ATBSZ)
        port map (rstn, clkm, ahbmi, ahbsi, ahbso(2), dbgo, dbgi, dsui, dsuo);

      dsubre_pad : inpad generic map (tech => padtech) port map (dsubre, dsui.break); 
      dsuact_pad : outpad generic map (tech => padtech) port map (dsuact, dsuo.active);

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
    dsurx_pad : inpad generic map (tech  => padtech) port map (dsurx, dui.rxd);
    dsutx_pad : outpad generic map (tech => padtech) port map (dsutx, duo.txd);
  end generate;
  nouah : if CFG_AHB_UART = 0 generate apbo(4) <= apb_none; end generate;

  ahbjtaggen0 :if CFG_AHB_JTAG = 1 generate
    ahbjtag0 : ahbjtag generic map(tech => fabtech, hindex => CFG_NCPU+CFG_AHB_UART)
      port map(rstn, clkm, tck, tms, tdi, tdo, ahbmi, ahbmo(CFG_NCPU+CFG_AHB_UART),
               open, open, open, open, open, open, open, gnd);
  end generate;

----------------------------------------------------------------------
---  DDR2 memory controller ------------------------------------------
----------------------------------------------------------------------
  
  mig_gen : if (CFG_MIG_DDR2 = 1) generate 
    clkgen_ddr : clkgen
	generic map (fabtech, 25, 6, 0, 0, 0, 0, 0, BOARD_FREQ, 0)
	port map (lclk, gnd, clk200, open, open, open, open, cgi, cgo_ddr, open, open, open);

    ddrc : entity work.ahb2mig_ztex generic map( 
	hindex => 4, haddr => 16#400#, hmask => CFG_MIG_HMASK,
	pindex => 5, paddr => 5)  
    port map(
 	mcb3_dram_dq  	=> mcb3_dram_dq,
   	mcb3_rzq	=> mcb3_rzq,
   	mcb3_dram_udqs	=> mcb3_dram_udqs,
	mcb3_dram_dqs	=> mcb3_dram_dqs,
   	mcb3_dram_a	=> mcb3_dram_a,
   	mcb3_dram_ba  	=> mcb3_dram_ba,
   	mcb3_dram_cke	=> mcb3_dram_cke,
   	mcb3_dram_ras_n	=> mcb3_dram_ras_n,
   	mcb3_dram_cas_n	=> mcb3_dram_cas_n,
   	mcb3_dram_we_n	=> mcb3_dram_we_n,
   	mcb3_dram_dm	=> mcb3_dram_dm,
   	mcb3_dram_udm	=> mcb3_dram_udm,
   	mcb3_dram_ck	=> mcb3_dram_ck,
   	mcb3_dram_ck_n	=> mcb3_dram_ck_n,

	ahbsi		=> ahbsi,
	ahbso		=> ahbso(4),
	apbi 		=> apbi,
	apbo 		=> apbo(5),
	calib_done	=> lock,
	rst_n_syn	=> rstn,
	rst_n_async	=> rstraw,  
	clk_amba	=> clkm,
	clk_mem		=> clk200,
	
	test_error	=> open
	);
  end generate;
  noddr : if CFG_MIG_DDR2 = 0 generate lock <= '1'; end generate;

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

  -- General purpose timer unit
  gpt : if CFG_GPT_ENABLE /= 0 generate
    timer0 : gptimer
      generic map (pindex => 3, paddr => 3, pirq => CFG_GPT_IRQ,
                   sepirq => CFG_GPT_SEPIRQ, sbits => CFG_GPT_SW,
                   ntimers => CFG_GPT_NTIM, nbits  => CFG_GPT_TW)
      port map (rstn, clkm, apbi, apbo(3), gpti, open);
    gpti <= gpti_dhalt_drive(dsuo.tstop);
  end generate;
  notim : if CFG_GPT_ENABLE = 0 generate apbo(3) <= apb_none; end generate;

  -- GPIO Unit
  gpio0 : if CFG_GRGPIO_ENABLE /= 0 generate
    grgpio0: grgpio
      generic map(pindex => 11, paddr => 11, imask => CFG_GRGPIO_IMASK, nbits => 12)
      port map(rstn, clkm, apbi, apbo(11), gpioi, gpioo);
  end generate;
  -- NOTE:
  -- GPIO pads are not instantiated here. If you want to use
  -- GPIO then add a top-level port, update the UCF and
  -- instantiate pads for the GPIO lines as is done in other
  -- template designs.

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

  spic: if CFG_SPICTRL_ENABLE = 1 generate  -- SPI controller
    spi1 : spictrl
      generic map (pindex => 9, paddr  => 9, pmask  => 16#fff#, pirq => 10,
                   fdepth => CFG_SPICTRL_FIFO, slvselen => CFG_SPICTRL_SLVREG,
                   slvselsz => CFG_SPICTRL_SLVS, odmode => CFG_SPICTRL_ODMODE,
                   syncram => CFG_SPICTRL_SYNCRAM, ft => CFG_SPICTRL_FT)
      port map (rstn, clkm, apbi, apbo(9), spii, spio, slvsel);
    miso_pad : iopad generic map (tech => padtech)
      port map (sd_dat, spio.miso, spio.misooen, spii.miso);
    mosi_pad : iopad generic map (tech => padtech)
      port map (sd_cmd, spio.mosi, spio.mosioen, spii.mosi);
    sck_pad  : iopad generic map (tech => padtech)
      port map (sd_sck, spio.sck, spio.sckoen, spii.sck);
    slvsel_pad : outpad generic map (tech => padtech)
      port map (sd_dat3, slvsel(0));
    spii.spisel <= '1';                 -- Master only
  end generate spic;
  nospic: if CFG_SPICTRL_ENABLE = 0 generate apbo(9) <= apb_none; end generate;
  
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
      generic map (hindex => 3, haddr => CFG_AHBRADDR, tech => CFG_MEMTECH, kbytes => CFG_AHBRSZ)
      port map (rstn, clkm, ahbsi, ahbso(3));
  end generate;
  nram : if CFG_AHBRAMEN = 0 generate ahbso(3) <= ahbs_none; end generate;


-----------------------------------------------------------------------
--  Test report module, only used for simulation ----------------------
-----------------------------------------------------------------------
--pragma translate_off
  test0 : ahbrep generic map (hindex => 5, haddr => 16#200#)
    port map (rstn, clkm, ahbsi, ahbso(5));
--pragma translate_on
    
-----------------------------------------------------------------------
---  Drive unused bus elements  ---------------------------------------
-----------------------------------------------------------------------

  nam1 : for i in (CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+1) to NAHBMST-1 generate
    ahbmo(i) <= ahbm_none;
  end generate;

-----------------------------------------------------------------------
---  Boot message  ----------------------------------------------------
-----------------------------------------------------------------------

-- pragma translate_off
  x : report_design
    generic map (
      msg1 => "LEON3 Demonstration design for ZTEX USB-FPGA Module 1.11",
      fabtech => tech_table(fabtech), memtech => tech_table(memtech),
      mdel => 1
      );
-- pragma translate_on

end rtl;

