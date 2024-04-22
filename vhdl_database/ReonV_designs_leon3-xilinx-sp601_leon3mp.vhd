------------------------------------------------------------------------------
--  LEON3 Demonstration design
--  Copyright (C) 2006 Jiri Gaisler, Gaisler Research
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
library esa;
use esa.memoryctrl.all;
use work.config.all;

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
    reset     : in    std_ulogic;
    reset_o1  : out   std_ulogic;
    reset_o2  : out   std_ulogic;
    clk27     : in    std_ulogic;
    clk200_p  : in    std_ulogic;
    clk200_n  : in    std_ulogic;
    errorn    : out   std_ulogic;

    -- PROM interface
    address   : out   std_logic_vector(23 downto 0);
    data      : inout std_logic_vector(7 downto 0);
    romsn     : out   std_ulogic;
    oen       : out   std_ulogic;
    writen    : out   std_ulogic;
-- pragma translate_off
    iosn      : out   std_ulogic;
    testdata  : inout std_logic_vector(23 downto 0);
-- pragma translate_on 

    -- DDR2 memory  
    ddr_clk        : out   std_logic;
    ddr_clkb       : out   std_logic;
    ddr_cke        : out   std_logic;
    ddr_we         : out   std_ulogic;                     -- write enable
    ddr_ras        : out   std_ulogic;                     -- ras
    ddr_cas        : out   std_ulogic;                     -- cas
    ddr_dm         : out   std_logic_vector(1 downto 0);   -- dm
    ddr_dqs        : inout std_logic_vector(1 downto 0);   -- dqs
    ddr_dqsn       : inout std_logic_vector(1 downto 0);   -- dqsn
    ddr_ad         : out   std_logic_vector(12 downto 0);  -- address
    ddr_ba         : out   std_logic_vector(2 downto 0);   -- bank address
    ddr_dq         : inout std_logic_vector(15 downto 0);  -- data
    ddr_odt        : out   std_logic;
    ddr_rzq        : inout std_logic;
    ddr_zio        : inout std_logic;

    -- Debug support unit
    dsubre    : in    std_ulogic;       -- Debug Unit break (connect to button)

    -- AHB Uart
    dsurx     : in    std_ulogic;
    dsutx     : out   std_ulogic;

    -- Ethernet signals
    etx_clk   : in    std_ulogic;
    erx_clk   : in    std_ulogic;
    erxd      : in    std_logic_vector(7 downto 0);
    erx_dv    : in    std_ulogic;
    erx_er    : in    std_ulogic;
    erx_col   : in    std_ulogic;
    erx_crs   : in    std_ulogic;
    etxd      : out   std_logic_vector(7 downto 0);
    etx_en    : out   std_ulogic;
    etx_er    : out   std_ulogic;
    emdc      : out   std_ulogic;
    emdio     : inout std_logic;

    -- SPI flash
--    spi_sel_n : inout std_ulogic;
--    spi_clk   : out   std_ulogic;
--    spi_mosi  : out   std_ulogic;

    -- Output signals to LEDs
    led       : out   std_logic_vector(2 downto 0)
    );
end;

architecture rtl of leon3mp is
  signal vcc : std_logic;
  signal gnd : std_logic;
  signal ddr_clk_fb_out : std_logic;
  signal ddr_clk_fb     : std_logic;

  signal memi : memory_in_type;
  signal memo : memory_out_type;
  signal wpo  : wprot_out_type;

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

  signal u1i, dui : uart_in_type;
  signal u1o, duo : uart_out_type;

  signal irqi : irq_in_vector(0 to CFG_NCPU-1);
  signal irqo : irq_out_vector(0 to CFG_NCPU-1);

  signal dbgi : l3_debug_in_vector(0 to CFG_NCPU-1);
  signal dbgo : l3_debug_out_vector(0 to CFG_NCPU-1);

  signal dsui : dsu_in_type;
  signal dsuo : dsu_out_type;

  signal ethi : eth_in_type;
  signal etho : eth_out_type;

  signal gpti : gptimer_in_type;

  signal spii : spi_in_type;
  signal spio : spi_out_type;
  signal slvsel : std_logic_vector(CFG_SPICTRL_SLVS-1 downto 0);

  signal spmi : spimctrl_in_type;
  signal spmo : spimctrl_out_type;

  signal lclk, lclk200      : std_ulogic;
  signal clkm, rstn, clkml  : std_ulogic;
  signal tck, tms, tdi, tdo : std_ulogic;
  signal rstraw             : std_logic;
  signal lock               : std_logic;

  -- RS232 APB Uart
  signal rxd1 : std_logic;
  signal txd1 : std_logic;
  
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

  constant BOARD_FREQ : integer := 27000;                                -- CLK input frequency in KHz
  constant DDR2_FREQ  : integer := 200000;                               -- DDR2 input frequency in KHz
  constant CPU_FREQ   : integer := BOARD_FREQ * CFG_CLKMUL / CFG_CLKDIV;  -- cpu frequency in KHz
