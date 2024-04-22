-----------------------------------------------------------------------------
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
--  LEON3 Zedboard Demonstration design
--  Copyright (C) 2012 Fredrik Ringhage, Aeroflex Gaisler
--  Modifed by Jiri Gaisler to provide working AXI interface, 2014-04-05 
------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
library grlib, techmap;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.config.all;
use techmap.gencomp.all;
library gaisler;
use gaisler.leon3.all;
use gaisler.uart.all;
use gaisler.misc.all;
use gaisler.jtag.all;
-- pragma translate_off
use gaisler.sim.all;
-- pragma translate_on

use work.config.all;

entity leon3mp is
  generic (
    fabtech : integer := CFG_FABTECH;
    memtech : integer := CFG_MEMTECH;
    padtech : integer := CFG_PADTECH;
    clktech : integer := CFG_CLKTECH;
    disas   : integer := CFG_DISAS;   -- Enable disassembly to console
    dbguart : integer := CFG_DUART;   -- Print UART on console
    pclow   : integer := CFG_PCLOW;
    testahb : boolean := false
  );
  port (
    processing_system7_0_MIO          : inout std_logic_vector(53 downto 0);
    processing_system7_0_PS_SRSTB     : inout std_logic;
    processing_system7_0_PS_CLK       : inout std_logic;
    processing_system7_0_PS_PORB      : inout std_logic;
    processing_system7_0_DDR_Clk      : inout std_logic;
    processing_system7_0_DDR_Clk_n    : inout std_logic;
    processing_system7_0_DDR_CKE      : inout std_logic;
    processing_system7_0_DDR_CS_n     : inout std_logic;
    processing_system7_0_DDR_RAS_n    : inout std_logic;
    processing_system7_0_DDR_CAS_n    : inout std_logic;
    processing_system7_0_DDR_WEB_pin  : inout std_logic;
    processing_system7_0_DDR_BankAddr : inout std_logic_vector(2 downto 0);
    processing_system7_0_DDR_Addr     : inout std_logic_vector(14 downto 0);
    processing_system7_0_DDR_ODT      : inout std_logic;
    processing_system7_0_DDR_DRSTB    : inout std_logic;
    processing_system7_0_DDR_DQ       : inout std_logic_vector(31 downto 0);
    processing_system7_0_DDR_DM       : inout std_logic_vector(3 downto 0);
    processing_system7_0_DDR_DQS      : inout std_logic_vector(3 downto 0);
    processing_system7_0_DDR_DQS_n    : inout std_logic_vector(3 downto 0);
    processing_system7_0_DDR_VRN      : inout std_logic;
    processing_system7_0_DDR_VRP      : inout std_logic;
    button  : in    std_logic_vector(3 downto 0);
    switch  : inout std_logic_vector(7 downto 0);
    led     : out   std_logic_vector(7 downto 0)
   );
end;

architecture rtl of leon3mp is

