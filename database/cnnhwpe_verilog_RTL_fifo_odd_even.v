// ********************************************************
// Copyright(c)  2018
// Project name  :  HWPE
// Author        :  chenhaoc
// File    name  :  fifo_odd_even.v
// Module  name  :  fifo_odd_even
// Created Time  :  2018/5/11 22:38:13
// Last Modified :  2018/5/21 21:56:44
// Abstract:
//      fifo0 is the even pointer FIFO;
//      fifo1 is the odd pointer FIFO; (pointer starts from 0)

// ========================================================
// Revision     Date     Author      Comment
// --------  ---------  ---------    ---------
//   1.0    2018/05/11  chenhaoc     initial version
//
// ********************************************************

`define DLY 1
`timescale 1ns/10ps

module fifo_odd_even(
    input  wire         clk,
    input  wire         rst,
    input  wire         fifo_w2entry,
    input  wire [127:0] fifo0_wd,
    input  wire [127:0] fifo1_wd,
    input  wire         fifo0_wen,
    input  wire         fifo1_wen,
    input  wire         fifo_ren,
    output wire [63:0]  fifo_rd,
    output wire         fifo_empty
);

reg cnt;
wire fifo0_ren;
wire fifo1_ren;
wire [63:0] fifo0_rd;
wire [63:0] fifo1_rd;
wire fifo0_empty;
wire fifo1_empty;
assign fifo0_ren = fifo_ren & ~cnt;
assign fifo1_ren = fifo_ren & cnt;
assign fifo_empty = fifo0_empty & fifo1_empty;
assign fifo_rd = cnt ? fifo1_rd : fifo0_rd;

always @(posedge clk) begin
    if(rst)
        cnt <= #`DLY 1'b0;
    else if(fifo_ren)
        cnt <= #`DLY ~cnt;
end

fifo    u_fifo0  (
         .clk    (clk)
        ,.rst    (rst)
        ,.w2entry(fifo_w2entry)
        ,.wd     (fifo0_wd)
        ,.wen    (fifo0_wen)
        ,.ren    (fifo0_ren)
        ,.rd     (fifo0_rd)
        // ,.full(full)
        ,.empty  (fifo0_empty)
);

fifo    u_fifo1  (
         .clk    (clk)
        ,.rst    (rst)
        ,.w2entry(fifo_w2entry)
        ,.wd     (fifo1_wd)
        ,.wen    (fifo1_wen)
        ,.ren    (fifo1_ren)
        ,.rd     (fifo1_rd)
        // ,.full(full)
        ,.empty  (fifo1_empty)
);

endmodule
