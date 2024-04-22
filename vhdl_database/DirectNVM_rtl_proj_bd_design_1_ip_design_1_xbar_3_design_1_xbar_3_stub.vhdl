-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
-- Date        : Fri Feb 19 16:15:28 2021
-- Host        : yzou-PC running 64-bit Ubuntu 16.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /hdd/directnvm/rtl_proj/bd/design_1/ip/design_1_xbar_3/design_1_xbar_3_stub.vhdl
-- Design      : design_1_xbar_3
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu7ev-ffvc1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_xbar_3 is
  Port ( 
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 179 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 575 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 71 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 26 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 17 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 35 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 26 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 35 downto 0 );
    s_axi_awuser : in STD_LOGIC_VECTOR ( 143 downto 0 );
    s_axi_awvalid : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awready : out STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 1151 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 143 downto 0 );
    s_axi_wlast : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_wvalid : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_wready : out STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_bid : out STD_LOGIC_VECTOR ( 179 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 17 downto 0 );
    s_axi_bvalid : out STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_bready : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arid : in STD_LOGIC_VECTOR ( 179 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 575 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 71 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 26 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 17 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 35 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 26 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 35 downto 0 );
    s_axi_aruser : in STD_LOGIC_VECTOR ( 143 downto 0 );
    s_axi_arvalid : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arready : out STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_rid : out STD_LOGIC_VECTOR ( 179 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 1151 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 17 downto 0 );
    s_axi_rlast : out STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_rvalid : out STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_rready : in STD_LOGIC_VECTOR ( 8 downto 0 );
    m_axi_awid : out STD_LOGIC_VECTOR ( 119 downto 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 383 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 47 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 17 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 17 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_awuser : out STD_LOGIC_VECTOR ( 95 downto 0 );
    m_axi_awvalid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_awready : in STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 767 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 95 downto 0 );
    m_axi_wlast : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_wvalid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_wready : in STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_bid : in STD_LOGIC_VECTOR ( 119 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_bvalid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_bready : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_arid : out STD_LOGIC_VECTOR ( 119 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 383 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 47 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 17 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 17 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_aruser : out STD_LOGIC_VECTOR ( 95 downto 0 );
    m_axi_arvalid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_arready : in STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_rid : in STD_LOGIC_VECTOR ( 119 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 767 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_rlast : in STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_rvalid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_rready : out STD_LOGIC_VECTOR ( 5 downto 0 )
  );

end design_1_xbar_3;

architecture stub of design_1_xbar_3 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aclk,aresetn,s_axi_awid[179:0],s_axi_awaddr[575:0],s_axi_awlen[71:0],s_axi_awsize[26:0],s_axi_awburst[17:0],s_axi_awlock[8:0],s_axi_awcache[35:0],s_axi_awprot[26:0],s_axi_awqos[35:0],s_axi_awuser[143:0],s_axi_awvalid[8:0],s_axi_awready[8:0],s_axi_wdata[1151:0],s_axi_wstrb[143:0],s_axi_wlast[8:0],s_axi_wvalid[8:0],s_axi_wready[8:0],s_axi_bid[179:0],s_axi_bresp[17:0],s_axi_bvalid[8:0],s_axi_bready[8:0],s_axi_arid[179:0],s_axi_araddr[575:0],s_axi_arlen[71:0],s_axi_arsize[26:0],s_axi_arburst[17:0],s_axi_arlock[8:0],s_axi_arcache[35:0],s_axi_arprot[26:0],s_axi_arqos[35:0],s_axi_aruser[143:0],s_axi_arvalid[8:0],s_axi_arready[8:0],s_axi_rid[179:0],s_axi_rdata[1151:0],s_axi_rresp[17:0],s_axi_rlast[8:0],s_axi_rvalid[8:0],s_axi_rready[8:0],m_axi_awid[119:0],m_axi_awaddr[383:0],m_axi_awlen[47:0],m_axi_awsize[17:0],m_axi_awburst[11:0],m_axi_awlock[5:0],m_axi_awcache[23:0],m_axi_awprot[17:0],m_axi_awregion[23:0],m_axi_awqos[23:0],m_axi_awuser[95:0],m_axi_awvalid[5:0],m_axi_awready[5:0],m_axi_wdata[767:0],m_axi_wstrb[95:0],m_axi_wlast[5:0],m_axi_wvalid[5:0],m_axi_wready[5:0],m_axi_bid[119:0],m_axi_bresp[11:0],m_axi_bvalid[5:0],m_axi_bready[5:0],m_axi_arid[119:0],m_axi_araddr[383:0],m_axi_arlen[47:0],m_axi_arsize[17:0],m_axi_arburst[11:0],m_axi_arlock[5:0],m_axi_arcache[23:0],m_axi_arprot[17:0],m_axi_arregion[23:0],m_axi_arqos[23:0],m_axi_aruser[95:0],m_axi_arvalid[5:0],m_axi_arready[5:0],m_axi_rid[119:0],m_axi_rdata[767:0],m_axi_rresp[11:0],m_axi_rlast[5:0],m_axi_rvalid[5:0],m_axi_rready[5:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "axi_crossbar_v2_1_21_axi_crossbar,Vivado 2019.2";
begin
end;
