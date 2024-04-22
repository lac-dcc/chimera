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
-------------------------------------------------------------------------------
-- Entity:      ahb2axi_mig_7series
-- File:        ahb2axi_mig_7series.vhd
-- Author:      Alen Bardizbanyan - Aeroflex Gaisler AB
--
--  Interface to convert AHB-2.0 to AXI4 interface of Xilinx Virtex-7 MIG
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;
use grlib.config_types.all;
use grlib.config.all;
library gaisler;
use gaisler.misc.all;
use gaisler.axi.all;


entity ahb2axi_mig_7series is
  generic(
    hindex                  : integer := 0;
    haddr                   : integer := 0;
    hmask                   : integer := 16#f00#;
    pindex                  : integer := 0;
    paddr                   : integer := 0;
    pmask                   : integer := 16#fff#
  );
  port(
    ddr3_dq           : inout std_logic_vector(63 downto 0);
    ddr3_dqs_p        : inout std_logic_vector(7 downto 0);
    ddr3_dqs_n        : inout std_logic_vector(7 downto 0);
    ddr3_addr         : out   std_logic_vector(13 downto 0);
    ddr3_ba           : out   std_logic_vector(2 downto 0);
    ddr3_ras_n        : out   std_logic;
    ddr3_cas_n        : out   std_logic;
    ddr3_we_n         : out   std_logic;
    ddr3_reset_n      : out   std_logic;
    ddr3_ck_p         : out   std_logic_vector(0 downto 0);
    ddr3_ck_n         : out   std_logic_vector(0 downto 0);
    ddr3_cke          : out   std_logic_vector(0 downto 0);
    ddr3_cs_n         : out   std_logic_vector(0 downto 0);
    ddr3_dm           : out   std_logic_vector(7 downto 0);
    ddr3_odt          : out   std_logic_vector(0 downto 0);
    ahbso             : out   ahb_slv_out_type;
    ahbsi             : in    ahb_slv_in_type;
    apbi              : in    apb_slv_in_type;
    apbo              : out   apb_slv_out_type;
    calib_done        : out   std_logic;
    rst_n_syn         : in    std_logic;
    rst_n_async       : in    std_logic;
    clk_amba          : in    std_logic;
    sys_clk_p         : in    std_logic;
    sys_clk_n         : in    std_logic;
    clk_ref_i         : in    std_logic;
    ui_clk            : out   std_logic;
    ui_clk_sync_rst   : out   std_logic
   );
end ;


