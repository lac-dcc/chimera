-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.1_sdx (win64) Build 1881615 Tue May 16 18:39:18 MDT 2017
-- Date        : Fri Oct  6 12:14:09 2017
-- Host        : W7-64-12 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               B:/SVN/cores/2017.1/design/TEC0053/platforms/arty_z7_20_foc/hw/vivado/arty_z7_20_foc.srcs/sources_1/bd/zsys/ip/zsys_axis_pwm_0_0/zsys_axis_pwm_0_0_stub.vhdl
-- Design      : zsys_axis_pwm_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zsys_axis_pwm_0_0 is
  Port ( 
    pwm_l : out STD_LOGIC_VECTOR ( 2 downto 0 );
    pwm_h : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_aresetn : in STD_LOGIC
  );

end zsys_axis_pwm_0_0;

architecture stub of zsys_axis_pwm_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "pwm_l[2:0],pwm_h[2:0],s_axis_tdata[63:0],s_axis_tdest[1:0],s_axis_tvalid,s_axis_tready,s_axis_aclk,s_axis_aresetn";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "axis_pwm_v1_0,Vivado 2017.1_sdx";
begin
end;
