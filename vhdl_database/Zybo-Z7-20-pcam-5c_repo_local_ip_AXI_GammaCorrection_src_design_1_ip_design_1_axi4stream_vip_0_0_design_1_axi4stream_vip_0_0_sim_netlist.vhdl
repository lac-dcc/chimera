-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2.2 (win64) Build 2348494 Mon Oct  1 18:25:44 MDT 2018
-- Date        : Mon Jan 13 20:55:51 2020
-- Host        : dig1-ro running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               D:/Ionut/Camy/PublicGit/repo/local/ip/AXI_GammaCorrection/src/design_1/ip/design_1_axi4stream_vip_0_0/design_1_axi4stream_vip_0_0_sim_netlist.vhdl
-- Design      : design_1_axi4stream_vip_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi4stream_vip_0_0_axi4stream_vip_v1_1_3_top is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    aclken : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 23 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute C_AXI4STREAM_DATA_WIDTH : integer;
  attribute C_AXI4STREAM_DATA_WIDTH of design_1_axi4stream_vip_0_0_axi4stream_vip_v1_1_3_top : entity is 24;
  attribute C_AXI4STREAM_DEST_WIDTH : integer;
  attribute C_AXI4STREAM_DEST_WIDTH of design_1_axi4stream_vip_0_0_axi4stream_vip_v1_1_3_top : entity is 0;
  attribute C_AXI4STREAM_HAS_ARESETN : integer;
  attribute C_AXI4STREAM_HAS_ARESETN of design_1_axi4stream_vip_0_0_axi4stream_vip_v1_1_3_top : entity is 1;
  attribute C_AXI4STREAM_ID_WIDTH : integer;
  attribute C_AXI4STREAM_ID_WIDTH of design_1_axi4stream_vip_0_0_axi4stream_vip_v1_1_3_top : entity is 0;
  attribute C_AXI4STREAM_INTERFACE_MODE : integer;
  attribute C_AXI4STREAM_INTERFACE_MODE of design_1_axi4stream_vip_0_0_axi4stream_vip_v1_1_3_top : entity is 2;
  attribute C_AXI4STREAM_SIGNAL_SET : string;
  attribute C_AXI4STREAM_SIGNAL_SET of design_1_axi4stream_vip_0_0_axi4stream_vip_v1_1_3_top : entity is "32'b00000000000000000000000010010011";
  attribute C_AXI4STREAM_USER_BITS_PER_BYTE : integer;
  attribute C_AXI4STREAM_USER_BITS_PER_BYTE of design_1_axi4stream_vip_0_0_axi4stream_vip_v1_1_3_top : entity is 0;
  attribute C_AXI4STREAM_USER_WIDTH : integer;
  attribute C_AXI4STREAM_USER_WIDTH of design_1_axi4stream_vip_0_0_axi4stream_vip_v1_1_3_top : entity is 1;
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_axi4stream_vip_0_0_axi4stream_vip_v1_1_3_top : entity is "yes";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_axi4stream_vip_0_0_axi4stream_vip_v1_1_3_top : entity is "axi4stream_vip_v1_1_3_top";
end design_1_axi4stream_vip_0_0_axi4stream_vip_v1_1_3_top;

architecture STRUCTURE of design_1_axi4stream_vip_0_0_axi4stream_vip_v1_1_3_top is
  signal \<const0>\ : STD_LOGIC;
begin
  m_axis_tdata(23) <= \<const0>\;
  m_axis_tdata(22) <= \<const0>\;
  m_axis_tdata(21) <= \<const0>\;
  m_axis_tdata(20) <= \<const0>\;
  m_axis_tdata(19) <= \<const0>\;
  m_axis_tdata(18) <= \<const0>\;
  m_axis_tdata(17) <= \<const0>\;
  m_axis_tdata(16) <= \<const0>\;
  m_axis_tdata(15) <= \<const0>\;
  m_axis_tdata(14) <= \<const0>\;
  m_axis_tdata(13) <= \<const0>\;
  m_axis_tdata(12) <= \<const0>\;
  m_axis_tdata(11) <= \<const0>\;
  m_axis_tdata(10) <= \<const0>\;
  m_axis_tdata(9) <= \<const0>\;
  m_axis_tdata(8) <= \<const0>\;
  m_axis_tdata(7) <= \<const0>\;
  m_axis_tdata(6) <= \<const0>\;
  m_axis_tdata(5) <= \<const0>\;
  m_axis_tdata(4) <= \<const0>\;
  m_axis_tdata(3) <= \<const0>\;
  m_axis_tdata(2) <= \<const0>\;
  m_axis_tdata(1) <= \<const0>\;
  m_axis_tdata(0) <= \<const0>\;
  m_axis_tdest(0) <= \<const0>\;
  m_axis_tid(0) <= \<const0>\;
  m_axis_tkeep(2) <= \<const0>\;
  m_axis_tkeep(1) <= \<const0>\;
  m_axis_tkeep(0) <= \<const0>\;
  m_axis_tlast <= \<const0>\;
  m_axis_tstrb(2) <= \<const0>\;
  m_axis_tstrb(1) <= \<const0>\;
  m_axis_tstrb(0) <= \<const0>\;
  m_axis_tuser(0) <= \<const0>\;
  m_axis_tvalid <= \<const0>\;
  s_axis_tready <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi4stream_vip_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 23 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_axi4stream_vip_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_axi4stream_vip_0_0 : entity is "design_1_axi4stream_vip_0_0,axi4stream_vip_v1_1_3_top,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_axi4stream_vip_0_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_axi4stream_vip_0_0 : entity is "axi4stream_vip_v1_1_3_top,Vivado 2018.2.2";
