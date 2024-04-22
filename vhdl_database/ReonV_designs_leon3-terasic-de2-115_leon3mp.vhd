-----------------------------------------------------------------------------
--  LEON3 Demonstration design
--  Copyright (C) 2004 Jiri Gaisler, Gaisler Research
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
use gaisler.spi.all;
use gaisler.can.all;
use gaisler.net.all;
use gaisler.jtag.all;
use gaisler.gr1553b_pkg.all;
-- pragma translate_off
use gaisler.sim.all;
-- pragma translate_on

library esa;
use esa.memoryctrl.all;
use work.config.all;

entity leon3mp is
  generic (
    fabtech   : integer := CFG_FABTECH;
    memtech   : integer := CFG_MEMTECH;
    padtech   : integer := CFG_PADTECH;
    clktech   : integer := CFG_CLKTECH;
    disas     : integer := CFG_DISAS;	-- Enable disassembly to console
    dbguart   : integer := CFG_DUART;	-- Print UART on console
    pclow     : integer := CFG_PCLOW
  );
  port (
    resetn	: in  std_logic;
    clock_50	: in  std_logic;
    sma_clkout  : out std_ulogic;
    errorn	: out std_logic;

    fl_addr 	: out std_logic_vector(22 downto 0);
    fl_dq	: inout std_logic_vector(7 downto 0);
    dram_addr  	: out std_logic_vector(12 downto 0);
    dram_ba    	: out std_logic_vector(1 downto 0);
    dram_dq	: inout std_logic_vector(31 downto 0);

    dram_clk  	: out std_logic;
    dram_cke  	: out std_logic;
    dram_cs_n  	: out std_logic;
    dram_we_n  	: out std_logic;                       -- sdram write enable
    dram_ras_n  : out std_logic;                       -- sdram ras
    dram_cas_n  : out std_logic;                       -- sdram cas
    dram_dqm   	: out std_logic_vector (3 downto 0);    -- sdram dqm
    uart_txd  	: out std_logic; 			-- DSU tx data
    uart_rxd  	: in  std_logic;  			-- DSU rx data
    dsubre  	: in std_logic;
    dsuact  	: out std_logic;
    fl_oe_n    	: out std_logic;
    fl_we_n 	: out std_logic;
    fl_rst_n   	: out std_logic;
    fl_wp_n   	: out std_logic;
    fl_ce_n  	: out std_logic;

--    gpio        : inout std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0); 	-- I/O port
    gpio        : inout std_logic_vector(35 downto 0); 	-- I/O port
    
    enet0_mdio  : inout std_logic;		-- ethernet PHY interface
    enet0_gtx_clk  : in std_logic;
    enet0_rx_clk : in std_logic;
    enet0_tx_clk : in std_logic;
    enet0_rx_data: in std_logic_vector(3 downto 0);   
    enet0_rx_dv  : in std_logic; 
    enet0_rx_er  : in std_logic; 
    enet0_rx_col : in std_logic;
    enet0_rx_crs : in std_logic;
    enet0_int_n  : in std_logic;
    enet0_rst_n  : out std_logic;
    enet0_tx_data: out std_logic_vector(3 downto 0);   
    enet0_tx_en : out std_logic; 
    enet0_tx_er : out std_logic; 
    enet0_mdc 	: out std_logic;

    can_txd	: out std_logic_vector(0 to CFG_CAN_NUM-1);
    can_rxd	: in  std_logic_vector(0 to CFG_CAN_NUM-1);
    can_stb	: out std_logic_vector(0 to CFG_CAN_NUM-1);

    clk_1553   : in  std_logic;
    busainen   : out std_logic;
    busainp    : in  std_logic;
    busainn    : in  std_logic;
    busaoutin  : out std_logic;
    busaoutp   : out std_logic;
    busaoutn   : out std_logic;
    busbinen   : out std_logic;
    busbinp    : in  std_logic;
    busbinn    : in  std_logic;
    busboutin  : out std_logic;
    busboutp   : out std_logic;
    busboutn   : out std_logic;
    
    sw      	: in std_logic_vector(0 to 2) := "000"

    );
end;

architecture rtl of leon3mp is

constant blength : integer := 12;
constant fifodepth : integer := 8;

signal vcc, gnd   : std_logic_vector(4 downto 0);
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

