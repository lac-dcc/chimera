// This program was cloned from: https://github.com/iCAS-Lab/APTPU
// License: MIT License

// MIT License
// 
// Copyright (c) 2021-2024 iCAS Lab
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

// Company: iCAS Lab, University of South Carolina
// Engineer: Mohammed E. Elbtity
// Create Date: 06/26/2023 12:15:48 AM
// Design Name: 
// Module Name: DR_ALM_TOP
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps

module DR_ALM_TOP #(parameter A_BW = 32, B_BW = 32, max_bw = (A_BW>B_BW)? A_BW:B_BW, bw_lg = $clog2(max_bw), MULT_DW = 5)
(
input	wire	[A_BW-1:0]		    A,
input	wire	[B_BW-1:0]          B,
output	wire	[(B_BW+A_BW)-1:0]	AP
);

localparam truncation_width = MULT_DW+1; 
localparam DataIN_width = A_BW; 

///LOD
wire	[bw_lg-1:0]					K_OUTA_wire,K_OUTB_wire;


///DT
wire	[truncation_width:0] 				DT_OUTA_wire,DT_OUTB_wire ;
wire	[DataIN_width-1:0]		DT_INA_wire, DT_INB_wire ;

//LC
wire	[bw_lg+truncation_width:0]	LC_OP_A_wire,LC_OP_B_wire ;

//AC
wire	[bw_lg+truncation_width+1:0]	AC_L_wire ;

wire [A_BW-1:0] uns_a;                      // The unsigend copy of the operand
wire [A_BW-1:0] lod_AO;                     // LOD of A-Operand output
wire [$clog2(A_BW)-1:0] log_a;              // Log of A-Operand (P_Encoder output)
wire [MULT_DW:0] trunc_a;                 // truncated A-operand (MUX output)
wire [truncation_width:0] trunc_a_err;             // truncated A-operand with concatenated 1'b1 at the end 


wire [A_BW-1:0] uns_b;                      // The unsigend copy of the operand
wire [A_BW-1:0] lod_BO;                     // LOD of B-Operand output
wire [$clog2(A_BW)-1:0] log_b;              // Log of B-Operand (P_Encoder output)
wire [MULT_DW:0] trunc_b;                 // truncated B-operand (MUX output)
wire [truncation_width:0] trunc_b_err;             // truncated B-operand with concatenated 1'b1 at the end 


LOD #(.BW(A_BW)) LOD_A (.in_a(A),.out_a(lod_AO));
P_Encoder #(.BW(A_BW)) PE_A (.in_a(lod_AO),.out_a(log_a));
Dynamic_truncation #(.BW(A_BW),.MULT_DW(MULT_DW)) mux_A (.in_a(A),.select(log_a),.out(trunc_a));

assign trunc_a_err = {trunc_a,1'b1};


LOD #(.BW(A_BW)) LOD_B (.in_a(B),.out_a(lod_BO));
P_Encoder #(.BW(A_BW)) PE_B (.in_a(lod_BO),.out_a(log_b));
Dynamic_truncation #(.BW(B_BW),.MULT_DW(MULT_DW)) mux_B (.in_a(B),.select(log_b),.out(trunc_b));

assign trunc_b_err = {trunc_b,1'b1};


Logarithmic_Converter  #(.truncation_width(truncation_width), .DataIN_width(A_BW), .DataK_width(bw_lg))Logarithmic_Converter_A(.LC_K(log_a),.LC_X(trunc_a_err),.LC_OP(LC_OP_A_wire));

Logarithmic_Converter #(.truncation_width(truncation_width), .DataIN_width(B_BW), .DataK_width(bw_lg))Logarithmic_Converter_B(.LC_K(log_b),.LC_X(trunc_b_err),.LC_OP(LC_OP_B_wire));

Adder_Compensation  #(.truncation_width(truncation_width), .DataIN_width(A_BW), .DataK_width(bw_lg))Adder_Compensation(.AC_OP1(LC_OP_A_wire),.AC_OP2(LC_OP_B_wire),.AC_L(AC_L_wire));

Antilogarithmic_Converter  #(.truncation_width(truncation_width), .DataIN_width(A_BW), .DataK_width(bw_lg))Antilogarithmic_Converter(.ANTI_L(AC_L_wire),.ANTI_AP(AP));

endmodule