architecture rtl of ahb2axi_mig_7series is


  constant pconfig : apb_config_type := (
    0 => ahb_device_reg ( VENDOR_GAISLER, GAISLER_MIG_7SERIES, 0, 0, 0),
    1 => apb_iobar(paddr, pmask));

  signal aximi : axi_somi_type;
  signal aximo : axi4_mosi_type;
  signal ahbsi_bridge : ahb_slv_in_type;
  signal ahbso_bridge : ahb_slv_out_type;

  --temporary signals to convert AXI3 to AXI4
  signal s_axi_rdata_buffer : std_logic_vector(AHBDW-1 downto 0);
  signal s_axi_wdata_buffer : std_logic_vector(AHBDW-1 downto 0);
  signal s_axi_awlen : std_logic_vector(7 downto 0);
  signal s_axi_arlen : std_logic_vector(7 downto 0);
  signal s_axi_awqos : std_logic_vector(3 downto 0);
  signal s_axi_arqos : std_logic_vector(3 downto 0);


  signal mmcm_locked : std_logic;

  
   component mig is
   port (
    ddr3_dq              : inout std_logic_vector(63 downto 0);--
    ddr3_addr            : out   std_logic_vector(13 downto 0);--
    ddr3_ba              : out   std_logic_vector(2 downto 0);--
    ddr3_ras_n           : out   std_logic;--
    ddr3_cas_n           : out   std_logic;--
    ddr3_we_n            : out   std_logic;--
    ddr3_reset_n         : out   std_logic;--
    ddr3_dqs_n           : inout std_logic_vector(7 downto 0);--
    ddr3_dqs_p           : inout std_logic_vector(7 downto 0);--
    ddr3_ck_p            : out   std_logic_vector(0 downto 0);--
    ddr3_ck_n            : out   std_logic_vector(0 downto 0);--
    ddr3_cke             : out   std_logic_vector(0 downto 0);--
    ddr3_cs_n            : out   std_logic_vector(0 downto 0);--
    ddr3_dm              : out   std_logic_vector(7 downto 0);--
    ddr3_odt             : out   std_logic_vector(0 downto 0);--
    sys_clk_p            : in    std_logic;--
    sys_clk_n            : in    std_logic;--
    clk_ref_i            : in    std_logic;--
    -- Slave Interface Write Address Ports
    aresetn              : in std_logic;
    s_axi_awid           : in std_logic_vector(3 downto 0);
    s_axi_awaddr         : in std_logic_vector(29 downto 0);
    s_axi_awlen          : in std_logic_vector(7 downto 0);
    s_axi_awsize         : in std_logic_vector(2 downto 0);
    s_axi_awburst        : in std_logic_vector(1 downto 0);
    s_axi_awlock         : in std_logic;  --(0 downto 0) ??
    s_axi_awcache        : in std_logic_vector(3 downto 0);
    s_axi_awprot         : in std_logic_vector(2 downto 0);
    s_axi_awqos          : in std_logic_vector(3 downto 0);
    s_axi_awvalid        : in    std_logic;
    s_axi_awready        : out   std_logic;
    --Slave Interface Write Data Ports
    s_axi_wdata          : in std_logic_vector(AHBDW-1 downto 0);
    s_axi_wstrb          : in std_logic_vector((AHBDW/8)-1 downto 0);
    s_axi_wlast          : in std_logic;
    s_axi_wvalid         : in std_logic;
    s_axi_wready         : out std_logic;
    -- Slave Interface Write Response Ports
    s_axi_bready         : in std_logic;
    s_axi_bid            : out std_logic_vector(3 downto 0);
    s_axi_bresp          : out std_logic_vector(1 downto 0);
    s_axi_bvalid         : out std_logic;
    -- Slave Interface Read Address Ports
    s_axi_arid           : in std_logic_vector(3 downto 0);
    s_axi_araddr         : in std_logic_vector(29 downto 0);
    s_axi_arlen          : in std_logic_vector(7 downto 0);
    s_axi_arsize         : in std_logic_vector(2 downto 0);
    s_axi_arburst        : in std_logic_vector(1 downto 0);
    s_axi_arlock         : in std_logic;  --(0 downto 0) ??
    s_axi_arcache        : in std_logic_vector(3 downto 0);
    s_axi_arprot         : in std_logic_vector(2 downto 0);
    s_axi_arqos          : in std_logic_vector(3 downto 0);
    s_axi_arvalid        : in std_logic;
    s_axi_arready        : out std_logic;
    -- Slave Interface Read Data Ports
    s_axi_rready         : in std_logic;
    s_axi_rid            : out std_logic_vector(3 downto 0);
    s_axi_rdata          : out std_logic_vector(AHBDW-1 downto 0);
    s_axi_rresp          : out std_logic_vector(1 downto 0);
    s_axi_rlast          : out std_logic;
    s_axi_rvalid         : out std_logic;
    app_sr_req           : in    std_logic;--
    app_ref_req          : in    std_logic;--
    app_zq_req           : in    std_logic;--
    app_sr_active        : out   std_logic;--
    app_ref_ack          : out   std_logic;--
    app_zq_ack           : out   std_logic;--
    ui_clk               : out   std_logic;--
    ui_clk_sync_rst      : out   std_logic;--
    mmcm_locked          : out   std_logic;  
    init_calib_complete  : out   std_logic;--
    sys_rst              : in    std_logic--
    );
 end component mig;