signal clkm, rstn, rstraw, pciclk, sdclkl : std_logic;
signal cgi, cgi2 : clkgen_in_type;
signal cgo, cgo2 : clkgen_out_type;
signal u1i, u2i, dui : uart_in_type;
signal u1o, u2o, duo : uart_out_type;

signal irqi : irq_in_vector(0 to CFG_NCPU-1);
signal irqo : irq_out_vector(0 to CFG_NCPU-1);

signal dbgi : l3_debug_in_vector(0 to CFG_NCPU-1);
signal dbgo : l3_debug_out_vector(0 to CFG_NCPU-1);

signal dsui : dsu_in_type;
signal dsuo : dsu_out_type; 

signal spii, spislvi : spi_in_type;
signal spio, spislvo : spi_out_type;
signal slvsel : std_logic_vector(CFG_SPICTRL_SLVS-1 downto 0);

signal stati : ahbstat_in_type;

signal ethi, ethi1, ethi2 : eth_in_type;
signal etho, etho1, etho2 : eth_out_type;

signal ethclk, egtx_clk_fb : std_logic;
signal egtx_clk, legtx_clk, l2egtx_clk : std_logic;

signal gpti : gptimer_in_type;
signal gpto : gptimer_out_type;

signal gpioi : gpio_in_type;
signal gpioo : gpio_out_type;

signal clklock, elock : std_ulogic;
signal can_lrx, can_ltx   : std_logic_vector(0 to 7);
signal dsubren : std_logic;
signal pci_arb_req_n, pci_arb_gnt_n   : std_logic_vector(0 to 3);

signal clk1553 : Std_Logic;
type milout_array is array (0 to 0) of gr1553b_txout_type;
type milin_array is array (0 to 0) of gr1553b_rxin_type;
signal rst1553: std_ulogic;
signal milout: milout_array;
signal milin: milin_array;

signal tck, tms, tdi, tdo : std_logic;

signal fpi : grfpu_in_vector_type;
signal fpo : grfpu_out_vector_type;

constant BOARD_FREQ : integer := 50000;	-- Board frequency in KHz
constant CPU_FREQ : integer := BOARD_FREQ * CFG_CLKMUL / CFG_CLKDIV;  -- cpu frequency in KHz
constant IOAEN : integer := CFG_CAN;
constant CFG_SDEN : integer := CFG_MCTRL_SDEN;
constant CFG_INVCLK : integer := CFG_MCTRL_INVCLK;
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

  clkgen0 : clkgen                      -- clock generator using toplevel generic 'freq'
    generic map (tech    => CFG_CLKTECH, clk_mul => CFG_CLKMUL,
                 clk_div => CFG_CLKDIV, sdramen => CFG_MCTRL_SDEN,
                 noclkfb => CFG_CLK_NOFB, freq => BOARD_FREQ, clk2xen => 1)
    port map (clkin => clock_50, pciclkin => gnd(0), clk => clkm, clkn => open,
              clk2x => sma_clkout, sdclk => sdclkl, pciclk => open,
              cgi   => cgi, cgo => cgo);
  sdclk_pad : outpad generic map (tech => padtech, slew => 1) 
	port map (dram_clk, sdclkl);

  rst0 : rstgen			-- reset generator
    port map (resetn, clkm, clklock, rstn, rstraw);
  clklock <= cgo.clklock and elock;

----------------------------------------------------------------------
---  AHB CONTROLLER --------------------------------------------------
----------------------------------------------------------------------

  ahb0 : ahbctrl 		-- AHB arbiter/multiplexer
  generic map (defmast => CFG_DEFMST, split => CFG_SPLIT, 
	rrobin => CFG_RROBIN, ioaddr => CFG_AHBIO, ioen => IOAEN,
	nahbm => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_SPI2AHB+CFG_GRETH+
               CFG_GR1553B_ENABLE,
	nahbs => 8)
  port map (rstn, clkm, ahbmi, ahbmo, ahbsi, ahbso);

