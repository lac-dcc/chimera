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
// Create Date: 06/14/2023 09:22:32 PM
// Design Name: 
// Module Name: Adder
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

module Adder #(parameter LOG2_WIDTH = 4, WIDTH = 2**LOG2_WIDTH)
(
input wire	[WIDTH-2:0]	     A,B,
input wire  [LOG2_WIDTH-1:0] log_a,              // Log of A-Operand (P_Encoder output)
input wire  [LOG2_WIDTH-1:0] log_b,              // Log of B-Operand (P_Encoder output)
output  	[WIDTH-2:0]		 OPs_sum,
output		[LOG2_WIDTH:0]	 log_sum
);


wire [LOG2_WIDTH+WIDTH-2:0] a_lga_conct;        // Concatenate A operand with logA
wire [LOG2_WIDTH+WIDTH-2:0] b_lga_conct;        // Concatenate B Operand with logB
wire  [LOG2_WIDTH+WIDTH-1:0]	sum ;


assign a_lga_conct = {log_a,A};
assign b_lga_conct = {log_b,B};

assign sum = a_lga_conct + b_lga_conct;

assign OPs_sum = sum[WIDTH-2:0] ;
assign log_sum = sum[LOG2_WIDTH+WIDTH-1:WIDTH-1] ;


endmodule