begin

----------------------------------------------------------------------
---  Reset and Clock generation  -------------------------------------
----------------------------------------------------------------------

  vcc <= '1';
  gnd <= '0';
  cgi.pllctrl <= "00";
  cgi.pllrst <= rstraw;

  -- Glitch free reset that can be used for the Eth Phy and flash memory
  reset_o1 <= rstn;
  reset_o2 <= rstn;

  rst0 : rstgen generic map (acthigh => 1)
    port map (reset, clkm, lock, rstn, rstraw);
  
  clk27_pad : clkpad generic map (tech => padtech) port map (clk27, lclk); 

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
                 nahbm => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_GRETH, 
                 nahbs => 8, devid => XILINX_SP601)
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

    error_pad : odpad generic map (tech => padtech) port map (errorn, dbgo(0).error);

    -- LEON3 Debug Support Unit    
    dsugen : if CFG_DSU = 1 generate
      dsu0 : dsu3
        generic map (hindex => 2, haddr => 16#900#, hmask => 16#F00#,
                     ncpu   => CFG_NCPU, tbits => 30, tech => memtech, irq => 0, kbytes => CFG_ATBSZ)
        port map (rstn, clkm, ahbmi, ahbsi, ahbso(2), dbgo, dbgi, dsui, dsuo);

      dsubre_pad : inpad generic map (tech  => padtech) port map (dsubre, dsui.break);

      dsui.enable <= '1';
      led(2) <= dsuo.active;
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
---  Memory controllers ----------------------------------------------
----------------------------------------------------------------------

  mg2 : if CFG_MCTRL_LEON2 = 1 generate        -- LEON2 memory controller
    sr1 : mctrl generic map (hindex => 5, pindex => 0, paddr => 0,
	ram8 => CFG_MCTRL_RAM8BIT, ram16 => CFG_MCTRL_RAM16BIT, rammask => 0)
      port map (rstn, clkm, memi, memo, ahbsi, ahbso(5), apbi, apbo(0), wpo, open);
  end generate;

  memi.brdyn  <= '1';
  memi.bexcn  <= '1';
  memi.writen <= '1';
  memi.wrn    <= "1111";
  memi.bwidth <= "00";

  mg0 : if (CFG_MCTRL_LEON2 = 0) generate 
    apbo(0) <= apb_none;
    ahbso(5) <= ahbs_none;
    roms_pad : outpad generic map (tech => padtech)
      port map (romsn, vcc);
    memo.bdrive(0) <= '1';
  end generate;

  mgpads : if (CFG_MCTRL_LEON2 /= 0) generate 
    addr_pad : outpadv generic map (tech => padtech, width => 24)
      port map (address, memo.address(23 downto 0));
    roms_pad : outpad generic map (tech => padtech)
      port map (romsn, memo.romsn(0));
    oen_pad : outpad generic map (tech => padtech)
      port map (oen, memo.oen);
    wri_pad : outpad generic map (tech => padtech)
      port map (writen, memo.writen);

-- pragma translate_off    
    iosn_pad : outpad generic map (tech => padtech) 
	port map (iosn, memo.iosn);
    tbdr : iopadv generic map (tech => padtech, width => 24)
        port map (testdata(23 downto 0), memo.data(23 downto 0),
                  memo.bdrive(1), memi.data(23 downto 0));
-- pragma translate_on
  end generate;

  bdr : iopadv generic map (tech => padtech, width => 8)
    port map (data(7 downto 0), memo.data(31 downto 24),
              memo.bdrive(0), memi.data(31 downto 24));
  