----------------------------------------------------------------------
---  LEON3 processor and DSU -----------------------------------------
----------------------------------------------------------------------

  cpu : for i in 0 to CFG_NCPU-1 generate
    leon3 : leon3x               -- LEON3 processor      
      generic map (
        hindex     => i,
        fabtech    => fabtech,
        memtech    => memtech,
        nwindows   => CFG_NWIN,
        dsu        => CFG_DSU,
        fpu        => CFG_FPU + 32*CFG_GRFPUSH,
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
        smp        => CFG_NCPU-1,
        iuft       => CFG_IUFT_EN,
        fpft       => CFG_FPUFT_EN,
        cmft       => CFG_CACHE_FT_EN,
        iuinj      => CFG_RF_ERRINJ,
        ceinj      => CFG_CACHE_ERRINJ,
        cached     => CFG_DFIXED,
        clk2x      => 0,
        netlist    => CFG_LEON3_NETLIST,
        scantest   => CFG_SCAN,
        mmupgsz    => CFG_MMU_PAGE,
        bp         => CFG_BP,
        npasi      => CFG_NP_ASI)
      port map (
        clk => clkm, gclk2 => clkm, gfclk2 => clkm, clk2 => clkm, rstn => rstn,
        ahbi => ahbmi, ahbo => ahbmo(i), ahbsi => ahbsi, ahbso => ahbso, 
        irqi => irqi(i), irqo => irqo(i), dbgi => dbgi(i), dbgo => dbgo(i),
        fpui => fpi(i), fpuo => fpo(i), clken => vcc(0));
  end generate;

  sh : if CFG_GRFPUSH /= 0 generate
    grfpush0 : grfpushwx generic map ((CFG_FPU-1), CFG_NCPU, fabtech)
    port map (clkm, rstn, fpi, fpo);
  end generate;
  nosh : if CFG_GRFPUSH = 0 generate
    fpo <= (others => grfpu_out_none);
  end generate;
  
  errorn_pad : odpad generic map (tech => padtech) port map (errorn, dbgo(0).error);
  
  dsugen : if CFG_DSU = 1 generate
    dsu0 : dsu3			-- LEON3 Debug Support Unit
    generic map (hindex => 2, haddr => 16#900#, hmask => 16#F00#, 
       ncpu => CFG_NCPU, tbits => 30, tech => memtech, irq => 0, kbytes => CFG_ATBSZ)
    port map (rstn, clkm, ahbmi, ahbsi, ahbso(2), dbgo, dbgi, dsui, dsuo);
    dsui.enable <= '1'; 
    dsubre_pad : inpad generic map (tech => padtech) port map (dsubre, dsubren);
    dsui.break <= not dsubren; 
    dsuact_pad : outpad generic map (tech => padtech) port map (dsuact, dsuo.active);
  end generate;
  nodsu : if CFG_DSU = 0 generate 
    ahbso(2) <= ahbs_none; dsuo.tstop <= '0'; dsuo.active <= '0';
  end generate;

  dcomgen : if CFG_AHB_UART = 1 generate
    dcom0: ahbuart		-- Debug UART
    generic map (hindex => CFG_NCPU, pindex => 7, paddr => 7)
    port map (rstn, clkm, dui, duo, apbi, apbo(7), ahbmi, ahbmo(CFG_NCPU));
--    dsurx_pad : inpad generic map (tech => padtech) port map (dsurx, dui.rxd); 
      dui.rxd <= uart_rxd when sw(0) = '0' else '1';
--    dsutx_pad : outpad generic map (tech => padtech) port map (dsutx, duo.txd);
  end generate;
--  nouah : if CFG_AHB_UART = 0 generate apbo(7) <= apb_none; end generate;

  ahbjtaggen0 :if CFG_AHB_JTAG = 1 generate
    ahbjtag0 : ahbjtag generic map(tech => fabtech, hindex => CFG_NCPU+CFG_AHB_UART)
      port map(rstn, clkm, tck, tms, tdi, tdo, ahbmi, ahbmo(CFG_NCPU+CFG_AHB_UART),
               open, open, open, open, open, open, open, gnd(0));
  end generate;
  
