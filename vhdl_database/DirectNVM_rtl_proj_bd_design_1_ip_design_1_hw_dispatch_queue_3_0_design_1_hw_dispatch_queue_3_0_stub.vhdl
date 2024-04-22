-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
-- Date        : Fri Feb 19 15:29:52 2021
-- Host        : yzou-PC running 64-bit Ubuntu 16.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /hdd/directnvm/rtl_proj/bd/design_1/ip/design_1_hw_dispatch_queue_3_0/design_1_hw_dispatch_queue_3_0_stub.vhdl
-- Design      : design_1_hw_dispatch_queue_3_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu7ev-ffvc1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_hw_dispatch_queue_3_0 is
  Port ( 
    clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 191 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 191 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    prog_empty : out STD_LOGIC
  );

end design_1_hw_dispatch_queue_3_0;

architecture stub of design_1_hw_dispatch_queue_3_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,din[191:0],wr_en,rd_en,dout[191:0],full,empty,prog_empty";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "fifo_generator_v13_2_5,Vivado 2019.2";
begin
end;
