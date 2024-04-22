-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.1_sdx (win64) Build 1881615 Tue May 16 18:39:18 MDT 2017
-- Date        : Thu Oct  5 15:59:54 2017
-- Host        : free-PC running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               B:/cores/2017.1/design/TEC0053/platforms/arty_z7_10_foc/hw/vivado/arty_z7_10_foc.srcs/sources_1/bd/zsys/ip/zsys_clk_mux_0_0/zsys_clk_mux_0_0_stub.vhdl
-- Design      : zsys_clk_mux_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zsys_clk_mux_0_0 is
  Port ( 
    clk0 : in STD_LOGIC;
    clk1 : in STD_LOGIC;
    sel : in STD_LOGIC;
    clkout : out STD_LOGIC
  );

end zsys_clk_mux_0_0;

architecture stub of zsys_clk_mux_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk0,clk1,sel,clkout";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "clk_mux,Vivado 2017.1_sdx";
begin
end;