----------------------------------------------------------------------
---  Memory controllers ----------------------------------------------
----------------------------------------------------------------------

  memi.edac <= '0'; memi.bwidth <= "00";

  mctrl0 : if CFG_MCTRL_LEON2 = 1 generate 	-- LEON2 memory controller
    sr1 : mctrl generic map (hindex => 0, pindex => 0, paddr => 0, 
	srbanks => 4, sden => CFG_MCTRL_SDEN, ram8 => CFG_MCTRL_RAM8BIT, 
	ram16 => CFG_MCTRL_RAM16BIT, invclk => CFG_MCTRL_INVCLK, 
	sepbus => CFG_MCTRL_SEPBUS, oepol => OEPOL, iomask => 0, 
	sdbits => 32 + 32*CFG_MCTRL_SD64, pageburst => CFG_MCTRL_PAGE)
    port map (rstn, clkm, memi, memo, ahbsi, ahbso(0), apbi, apbo(0), wpo, sdo);

    addr_pad : outpadv generic map (width => 23, tech => padtech) 
	port map (fl_addr, memo.address(22 downto 0)); 
    roms_pad : outpad generic map (tech => padtech) 
	port map (fl_ce_n, memo.romsn(0)); 
    oen_pad  : outpad generic map (tech => padtech) 
	port map (fl_oe_n, memo.oen);
    wri_pad  : outpad generic map (tech => padtech) 
	port map (fl_we_n, memo.writen);
    fl_rst_pad : outpad generic map (tech => padtech) 
	port map (fl_rst_n, rstn); 
    fl_wp_pad : outpad generic map (tech => padtech) 
	port map (fl_wp_n, vcc(0));
    data_pad : iopadvv generic map (tech => padtech, width => 8, oepol => OEPOL)
      port map (fl_dq, memo.data(31 downto 24), memo.vbdrive(31 downto 24), memi.data(31 downto 24));
    memi.brdyn <= '1'; memi.bexcn <= '1';
    memi.writen <= '1'; memi.wrn <= "1111";

    sdpads : if CFG_MCTRL_SDEN = 1 generate 		-- SDRAM controller
      sd2 : if CFG_MCTRL_SEPBUS = 1 generate
        sa_pad : outpadv generic map (width => 13) 
	  port map (dram_addr, memo.sa(12 downto 0));
        ba_pad : outpadv generic map (width => 2) 
	  port map (dram_ba, memo.sa(14 downto 13));
          sd_pad : iopadvv generic map (tech => padtech, width => 32, oepol => OEPOL)
          port map (dram_dq(31 downto 0), memo.sddata(31 downto 0),
		memo.svbdrive(31 downto 0), memi.sd(31 downto 0));
      end generate;
      sdwen_pad : outpad generic map (tech => padtech) 
	   port map (dram_we_n, sdo.sdwen);
      sdras_pad : outpad generic map (tech => padtech) 
	   port map (dram_ras_n, sdo.rasn);
      sdcas_pad : outpad generic map (tech => padtech) 
	   port map (dram_cas_n, sdo.casn);
      sddqm_pad : outpadv generic map (width => 4, tech => padtech) 
	   port map (dram_dqm, sdo.dqm(3 downto 0));
      sdcke_pad : outpad generic map (tech => padtech) 
	   port map (dram_cke, sdo.sdcke(0)); 
      sdcsn_pad : outpad generic map (tech => padtech) 
	   port map (dram_cs_n, sdo.sdcsn(0)); 
    end generate;
  end generate;

  nosd0 : if (CFG_SDEN = 0) generate 		-- no SDRAM controller
      sdcke_pad : outpad generic map (tech => padtech) 
	   port map (dram_cke, vcc(0)); 
      sdcsn_pad : outpad generic map (tech => padtech) 
	   port map (dram_cs_n, vcc(0)); 
  end generate;


  mg0 : if CFG_MCTRL_LEON2 = 0 generate	-- No PROM/SRAM controller
    apbo(0) <= apb_none; ahbso(0) <= ahbs_none;
    roms_pad : outpad generic map (tech => padtech) 
	port map (fl_ce_n, vcc(0)); 
  end generate;


----------------------------------------------------------------------
---  APB Bridge and various periherals -------------------------------
----------------------------------------------------------------------

  apb0 : apbctrl				-- AHB/APB bridge
  generic map (hindex => 1, haddr => CFG_APBADDR)
  port map (rstn, clkm, ahbsi, ahbso(1), apbi, apbo );

  ua1 : if CFG_UART1_ENABLE /= 0 generate
    uart1 : apbuart			-- UART 1
    generic map (pindex => 1, paddr => 1,  pirq => 2, console => dbguart,
	fifosize => CFG_UART1_FIFO)
    port map (rstn, clkm, apbi, apbo(1), u1i, u1o);
    u1i.rxd <= '1' when sw(0) = '0' else uart_rxd; u1i.ctsn <= '0'; u1i.extclk <= '0'; 
  end generate;
  uart_txd <= u1o.txd when sw(0) = '1' else duo.txd;
  noua0 : if CFG_UART1_ENABLE = 0 generate apbo(1) <= apb_none; end generate;

  irqctrl : if CFG_IRQ3_ENABLE /= 0 generate
    irqctrl0 : irqmp			-- interrupt controller
    generic map (pindex => 2, paddr => 2, ncpu => CFG_NCPU)
    port map (rstn, clkm, apbi, apbo(2), irqo, irqi);
  end generate;
  irq3 : if CFG_IRQ3_ENABLE = 0 generate
    x : for i in 0 to CFG_NCPU-1 generate
      irqi(i).irl <= "0000";
    end generate;
