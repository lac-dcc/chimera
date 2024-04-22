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
use gaisler.ddrpkg.all;
use gaisler.leon3.all;
use gaisler.uart.all;
use gaisler.misc.all;
use gaisler.net.all;
use gaisler.jtag.all;
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
    ncpu      : integer := CFG_NCPU;
    disas     : integer := CFG_DISAS;	-- Enable disassembly to console
    dbguart   : integer := CFG_DUART;	-- Print UART on console
    pclow     : integer := CFG_PCLOW
  );
  port (

    resetn          : in  std_ulogic;
    clk	            : in  std_ulogic;
    sysace_clk      : in  std_ulogic;
    errorn          : out std_ulogic;

    dsuen           : in std_ulogic;
    dsubre          : in std_ulogic;
    dsuact  	    : out std_ulogic;

    ddr_clk         : out std_logic_vector(2 downto 0);
    ddr_clkb  	    : out std_logic_vector(2 downto 0);
    ddr_clk_fb      : in std_logic;
    ddr_clk_fb_out  : out std_logic;
    ddr_cke         : out std_logic_vector(1 downto 0);
    ddr_csb         : out std_logic_vector(1 downto 0);
    ddr_web         : out std_ulogic;                       -- ddr write enable
    ddr_rasb        : out std_ulogic;                       -- ddr ras
    ddr_casb        : out std_ulogic;                       -- ddr cas
    ddr_dm          : out std_logic_vector (7 downto 0);    -- ddr dm
    ddr_dqs         : inout std_logic_vector (7 downto 0);    -- ddr dqs
    ddr_ad          : out std_logic_vector (13 downto 0);   -- ddr address
    ddr_ba          : out std_logic_vector (1 downto 0);    -- ddr bank address
    ddr_dq          : inout std_logic_vector (63 downto 0); -- ddr data

    rxd             : in std_ulogic;
    txd             : out std_ulogic;
    led_rx          : out std_ulogic;
    led_tx          : out std_ulogic;

--    gpio        : inout std_logic_vector(31 downto 0); 	-- I/O port

    emdio           : inout std_logic;		-- ethernet PHY interface
    etx_clk         : in std_ulogic;
    erx_clk         : in std_ulogic;
    erxd            : in std_logic_vector(3 downto 0);   
    erx_dv          : in std_ulogic; 
    erx_er          : in std_ulogic; 
    erx_col         : in std_ulogic;
    erx_crs         : in std_ulogic;
    etxd            : out std_logic_vector(3 downto 0);   
    etx_en          : out std_ulogic; 
    etx_er          : out std_ulogic; 
    emdc            : out std_ulogic;
    eresetn         : out std_ulogic;
    etx_slew        : out std_logic_vector(1 downto 0);   

    ps2clk          : inout std_logic_vector(1 downto 0);
    ps2data         : inout std_logic_vector(1 downto 0);

    vid_clock       : out std_ulogic;
    vid_blankn      : out std_ulogic;
    vid_syncn       : out std_ulogic;
    vid_hsync       : out std_ulogic;
    vid_vsync       : out std_ulogic;
    vid_r           : out std_logic_vector(7 downto 0);
    vid_g           : out std_logic_vector(7 downto 0);
    vid_b           : out std_logic_vector(7 downto 0);

    cf_mpa          : out std_logic_vector(6 downto 0);
    cf_mpd          : inout std_logic_vector(15 downto 0);
    cf_mp_ce_z      : out std_ulogic;
    cf_mp_oe_z      : out std_ulogic;
    cf_mp_we_z      : out std_ulogic;
    cf_mpirq        : in  std_ulogic
	);
end;

architecture rtl of leon3mp is

signal gpio        : std_logic_vector(31 downto 0); 	-- I/O port

constant maxahbm : integer := NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_GRETH+CFG_SVGA_ENABLE;

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

signal clkm, rstn, rstraw, pciclk, ddrlock : std_ulogic;

signal cgi   : clkgen_in_type;
signal cgo   : clkgen_out_type;
signal u1i, dui : uart_in_type;
signal u1o, duo : uart_out_type;

signal irqi : irq_in_vector(0 to NCPU-1);
signal irqo : irq_out_vector(0 to NCPU-1);

