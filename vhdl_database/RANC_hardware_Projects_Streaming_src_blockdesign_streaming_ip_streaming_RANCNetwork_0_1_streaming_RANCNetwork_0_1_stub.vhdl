-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Wed May 22 14:44:17 2019
-- Host        : ENGR-RCL11G running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/rubenpurdy/Developer/RANC/Emulation/Projects/RANCStreaming/src/blockdesign/streaming/ip/streaming_RANCNetwork_0_1/streaming_RANCNetwork_0_1_stub.vhdl
-- Design      : streaming_RANCNetwork_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu9eg-ffvb1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity streaming_RANCNetwork_0_1 is
  Port ( 
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    tick : in STD_LOGIC;
    outcome_capture : in STD_LOGIC;
    packet_out : out STD_LOGIC_VECTOR ( 29 downto 0 );
    packet_out_valid : out STD_LOGIC;
    packet_in_capture : out STD_LOGIC;
    forward_east_full : out STD_LOGIC;
    token_controller_error : out STD_LOGIC;
    scheduler_error : out STD_LOGIC;
    packet_read_error : out STD_LOGIC;
    fifo_write_error : out STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axis_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axis_tlast : in STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC
  );

end streaming_RANCNetwork_0_1;

architecture stub of streaming_RANCNetwork_0_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst,tick,outcome_capture,packet_out[29:0],packet_out_valid,packet_in_capture,forward_east_full,token_controller_error,scheduler_error,packet_read_error,fifo_write_error,s00_axis_aclk,s00_axis_aresetn,s00_axis_tready,s00_axis_tdata[31:0],s00_axis_tstrb[3:0],s00_axis_tlast,s00_axis_tvalid";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "RANCNetwork,Vivado 2018.2";
begin
end;
