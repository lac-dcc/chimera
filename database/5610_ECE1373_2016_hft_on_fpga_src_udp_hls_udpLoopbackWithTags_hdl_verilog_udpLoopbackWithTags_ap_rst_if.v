// This program was cloned from: https://github.com/mustafabbas/ECE1373_2016_hft_on_fpga
// License: MIT License

// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.3
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

`timescale 1ns/1ps

module udpLoopbackWithTags_ap_rst_if
#(parameter
    RESET_ACTIVE_LOW = 0
)(
    input  wire din,
    output wire dout
);

assign dout = (RESET_ACTIVE_LOW == 1)? ~din : din;

endmodule