signal dbgi : l3_debug_in_vector(0 to NCPU-1);
signal dbgo : l3_debug_out_vector(0 to NCPU-1);

signal dsui : dsu_in_type;
signal dsuo : dsu_out_type; 

signal gpti : gptimer_in_type;

signal gpioi : gpio_in_type;
signal gpioo : gpio_out_type;

signal lclk, ndsuact : std_ulogic;
signal tck, tckn, tms, tdi, tdo : std_ulogic;

signal rxd1 : std_logic;
signal txd1 : std_logic;
signal duart, rserrx, rsertx, rdsuen, ldsuen : std_logic;

signal ethi : eth_in_type;
signal etho : eth_out_type;

signal kbdi  : ps2_in_type;
signal kbdo  : ps2_out_type;
signal moui  : ps2_in_type;
signal mouo  : ps2_out_type;
signal vgao  : apbvga_out_type;

signal clkace : std_ulogic;
signal acei   : gracectrl_in_type;
signal aceo   : gracectrl_out_type;

signal ldsubre, lresetn, lock, clkml, clk1x : std_ulogic;

constant BOARD_FREQ : integer := 100000;   -- input frequency in KHz
constant CPU_FREQ : integer := BOARD_FREQ * CFG_CLKMUL / CFG_CLKDIV;  -- cpu frequency in KHz
constant IOAEN : integer := 1;

attribute keep : boolean;
attribute syn_keep : boolean;
attribute syn_preserve : boolean;
attribute keep of ddrlock : signal is true;
attribute keep of clkml : signal is true;
attribute keep of clkm : signal is true;
attribute syn_keep of clkml : signal is true;
attribute syn_preserve of clkml : signal is true;
attribute syn_keep of ddrlock : signal is true;
attribute syn_preserve of ddrlock : signal is true;

signal dac_clk,video_clk, clkvga : std_logic; -- Signals to vgaclock.
signal clk_sel : std_logic_vector(1 downto 0);
signal clkval : std_logic_vector(1 downto 0);

attribute keep of clkvga : signal is true;
attribute syn_keep of clkvga : signal is true;
attribute syn_preserve of clkvga : signal is true;
begin

----------------------------------------------------------------------
---  Reset and Clock generation  -------------------------------------
----------------------------------------------------------------------
  
  vcc <= (others => '1'); gnd <= (others => '0');
  cgi.pllctrl <= "00"; cgi.pllrst <= rstraw;
  lock <= ddrlock and cgo.clklock;

  sysace_clk_pad : clkpad generic map (tech => padtech, level => cmos, voltage => x25v) 
    port map (sysace_clk, clkace);
  
  clk_pad : clkpad generic map (tech => padtech) port map (clk, lclk); 

  clkgen0 : clkgen  		-- clock generator
  generic map (fabtech, CFG_CLKMUL, CFG_CLKDIV, 0, 0, 0, 0, 0, BOARD_FREQ, 0)
  port map (lclk, pciclk, clkm, open, open, open, pciclk, cgi, cgo, open, clk1x);

  resetn_pad : inpad generic map (tech => padtech) port map (resetn, lresetn); 
  rst0 : rstgen			-- reset generator
  port map (lresetn, clkm, lock, rstn, rstraw);

----------------------------------------------------------------------
---  AHB CONTROLLER --------------------------------------------------
----------------------------------------------------------------------

  ahb0 : ahbctrl 		-- AHB arbiter/multiplexer
  generic map (defmast => CFG_DEFMST, split => CFG_SPLIT, 
	rrobin => CFG_RROBIN, ioaddr => CFG_AHBIO,
	ioen => IOAEN, nahbm => maxahbm, nahbs => 8)
  port map (rstn, clkm, ahbmi, ahbmo, ahbsi, ahbso);