component leon3_zedboard_stub
  port (
  DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
  DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
  DDR_cas_n : inout STD_LOGIC;
  DDR_ck_n : inout STD_LOGIC;
  DDR_ck_p : inout STD_LOGIC;
  DDR_cke : inout STD_LOGIC;
  DDR_cs_n : inout STD_LOGIC;
  DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
  DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
  DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
  DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
  DDR_odt : inout STD_LOGIC;
  DDR_ras_n : inout STD_LOGIC;
  DDR_reset_n : inout STD_LOGIC;
  DDR_we_n : inout STD_LOGIC;
  FCLK_CLK0 : out STD_LOGIC;
  FCLK_CLK1 : out STD_LOGIC;
  FCLK_RESET0_N : out STD_LOGIC;
  FIXED_IO_ddr_vrn : inout STD_LOGIC;
  FIXED_IO_ddr_vrp : inout STD_LOGIC;
  FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
  FIXED_IO_ps_clk : inout STD_LOGIC;
  FIXED_IO_ps_porb : inout STD_LOGIC;
  FIXED_IO_ps_srstb : inout STD_LOGIC;
  S_AXI_GP0_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S_AXI_GP0_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
  S_AXI_GP0_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S_AXI_GP0_arid : in STD_LOGIC_VECTOR ( 5 downto 0 ); --
  S_AXI_GP0_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S_AXI_GP0_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 ); --
  S_AXI_GP0_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S_AXI_GP0_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );  --
  S_AXI_GP0_arready : out STD_LOGIC;
  S_AXI_GP0_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S_AXI_GP0_arvalid : in STD_LOGIC;
  S_AXI_GP0_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S_AXI_GP0_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
  S_AXI_GP0_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S_AXI_GP0_awid : in STD_LOGIC_VECTOR ( 5 downto 0 );  --
  S_AXI_GP0_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S_AXI_GP0_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 ); --
  S_AXI_GP0_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S_AXI_GP0_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );  --
  S_AXI_GP0_awready : out STD_LOGIC;
  S_AXI_GP0_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S_AXI_GP0_awvalid : in STD_LOGIC;
  S_AXI_GP0_bid : out STD_LOGIC_VECTOR ( 5 downto 0 );  --
  S_AXI_GP0_bready : in STD_LOGIC;
  S_AXI_GP0_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
  S_AXI_GP0_bvalid : out STD_LOGIC;
  S_AXI_GP0_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
  S_AXI_GP0_rid : out STD_LOGIC_VECTOR ( 5 downto 0 );  --
  S_AXI_GP0_rlast : out STD_LOGIC;
  S_AXI_GP0_rready : in STD_LOGIC;
  S_AXI_GP0_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
  S_AXI_GP0_rvalid : out STD_LOGIC;
  S_AXI_GP0_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S_AXI_GP0_wid : in STD_LOGIC_VECTOR ( 5 downto 0 );  --
  S_AXI_GP0_wlast : in STD_LOGIC;
  S_AXI_GP0_wready : out STD_LOGIC;
  S_AXI_GP0_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S_AXI_GP0_wvalid : in STD_LOGIC
  
  );
end component;

constant maxahbm : integer := (CFG_LEON3*CFG_NCPU)+CFG_AHB_JTAG;
constant maxahbs : integer := 8;
constant maxapbs : integer := 16;

signal vcc, gnd   : std_logic;

signal apbi  : apb_slv_in_type;
signal apbo  : apb_slv_out_vector := (others => apb_none);
signal ahbsi : ahb_slv_in_type;
signal ahbso : ahb_slv_out_vector := (others => ahbs_none);
signal ahbmi : ahb_mst_in_type;
signal ahbmo : ahb_mst_out_vector := (others => ahbm_none);

signal clkm, rstn, rsti, rst : std_ulogic;

signal u1i, dui : uart_in_type;
signal u1o, duo : uart_out_type;

signal irqi : irq_in_vector(0 to CFG_NCPU-1);
signal irqo : irq_out_vector(0 to CFG_NCPU-1);

signal dbgi : l3_debug_in_vector(0 to CFG_NCPU-1);
signal dbgo : l3_debug_out_vector(0 to CFG_NCPU-1);

signal dsui : dsu_in_type;
signal dsuo : dsu_out_type;

signal rxd1 : std_logic;
signal txd1 : std_logic;

signal gpti : gptimer_in_type;
signal gpto : gptimer_out_type;

signal gpioi : gpio_in_type;
signal gpioo : gpio_out_type;

signal tck, tckn, tms, tdi, tdo : std_ulogic;

constant BOARD_FREQ : integer := 83333;   -- CLK0 frequency in KHz
constant CPU_FREQ : integer := BOARD_FREQ; 

signal stati : ahbstat_in_type;

constant CIDSZ : integer := 6;
constant CLENSZ : integer := 4;