begin

  apbo.pindex  <= pindex;
  apbo.pconfig <= pconfig;
  apbo.pirq    <= (others => '0');
  apbo.prdata  <= (others => '0');

  ahbsi_bridge.hsel <= ahbsi.hsel;
  ahbsi_bridge.haddr <= ahbsi.haddr;
  ahbsi_bridge.hwrite <= ahbsi.hwrite;
  ahbsi_bridge.htrans <= ahbsi.htrans;
  ahbsi_bridge.hsize <= ahbsi.hsize;
  ahbsi_bridge.hburst <= ahbsi.hburst;
  ahbsi_bridge.hprot <= ahbsi.hprot;
  ahbsi_bridge.hready <= ahbsi.hready;
  ahbsi_bridge.hwdata <= ahbsi.hwdata;
  

  ahbso.hconfig <= ahbso_bridge.hconfig;
  ahbso.hirq    <= (others => '0');
  ahbso.hindex  <= hindex;
  ahbso.hsplit  <= (others => '0');
  ahbso.hready  <= ahbso_bridge.hready;
  ahbso.hresp   <= ahbso_bridge.hresp;
  ahbso.hrdata  <= ahbso_bridge.hrdata;
  
  bridge: ahb2axi4b
    generic map (
      hindex => hindex,
      aximid => 0,
      wbuffer_num => 8,
      rprefetch_num => 8,
      endianness_mode => 0,
      narrow_acc_mode => 0,
      vendor  => VENDOR_GAISLER,
      device  => GAISLER_MIG_7SERIES,
      bar0    => ahb2ahb_membar(haddr, '1', '1', hmask)
      )
    port map (
      rstn  => rst_n_syn,
      clk   => clk_amba,
      ahbsi => ahbsi_bridge,
      ahbso => ahbso_bridge,
      aximi => aximi,
      aximo => aximo);

  MCB_inst : mig
    port map (
      ddr3_dq              => ddr3_dq,
      ddr3_dqs_p           => ddr3_dqs_p,
      ddr3_dqs_n           => ddr3_dqs_n,
      ddr3_addr            => ddr3_addr,
      ddr3_ba              => ddr3_ba,
      ddr3_ras_n           => ddr3_ras_n,
      ddr3_cas_n           => ddr3_cas_n,
      ddr3_we_n            => ddr3_we_n,
      ddr3_reset_n         => ddr3_reset_n,
      ddr3_ck_p            => ddr3_ck_p,
      ddr3_ck_n            => ddr3_ck_n,
      ddr3_cke             => ddr3_cke,
      ddr3_cs_n            => ddr3_cs_n,
      ddr3_dm              => ddr3_dm,
      ddr3_odt             => ddr3_odt,
      sys_clk_p            => sys_clk_p,
      sys_clk_n            => sys_clk_n,
      clk_ref_i            => clk_ref_i,
      aresetn              => rst_n_syn,               
      s_axi_awid           => aximo.aw.id,
      s_axi_awaddr         => aximo.aw.addr(29 downto 0),
      s_axi_awlen          => aximo.aw.len,
      s_axi_awsize         => aximo.aw.size,
      s_axi_awburst        => aximo.aw.burst,
      s_axi_awlock         => aximo.aw.lock,
      s_axi_awcache        => aximo.aw.cache,
      s_axi_awprot         => aximo.aw.prot,
      s_axi_awqos          => aximo.aw.qos,
      s_axi_awvalid        => aximo.aw.valid,
      s_axi_awready        => aximi.aw.ready,
      s_axi_wdata          => aximo.w.data,   
      s_axi_wstrb          => aximo.w.strb,
      s_axi_wlast          => aximo.w.last,
      s_axi_wvalid         => aximo.w.valid,
      s_axi_wready         => aximi.w.ready,
      s_axi_bready         => aximo.b.ready,
      s_axi_bid            => aximi.b.id,
      s_axi_bresp          => aximi.b.resp,
      s_axi_bvalid         => aximi.b.valid,
      s_axi_arid           => aximo.ar.id,
      s_axi_araddr         => aximo.ar.addr(29 downto 0),
      s_axi_arlen          => aximo.ar.len,
      s_axi_arsize         => aximo.ar.size,
      s_axi_arburst        => aximo.ar.burst,
      s_axi_arlock         => aximo.ar.lock,
      s_axi_arcache        => aximo.ar.cache,
      s_axi_arprot         => aximo.ar.prot,
      s_axi_arqos          => aximo.ar.qos,
      s_axi_arvalid        => aximo.ar.valid,
      s_axi_arready        => aximi.ar.ready, 
      s_axi_rready         => aximo.r.ready,
      s_axi_rid            => aximi.r.id,
      s_axi_rdata          => aximi.r.data,
      s_axi_rresp          => aximi.r.resp,
      s_axi_rlast          => aximi.r.last, 
      s_axi_rvalid         => aximi.r.valid,
      app_sr_req           => '0',
      app_ref_req          => '0',
      app_zq_req           => '0',
      app_sr_active        => open,
      app_ref_ack          => open,
      app_zq_ack           => open,
      ui_clk               => ui_clk,
      ui_clk_sync_rst      => ui_clk_sync_rst,
      mmcm_locked          => mmcm_locked,
      init_calib_complete  => calib_done,
      sys_rst              => rst_n_async
      );
  

end;