----------------------------------------------------------------------
---  LEON3 processor and DSU -----------------------------------------
----------------------------------------------------------------------

  l3 : if CFG_LEON3 = 1 generate
    cpu : for i in 0 to NCPU-1 generate
      u0 : leon3s			-- LEON3 processor      
      generic map (i, fabtech, memtech, CFG_NWIN, CFG_DSU, CFG_FPU, CFG_V8, 
	0, CFG_MAC, pclow, CFG_NOTAG, CFG_NWP, CFG_ICEN, CFG_IREPL, CFG_ISETS, CFG_ILINE, 
	CFG_ISETSZ, CFG_ILOCK, CFG_DCEN, CFG_DREPL, CFG_DSETS, CFG_DLINE, CFG_DSETSZ,
	CFG_DLOCK, CFG_DSNOOP, CFG_ILRAMEN, CFG_ILRAMSZ, CFG_ILRAMADDR, CFG_DLRAMEN,
        CFG_DLRAMSZ, CFG_DLRAMADDR, CFG_MMUEN, CFG_ITLBNUM, CFG_DTLBNUM, CFG_TLB_TYPE, CFG_TLB_REP, 
        CFG_LDDEL, disas, CFG_ITBSZ, CFG_PWD, CFG_SVT, CFG_RSTADDR, NCPU-1,
        CFG_DFIXED, CFG_SCAN, CFG_MMU_PAGE, CFG_BP, CFG_NP_ASI, CFG_WRPSR)
      port map (clkm, rstn, ahbmi, ahbmo(i), ahbsi, ahbso, 
    		irqi(i), irqo(i), dbgi(i), dbgo(i));
    end generate;
    errorn_pad : odpad generic map (tech => padtech) port map (errorn, dbgo(0).error);
  
    dsugen : if CFG_DSU = 1 generate
      dsu0 : dsu3			-- LEON3 Debug Support Unit
      generic map (hindex => 2, haddr => 16#900#, hmask => 16#F00#, 
         ncpu => NCPU, tbits => 30, tech => memtech, irq => 0, kbytes => CFG_ATBSZ)
      port map (rstn, clkm, ahbmi, ahbsi, ahbso(2), dbgo, dbgi, dsui, dsuo);
      dsui.enable <= '1';
      dsubre_pad : inpad generic map (tech => padtech) port map (dsubre, ldsubre);
      dsui.break <= not ldsubre;
      ndsuact <= not dsuo.active;
      dsuact_pad : outpad generic map (tech => padtech) port map (dsuact, ndsuact);
    end generate;
  end generate;

  nodsu : if CFG_DSU = 0 generate 
    dsuo.tstop <= '0'; dsuo.active <= '0';
  end generate;

  dcomgen : if CFG_AHB_UART = 1 generate
    dcom0 : ahbuart                     -- Debug UART
      generic map (hindex => CFG_NCPU, pindex => 4, paddr => 4)
      port map (rstn, clkm, dui, duo, apbi, apbo(4), ahbmi, ahbmo(CFG_NCPU));
      dui.rxd <= rxd when dsuen = '1' else '1';
  end generate;

  led_rx <= rxd; 
  led_tx <= duo.txd when dsuen = '1' else u1o.txd;
  txd <= duo.txd when dsuen = '1' else u1o.txd;

  ahbjtaggen0 :if CFG_AHB_JTAG = 1 generate
    ahbjtag0 : ahbjtag generic map(tech => fabtech, hindex => NCPU+CFG_AHB_UART)
      port map(rstn, clkm, tck, tms, tdi, tdo, ahbmi, ahbmo(NCPU+CFG_AHB_UART),
               open, open, open, open, open, open, open, gnd(0));
  end generate;
  
----------------------------------------------------------------------
---  Memory controllers ----------------------------------------------
----------------------------------------------------------------------

  -- DDR RAM

  ddrsp0 : if (CFG_DDRSP /= 0) generate 

    ddr0 : ddrspa generic map (
	fabtech => fabtech, memtech => 0, ddrbits => 64,
	hindex => 3, haddr => 16#400#, hmask => 16#C00#, ioaddr => 1, 
	pwron => CFG_DDRSP_INIT, MHz => BOARD_FREQ/1000,
	clkmul => CFG_DDRSP_FREQ/5, clkdiv => 20, col => CFG_DDRSP_COL,
	Mbyte => CFG_DDRSP_SIZE, ahbfreq => CPU_FREQ/1000,
	rskew => CFG_DDRSP_RSKEW )
    port map (lresetn, rstn, clk1x, clkm, ddrlock, clkml, clkml, 
	ahbsi, ahbso(3),
	ddr_clk, ddr_clkb, ddr_clk_fb_out, ddr_clk_fb,
	ddr_cke, ddr_csb, ddr_web, ddr_rasb, ddr_casb, 
	ddr_dm, ddr_dqs, ddr_ad, ddr_ba, ddr_dq);
  end generate;

  noddr :  if (CFG_DDRSP = 0) generate ddrlock <= '1'; end generate;