--    apbo(2) <= apb_none;
  end generate;

  gpt : if CFG_GPT_ENABLE /= 0 generate
    timer0 : gptimer 			-- timer unit
    generic map (pindex => 3, paddr => 3, pirq => CFG_GPT_IRQ, 
	sepirq => CFG_GPT_SEPIRQ, sbits => CFG_GPT_SW, ntimers => CFG_GPT_NTIM, 
	nbits => CFG_GPT_TW)
    port map (rstn, clkm, apbi, apbo(3), gpti, open);
    gpti <= gpti_dhalt_drive(dsuo.tstop);
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

  spic: if CFG_SPICTRL_ENABLE = 1 generate  -- SPI controller
    spi1 : spictrl
      generic map (pindex => 10, paddr  => 10, pmask  => 16#fff#, pirq => 10,
                   fdepth => CFG_SPICTRL_FIFO, slvselen => CFG_SPICTRL_SLVREG,
                   slvselsz => CFG_SPICTRL_SLVS, odmode => 0, netlist => 0,
                   syncram => CFG_SPICTRL_SYNCRAM, ft => CFG_SPICTRL_FT)
      port map (rstn, clkm, apbi, apbo(10), spii, spio, slvsel);
    spii.spisel <= '1';                 -- Master only
    miso_pad : iopad generic map (tech => padtech)
      port map (gpio(35), spio.miso, spio.misooen, spii.miso);
    mosi_pad : iopad generic map (tech => padtech)
      port map (gpio(34), spio.mosi, spio.mosioen, spii.mosi);
    sck_pad  : iopad generic map (tech => padtech)
      port map (gpio(33), spio.sck, spio.sckoen, spii.sck);
    slvsel_pad : iopad generic map (tech => padtech)
      port map (gpio(32), slvsel(0), gnd(0), open);
  end generate spic;
    
  spibridge : if CFG_SPI2AHB /= 0 generate  -- SPI to AHB bridge
    withapb : if CFG_SPI2AHB_APB /= 0 generate
      spi2ahb0 : spi2ahb_apb
        generic map(hindex => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG,
          ahbaddrh => CFG_SPI2AHB_ADDRH, ahbaddrl => CFG_SPI2AHB_ADDRL,
          ahbmaskh => CFG_SPI2AHB_MASKH, ahbmaskl => CFG_SPI2AHB_MASKL,
          resen => CFG_SPI2AHB_RESEN, pindex => 11, paddr => 11, pmask => 16#fff#,
          pirq => 11, filter => CFG_SPI2AHB_FILTER, cpol => CFG_SPI2AHB_CPOL,
          cpha => CFG_SPI2AHB_CPHA)
        port map (rstn, clkm, ahbmi, ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG),
                  apbi, apbo(11), spislvi, spislvo);
    end generate;
    woapb : if CFG_SPI2AHB_APB = 0 generate
      spi2ahb0 : spi2ahb
        generic map(hindex => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG,
          ahbaddrh => CFG_SPI2AHB_ADDRH, ahbaddrl => CFG_SPI2AHB_ADDRL,
          ahbmaskh => CFG_SPI2AHB_MASKH, ahbmaskl => CFG_SPI2AHB_MASKL,
          filter => CFG_SPI2AHB_FILTER,
          cpol => CFG_SPI2AHB_CPOL, cpha => CFG_SPI2AHB_CPHA)
        port map (rstn, clkm, ahbmi, ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG),
                  spislvi, spislvo);
    end generate;
    spislv_miso_pad : iopad generic map (tech => padtech)
      port map (gpio(31), spislvo.miso, spislvo.misooen, spislvi.miso);
    spislvl_mosi_pad : iopad generic map (tech => padtech)
      port map (gpio(30), spislvo.mosi, spislvo.mosioen, spislvi.mosi);
    spislv_sck_pad  : iopad generic map (tech => padtech)
      port map (gpio(29), spislvo.sck, spislvo.sckoen, spislvi.sck);
    spislv_slvsel_pad : iopad generic map (tech => padtech)
      port map (gpio(28), gnd(0), vcc(0), spislvi.spisel);
  end generate;
  nospibridge : if CFG_SPI2AHB = 0 or CFG_SPI2AHB_APB = 0 generate
    apbo(11) <= apb_none;
  end generate;
  
  ahbs : if CFG_AHBSTAT = 1 generate	-- AHB status register
    stati.cerror(0) <= memo.ce;
    ahbstat0 : ahbstat generic map (pindex => 15, paddr => 15, pirq => 1,
	nftslv => CFG_AHBSTATN)
      port map (rstn, clkm, ahbmi, ahbsi, stati, apbi, apbo(15));
  end generate;
  nop2 : if CFG_AHBSTAT = 0 generate apbo(15) <= apb_none; end generate;

