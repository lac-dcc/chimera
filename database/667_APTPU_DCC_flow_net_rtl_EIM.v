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
// Module Name: EIM
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

module EIM #(parameter DW=8, WW=8, max_bw = (DW>WW)? DW:WW)
( 
  input    [DW-1:0] 	 A,
  input    [WW-1:0]      B, 
  output   [(DW+WW)-1:0] R         
) ;

 
generate  
    if(max_bw == 'd4)

	   EIM4x4 EIM4x4(.A(A),.B(B),.R(R));
    
    else if(max_bw == 'd8)

	   EIM8x8 EIM8x8(.A(A),.B(B),.R(R));
	 
	else if(max_bw == 'd16)

	   EIM16x16 EIM16x16(.A(A),.B(B),.R(R));
	   
	else if(max_bw == 'd32)
       
        EIM32x32 EIM32x32(.A(A),.B(B),.R(R));
            
	 
	 
endgenerate

endmodule