----------------------------------------------------------------------
---  APB Bridge and various periherals -------------------------------
----------------------------------------------------------------------

  apb0 : apbctrl				-- AHB/APB bridge
  generic map (hindex => 1, haddr => CFG_APBADDR, nslaves => 16)
  port map (rstn, clkm, ahbsi, ahbso(1), apbi, apbo );

  ua1 : if CFG_UART1_ENABLE /= 0 generate
    uart1 : apbuart                     -- UART 1
      generic map (pindex   => 1, paddr => 1, pirq => 2, console => dbguart,
                   fifosize => CFG_UART1_FIFO)
      port map (rstn, clkm, apbi, apbo(1), u1i, u1o);
    u1i.rxd <= rxd; u1i.ctsn <= '0'; u1i.extclk <= '0'; --txd1 <= u1o.txd;
  end generate;

  irqctrl : if CFG_IRQ3_ENABLE /= 0 generate
    irqctrl0 : irqmp			-- interrupt controller
    generic map (pindex => 2, paddr => 2, ncpu => NCPU)
    port map (rstn, clkm, apbi, apbo(2), irqo, irqi);
  end generate;
  irq3 : if CFG_IRQ3_ENABLE = 0 generate
    x : for i in 0 to NCPU-1 generate
      irqi(i).irl <= "0000";
    end generate;
    apbo(2) <= apb_none;
  end generate;

  gpt : if CFG_GPT_ENABLE /= 0 generate
    timer0 : gptimer 			-- timer unit
    generic map (pindex => 3, paddr => 3, pirq => CFG_GPT_IRQ, 
	sepirq => CFG_GPT_SEPIRQ, sbits => CFG_GPT_SW, ntimers => CFG_GPT_NTIM, 
	nbits => CFG_GPT_TW)
    port map (rstn, clkm, apbi, apbo(3), gpti, open);
    gpti <= gpti_dhalt_drive(dsuo.tstop);
  end generate;

  nogpt : if CFG_GPT_ENABLE = 0 generate apbo(3) <= apb_none; end generate;

  kbd : if CFG_KBD_ENABLE /= 0 generate
    ps21 : apbps2 generic map(pindex => 7, paddr => 7, pirq => 4)
      port map(rstn, clkm, apbi, apbo(7), moui, mouo);
    ps20 : apbps2 generic map(pindex => 5, paddr => 5, pirq => 5)
      port map(rstn, clkm, apbi, apbo(5), kbdi, kbdo);
  end generate;

  kbdclk_pad : iopad generic map (tech => padtech)
      port map (ps2clk(0),kbdo.ps2_clk_o, kbdo.ps2_clk_oe, kbdi.ps2_clk_i);
  kbdata_pad : iopad generic map (tech => padtech)
        port map (ps2data(0), kbdo.ps2_data_o, kbdo.ps2_data_oe, kbdi.ps2_data_i);

  mouclk_pad : iopad generic map (tech => padtech)
      port map (ps2clk(1),mouo.ps2_clk_o, mouo.ps2_clk_oe, moui.ps2_clk_i);
  mouata_pad : iopad generic map (tech => padtech)
        port map (ps2data(1), mouo.ps2_data_o, mouo.ps2_data_oe, moui.ps2_data_i);
  
  vga : if CFG_VGA_ENABLE /= 0 generate
    vga0 : apbvga generic map(memtech => memtech, pindex => 6, paddr => 6)
       port map(rstn, clkm, clkm, apbi, apbo(6), vgao);
    video_clock_pad : outpad generic map ( tech => padtech)
        port map (vid_clock, clkm);
   end generate;
  
  svga : if CFG_SVGA_ENABLE /= 0 generate
    svga0 : svgactrl generic map(memtech => memtech, pindex => 6, paddr => 6,
        hindex => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG, clk0 => 40000, 
	clk1 => 20000, clk2 => CFG_CLKDIV*10000/CFG_CLKMUL, burstlen => 5)
       port map(rstn, clkm, clkvga, apbi, apbo(6), vgao, ahbmi, 
		ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG), clk_sel);

    clkdiv : process(clk1x, rstn)
    begin
	if rstn = '0' then clkval <= "00";
        elsif rising_edge(clk1x) then
	  clkval <= clkval + 1;
	end if;
    end process;

    video_clk <= clkval(1) when clk_sel = "00" else clkval(0) when clk_sel = "01" else clkm;
    b1 : techbuf generic map (2, virtex2) port map (video_clk, clkvga);
    dac_clk <= not video_clk;
    video_clock_pad : outpad generic map ( tech => padtech)
        port map (vid_clock, clkvga);
  end generate;

  novga : if (CFG_VGA_ENABLE = 0 and CFG_SVGA_ENABLE = 0) generate
    apbo(6) <= apb_none; vgao <= vgao_none;
  end generate;
  
  vga_pads : if (CFG_VGA_ENABLE /= 0 or CFG_SVGA_ENABLE /=0) generate
    blank_pad : outpad generic map (tech => padtech)
        port map (vid_blankn, vgao.blank);
    comp_sync_pad : outpad generic map (tech => padtech)
        port map (vid_syncn, vgao.comp_sync);
    vert_sync_pad : outpad generic map (tech => padtech)
        port map (vid_vsync, vgao.vsync);
    horiz_sync_pad : outpad generic map (tech => padtech)
        port map (vid_hsync, vgao.hsync);
    video_out_r_pad : outpadv generic map (width => 8, tech => padtech)
        port map (vid_r, vgao.video_out_r);
    video_out_g_pad : outpadv generic map (width => 8, tech => padtech)
        port map (vid_g, vgao.video_out_g);
    video_out_b_pad : outpadv generic map (width => 8, tech => padtech)
        port map (vid_b, vgao.video_out_b);
  end generate;