-----------------------------------------------------------------------
---  ETHERNET ---------------------------------------------------------
-----------------------------------------------------------------------
  eth1 : if CFG_GRETH = 1 generate -- Gaisler ethernet MAC
    e1 : grethm generic map(
      hindex => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_SPI2AHB,
      pindex => 14, paddr => 14, pirq => 12, memtech => memtech,
      mdcscaler => CPU_FREQ/1000, enable_mdio => 1, fifosize => CFG_ETH_FIFO,
      nsync => 1, edcl => CFG_DSU_ETH, edclbufsz => CFG_ETH_BUF,
      macaddrh => CFG_ETH_ENM, macaddrl => CFG_ETH_ENL, phyrstadr => 16,
      ipaddrh => CFG_ETH_IPM, ipaddrl => CFG_ETH_IPL, giga => CFG_GRETH1G,
      enable_mdint => 1)
      port map(
        rst => rstn, clk => clkm, ahbmi => ahbmi,
        ahbmo => ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_SPI2AHB),
        apbi => apbi, apbo => apbo(14), ethi => ethi, etho => etho);

    greth1g: if CFG_GRETH1G = 1 generate
      eth_macclk_pad : clkpad
        generic map (tech => padtech, arch => 3, hf => 1)
        port map (enet0_gtx_clk, egtx_clk, cgo.clklock, elock);
    end generate greth1g;
    
    emdio_pad : iopad generic map (tech => padtech) 
      port map (enet0_mdio, etho.mdio_o, etho.mdio_oe, ethi.mdio_i);
    
    etxc_pad : clkpad generic map (tech => padtech, arch => 2) 
      port map (enet0_tx_clk, ethi.tx_clk);
    erxc_pad : clkpad generic map (tech => padtech, arch => 2)
      port map (enet0_rx_clk, ethi.rx_clk);
    erxd_pad : inpadv generic map (tech => padtech, width => 4) 
      port map (enet0_rx_data, ethi.rxd(3 downto 0));
    erxdv_pad : inpad generic map (tech => padtech)
      port map (enet0_rx_dv, ethi.rx_dv);
    erxer_pad : inpad generic map (tech => padtech) 
      port map (enet0_rx_er, ethi.rx_er);
    erxco_pad : inpad generic map (tech => padtech) 
      port map (enet0_rx_col, ethi.rx_col);
    erxcr_pad : inpad generic map (tech => padtech) 
      port map (enet0_rx_crs, ethi.rx_crs);
    emdintn_pad : inpad generic map (tech => padtech) 
      port map (enet0_int_n, ethi.mdint);
    
    etxd_pad : outpadv generic map (tech => padtech, width => 4)
      port map (enet0_tx_data, etho.txd(3 downto 0));
    etxen_pad : outpad generic map (tech => padtech)
      port map (enet0_tx_en, etho.tx_en);
    etxer_pad : outpad generic map (tech => padtech) 
      port map (enet0_tx_er, etho.tx_er);
    emdc_pad : outpad generic map (tech => padtech)
      port map (enet0_mdc, etho.mdc);

    eth0_rst_pad : odpad generic map (tech => padtech) 
      port map (enet0_rst_n, rstn);
    
