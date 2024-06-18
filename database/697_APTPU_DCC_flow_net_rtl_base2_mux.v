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
// Create Date: 06/28/2023 12:47:35 AM
// Design Name: 
// Module Name: base2_mux
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

// this mux to get output of pow(2,K)

module base2_mux #(parameter WIDTH = 16, LOG2_WIDTH = 4) //WIDTH --> input data width
(	
input   [LOG2_WIDTH-1:0]	K, //index of first one
output	[WIDTH-1:0]			OUT_2K // out data 
);

assign OUT_2K = 1 << K;

/*
always@(*)
begin:	always_begin

if(WIDTH == 'd16)
begin:	if_16

case(K)
	'd0:	OUT_2K = 'd1 ;     //2**0
	'd1:	OUT_2K = 'd2 ;     //2**1
	'd2:	OUT_2K = 'd4 ; 	   //2**2
	'd3:	OUT_2K = 'd8 ;     //2**3
	'd4:	OUT_2K = 'd16 ;    //2**4
	'd5:	OUT_2K = 'd32 ;    //2**5
	'd6:	OUT_2K = 'd64 ;    //2**6
	'd7:	OUT_2K = 'd128 ;   //2**7
	'd8:	OUT_2K = 'd256 ;   //2**8
	'd9:	OUT_2K = 'd512 ;   //2**9
	'd10:	OUT_2K = 'd1024 ;  //2**10
	'd11:	OUT_2K = 'd2048 ;  //2**11
	'd12:	OUT_2K = 'd4096 ;  //2**12
	'd13:	OUT_2K = 'd8192 ;  //2**13
	'd14:	OUT_2K = 'd16384 ; //2**14
	'd15:	OUT_2K = 'd32768 ; //2**15
endcase

end:	if_16

else if(WIDTH == 'd8)
begin:	if_8

case(K)
	'd0:	OUT_2K = 'd1 ;
	'd1:	OUT_2K = 'd2 ;
	'd2:	OUT_2K = 'd4 ;
	'd3:	OUT_2K = 'd8 ;
	'd4:	OUT_2K = 'd16 ;
	'd5:	OUT_2K = 'd32 ;
	'd6:	OUT_2K = 'd64 ;
	'd7:	OUT_2K = 'd128 ;
endcase

end: if_8

else if(WIDTH == 'd4)
begin:	if_4

case(K)
	'd0:	OUT_2K = 'd1 ;
	'd1:	OUT_2K = 'd2 ;
	'd2:	OUT_2K = 'd4 ;
	'd3:	OUT_2K = 'd8 ;
endcase

end: if_4

end:	always_begin
*/ 

endmodule
