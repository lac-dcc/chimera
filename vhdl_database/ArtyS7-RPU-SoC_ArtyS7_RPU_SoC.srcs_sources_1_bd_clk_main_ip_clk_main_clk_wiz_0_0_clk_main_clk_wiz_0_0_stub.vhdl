-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Fri Jan 10 22:51:39 2020
-- Host        : rainbowdash running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top clk_main_clk_wiz_0_0 -prefix
--               clk_main_clk_wiz_0_0_ clk_main_clk_wiz_0_0_stub.vhdl
-- Design      : clk_main_clk_wiz_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7s50csga324-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_main_clk_wiz_0_0 is
  Port ( 
    clk_100MHz : out STD_LOGIC;
    clk_200MHz : out STD_LOGIC;
    clk_core : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end clk_main_clk_wiz_0_0;

architecture stub of clk_main_clk_wiz_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_100MHz,clk_200MHz,clk_core,reset,locked,clk_in1";
begin
end;
