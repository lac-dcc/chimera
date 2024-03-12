// ********************************************************
// Copyright(c)  2018
// Project name  :  HWPE
// Author        :  chenhaoc
// File    name  :  sram.v
// Module  name  :  sram
// Created Time  :  2018/5/7 17:13:33
// Last Modified :  2018/5/19 22:35:08
// Abstract:

// ========================================================
// Revision     Date     Author      Comment
// --------  ---------  ---------    ---------
//   1.0    2018/05/07  chenhaoc
//
// ********************************************************

`include "hwpe_define.vh"
`define DLY 1
`timescale 1ns/10ps

module sram(
    input  wire                       clk,
    input  wire                       cen,
    input  wire [`SRAM_ADDR_WIDTH-1:0] ad,
    input  wire [63:0]                wd,
    input  wire                       wen,
    output wire [63:0]                rd
);

parameter SRAM_ENTRY=2**(`SRAM_ADDR_WIDTH-3);

reg [63:0] mem[0:SRAM_ENTRY-1];

always @(posedge clk) begin
    if(cen & wen)
        mem[ad[`SRAM_ADDR_WIDTH-1:3]] <= #`DLY wd;
end

assign rd = cen&~wen ? mem[ad[`SRAM_ADDR_WIDTH-1:3]] : 64'd0;

endmodule