----------------------------------------------------------------------
---  DDR2 memory controller ------------------------------------------
----------------------------------------------------------------------
  
  ddr2sp0 : if (CFG_DDR2SP /= 0) generate 
    clk200_pad : inpad_ds generic map (tech => padtech, voltage => x25v) 
      port map (clk200_p, clk200_n, lclk200); 
    ddrc0 : ddr2spa generic map ( fabtech => fabtech, memtech => memtech,
      hindex => 4, haddr => 16#400#, hmask => 16#F00#, ioaddr => 1, 
      pwron => CFG_DDR2SP_INIT, MHz => DDR2_FREQ/1000, clkmul => 5, clkdiv => 8,
      TRFC => CFG_DDR2SP_TRFC,
      ahbfreq => CPU_FREQ/1000, col => CFG_DDR2SP_COL, Mbyte => CFG_DDR2SP_SIZE,
      ddrbits => 16, eightbanks => 1, odten => 0)
    port map ( cgo.clklock, rstn, lclk200, clkm, vcc, lock, clkml, clkml, ahbsi, ahbso(4),
        core_ddr_clk, core_ddr_clkb, ddr_clk_fb_out, ddr_clk_fb, core_ddr_cke,
        core_ddr_csb, ddr_we, ddr_ras, ddr_cas, ddr_dm, ddr_dqs, ddr_dqsn,
        core_ddr_ad, ddr_ba, ddr_dq, core_ddr_odt);

    ddr_clk              <= core_ddr_clk(0);
    ddr_clkb             <= core_ddr_clkb(0);
    ddr_cke              <= core_ddr_cke(0);
    ddr_ad               <= core_ddr_ad(12 downto 0);
    ddr_odt              <= core_ddr_odt(0);
  end generate;

  mig_gen : if (CFG_MIG_DDR2 = 1) generate 
    ddrc : entity work.ahb2mig_sp601 generic map( 
	hindex => 4, haddr => 16#400#, hmask => 16#F80#,
	pindex => 5, paddr => 5)  
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
	ahbsi		=> ahbsi,
	ahbso		=> ahbso(4),
	apbi 		=> apbi,
	apbo 		=> apbo(5),
	calib_done	=> lock,
	rst_n_syn	=> rstn,
	rst_n_async	=> rstraw,  
	clk_amba	=> clkm,
	clk_mem_n	=> clk200_n,
	clk_mem_p	=> clk200_p,
	
	test_error	=> open
	);

  end generate;
  noddr : if (CFG_DDR2SP+CFG_MIG_DDR2) = 0 generate lock <= '1'; end generate;

----------------------------------------------------------------------
---  SPI Memory Controller--------------------------------------------
----------------------------------------------------------------------

--  spimc: if CFG_SPICTRL_ENABLE = 0 and CFG_SPIMCTRL = 1 generate
--    spimctrl0 : spimctrl        -- SPI Memory Controller
--      generic map (hindex => 7, hirq => 11, faddr => 16#e00#, fmask => 16#ff8#,
--                   ioaddr => 16#002#, iomask => 16#fff#,
--                   spliten => CFG_SPLIT, oepol  => 0,
--                   sdcard => CFG_SPIMCTRL_SDCARD,
--                   readcmd => CFG_SPIMCTRL_READCMD,
--                   dummybyte => CFG_SPIMCTRL_DUMMYBYTE,
--                   dualoutput => CFG_SPIMCTRL_DUALOUTPUT,
--                   scaler => CFG_SPIMCTRL_SCALER,
--                   altscaler => CFG_SPIMCTRL_ASCALER,
--                   pwrupcnt => CFG_SPIMCTRL_PWRUPCNT)
--      port map (rstn, clkm, ahbsi, ahbso(7), spmi, spmo);
--
--    -- MISO is shared with Flash data 0
--    spmi.miso <= memi.data(24);
--    mosi_pad : outpad generic map (tech => padtech)
--      port map (spi_mosi, spmo.mosi);
--    sck_pad  : outpad generic map (tech => padtech)
--      port map (spi_clk, spmo.sck);
--    slvsel0_pad : odpad generic map (tech => padtech)
--      port map (spi_sel_n, spmo.csn);  
--  end generate;
  
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

  -- GPIO Unit
  gpio0 : if CFG_GRGPIO_ENABLE /= 0 generate
    grgpio0: grgpio
      generic map(pindex => 11, paddr => 11, imask => CFG_GRGPIO_IMASK, nbits => 12)
      port map(rstn, clkm, apbi, apbo(11), gpioi, gpioo);
  end generate;

  ua1 : if CFG_UART1_ENABLE /= 0 generate
    uart1 : apbuart                     -- UART 1
      generic map (pindex   => 1, paddr => 1, pirq => 2, console => dbguart, fifosize => CFG_UART1_FIFO)
      port map (rstn, clkm, apbi, apbo(1), u1i, u1o);
    u1i.rxd    <= rxd1;
    u1i.ctsn   <= '0';
    u1i.extclk <= '0';
    txd1       <= u1o.txd;
    serrx_pad : inpad generic map (tech  => padtech) port map (dsurx, rxd1);
    sertx_pad : outpad generic map (tech => padtech) port map (dsutx, txd1);
    led(0) <= not rxd1;
    led(1) <= not txd1;
  end generate;
  noua0 : if CFG_UART1_ENABLE = 0 generate apbo(1) <= apb_none; end generate;