end design_1_axi4stream_vip_0_0;

architecture STRUCTURE of design_1_axi4stream_vip_0_0 is
  signal NLW_inst_m_axis_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_m_axis_tvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_m_axis_tdata_UNCONNECTED : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal NLW_inst_m_axis_tdest_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_axis_tid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_axis_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_m_axis_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_m_axis_tuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute C_AXI4STREAM_DATA_WIDTH : integer;
  attribute C_AXI4STREAM_DATA_WIDTH of inst : label is 24;
  attribute C_AXI4STREAM_DEST_WIDTH : integer;
  attribute C_AXI4STREAM_DEST_WIDTH of inst : label is 0;
  attribute C_AXI4STREAM_HAS_ARESETN : integer;
  attribute C_AXI4STREAM_HAS_ARESETN of inst : label is 1;
  attribute C_AXI4STREAM_ID_WIDTH : integer;
  attribute C_AXI4STREAM_ID_WIDTH of inst : label is 0;
  attribute C_AXI4STREAM_INTERFACE_MODE : integer;
  attribute C_AXI4STREAM_INTERFACE_MODE of inst : label is 2;
  attribute C_AXI4STREAM_SIGNAL_SET : string;
  attribute C_AXI4STREAM_SIGNAL_SET of inst : label is "32'b00000000000000000000000010010011";
  attribute C_AXI4STREAM_USER_BITS_PER_BYTE : integer;
  attribute C_AXI4STREAM_USER_BITS_PER_BYTE of inst : label is 0;
  attribute C_AXI4STREAM_USER_WIDTH : integer;
  attribute C_AXI4STREAM_USER_WIDTH of inst : label is 1;
  attribute DowngradeIPIdentifiedWarnings of inst : label is "yes";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of aclk : signal is "xilinx.com:signal:clock:1.0 CLOCK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of aclk : signal is "XIL_INTERFACENAME CLOCK, ASSOCIATED_BUSIF S_AXIS:M_AXIS, ASSOCIATED_RESET aresetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_aclk_0, ASSOCIATED_CLKEN aclken";
  attribute X_INTERFACE_INFO of aresetn : signal is "xilinx.com:signal:reset:1.0 RESET RST";
  attribute X_INTERFACE_PARAMETER of aresetn : signal is "XIL_INTERFACENAME RESET, POLARITY ACTIVE_LOW, TYPE INTERCONNECT";
  attribute X_INTERFACE_INFO of s_axis_tdata : signal is "xilinx.com:interface:axis:1.0 S_AXIS TDATA";
  attribute X_INTERFACE_INFO of s_axis_tlast : signal is "xilinx.com:interface:axis:1.0 S_AXIS TLAST";
  attribute X_INTERFACE_INFO of s_axis_tready : signal is "xilinx.com:interface:axis:1.0 S_AXIS TREADY";
  attribute X_INTERFACE_INFO of s_axis_tuser : signal is "xilinx.com:interface:axis:1.0 S_AXIS TUSER";
  attribute X_INTERFACE_PARAMETER of s_axis_tuser : signal is "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 3, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_aclk_0, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of s_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 S_AXIS TVALID";
begin
inst: entity work.design_1_axi4stream_vip_0_0_axi4stream_vip_v1_1_3_top
     port map (
      aclk => aclk,
      aclken => '1',
      aresetn => aresetn,
      m_axis_tdata(23 downto 0) => NLW_inst_m_axis_tdata_UNCONNECTED(23 downto 0),
      m_axis_tdest(0) => NLW_inst_m_axis_tdest_UNCONNECTED(0),
      m_axis_tid(0) => NLW_inst_m_axis_tid_UNCONNECTED(0),
      m_axis_tkeep(2 downto 0) => NLW_inst_m_axis_tkeep_UNCONNECTED(2 downto 0),
      m_axis_tlast => NLW_inst_m_axis_tlast_UNCONNECTED,
      m_axis_tready => '0',
      m_axis_tstrb(2 downto 0) => NLW_inst_m_axis_tstrb_UNCONNECTED(2 downto 0),
      m_axis_tuser(0) => NLW_inst_m_axis_tuser_UNCONNECTED(0),
      m_axis_tvalid => NLW_inst_m_axis_tvalid_UNCONNECTED,
      s_axis_tdata(23 downto 0) => s_axis_tdata(23 downto 0),
      s_axis_tdest(0) => '0',
      s_axis_tid(0) => '0',
      s_axis_tkeep(2 downto 0) => B"000",
      s_axis_tlast => s_axis_tlast(0),
      s_axis_tready => s_axis_tready(0),
      s_axis_tstrb(2 downto 0) => B"000",
      s_axis_tuser(0) => s_axis_tuser(0),
      s_axis_tvalid => s_axis_tvalid(0)
    );
end STRUCTURE;