-----------------------------------------------------------------------
---  ETHERNET ---------------------------------------------------------
-----------------------------------------------------------------------

    eth0 : if CFG_GRETH = 1 generate -- Gaisler ethernet MAC
      e1 : greth generic map(hindex => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_SVGA_ENABLE,
	pindex => 11, paddr => 11, pirq => 12, memtech => memtech,
        mdcscaler => CPU_FREQ/1000, enable_mdio => 1, fifosize => CFG_ETH_FIFO,
        nsync => 1, edcl => CFG_DSU_ETH, edclbufsz => CFG_ETH_BUF,
        macaddrh => CFG_ETH_ENM, macaddrl => CFG_ETH_ENL, 
	ipaddrh => CFG_ETH_IPM, ipaddrl => CFG_ETH_IPL)
     port map( rst => rstn, clk => clkm, ahbmi => ahbmi,
       ahbmo => ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_SVGA_ENABLE), apbi => apbi,
       apbo => apbo(11), ethi => ethi, etho => etho); 
    end generate;

    ethpads : if (CFG_GRETH = 1) generate -- eth pads
      emdio_pad : iopad generic map (tech => padtech) 
      port map (emdio, etho.mdio_o, etho.mdio_oe, ethi.mdio_i);
      etxc_pad : clkpad generic map (tech => padtech, arch => 2) 
	port map (etx_clk, ethi.tx_clk);
      erxc_pad : clkpad generic map (tech => padtech, arch => 2) 
	port map (erx_clk, ethi.rx_clk);
      erxd_pad : inpadv generic map (tech => padtech, width => 4) 
	port map (erxd, ethi.rxd(3 downto 0));
      erxdv_pad : inpad generic map (tech => padtech) 
	port map (erx_dv, ethi.rx_dv);
      erxer_pad : inpad generic map (tech => padtech) 
	port map (erx_er, ethi.rx_er);
      erxco_pad : inpad generic map (tech => padtech) 
	port map (erx_col, ethi.rx_col);
      erxcr_pad : inpad generic map (tech => padtech) 
	port map (erx_crs, ethi.rx_crs);

      etxd_pad : outpadv generic map (tech => padtech, width => 4) 
	port map (etxd, etho.txd(3 downto 0));
      etxen_pad : outpad generic map (tech => padtech) 
	port map ( etx_en, etho.tx_en);
      etxer_pad : outpad generic map (tech => padtech) 
	port map (etx_er, etho.tx_er);
      emdc_pad : outpad generic map (tech => padtech) 
	port map (emdc, etho.mdc);
    end generate;

    etx_slew <= "00";
    eresetn <= rstn;

