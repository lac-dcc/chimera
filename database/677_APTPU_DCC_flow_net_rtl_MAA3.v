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
// Create Date: 06/15/2023 04:11:32 AM
// Design Name: 
// Module Name: MAA3
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

module MAA3 #(parameter LOG2_WIDTH = 4, WIDTH = 2**LOG2_WIDTH, M = 8) //M is MAA4 parameter
(
input	wire		[LOG2_WIDTH+WIDTH-2:0]	OP1,OP2,
output	wire		[WIDTH-2:0]				X,
output	wire		[LOG2_WIDTH:0]			K
);

wire	[LOG2_WIDTH+WIDTH-1:0]	sum ;
wire							Cin ;
// declare for generate loop variable
genvar i ; 

  generate
    for ( i=0 ; i < M ; i = i + 1 )
	  begin
        assign sum[i] = OP2[i];
	  end
  endgenerate

assign	Cin = OP1[M-1]  ;

assign	sum[LOG2_WIDTH+WIDTH-1:M] = OP1[LOG2_WIDTH+WIDTH-2:M] + OP2[LOG2_WIDTH+WIDTH-2:M] + Cin;

assign	X = sum[WIDTH-2:0] ;
assign	K = sum[LOG2_WIDTH+WIDTH-1:WIDTH-1] ;

endmodule