signal S_AXI_GP0_araddr : STD_LOGIC_VECTOR ( 31 downto 0 );
signal S_AXI_GP0_arburst : STD_LOGIC_VECTOR ( 1 downto 0 );
signal S_AXI_GP0_arcache : STD_LOGIC_VECTOR ( 3 downto 0 );
signal S_AXI_GP0_arid : STD_LOGIC_VECTOR ( CIDSZ-1 downto 0 );
signal S_AXI_GP0_arlen : STD_LOGIC_VECTOR ( CLENSZ-1 downto 0 );
signal S_AXI_GP0_arlock : STD_LOGIC_VECTOR ( 1 downto 0 ); --
signal S_AXI_GP0_arprot : STD_LOGIC_VECTOR ( 2 downto 0 );
signal S_AXI_GP0_arqos :  STD_LOGIC_VECTOR ( 3 downto 0 );  --
signal S_AXI_GP0_awqos :  STD_LOGIC_VECTOR ( 3 downto 0 );  --
signal S_AXI_GP0_arready : STD_LOGIC;
signal S_AXI_GP0_arsize : STD_LOGIC_VECTOR ( 2 downto 0 );
signal S_AXI_GP0_arvalid : STD_LOGIC;
signal S_AXI_GP0_awaddr : STD_LOGIC_VECTOR ( 31 downto 0 );
signal S_AXI_GP0_awburst : STD_LOGIC_VECTOR ( 1 downto 0 );
signal S_AXI_GP0_awcache : STD_LOGIC_VECTOR ( 3 downto 0 );
signal S_AXI_GP0_awid : STD_LOGIC_VECTOR ( CIDSZ-1 downto 0 );
signal S_AXI_GP0_awlen : STD_LOGIC_VECTOR ( CLENSZ-1 downto 0 );
signal S_AXI_GP0_awlock : STD_LOGIC_VECTOR ( 1 downto 0 ); --
signal S_AXI_GP0_awprot : STD_LOGIC_VECTOR ( 2 downto 0 );
signal S_AXI_GP0_awready : STD_LOGIC;
signal S_AXI_GP0_awsize : STD_LOGIC_VECTOR ( 2 downto 0 );
signal S_AXI_GP0_awvalid : STD_LOGIC;
signal S_AXI_GP0_bid : STD_LOGIC_VECTOR ( CIDSZ-1 downto 0 );
signal S_AXI_GP0_bready : STD_LOGIC;
signal S_AXI_GP0_bresp : STD_LOGIC_VECTOR ( 1 downto 0 );
signal S_AXI_GP0_bvalid : STD_LOGIC;
signal S_AXI_GP0_rdata : STD_LOGIC_VECTOR ( 31 downto 0 );
signal S_AXI_GP0_rid : STD_LOGIC_VECTOR ( CIDSZ-1 downto 0 );
signal S_AXI_GP0_rlast : STD_LOGIC;
signal S_AXI_GP0_rready : STD_LOGIC;
signal S_AXI_GP0_rresp : STD_LOGIC_VECTOR ( 1 downto 0 );
signal S_AXI_GP0_rvalid : STD_LOGIC;
signal S_AXI_GP0_wdata : STD_LOGIC_VECTOR ( 31 downto 0 );
signal S_AXI_GP0_wlast : STD_LOGIC;
signal S_AXI_GP0_wready : STD_LOGIC;
signal S_AXI_GP0_wstrb : STD_LOGIC_VECTOR ( 3 downto 0 );
signal S_AXI_GP0_wvalid : STD_LOGIC;
signal S_AXI_GP0_wid : STD_LOGIC_VECTOR ( 5 downto 0 );  --

begin

----------------------------------------------------------------------
---  Reset and Clock generation  -------------------------------------
----------------------------------------------------------------------

  vcc <= '1'; gnd <= '0';
  reset_pad   : inpad  generic map (level => cmos, voltage => x18v, tech => padtech)
    port map (button(0), rsti);
  rstn <= rst and not rsti;