--      emdis_pad : outpad generic map (tech => padtech) 
--	port map (emddis, vcc(0));
--      eepwrdwn_pad : outpad generic map (tech => padtech) 
--	port map (epwrdwn, gnd(0));
--      esleep_pad : outpad generic map (tech => padtech) 
--	port map (esleep, gnd(0));
--      epause_pad : outpad generic map (tech => padtech) 
--	port map (epause, gnd(0));
--      ereset_pad : outpad generic map (tech => padtech) 
--	port map (ereset, gnd(0));
        
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
--- MIL-STD-1553B
-----------------------------------------------------------------------

  mil: if CFG_GR1553B_ENABLE /= 0 generate

    --milclk_pad : clkpad generic map (tech => padtech) port map (clk_1553, clk1553);
    milclk_pad : techbuf generic map(tech => padtech, buftype => 2)
      port map(i => clk_1553, o => clk1553);

    milrst: rstgen
      port map (resetn, clk1553, vcc(0), rst1553, open);

    gr1553b0: gr1553b_nlw
      generic map (
        tech => 0,                      -- inferred = rtl
        hindex => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_SPI2AHB+CFG_GRETH,
        pindex => 13, paddr => 13, pirq => 13,
        bc_enable => CFG_GR1553B_BCEN, rt_enable => CFG_GR1553B_RTEN,
        bm_enable => CFG_GR1553B_BMEN,
        bc_rtbusmask => 1)
      port map (
        clk => clkm, rst => rstn,
        ahbmi => ahbmi, ahbmo => ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_SPI2AHB+CFG_GRETH),
        apbsi => apbi, apbso => apbo(13),
        auxin => gr1553b_auxin_zero, auxout => open,
        codec_clk => clk1553, codec_rst => rst1553,
        txout => milout(0), txout_fb => milout(0), rxin => milin(0)
        );
    
  end generate;

  nmil: if CFG_GR1553B_ENABLE = 0 generate
    clk1553 <= '0'; rst1553 <= '0';
    milout(0) <= (others => '0');
  end generate;
  
  milpads: gr1553b_pads
    generic map (padtech => padtech, outen_pol => 1)
    port map (milout(0), milin(0),
              busainen, busainp, busainn, busaoutin, busaoutp, busaoutn,
              busbinen, busbinp, busbinn, busboutin, busboutp, busboutn);


  
-----------------------------------------------------------------------
---  AHB RAM ----------------------------------------------------------
-----------------------------------------------------------------------

--  ocram : if CFG_AHBRAMEN = 1 generate 
--    ahbram0 : ftahbram generic map (hindex => 7, haddr => CFG_AHBRADDR, 
--	tech => CFG_MEMTECH, kbytes => CFG_AHBRSZ, pindex => 6,
--	paddr => 6, edacen => CFG_AHBRAEDAC, autoscrub => CFG_AHBRASCRU,
--	errcnten => CFG_AHBRAECNT, cntbits => CFG_AHBRAEBIT)
--    port map ( rstn, clkm, ahbsi, ahbso(7), apbi, apbo(6), open);
--  end generate;
--
--  nram : if CFG_AHBRAMEN = 0 generate ahbso(7) <= ahbs_none; end generate;

-----------------------------------------------------------------------
---  Drive unused bus elements  ---------------------------------------
-----------------------------------------------------------------------

--  nam1 : for i in (CFG_NCPU+CFG_AHB_UART+log2x(CFG_PCI)+CFG_AHB_JTAG) to NAHBMST-1 generate
--    ahbmo(i) <= ahbm_none;
--  end generate;
--  nam2 : if CFG_PCI > 1 generate
--    ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+log2x(CFG_PCI)-1) <= ahbm_none;
--  end generate;
--  nap0 : for i in 11 to NAPBSLV-1 generate apbo(i) <= apb_none; end generate;
--  apbo(6) <= apb_none;

-----------------------------------------------------------------------
---  Test report module  ----------------------------------------------
-----------------------------------------------------------------------

-- pragma translate_off

  test0 : ahbrep generic map (hindex => 7, haddr => 16#200#)
   port map (rstn, clkm, ahbsi, ahbso(7));

-- pragma translate_on
-----------------------------------------------------------------------
---  Boot message  ----------------------------------------------------
-----------------------------------------------------------------------

-- pragma translate_off
  x : report_design
  generic map (
   msg1 => "LEON3 TerAsic DE2_115 Demonstration design",
   fabtech => tech_table(fabtech), memtech => tech_table(memtech),
   mdel => 1
  );
-- pragma translate_on
end;

