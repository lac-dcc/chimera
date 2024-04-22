-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
-- Date        : Fri Feb 19 15:29:22 2021
-- Host        : yzou-PC running 64-bit Ubuntu 16.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /hdd/directnvm/rtl_proj/bd/design_1/ip/design_1_CompletionQueueManag_0_0/design_1_CompletionQueueManag_0_0_stub.vhdl
-- Design      : design_1_CompletionQueueManag_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu7ev-ffvc1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_CompletionQueueManag_0_0 is
  Port ( 
    num_cmds_to_wait : in STD_LOGIC_VECTOR ( 31 downto 0 );
    go : in STD_LOGIC;
    async_clear : in STD_LOGIC;
    done : out STD_LOGIC;
    m00_axi_lite_aclk : in STD_LOGIC;
    m00_axi_lite_aresetn : in STD_LOGIC;
    m00_axi_lite_awaddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m00_axi_lite_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m00_axi_lite_awvalid : out STD_LOGIC;
    m00_axi_lite_awready : in STD_LOGIC;
    m00_axi_lite_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axi_lite_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m00_axi_lite_wvalid : out STD_LOGIC;
    m00_axi_lite_wready : in STD_LOGIC;
    m00_axi_lite_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m00_axi_lite_bvalid : in STD_LOGIC;
    m00_axi_lite_bready : out STD_LOGIC;
    m00_axi_lite_araddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m00_axi_lite_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m00_axi_lite_arvalid : out STD_LOGIC;
    m00_axi_lite_arready : in STD_LOGIC;
    m00_axi_lite_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axi_lite_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m00_axi_lite_rvalid : in STD_LOGIC;
    m00_axi_lite_rready : out STD_LOGIC;
    s00_axi_full_aclk : in STD_LOGIC;
    s00_axi_full_aresetn : in STD_LOGIC;
    s00_axi_full_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_full_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_full_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_full_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_full_awlock : in STD_LOGIC;
    s00_axi_full_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_full_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_full_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_full_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_full_awvalid : in STD_LOGIC;
    s00_axi_full_awready : out STD_LOGIC;
    s00_axi_full_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s00_axi_full_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s00_axi_full_wlast : in STD_LOGIC;
    s00_axi_full_wvalid : in STD_LOGIC;
    s00_axi_full_wready : out STD_LOGIC;
    s00_axi_full_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_full_bvalid : out STD_LOGIC;
    s00_axi_full_bready : in STD_LOGIC;
    s00_axi_full_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_full_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_full_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_full_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_full_arlock : in STD_LOGIC;
    s00_axi_full_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_full_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_full_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_full_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_full_arvalid : in STD_LOGIC;
    s00_axi_full_arready : out STD_LOGIC;
    s00_axi_full_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    s00_axi_full_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_full_rlast : out STD_LOGIC;
    s00_axi_full_rvalid : out STD_LOGIC;
    s00_axi_full_rready : in STD_LOGIC
  );

end design_1_CompletionQueueManag_0_0;

architecture stub of design_1_CompletionQueueManag_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "num_cmds_to_wait[31:0],go,async_clear,done,m00_axi_lite_aclk,m00_axi_lite_aresetn,m00_axi_lite_awaddr[63:0],m00_axi_lite_awprot[2:0],m00_axi_lite_awvalid,m00_axi_lite_awready,m00_axi_lite_wdata[31:0],m00_axi_lite_wstrb[3:0],m00_axi_lite_wvalid,m00_axi_lite_wready,m00_axi_lite_bresp[1:0],m00_axi_lite_bvalid,m00_axi_lite_bready,m00_axi_lite_araddr[63:0],m00_axi_lite_arprot[2:0],m00_axi_lite_arvalid,m00_axi_lite_arready,m00_axi_lite_rdata[31:0],m00_axi_lite_rresp[1:0],m00_axi_lite_rvalid,m00_axi_lite_rready,s00_axi_full_aclk,s00_axi_full_aresetn,s00_axi_full_awaddr[31:0],s00_axi_full_awlen[7:0],s00_axi_full_awsize[2:0],s00_axi_full_awburst[1:0],s00_axi_full_awlock,s00_axi_full_awcache[3:0],s00_axi_full_awprot[2:0],s00_axi_full_awqos[3:0],s00_axi_full_awregion[3:0],s00_axi_full_awvalid,s00_axi_full_awready,s00_axi_full_wdata[127:0],s00_axi_full_wstrb[15:0],s00_axi_full_wlast,s00_axi_full_wvalid,s00_axi_full_wready,s00_axi_full_bresp[1:0],s00_axi_full_bvalid,s00_axi_full_bready,s00_axi_full_araddr[31:0],s00_axi_full_arlen[7:0],s00_axi_full_arsize[2:0],s00_axi_full_arburst[1:0],s00_axi_full_arlock,s00_axi_full_arcache[3:0],s00_axi_full_arprot[2:0],s00_axi_full_arqos[3:0],s00_axi_full_arregion[3:0],s00_axi_full_arvalid,s00_axi_full_arready,s00_axi_full_rdata[127:0],s00_axi_full_rresp[1:0],s00_axi_full_rlast,s00_axi_full_rvalid,s00_axi_full_rready";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "CompletionQueueManagement_v2_0,Vivado 2019.2";
begin
end;