----------------------------------------------------------------------
---  System ACE I/F Controller ---------------------------------------
----------------------------------------------------------------------
  
  grace: if CFG_GRACECTRL = 1 generate
    grace0 : gracectrl generic map (hindex => 5, hirq => 6,
        haddr => 16#003#, hmask => 16#fff#, split => CFG_SPLIT)
      port map (rstn, clkm, clkace, ahbsi, ahbso(5), acei, aceo);
  end generate;

  nograce: if CFG_GRACECTRL = 0 generate
    aceo.addr <= (others => '0'); aceo.cen <= '1'; aceo.do <= (others => '0');
    aceo.doen <= '1'; aceo.oen <= '1'; aceo.wen <= '0';
  end generate nograce;
  
  cf_mpa_pads : outpadv generic map
    (width => 7, tech => padtech, level => cmos, voltage => x25v) 
    port map (cf_mpa, aceo.addr); 
  cf_mp_ce_z_pad : outpad generic map
    (tech => padtech, level => cmos, voltage => x25v)
    port map (cf_mp_ce_z, aceo.cen); 
  cf_mpd_pads : iopadv generic map
    (tech => padtech, width => 16, level => cmos, voltage => x25v)
    port map (cf_mpd, aceo.do, aceo.doen, acei.di); 
  cf_mp_oe_z_pad : outpad generic map
    (tech => padtech, level => cmos, voltage => x25v)
    port map (cf_mp_oe_z, aceo.oen);
  cf_mp_we_z_pad : outpad generic map
    (tech => padtech, level => cmos, voltage => x25v)
    port map (cf_mp_we_z, aceo.wen); 
  cf_mpirq_pad : inpad generic map
    (tech => padtech, level => cmos, voltage => x25v)
    port map (cf_mpirq, acei.irq); 

-----------------------------------------------------------------------
---  AHB ROM ----------------------------------------------------------
-----------------------------------------------------------------------

  bpromgen : if CFG_AHBROMEN /= 0 generate
    brom : entity work.ahbrom
      generic map (hindex => 0, haddr => CFG_AHBRODDR, pipe => CFG_AHBROPIP)
      port map ( rstn, clkm, ahbsi, ahbso(0));
  end generate;

  ocram : if CFG_AHBRAMEN = 1 generate 
    ahbram0 : ahbram generic map (hindex => 7, haddr => CFG_AHBRADDR, 
	tech => CFG_MEMTECH, kbytes => CFG_AHBRSZ, pipe => CFG_AHBRPIPE)
    port map ( rstn, clkm, ahbsi, ahbso(7));
  end generate;

-----------------------------------------------------------------------
---  Test report module  ----------------------------------------------
-----------------------------------------------------------------------

-- pragma translate_off

  test0 : ahbrep generic map (hindex => 4, haddr => 16#200#)
	port map (rstn, clkm, ahbsi, ahbso(4));

-- pragma translate_on

-----------------------------------------------------------------------
---  Debug   ----------------------------------------------------------
-----------------------------------------------------------------------

-- pragma translate_off
--  dma0 : ahbdma
--    generic map (hindex => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_SVGA_ENABLE+1,
--	pindex => 13, paddr => 13, dbuf => 6)
--    port map (rstn, clkm, apbi, apbo(13), ahbmi, 
--	ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_SVGA_ENABLE+1));
-- pragma translate_on
--
--  at0 : ahbtrace
--  generic map ( hindex  => 7, ioaddr => 16#200#, iomask => 16#E00#,
--    tech    => memtech, irq     => 0, kbytes  => 8) 
--  port map ( rstn, clkm, ahbmi, ahbsi, ahbso(7));

-----------------------------------------------------------------------
---  Boot message  ----------------------------------------------------
-----------------------------------------------------------------------

-- pragma translate_off
  x : report_design
  generic map (
   msg1 => "LEON3 Digilent Virtex2-Pro XUP Demonstration design",
   fabtech => tech_table(fabtech), memtech => tech_table(memtech),
   mdel => 1
  );
-- pragma translate_on
end;

