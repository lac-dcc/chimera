// This program was cloned from: https://github.com/RVECE-A-RISC-V-Community/SWIS-V
// License: MIT License

// MIT License
// 
// Copyright (c) 2023 Sudeep et al.
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

`timescale 1ns / 1ps
`default_nettype none
`include "rtl/core.v"
`include "rtl/instr_mem.v"
`include "rtl/data_mem.v"

module top_module(
input wire clk,
input wire rst_n
);

wire [31:0] i_i_data;
wire [31:0] i_d_data;
wire i_i_ack;
wire i_d_ack;
wire o_i_stb;
wire o_d_stb;
wire o_d_wr_en;
wire [31:0] o_d_write_data;
wire [31:0] o_i_addr;
wire [31:0] o_d_addr;

core core_inst (
    .clk(clk),
    .rst_n(rst_n),
    .i_i_data(i_i_data),
    .i_d_data(i_d_data),
    .i_i_ack(i_i_ack),
    .i_d_ack(i_d_ack),
    .o_i_stb(o_i_stb),
    .o_d_stb(o_d_stb),
    .o_d_wr_en(o_d_wr_en),
    .o_d_write_data(o_d_write_data),
    .o_i_addr(o_i_addr),
    .o_d_addr(o_d_addr)
);

data_mem data_mem_inst (
    .clk(clk),
    .rst_n(rst_n),
    .i_stb(o_d_stb),
    .i_wr_en(o_d_wr_en),
    .i_addr(o_d_addr),
    .i_write_data(o_d_write_data),
    .o_rd_ack(i_d_ack),
    .o_read_data(i_d_data)
);

instr_mem instr_mem_inst (
    .clk(clk),
    .rst_n(rst_n),
    .i_addr(o_i_addr),
    .i_stb(o_i_stb),
    .o_ack(i_i_ack),
    .o_data(i_i_data)
);

endmodule
