// ********************************************************
// Copyright(c)  2018
// Project name  :  HWPE
// Author        :  chenqiang
// File    name  :  relu8b.v
// Module  name  :  relu8b
// Created Time  :  2018/5/17 10:54:46
// Last Modified :  2018/5/17 11:29:20
// Abstract:

// ========================================================
// Revision     Date     Author      Comment
// --------  ---------  ---------    ---------
//   1.0    2018/05/16  chenqiang
//   1.1    2018/05/17  chenhaoc
// ********************************************************

`define DLY 1
`timescale 1ns/10ps

module relu8b(
    input  wire [31:0]         data_in,
    input  wire [4:0]          AccReg_shift,
    output wire [7:0]          data_out
);

wire [31:0] data_sft;
assign data_sft = data_in >> AccReg_shift;
assign data_out =  data_in[31]    ? 8'h00 :  // neg to 0
                  |data_sft[31:8] ? 8'hFF :  // >255 to 255
                   data_sft[7:0];            // 8b

endmodule
