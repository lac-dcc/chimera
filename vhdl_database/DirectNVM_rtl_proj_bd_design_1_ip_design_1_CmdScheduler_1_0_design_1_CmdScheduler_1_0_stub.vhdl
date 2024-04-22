-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
-- Date        : Fri Feb 19 15:31:50 2021
-- Host        : yzou-PC running 64-bit Ubuntu 16.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top design_1_CmdScheduler_1_0 -prefix
--               design_1_CmdScheduler_1_0_ design_1_CmdScheduler_3_0_stub.vhdl
-- Design      : design_1_CmdScheduler_3_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu7ev-ffvc1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_CmdScheduler_1_0 is
  Port ( 
    done : in STD_LOGIC;
    start : out STD_LOGIC;
    num_reqs : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dispatch_queue_en : out STD_LOGIC;
    dispatch_queue_prog_empty : in STD_LOGIC;
    dispatch_queue_din : out STD_LOGIC_VECTOR ( 191 downto 0 );
    s00_axi_lite_aclk : in STD_LOGIC;
    s00_axi_lite_aresetn : in STD_LOGIC;
    s00_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s00_axi_lite_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_lite_awvalid : in STD_LOGIC;
    s00_axi_lite_awready : out STD_LOGIC;
    s00_axi_lite_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s00_axi_lite_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_lite_wvalid : in STD_LOGIC;
    s00_axi_lite_wready : out STD_LOGIC;
    s00_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_lite_bvalid : out STD_LOGIC;
    s00_axi_lite_bready : in STD_LOGIC;
    s00_axi_lite_araddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s00_axi_lite_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_lite_arvalid : in STD_LOGIC;
    s00_axi_lite_arready : out STD_LOGIC;
    s00_axi_lite_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s00_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_lite_rvalid : out STD_LOGIC;
    s00_axi_lite_rready : in STD_LOGIC;
    m00_axi_aclk : in STD_LOGIC;
    m00_axi_aresetn : in STD_LOGIC;
    m00_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m00_axi_awaddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m00_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m00_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m00_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m00_axi_awlock : out STD_LOGIC;
    m00_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m00_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m00_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m00_axi_awuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m00_axi_awvalid : out STD_LOGIC;
    m00_axi_awready : in STD_LOGIC;
    m00_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m00_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m00_axi_wlast : out STD_LOGIC;
    m00_axi_wuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m00_axi_wvalid : out STD_LOGIC;
    m00_axi_wready : in STD_LOGIC;
    m00_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m00_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m00_axi_buser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m00_axi_bvalid : in STD_LOGIC;
    m00_axi_bready : out STD_LOGIC;
    m00_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m00_axi_araddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m00_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m00_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m00_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m00_axi_arlock : out STD_LOGIC;
    m00_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m00_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m00_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m00_axi_aruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m00_axi_arvalid : out STD_LOGIC;
    m00_axi_arready : in STD_LOGIC;
    m00_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m00_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m00_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m00_axi_rlast : in STD_LOGIC;
    m00_axi_ruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m00_axi_rvalid : in STD_LOGIC;
    m00_axi_rready : out STD_LOGIC
  );

end design_1_CmdScheduler_1_0;

architecture stub of design_1_CmdScheduler_1_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "done,start,num_reqs[31:0],dispatch_queue_en,dispatch_queue_prog_empty,dispatch_queue_din[191:0],s00_axi_lite_aclk,s00_axi_lite_aresetn,s00_axi_lite_awaddr[5:0],s00_axi_lite_awprot[2:0],s00_axi_lite_awvalid,s00_axi_lite_awready,s00_axi_lite_wdata[63:0],s00_axi_lite_wstrb[7:0],s00_axi_lite_wvalid,s00_axi_lite_wready,s00_axi_lite_bresp[1:0],s00_axi_lite_bvalid,s00_axi_lite_bready,s00_axi_lite_araddr[5:0],s00_axi_lite_arprot[2:0],s00_axi_lite_arvalid,s00_axi_lite_arready,s00_axi_lite_rdata[63:0],s00_axi_lite_rresp[1:0],s00_axi_lite_rvalid,s00_axi_lite_rready,m00_axi_aclk,m00_axi_aresetn,m00_axi_awid[0:0],m00_axi_awaddr[63:0],m00_axi_awlen[7:0],m00_axi_awsize[2:0],m00_axi_awburst[1:0],m00_axi_awlock,m00_axi_awcache[3:0],m00_axi_awprot[2:0],m00_axi_awqos[3:0],m00_axi_awuser[0:0],m00_axi_awvalid,m00_axi_awready,m00_axi_wdata[63:0],m00_axi_wstrb[7:0],m00_axi_wlast,m00_axi_wuser[0:0],m00_axi_wvalid,m00_axi_wready,m00_axi_bid[0:0],m00_axi_bresp[1:0],m00_axi_buser[0:0],m00_axi_bvalid,m00_axi_bready,m00_axi_arid[0:0],m00_axi_araddr[63:0],m00_axi_arlen[7:0],m00_axi_arsize[2:0],m00_axi_arburst[1:0],m00_axi_arlock,m00_axi_arcache[3:0],m00_axi_arprot[2:0],m00_axi_arqos[3:0],m00_axi_aruser[0:0],m00_axi_arvalid,m00_axi_arready,m00_axi_rid[0:0],m00_axi_rdata[63:0],m00_axi_rresp[1:0],m00_axi_rlast,m00_axi_ruser[0:0],m00_axi_rvalid,m00_axi_rready";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "CmdScheduler_v1_0,Vivado 2019.2";
begin
end;