----------------------------------------------------------------------
---  AHB CONTROLLER --------------------------------------------------
----------------------------------------------------------------------

  ahb0 : ahbctrl       -- AHB arbiter/multiplexer
  generic map (defmast => CFG_DEFMST, split => CFG_SPLIT,
   rrobin => CFG_RROBIN, ioaddr => CFG_AHBIO, fpnpen => CFG_FPNPEN,
     nahbm => maxahbm, nahbs => maxahbs)
  port map (rstn, clkm, ahbmi, ahbmo, ahbsi, ahbso);

----------------------------------------------------------------------
---  LEON3 processor and DSU -----------------------------------------
----------------------------------------------------------------------

  leon3_0 : if CFG_LEON3 = 1 generate
    cpu : for i in 0 to CFG_NCPU-1 generate
        u0 : leon3s     -- LEON3 processor
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
  nocpu : if CFG_LEON3 = 0 generate dbgo(0) <= dbgo_none; end generate;
   
  led1_pad : outpad generic map (tech => padtech, level => cmos, voltage => x33v) port map (led(1), dbgo(0).error);

  dsugen : if CFG_DSU = 1 generate
      dsu0 : dsu3         -- LEON3 Debug Support Unit
      generic map (hindex => 2, haddr => 16#900#, hmask => 16#F00#,
         ncpu => CFG_NCPU, tbits => 30, tech => memtech, irq => 0, kbytes => CFG_ATBSZ)
      port map (rstn, clkm, ahbmi, ahbsi, ahbso(2), dbgo, dbgi, dsui, dsuo);
      dsui.enable <= '1';
      dsui.break <= gpioo.val(0);
  end generate;
  dsuact_pad : outpad generic map (tech => padtech, level => cmos, voltage => x33v) port map (led(0), dsuo.active);

  nodsu : if CFG_DSU = 0 generate
    dsuo.tstop <= '0'; dsuo.active <= '0'; ahbso(2) <= ahbs_none;
  end generate;

  ahbjtaggen0 :if CFG_AHB_JTAG = 1 generate
    ahbjtag0 : ahbjtag generic map(tech => fabtech, hindex => CFG_LEON3*CFG_NCPU)
      port map(rstn, clkm, tck, tms, tdi, tdo, ahbmi, ahbmo(CFG_LEON3*CFG_NCPU),
               open, open, open, open, open, open, open, gnd);
  end generate;

  leon3_zedboard_stub_i : leon3_zedboard_stub
        port map (
          DDR_ck_p              => processing_system7_0_DDR_Clk,
          DDR_ck_n            => processing_system7_0_DDR_Clk_n,
          DDR_cke              => processing_system7_0_DDR_CKE,
          DDR_cs_n             => processing_system7_0_DDR_CS_n,
          DDR_ras_n            => processing_system7_0_DDR_RAS_n,
          DDR_cas_n            => processing_system7_0_DDR_CAS_n,
          DDR_we_n          => processing_system7_0_DDR_WEB_pin,
          DDR_ba         => processing_system7_0_DDR_BankAddr,
          DDR_addr             => processing_system7_0_DDR_Addr,
          DDR_odt              => processing_system7_0_DDR_ODT,
          DDR_reset_n            => processing_system7_0_DDR_DRSTB,
          DDR_dq               => processing_system7_0_DDR_DQ,
          DDR_dm               => processing_system7_0_DDR_DM,
          DDR_dqs_p              => processing_system7_0_DDR_DQS,
          DDR_dqs_n            => processing_system7_0_DDR_DQS_n,
          FCLK_CLK0        => clkm,
          FCLK_RESET0_N    => rst,
          FIXED_IO_mio                  => processing_system7_0_MIO,
          FIXED_IO_ps_srstb             => processing_system7_0_PS_SRSTB,
          FIXED_IO_ps_clk               => processing_system7_0_PS_CLK,
          FIXED_IO_ps_porb              => processing_system7_0_PS_PORB,
          FIXED_IO_ddr_vrn              => processing_system7_0_DDR_VRN,
          FIXED_IO_ddr_vrp              => processing_system7_0_DDR_VRP,
          S_AXI_GP0_araddr => S_AXI_GP0_araddr,
          S_AXI_GP0_arburst(1 downto 0) => S_AXI_GP0_arburst(1 downto 0),
          S_AXI_GP0_arcache(3 downto 0) => S_AXI_GP0_arcache(3 downto 0),
          S_AXI_GP0_arid => S_AXI_GP0_arid,
          S_AXI_GP0_arlen => S_AXI_GP0_arlen,
          S_AXI_GP0_arlock => S_AXI_GP0_arlock,
          S_AXI_GP0_arprot(2 downto 0) => S_AXI_GP0_arprot(2 downto 0),
          S_AXI_GP0_arqos => S_AXI_GP0_arqos,
          S_AXI_GP0_awqos => S_AXI_GP0_awqos,
          S_AXI_GP0_arready => S_AXI_GP0_arready,
          S_AXI_GP0_arsize(2 downto 0) => S_AXI_GP0_arsize(2 downto 0),
          S_AXI_GP0_arvalid => S_AXI_GP0_arvalid,
          S_AXI_GP0_awaddr => S_AXI_GP0_awaddr,
          S_AXI_GP0_awburst(1 downto 0) => S_AXI_GP0_awburst(1 downto 0),
          S_AXI_GP0_awcache(3 downto 0) => S_AXI_GP0_awcache(3 downto 0),
          S_AXI_GP0_awid => S_AXI_GP0_awid,
          S_AXI_GP0_awlen => S_AXI_GP0_awlen,
          S_AXI_GP0_awlock => S_AXI_GP0_awlock,
          S_AXI_GP0_awprot(2 downto 0) => S_AXI_GP0_awprot(2 downto 0),
          S_AXI_GP0_awready => S_AXI_GP0_awready,
          S_AXI_GP0_awsize(2 downto 0) => S_AXI_GP0_awsize(2 downto 0),
          S_AXI_GP0_awvalid => S_AXI_GP0_awvalid,
          S_AXI_GP0_bid => S_AXI_GP0_bid,
          S_AXI_GP0_bready => S_AXI_GP0_bready,
          S_AXI_GP0_bresp(1 downto 0) => S_AXI_GP0_bresp(1 downto 0),
          S_AXI_GP0_bvalid => S_AXI_GP0_bvalid,
          S_AXI_GP0_rdata(31 downto 0) => S_AXI_GP0_rdata(31 downto 0),
          S_AXI_GP0_rid => S_AXI_GP0_rid,
          S_AXI_GP0_rlast => S_AXI_GP0_rlast,
          S_AXI_GP0_rready => S_AXI_GP0_rready,
          S_AXI_GP0_rresp(1 downto 0) => S_AXI_GP0_rresp(1 downto 0),
          S_AXI_GP0_rvalid => S_AXI_GP0_rvalid,
          S_AXI_GP0_wdata(31 downto 0) => S_AXI_GP0_wdata(31 downto 0),
          S_AXI_GP0_wid => S_AXI_GP0_wid,
          S_AXI_GP0_wlast => S_AXI_GP0_wlast,
          S_AXI_GP0_wready => S_AXI_GP0_wready,
          S_AXI_GP0_wstrb(3 downto 0) => S_AXI_GP0_wstrb(3 downto 0),
          S_AXI_GP0_wvalid => S_AXI_GP0_wvalid
       );

    
    ahb2axi0 : entity work.ahb2axi
    generic map(
     hindex => 3, haddr => 16#400#, hmask => 16#F00#,
     pindex => 0, paddr => 0, cidsz => CIDSZ, clensz => CLENSZ)
    port map(
      rstn  => rstn,
      clk   => clkm,
      ahbsi => ahbsi,
      ahbso => ahbso(3),
      apbi  => apbi,
      apbo  => apbo(0),
      M_AXI_araddr => S_AXI_GP0_araddr,
      M_AXI_arburst(1 downto 0) => S_AXI_GP0_arburst(1 downto 0),
      M_AXI_arcache(3 downto 0) => S_AXI_GP0_arcache(3 downto 0),
      M_AXI_arid => S_AXI_GP0_arid,
      M_AXI_arlen => S_AXI_GP0_arlen,
      M_AXI_arlock => S_AXI_GP0_arlock,
      M_AXI_arprot(2 downto 0) => S_AXI_GP0_arprot(2 downto 0),
      M_AXI_arqos => S_AXI_GP0_arqos,
      M_AXI_arready => S_AXI_GP0_arready,
      M_AXI_arsize(2 downto 0) => S_AXI_GP0_arsize(2 downto 0),
      M_AXI_arvalid => S_AXI_GP0_arvalid,
      M_AXI_awaddr => S_AXI_GP0_awaddr,
      M_AXI_awburst(1 downto 0) => S_AXI_GP0_awburst(1 downto 0),
      M_AXI_awcache(3 downto 0) => S_AXI_GP0_awcache(3 downto 0),
      M_AXI_awid => S_AXI_GP0_awid,
      M_AXI_awlen => S_AXI_GP0_awlen,
      M_AXI_awlock => S_AXI_GP0_awlock,
      M_AXI_awprot(2 downto 0) => S_AXI_GP0_awprot(2 downto 0),
      M_AXI_awqos => S_AXI_GP0_awqos,
      M_AXI_awready => S_AXI_GP0_awready,
      M_AXI_awsize(2 downto 0) => S_AXI_GP0_awsize(2 downto 0),
      M_AXI_awvalid => S_AXI_GP0_awvalid,
      M_AXI_bid => S_AXI_GP0_bid,
      M_AXI_bready => S_AXI_GP0_bready,
      M_AXI_bresp(1 downto 0) => S_AXI_GP0_bresp(1 downto 0),
      M_AXI_bvalid => S_AXI_GP0_bvalid,
      M_AXI_rdata(31 downto 0) => S_AXI_GP0_rdata(31 downto 0),
      M_AXI_rid => S_AXI_GP0_rid,
      M_AXI_rlast => S_AXI_GP0_rlast,
      M_AXI_rready => S_AXI_GP0_rready,
      M_AXI_rresp(1 downto 0) => S_AXI_GP0_rresp(1 downto 0),
      M_AXI_rvalid => S_AXI_GP0_rvalid,
      M_AXI_wdata(31 downto 0) => S_AXI_GP0_wdata(31 downto 0),
      M_AXI_wlast => S_AXI_GP0_wlast,
      M_AXI_wready => S_AXI_GP0_wready,
      M_AXI_wstrb(3 downto 0) => S_AXI_GP0_wstrb(3 downto 0),
      M_AXI_wvalid => S_AXI_GP0_wvalid
    );

