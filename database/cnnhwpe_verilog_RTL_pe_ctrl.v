// ********************************************************
// Copyright(c)  2018
// Project name  :  HWPE
// Author        :  chenhaoc
// File    name  :  pe_ctrl.v
// Module  name  :  pe_ctrl
// Created Time  :  2018/5/15 11:07:40
// Last Modified :  2018/5/20 11:24:33
// Abstract:

// ========================================================
// Revision     Date     Author      Comment
// --------  ---------  ---------    ---------
//   1.0    2018/05/15  chenhaoc
//
// ********************************************************

`define DLY 1
`timescale 1ns/10ps

module pe_ctrl(
    input  wire          clk,
    input  wire          rst,
    input  wire          fifo_empty,
    input  wire [63:0]   fifo_rd,
    output wire          fifo_ren,
    output reg  [63:0]   lm,
    output wire          mac_out_en,
    output wire [2:0]    mac_acc_id,
    output wire          pe_done,
    input  wire          fmap_2addr_error,
    input  wire          kernel_2addr_error
);

always @(posedge clk) begin
    if(rst)
        lm <= #`DLY 64'd0;
    else
        lm <= #`DLY fifo_ren ? fifo_rd : lm;
end

assign fifo_ren = !fifo_empty ;

reg en;
reg en_d1;
reg en_d2;
reg en_d3;
reg en_d4;
reg [2:0] acc_id; //synchronize with accreg module for addition
wire [2:0] acc_id_w;

assign mac_out_en = en_d2;
assign acc_id_w = mac_out_en ? acc_id + 1'b1 : acc_id;
assign mac_acc_id = acc_id;
assign pe_done = (~mac_out_en & en_d3) |fmap_2addr_error|kernel_2addr_error;

always @(posedge clk) begin
    if(rst) begin
        en <= #`DLY 1'b0;
        en_d1 <= #`DLY 1'b0;
        en_d2 <= #`DLY 1'b0;
        en_d3 <= #`DLY 1'b0;
        en_d4 <= #`DLY 1'b0;
        acc_id <= #`DLY 3'b000;
    end
    else begin
        en <= #`DLY fifo_ren;
        en_d1 <= #`DLY en;
        en_d2 <= #`DLY en_d1;
        en_d3 <= #`DLY en_d2;
        en_d4 <= #`DLY en_d3;
        acc_id <= #`DLY acc_id_w;
    end
end

endmodule