--  spic: if CFG_SPICTRL_ENABLE = 1 generate  -- SPI controller
--    spi1 : spictrl
--      generic map (pindex => 7, paddr  => 7, pmask  => 16#fff#, pirq => 11,
--                   fdepth => CFG_SPICTRL_FIFO, slvselen => CFG_SPICTRL_SLVREG,
--                   slvselsz => CFG_SPICTRL_SLVS, odmode => 0)
--      port map (rstn, clkm, apbi, apbo(7), spii, spio, slvsel);
--    spii.spisel <= '1';                 -- Master only
--    -- MISO is shared with Flash data 0
--    spii.miso <= memi.data(24);
--    mosi_pad : outpad generic map (tech => padtech)
--      port map (spi_mosi, spio.mosi);
--    sck_pad  : outpad generic map (tech => padtech)
--      port map (spi_clk, spio.sck);
--    slvsel_pad : odpad generic map (tech => padtech)
--      port map (spi_sel_n, slvsel(0));
--  end generate spic;

  nospi: if CFG_SPICTRL_ENABLE = 0 and CFG_SPIMCTRL = 0 generate
    apbo(7) <= apb_none;
--    mosi_pad : outpad generic map (tech => padtech)
--      port map (spi_mosi, gnd);
--    sck_pad  : outpad generic map (tech => padtech)
--      port map (spi_clk, gnd);
--    slvsel_pad : odpad generic map (tech => padtech)
--      port map (spi_sel_n, vcc);
  end generate;

-----------------------------------------------------------------------
---  ETHERNET ---------------------------------------------------------
-----------------------------------------------------------------------

  eth0 : if CFG_GRETH = 1 generate -- Gaisler ethernet MAC
    e1 : grethm
      generic map(hindex => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG,
                  pindex => 15, paddr => 15, pirq => 12, memtech => memtech,
                  mdcscaler => CPU_FREQ/1000, enable_mdio => 1, fifosize => CFG_ETH_FIFO,
                  nsync => 1, edcl => CFG_DSU_ETH, edclbufsz => CFG_ETH_BUF,
                  macaddrh => CFG_ETH_ENM, macaddrl => CFG_ETH_ENL, phyrstadr => 7, 
                  ipaddrh => CFG_ETH_IPM, ipaddrl => CFG_ETH_IPL, giga => CFG_GRETH1G)
      port map(rst => rstn, clk => clkm, ahbmi => ahbmi,
               ahbmo => ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG), 
               apbi => apbi, apbo => apbo(15), ethi => ethi, etho => etho); 
  end generate;

  ethpads : if (CFG_GRETH = 1) generate -- eth pads
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

    etxd_pad : outpadv generic map (tech => padtech, width => 8)
      port map (etxd, etho.txd(7 downto 0));
    etxen_pad : outpad generic map (tech => padtech)
      port map (etx_en, etho.tx_en);
    etxer_pad : outpad generic map (tech => padtech)
      port map (etx_er, etho.tx_er);
    emdc_pad : outpad generic map (tech => padtech)
      port map (emdc, etho.mdc);
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
      msg1 => "LEON3 Demonstration design for Xilinx Spartan6 SP601 board",
      fabtech => tech_table(fabtech), memtech => tech_table(memtech),
      mdel => 1
      );
-- pragma translate_on

end rtl;

