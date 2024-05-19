// This program was cloned from: https://github.com/zephray/RISu064
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none
//
// RISu64
// Copyright 2022 Wenting Zhang
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
`include "defines.vh"

// KLink decoupler with 1 cycle latency
module kl_decoupler(
    input  wire         clk,
    input  wire         rst,
    // Uplink
    input  wire [31:0]  up_req_addr,
    input  wire         up_req_wen,
    input  wire [63:0]  up_req_wdata,
    input  wire [7:0]   up_req_wmask,
    input  wire [2:0]   up_req_size,
    input  wire [4:0]   up_req_srcid,
    input  wire         up_req_valid,
    output wire         up_req_ready,
    output wire [63:0]  up_resp_rdata,
    output wire [2:0]   up_resp_size,
    output wire [4:0]   up_resp_dstid,
    output wire         up_resp_valid,
    input  wire         up_resp_ready,
    // Downlink
    output wire [31:0]  dn_req_addr,
    output wire         dn_req_wen,
    output wire [63:0]  dn_req_wdata,
    output wire [7:0]   dn_req_wmask,
    output wire [2:0]   dn_req_size,
    output wire [4:0]   dn_req_srcid,
    output wire         dn_req_valid,
    input  wire         dn_req_ready,
    input  wire [63:0]  dn_resp_rdata,
    input  wire [2:0]   dn_resp_size,
    input  wire [4:0]   dn_resp_dstid,
    input  wire         dn_resp_valid,
    output wire         dn_resp_ready
);

    fifo_nd #(.WIDTH(113), .ABITS(1)) req_fifo (
        .clk(clk),
        .rst(rst),
        .a_data({up_req_addr, up_req_wen, up_req_wdata, up_req_wmask, up_req_size, up_req_srcid}),
        .a_valid(up_req_valid),
        .a_ready(up_req_ready),
        .a_almost_full(),
        .a_full(),
        .b_data({dn_req_addr, dn_req_wen, dn_req_wdata, dn_req_wmask, dn_req_size, dn_req_srcid}),
        .b_valid(dn_req_valid),
        .b_ready(dn_req_ready)
    );

    fifo_nd #(.WIDTH(72), .ABITS(1)) resp_fifo (
        .clk(clk),
        .rst(rst),
        .a_data({dn_resp_rdata, dn_resp_size, dn_resp_dstid}),
        .a_valid(dn_resp_valid),
        .a_ready(dn_resp_ready),
        .a_almost_full(),
        .a_full(),
        .b_data({up_resp_rdata, up_resp_size, up_resp_dstid}),
        .b_valid(up_resp_valid),
        .b_ready(up_resp_ready)
    );


endmodule