----------------------------------------------------------------------
---  APB Bridge and various periherals -------------------------------
----------------------------------------------------------------------

  apb0 : apbctrl            -- AHB/APB bridge
  generic map (hindex => 1, haddr => CFG_APBADDR, nslaves => 16)
  port map (rstn, clkm, ahbsi, ahbso(1), apbi, apbo );

  irqgen : if CFG_LEON3 = 1 generate
    irqctrl : if CFG_IRQ3_ENABLE /= 0 generate
      irqctrl0 : irqmp         -- interrupt controller
      generic map (pindex => 2, paddr => 2, ncpu => CFG_NCPU)
      port map (rstn, clkm, apbi, apbo(2), irqo, irqi);
    end generate;
  end generate;
  irqctrl : if (CFG_IRQ3_ENABLE + CFG_LEON3) /= 2 generate
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

  gpio0 : if CFG_GRGPIO_ENABLE /= 0 generate     -- GPIO unit
    grgpio0: grgpio
    generic map(pindex => 8, paddr => 8, imask => CFG_GRGPIO_IMASK, nbits => CFG_GRGPIO_WIDTH)
    port map(rst => rstn, clk => clkm, apbi => apbi, apbo => apbo(8),
    gpioi => gpioi, gpioo => gpioo);
    pio_pad_0 : inpad generic map (tech => padtech)
      port map (switch(0), gpioi.din(0));  -- Do not let SW modify BREAK input
    pio_pads : for i in 1 to 7 generate
        pio_pad : iopad generic map (tech => padtech, level => cmos, voltage => x18v)
            port map (switch(i), gpioo.dout(i), gpioo.oen(i), gpioi.din(i));
    end generate;
    pio_pads2 : for i in 8 to 10 generate
        pio_pad : inpad generic map (tech => padtech, level => cmos, voltage => x18v)
            port map (button(i-8+1), gpioi.din(i));
    end generate;
    pio_pads3 : for i in 11 to 14 generate
        pio_pad : outpad generic map (tech => padtech, level => cmos, voltage => x33v)
            port map (led(i-11+4), gpioo.dout(i));
    end generate;
  end generate;

  ua1 : if CFG_UART1_ENABLE /= 0 generate
    uart1 : apbuart                     -- UART 1
      generic map (pindex   => 1, paddr => 1, pirq => 2, console => dbguart, 
         fifosize => CFG_UART1_FIFO)
      port map (rstn, clkm, apbi, apbo(1), u1i, u1o);
    u1i.rxd    <= rxd1;
    u1i.ctsn   <= '0';
    u1i.extclk <= '0';
    txd1       <= u1o.txd;

  end generate;
  noua0 : if CFG_UART1_ENABLE = 0 generate apbo(1) <= apb_none; end generate;
  
  hready_pad : outpad generic map (level => cmos, voltage => x33v, tech => padtech) 
     port map (led(2), ahbmi.hready);
  rsti_pad : outpad generic map (level => cmos, voltage => x33v, tech => padtech) 
     port map (led(3), rsti);
     
  ahbs : if CFG_AHBSTAT = 1 generate   -- AHB status register
    stati <= ahbstat_in_none;
    ahbstat0 : ahbstat generic map (pindex => 15, paddr => 15, pirq => 7,
   nftslv => CFG_AHBSTATN)
      port map (rstn, clkm, ahbmi, ahbsi, stati, apbi, apbo(15));
  end generate;

