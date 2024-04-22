-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Sat Oct 19 17:22:03 2019
-- Host        : think running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/GitHub/Rattlesnake/build/par/Xilinx/Digilent_A7_100T/Digilent_A7_100T.srcs/ip/clk_mmcm/clk_mmcm_stub.vhdl
-- Design      : clk_mmcm
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100ticsg324-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_mmcm is
  Port ( 
    clk_out : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in : in STD_LOGIC
  );

end clk_mmcm;

architecture stub of clk_mmcm is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out,reset,locked,clk_in";
begin
end;
