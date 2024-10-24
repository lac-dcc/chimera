// This program was cloned from: https://github.com/mustafabbas/ECE1373_2016_hft_on_fpga
// License: MIT License

// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.3
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

`timescale 1 ns / 1 ps
module timer_stream_adapter_top (
synchTime_1_TVALID,
synchTime_1_TREADY,
synchTime_1_TDATA,
synchTime_2_TVALID,
synchTime_2_TREADY,
synchTime_2_TDATA,
aresetn,
aclk,
asyncTime_V
);

parameter RESET_ACTIVE_LOW = 1;

output synchTime_1_TVALID ;
input synchTime_1_TREADY ;
output [64 - 1:0] synchTime_1_TDATA ;


output synchTime_2_TVALID ;
input synchTime_2_TREADY ;
output [64 - 1:0] synchTime_2_TDATA ;

input aresetn ;

input aclk ;

input [64 - 1:0] asyncTime_V ;


wire synchTime_1_TVALID;
wire synchTime_1_TREADY;
wire [64 - 1:0] synchTime_1_TDATA;


wire synchTime_2_TVALID;
wire synchTime_2_TREADY;
wire [64 - 1:0] synchTime_2_TDATA;

wire aresetn;


wire [64 - 1:0] sig_timer_stream_adapter_synchTime_1_V_V_din;
wire sig_timer_stream_adapter_synchTime_1_V_V_full_n;
wire sig_timer_stream_adapter_synchTime_1_V_V_write;

wire [64 - 1:0] sig_timer_stream_adapter_synchTime_2_V_V_din;
wire sig_timer_stream_adapter_synchTime_2_V_V_full_n;
wire sig_timer_stream_adapter_synchTime_2_V_V_write;

wire sig_timer_stream_adapter_ap_rst;



timer_stream_adapter timer_stream_adapter_U(
    .synchTime_1_V_V_din(sig_timer_stream_adapter_synchTime_1_V_V_din),
    .synchTime_1_V_V_full_n(sig_timer_stream_adapter_synchTime_1_V_V_full_n),
    .synchTime_1_V_V_write(sig_timer_stream_adapter_synchTime_1_V_V_write),
    .synchTime_2_V_V_din(sig_timer_stream_adapter_synchTime_2_V_V_din),
    .synchTime_2_V_V_full_n(sig_timer_stream_adapter_synchTime_2_V_V_full_n),
    .synchTime_2_V_V_write(sig_timer_stream_adapter_synchTime_2_V_V_write),
    .ap_rst(sig_timer_stream_adapter_ap_rst),
    .ap_clk(aclk),
    .asyncTime_V(asyncTime_V)
);

timer_stream_adapter_synchTime_1_if timer_stream_adapter_synchTime_1_if_U(
    .ACLK(aclk),
    .ARESETN(aresetn),
    .synchTime_1_V_V_din(sig_timer_stream_adapter_synchTime_1_V_V_din),
    .synchTime_1_V_V_full_n(sig_timer_stream_adapter_synchTime_1_V_V_full_n),
    .synchTime_1_V_V_write(sig_timer_stream_adapter_synchTime_1_V_V_write),
    .TVALID(synchTime_1_TVALID),
    .TREADY(synchTime_1_TREADY),
    .TDATA(synchTime_1_TDATA));

timer_stream_adapter_synchTime_2_if timer_stream_adapter_synchTime_2_if_U(
    .ACLK(aclk),
    .ARESETN(aresetn),
    .synchTime_2_V_V_din(sig_timer_stream_adapter_synchTime_2_V_V_din),
    .synchTime_2_V_V_full_n(sig_timer_stream_adapter_synchTime_2_V_V_full_n),
    .synchTime_2_V_V_write(sig_timer_stream_adapter_synchTime_2_V_V_write),
    .TVALID(synchTime_2_TVALID),
    .TREADY(synchTime_2_TREADY),
    .TDATA(synchTime_2_TDATA));

timer_stream_adapter_ap_rst_if #(
    .RESET_ACTIVE_LOW(RESET_ACTIVE_LOW))
ap_rst_if_U(
    .dout(sig_timer_stream_adapter_ap_rst),
    .din(aresetn));

endmodule
