-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Sat Nov  9 13:00:01 2019
-- Host        : heplnw017.pp.rl.ac.uk running 64-bit CentOS Linux release 7.7.1908 (Core)
-- Command     : write_vhdl -force -mode synth_stub
--               /data/tsw/firmware/ipbus-dev-zcu102-c2c/proj/zcu102_2019.1to2019.1.1/zcu102_2019.1to2019.1.1/zcu102_2019.1to2019.1.1.srcs/sources_1/bd/c2c_s_ipb/ip/c2c_s_ipb_clk_wiz_0_1/c2c_s_ipb_clk_wiz_0_1_stub.vhdl
-- Design      : c2c_s_ipb_clk_wiz_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu9eg-ffvb1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity c2c_s_ipb_clk_wiz_0_1 is
  Port ( 
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end c2c_s_ipb_clk_wiz_0_1;

architecture stub of c2c_s_ipb_clk_wiz_0_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,clk_out2,reset,locked,clk_in1";
begin
end;
