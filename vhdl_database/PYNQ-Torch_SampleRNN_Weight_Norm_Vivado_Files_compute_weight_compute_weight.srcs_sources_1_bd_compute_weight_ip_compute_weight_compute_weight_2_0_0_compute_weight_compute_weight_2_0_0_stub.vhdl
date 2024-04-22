-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Fri Apr  5 17:17:38 2019
-- Host        : ManoharVohra-PC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/ECTE433_LabFiles/compute_weight/compute_weight.srcs/sources_1/bd/compute_weight/ip/compute_weight_compute_weight_2_0_0/compute_weight_compute_weight_2_0_0_stub.vhdl
-- Design      : compute_weight_compute_weight_2_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity compute_weight_compute_weight_2_0_0 is
  Port ( 
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    input_r_TVALID : in STD_LOGIC;
    input_r_TREADY : out STD_LOGIC;
    input_r_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    input_r_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    output_r_TVALID : out STD_LOGIC;
    output_r_TREADY : in STD_LOGIC;
    output_r_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    output_r_TLAST : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end compute_weight_compute_weight_2_0_0;

architecture stub of compute_weight_compute_weight_2_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ap_clk,ap_rst_n,input_r_TVALID,input_r_TREADY,input_r_TDATA[31:0],input_r_TLAST[0:0],output_r_TVALID,output_r_TREADY,output_r_TDATA[31:0],output_r_TLAST[0:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "compute_weight_2,Vivado 2018.2";
begin
end;
