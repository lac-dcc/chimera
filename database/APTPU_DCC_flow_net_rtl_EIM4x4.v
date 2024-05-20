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
// Create Date: 06/26/2023 03:32:37 AM
// Design Name: 
// Module Name: EIM4x4
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

module EIM4x4 #(parameter WIDTH = 4)
(
input	wire	[WIDTH-1:0]		A,B,
output	wire	[2*WIDTH-1:0]		R
);

wire	anding_A0_B3 ;
wire anding_A1_B3, anding_A2_B3, anding_A3_B3, anding_A3_B0, anding_A3_B1, anding_A3_B2, anding_A1_B2, anding_A2_B1, anding_A2_B2, anding_A3_B2_A2_B3;
assign anding_A0_B3 = A[0] & B[3] ;
assign anding_A1_B3 = A[1] & B[3] ;
assign anding_A2_B3 = A[2] & B[3] ;
assign anding_A3_B3 = A[3] & B[3] ;

assign anding_A3_B0 = A[3] & B[0] ;
assign anding_A3_B1 = A[3] & B[1] ;
assign anding_A3_B2 = A[3] & B[2] ;

assign anding_A1_B2 = A[1] & B[2] ;
assign anding_A2_B1 = A[2] & B[1] ;


assign anding_A2_B2 = A[2] & B[2] ;


assign anding_A3_B2_A2_B3 = anding_A3_B2 & anding_A2_B3 ;

assign R[0] = A[0] & B[0] ;
assign R[1]	= (A[0] & B[1]) | (A[1] & B[0]) ;
assign R[2]	= (A[0] & B[2]) | (A[1] & B[1]) | (A[2] & B[0]) ;
assign R[3]	= anding_A0_B3 | anding_A1_B2 | anding_A2_B1 | anding_A3_B0 ;
assign R[4]	= (anding_A0_B3 & anding_A1_B2 & anding_A2_B1 & anding_A3_B0) | (anding_A1_B3 | anding_A2_B2);
assign R[5]	= (anding_A1_B3 & anding_A2_B2 & anding_A3_B1) ^ ( anding_A2_B3 ^ anding_A3_B2);
assign R[6]	= anding_A3_B2_A2_B3 ^ anding_A3_B3 ;
assign R[7]	= anding_A3_B2_A2_B3 & anding_A3_B3;

endmodule
