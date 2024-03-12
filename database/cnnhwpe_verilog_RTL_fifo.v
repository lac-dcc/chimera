// ********************************************************
// Copyright(c)  2018
// Project name  :  HWPE
// Author        :  chenhaoc
// File    name  :  fifo.v
// Module  name  :  fifo
// Created Time  :  2018/5/7 15:54:00
// Last Modified :  2018/5/21 21:50:25
// Abstract:
//      FIFO Deepth=2;
//      Support 2 entry write in, but only 1 entry read out every cycle

// ========================================================
// Revision     Date     Author      Comment
// --------  ---------  ---------    ---------
//   1.0    2018/05/12  chenhaoc     initial version
//
// ********************************************************

`include "hwpe_define.vh"
`define DLY 1
`timescale 1ns/10ps

module fifo(
    input  wire         clk,
    input  wire         rst,
    input  wire         w2entry,
    input  wire [127:0] wd,
    input  wire         wen,
    input  wire         ren,
    output wire [63:0]  rd,
    output reg          empty
);

reg [63:0] mem[0:1];
reg wp;
reg rp;
reg full;

always @(posedge clk ) begin
    if(rst)
        full <= #`DLY 1'b0;
    else if((wen & !ren &((!w2entry&(wp^rp)) | (w2entry&empty))) | (wen&ren&w2entry&(wp^rp)))
        full <= #`DLY 1'b1;
    else if(ren & !wen)
        full <= #`DLY 1'b0;
end

always @(posedge clk) begin
    if(rst)
        empty <= #`DLY 1'b1;
    else if(ren & !wen & (wp^rp))
        empty <= #`DLY 1'b1;
    else if(wen)
        empty <= #`DLY 1'b0;
end

always @(posedge clk) begin
    if(rst)
        wp <= #`DLY 1'b0;
  /*  else if(w2entry) begin
        if((wen&empty) | (wen&ren&(rp^wp))
            wp <= #`DLY wp;
    end  */
    else if(!w2entry & wen & (!full | ren))
        wp <= #`DLY ~wp;
end

always @(posedge clk) begin
    if(rst)
        rp <= #`DLY 1'b0;
    else if(ren & !empty)
        rp <= #`DLY ~rp;
end

always @(posedge clk) begin
    if(wen & (!full|ren))
        mem[wp] <= #`DLY wd[63:0];
    if(w2entry&wen&(empty|(ren&!full)))
        mem[~wp] <= #`DLY wd[127:64];
end

assign rd = mem[rp];

endmodule

