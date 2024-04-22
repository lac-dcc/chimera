--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
--Date        : Sat Sep  5 00:10:53 2020
--Host        : rainbowdash running 64-bit major release  (build 9200)
--Command     : generate_target clk_main.bd
--Design      : clk_main
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_main is
  port (
    clk_100MHz_0 : out STD_LOGIC;
    clk_200MHz_0 : out STD_LOGIC;
    clk_core_0 : out STD_LOGIC;
    clk_in1_0 : in STD_LOGIC;
    locked_0 : out STD_LOGIC;
    reset_0 : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of clk_main : entity is "clk_main,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=clk_main,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of clk_main : entity is "clk_main.hwdef";
end clk_main;

architecture STRUCTURE of clk_main is
  component clk_main_clk_wiz_0_0 is
  port (
    reset : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    clk_100MHz : out STD_LOGIC;
    clk_200MHz : out STD_LOGIC;
    clk_core : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component clk_main_clk_wiz_0_0;
  signal clk_in1_0_1 : STD_LOGIC;
  signal clk_wiz_0_clk_100MHz : STD_LOGIC;
  signal clk_wiz_0_clk_200MHz : STD_LOGIC;
  signal clk_wiz_0_clk_core : STD_LOGIC;
  signal clk_wiz_0_locked : STD_LOGIC;
  signal reset_0_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_100MHz_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_100MHZ_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_100MHz_0 : signal is "XIL_INTERFACENAME CLK.CLK_100MHZ_0, CLK_DOMAIN /clk_wiz_0_clk_out1, FREQ_HZ 100000000, PHASE 0.0";
  attribute X_INTERFACE_INFO of clk_200MHz_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_200MHZ_0 CLK";
  attribute X_INTERFACE_PARAMETER of clk_200MHz_0 : signal is "XIL_INTERFACENAME CLK.CLK_200MHZ_0, CLK_DOMAIN /clk_wiz_0_clk_out1, FREQ_HZ 200000000, PHASE 0.0";
  attribute X_INTERFACE_INFO of clk_core_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_CORE_0 CLK";
  attribute X_INTERFACE_PARAMETER of clk_core_0 : signal is "XIL_INTERFACENAME CLK.CLK_CORE_0, CLK_DOMAIN /clk_wiz_0_clk_out1, FREQ_HZ 100000000, PHASE 0.0";
  attribute X_INTERFACE_INFO of clk_in1_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_IN1_0 CLK";
  attribute X_INTERFACE_PARAMETER of clk_in1_0 : signal is "XIL_INTERFACENAME CLK.CLK_IN1_0, CLK_DOMAIN clk_main_clk_in1_0, FREQ_HZ 100000000, PHASE 0.000";
  attribute X_INTERFACE_INFO of reset_0 : signal is "xilinx.com:signal:reset:1.0 RST.RESET_0 RST";
  attribute X_INTERFACE_PARAMETER of reset_0 : signal is "XIL_INTERFACENAME RST.RESET_0, POLARITY ACTIVE_HIGH";
begin
  clk_100MHz_0 <= clk_wiz_0_clk_100MHz;
  clk_200MHz_0 <= clk_wiz_0_clk_200MHz;
  clk_core_0 <= clk_wiz_0_clk_core;
  clk_in1_0_1 <= clk_in1_0;
  locked_0 <= clk_wiz_0_locked;
  reset_0_1 <= reset_0;
clk_wiz_0: component clk_main_clk_wiz_0_0
     port map (
      clk_100MHz => clk_wiz_0_clk_100MHz,
      clk_200MHz => clk_wiz_0_clk_200MHz,
      clk_core => clk_wiz_0_clk_core,
      clk_in1 => clk_in1_0_1,
      locked => clk_wiz_0_locked,
      reset => reset_0_1
    );
end STRUCTURE;