-----------------------------------------------------------------------
---  AHB ROM ----------------------------------------------------------
-----------------------------------------------------------------------

  bpromgen : if CFG_AHBROMEN /= 0 generate
    brom : entity work.ahbrom
      generic map (hindex => 0, haddr => CFG_AHBRODDR, pipe => CFG_AHBROPIP)
      port map ( rstn, clkm, ahbsi, ahbso(0));
  end generate;

-----------------------------------------------------------------------
---  AHB RAM ----------------------------------------------------------
-----------------------------------------------------------------------

  ocram : if CFG_AHBRAMEN = 1 generate
    ahbram0 : ahbram generic map (hindex => 5, haddr => CFG_AHBRADDR,
   tech => CFG_MEMTECH, kbytes => CFG_AHBRSZ, pipe => CFG_AHBRPIPE)
    port map ( rstn, clkm, ahbsi, ahbso(5));
  end generate;
  
-----------------------------------------------------------------------
---  Test report module  ----------------------------------------------
-----------------------------------------------------------------------

  -- pragma translate_off
  test0_gen : if (testahb = true) generate
     test0 : ahbrep generic map (hindex => 6, haddr => 16#200#)
      port map (rstn, clkm, ahbsi, ahbso(6));
  end generate;
  -- pragma translate_on

 -----------------------------------------------------------------------
 ---  Drive unused bus elements  ---------------------------------------
 -----------------------------------------------------------------------

  nam1 : for i in (maxahbs+1) to NAHBMST-1 generate
    ahbmo(i) <= ahbm_none;
  end generate;
 
 -----------------------------------------------------------------------
 ---  Boot message  ----------------------------------------------------
 -----------------------------------------------------------------------

 -- pragma translate_off
   x : report_design
   generic map (
    msg1 => "LEON3 Xilinx Zedboard Demonstration design",
    fabtech => tech_table(fabtech), memtech => tech_table(memtech),
    mdel => 1
    );
 -- pragma translate_on
 end;

