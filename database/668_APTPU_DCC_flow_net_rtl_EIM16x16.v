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
// Module Name: EIM16x16
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


module EIM16x16 #(parameter WIDTH = 16)  // Karatsuba design using 8x8 multiplier 
(
input	wire	[WIDTH-1:0]		A,B,
output	wire	[2*WIDTH-1:0]	R
);


wire	[WIDTH/2-1:0]	AL,AH,BL,BH ;
wire	[WIDTH-1:0]		R1,R2,R3,R4 ;


assign	AL = A[WIDTH/2-1:0] ;  //LSBs
assign	AH = A[WIDTH-1:WIDTH/2] ; //MSBs

assign	BL = B[WIDTH/2-1:0] ;  //LSBs
assign	BH = B[WIDTH-1:WIDTH/2] ; //MSBs

	 
		EIM8x8 AL_BL
		(
		.A(AL),//Al
		.B(BL),//Bl
		.R(R1)
		);
		
		EIM8x8 AH_BL
		(
		.A(AH), //Ah
		.B(BL), //Bl
		.R(R2)
		);
		
		EIM8x8 AL_BH
		(
		.A(AL),//Al
		.B(BH),//Bh
		.R(R3)
		);
		
		EIM8x8 AH_BH
		(
		.A(AH),//Ah
		.B(BH),//Bh
		.R(R4)
		);
    
	assign	R = R1 + (R2 << 8) + (R3 << 8) + (R4 << 16) ;
		 
endmodule
