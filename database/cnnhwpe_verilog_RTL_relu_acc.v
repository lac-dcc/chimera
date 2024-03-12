// ********************************************************
// Copyright(c)  2018
// Project name  :  HWPE
// Author        :  chenhaoc
// File    name  :  relu_acc.v
// Module  name  :  relu_acc
// Created Time  :  2018/5/17 11:04:09
// Last Modified :  2018/5/17 20:53:24
// Abstract:

// ========================================================
// Revision     Date     Author      Comment
// --------  ---------  ---------    ---------
//   1.0    2018/05/17  chenhaoc
//
// ********************************************************

`define DLY 1
`timescale 1ns/10ps

module relu_acc(
    input  wire             clk,
    input  wire             rst,
    input  wire  [4:0]      AccReg_shift,
    input  wire  [31:0]     relu_accreg_0,
    input  wire  [31:0]     relu_accreg_1,
    input  wire  [31:0]     relu_accreg_2,
    input  wire  [31:0]     relu_accreg_3,
    input  wire             relu_out_continue,
    output reg   [31:0]     relu_out_32b
    );

wire [7:0] relu_acc_8b_0;
wire [7:0] relu_acc_8b_1;
wire [7:0] relu_acc_8b_2;
wire [7:0] relu_acc_8b_3;
wire [31:0] relu_acc_32b;
assign relu_acc_32b = {relu_acc_8b_3,relu_acc_8b_2,relu_acc_8b_1,relu_acc_8b_0};
always @(posedge clk) begin
    if(rst) begin
        relu_out_32b <= #`DLY {32{1'b0}};
    end else begin
        relu_out_32b <= #`DLY relu_acc_32b;
    end
end

relu8b  u_relu8b_0(
     .data_in      (relu_accreg_0 )
    ,.AccReg_shift (AccReg_shift  )
    ,.data_out     (relu_acc_8b_0 )
);

relu8b  u_relu8b_1(
     .data_in      (relu_accreg_1 )
    ,.AccReg_shift (AccReg_shift  )
    ,.data_out     (relu_acc_8b_1 )
);

relu8b  u_relu8b_2(
     .data_in      (relu_accreg_2 )
    ,.AccReg_shift (AccReg_shift  )
    ,.data_out     (relu_acc_8b_2 )
);

relu8b  u_relu8b_3(
     .data_in      (relu_accreg_3 )
    ,.AccReg_shift (AccReg_shift  )
    ,.data_out     (relu_acc_8b_3 )
);

endmodule
