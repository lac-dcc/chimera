-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.1_sdx (win64) Build 1881615 Tue May 16 18:39:18 MDT 2017
-- Date        : Thu Oct  5 15:55:17 2017
-- Host        : free-PC running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               B:/cores/2017.1/design/TEC0053/platforms/arty_z7_10_foc/hw/vivado/arty_z7_10_foc.srcs/sources_1/bd/zsys/ip/zsys_axis_concat_0_0/zsys_axis_concat_0_0_sim_netlist.vhdl
-- Design      : zsys_axis_concat_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zsys_axis_concat_0_0 is
  port (
    s_axis_aclk : in STD_LOGIC;
    s_axis_aresetn : in STD_LOGIC;
    sa_axis_tready : out STD_LOGIC;
    sa_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sa_axis_tvalid : in STD_LOGIC;
    sb_axis_tready : out STD_LOGIC;
    sb_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    sb_axis_tvalid : in STD_LOGIC;
    sc_axis_tready : out STD_LOGIC;
    sc_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    sc_axis_tvalid : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tvalid : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of zsys_axis_concat_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of zsys_axis_concat_0_0 : entity is "zsys_axis_concat_0_0,axis_concat_v1_0,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of zsys_axis_concat_0_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of zsys_axis_concat_0_0 : entity is "axis_concat_v1_0,Vivado 2017.1_sdx";
end zsys_axis_concat_0_0;

architecture STRUCTURE of zsys_axis_concat_0_0 is
  signal \^m_axis_tready\ : STD_LOGIC;
  signal \^sa_axis_tdata\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^sa_axis_tvalid\ : STD_LOGIC;
  signal \^sb_axis_tdata\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^sc_axis_tdata\ : STD_LOGIC_VECTOR ( 15 downto 0 );
begin
  \^m_axis_tready\ <= m_axis_tready;
  \^sa_axis_tdata\(31 downto 0) <= sa_axis_tdata(31 downto 0);
  \^sa_axis_tvalid\ <= sa_axis_tvalid;
  \^sb_axis_tdata\(15 downto 0) <= sb_axis_tdata(15 downto 0);
  \^sc_axis_tdata\(15 downto 0) <= sc_axis_tdata(15 downto 0);
  m_axis_tdata(63 downto 48) <= \^sc_axis_tdata\(15 downto 0);
  m_axis_tdata(47 downto 32) <= \^sb_axis_tdata\(15 downto 0);
  m_axis_tdata(31 downto 0) <= \^sa_axis_tdata\(31 downto 0);
  m_axis_tvalid <= \^sa_axis_tvalid\;
  sa_axis_tready <= \^m_axis_tready\;
  sb_axis_tready <= \^m_axis_tready\;
  sc_axis_tready <= \^m_axis_tready\;
end STRUCTURE;
