--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
--Date        : Fri Dec 14 14:48:24 2018
--Host        : rainbowdash running 64-bit major release  (build 9200)
--Command     : generate_target clk_video.bd
--Design      : clk_video
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_video is
  port (
    clk_5xpixel_0 : out STD_LOGIC;
    clk_5xpixel_inv_0 : out STD_LOGIC;
    clk_in1_0 : in STD_LOGIC;
    clk_pixel_0 : out STD_LOGIC;
    locked_0 : out STD_LOGIC;
    reset_0 : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of clk_video : entity is "clk_video,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=clk_video,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of clk_video : entity is "clk_video.hwdef";
end clk_video;

architecture STRUCTURE of clk_video is
  component clk_video_clk_wiz_0_0 is
  port (
    reset : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_pixel : out STD_LOGIC;
    clk_5xpixel : out STD_LOGIC;
    clk_5xpixel_inv : out STD_LOGIC
  );
  end component clk_video_clk_wiz_0_0;
  signal clk_in1_0_1 : STD_LOGIC;
  signal clk_wiz_0_clk_5xpixel : STD_LOGIC;
  signal clk_wiz_0_clk_5xpixel_inv : STD_LOGIC;
  signal clk_wiz_0_clk_pixel : STD_LOGIC;
  signal clk_wiz_0_locked : STD_LOGIC;
  signal reset_0_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_5xpixel_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_5XPIXEL_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_5xpixel_0 : signal is "XIL_INTERFACENAME CLK.CLK_5XPIXEL_0, CLK_DOMAIN /clk_wiz_0_clk_out1, FREQ_HZ 371250000, PHASE 0.0";
  attribute X_INTERFACE_INFO of clk_5xpixel_inv_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_5XPIXEL_INV_0 CLK";
  attribute X_INTERFACE_PARAMETER of clk_5xpixel_inv_0 : signal is "XIL_INTERFACENAME CLK.CLK_5XPIXEL_INV_0, CLK_DOMAIN /clk_wiz_0_clk_out1, FREQ_HZ 371250000, PHASE 180.0";
  attribute X_INTERFACE_INFO of clk_in1_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_IN1_0 CLK";
  attribute X_INTERFACE_PARAMETER of clk_in1_0 : signal is "XIL_INTERFACENAME CLK.CLK_IN1_0, CLK_DOMAIN clk_video_clk_in1_0, FREQ_HZ 100000000, PHASE 0.000";
  attribute X_INTERFACE_INFO of clk_pixel_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_PIXEL_0 CLK";
  attribute X_INTERFACE_PARAMETER of clk_pixel_0 : signal is "XIL_INTERFACENAME CLK.CLK_PIXEL_0, CLK_DOMAIN /clk_wiz_0_clk_out1, FREQ_HZ 74250000, PHASE 0.0";
  attribute X_INTERFACE_INFO of reset_0 : signal is "xilinx.com:signal:reset:1.0 RST.RESET_0 RST";
  attribute X_INTERFACE_PARAMETER of reset_0 : signal is "XIL_INTERFACENAME RST.RESET_0, POLARITY ACTIVE_HIGH";
begin
  clk_5xpixel_0 <= clk_wiz_0_clk_5xpixel;
  clk_5xpixel_inv_0 <= clk_wiz_0_clk_5xpixel_inv;
  clk_in1_0_1 <= clk_in1_0;
  clk_pixel_0 <= clk_wiz_0_clk_pixel;
  locked_0 <= clk_wiz_0_locked;
  reset_0_1 <= reset_0;
clk_wiz_0: component clk_video_clk_wiz_0_0
     port map (
      clk_5xpixel => clk_wiz_0_clk_5xpixel,
      clk_5xpixel_inv => clk_wiz_0_clk_5xpixel_inv,
      clk_in1 => clk_in1_0_1,
      clk_pixel => clk_wiz_0_clk_pixel,
      locked => clk_wiz_0_locked,
      reset => reset_0_1
    );
end STRUCTURE;
