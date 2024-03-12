// ********************************************************
// Copyright(c)  2018
// Project name  :  HWPE
// Author        :  chenhaoc
// File    name  :  mul_int8.v
// Module  name  :  mul_int8
// Created Time  :  2018/5/15 16:06:50
// Last Modified :  2018/5/16 14:47:15
// Abstract:

// ========================================================
// Revision     Date     Author      Comment
// --------  ---------  ---------    ---------
//   1.0    2018/05/15  chenhaoc
//
// ********************************************************

`define DLY 1
`timescale 1ns/10ps

module mul_int8(
    input  wire [8:0]   rs1,
    input  wire [7:0]   rs2,
    output wire [16:0]  mul
);


//==========================================================
// Booth recoding and selection, radix-4
//==========================================================
wire [8:0] code;
wire [2:0] code_0;
wire [2:0] code_1;
wire [2:0] code_2;
wire [2:0] code_3;
wire [9:0] sel_data_0;
wire [9:0] sel_data_1;
wire [9:0] sel_data_2;
wire [9:0] sel_data_3;
wire sel_inv_0;
wire sel_inv_1;
wire sel_inv_2;
wire sel_inv_3;

assign code = {rs2[7:0], 1'b0};

assign code_0 = code[2:0];
assign code_1 = code[4:2];
assign code_2 = code[6:4];
assign code_3 = code[8:6];

booth u_booth_0 (
    .code      (code_0[2:0])
    ,.src_data (rs1[8:0])
    ,.out_data (sel_data_0)
    ,.out_inv  (sel_inv_0)
);

booth u_booth_1 (
    .code      (code_1[2:0])
    ,.src_data (rs1[8:0])
    ,.out_data (sel_data_1)
    ,.out_inv  (sel_inv_1)
);

booth u_booth_2 (
    .code      (code_2[2:0])
    ,.src_data (rs1[8:0])
    ,.out_data (sel_data_2)
    ,.out_inv  (sel_inv_2)
);

booth u_booth_3 (
    .code      (code_3[2:0])
    ,.src_data (rs1[8:0])
    ,.out_data (sel_data_3)
    ,.out_inv  (sel_inv_3)
);

//==========================================================
// CSA tree input
//==========================================================
reg     [16:0] ppre_0;
reg     [16:0] ppre_1;
reg     [16:0] ppre_2;
reg     [16:0] ppre_3;
reg     [16:0] ppre_4;

always @( * ) begin
    ppre_0 = {7'b0, sel_data_0};
    ppre_1 = {5'b0, sel_data_1, 1'b0, sel_inv_0};
    ppre_2 = {3'b0, sel_data_2, 1'b0, sel_inv_1, 2'b0};
    ppre_3 = {1'b0, sel_data_3, 1'b0, sel_inv_2, 4'b0};
    ppre_4 = {10'b0, sel_inv_3 , 6'b0 };//-'hAA_00='hF5600
    // ppre_4 = {1'b1, 8'h56, 1'b0, sel_inv_3 , 6'b0 };//-'hAA_00='hF5600
end

wire [84:0] pp_in;
assign pp_in = {ppre_4, ppre_3, ppre_2, ppre_1, ppre_0};
wire [16:0] pp_out_0;
wire [16:0] pp_out_1;
DW02_tree #(5, 17) u_tree_l0n0 (
   .INPUT    (pp_in[84:0])
  ,.OUT0     (pp_out_0[16:0])
  ,.OUT1     (pp_out_1[16:0])
);

assign mul = pp_out_0 + pp_out_1;

endmodule
