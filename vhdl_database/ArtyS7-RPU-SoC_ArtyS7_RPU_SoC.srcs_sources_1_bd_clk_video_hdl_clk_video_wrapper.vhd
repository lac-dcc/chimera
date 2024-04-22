--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
--Date        : Fri Dec 14 14:48:24 2018
--Host        : rainbowdash running 64-bit major release  (build 9200)
--Command     : generate_target clk_video_wrapper.bd
--Design      : clk_video_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_video_wrapper is
  port (
    clk_5xpixel_0 : out STD_LOGIC;
    clk_5xpixel_inv_0 : out STD_LOGIC;
    clk_in1_0 : in STD_LOGIC;
    clk_pixel_0 : out STD_LOGIC;
    locked_0 : out STD_LOGIC;
    reset_0 : in STD_LOGIC
  );
end clk_video_wrapper;

architecture STRUCTURE of clk_video_wrapper is
  component clk_video is
  port (
    reset_0 : in STD_LOGIC;
    clk_in1_0 : in STD_LOGIC;
    locked_0 : out STD_LOGIC;
    clk_pixel_0 : out STD_LOGIC;
    clk_5xpixel_0 : out STD_LOGIC;
    clk_5xpixel_inv_0 : out STD_LOGIC
  );
  end component clk_video;
begin
clk_video_i: component clk_video
     port map (
      clk_5xpixel_0 => clk_5xpixel_0,
      clk_5xpixel_inv_0 => clk_5xpixel_inv_0,
      clk_in1_0 => clk_in1_0,
      clk_pixel_0 => clk_pixel_0,
      locked_0 => locked_0,
      reset_0 => reset_0
    );
end STRUCTURE;
