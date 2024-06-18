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
// Create Date: 06/28/2023 02:14:40 AM
// Design Name: 
// Module Name: UDM_BB
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
module UDM_BB #(parameter WIDTH = 2) //UDM Building block
(
    input  wire   [WIDTH-1:0]     A,B,     //input
    output reg   [(2*WIDTH)-1:0] Z        //output
);

genvar i;

generate
    for (i = 0; i < WIDTH; i = i + 1) begin: GEN_BLK
        always @* begin
            Z[2*i] = A[i] & B[i];  // Assign Z[2*i] with A[i] & B[i]

            // Assign Z[2*i + 1] with A[i+1] & B[i] | A[i] & B[i+1] for i < WIDTH-1
            if (i < WIDTH - 1) 
                Z[2*i + 1] = (A[i+1] & B[i]) | (A[i] & B[i+1]);
        end
    end
endgenerate

endmodule



/*
module UDM_BB #(parameter WIDTH = 2) //UDM Building block
(
input	wire	[WIDTH-1:0]		A,B,	 //input
output	wire	[2*WIDTH-1:0]	Z		 //output
);

assign	Z[0] = A[0] & B[0] ;

assign	Z[1] = (A[1] & B[0]) | (A[0] & B[1]) ;

assign	Z[2] = A[1] & B[1] ;

assign	Z[3] = 0 ;

endmodule
*/
