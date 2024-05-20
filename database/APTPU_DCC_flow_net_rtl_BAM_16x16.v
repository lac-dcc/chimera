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
// Create Date: 06/25/2023 01:53:07 AM
// Design Name: 
// Module Name: BAM_16x16
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

module BAM_16x16 #(parameter LOG2_WIDTH =3, WIDTH = 2**LOG2_WIDTH, VBL = 2) //4-bit wallace multiplier, //VBL --> Vertical breaking level

( input   wire [WIDTH-1:0] 	 A,B, 
  output  wire [2*WIDTH-1:0] R       
) ;


wire	[WIDTH/2-1:0]	AL,AH,BL,BH ;
wire	[WIDTH-1:0]		Z1,Z2,Z3,Z4 ;


assign	AL = A[WIDTH/2-1:0] ;  //LSBs
assign	AH = A[WIDTH-1:WIDTH/2] ; //MSBs

assign	BL = B[WIDTH/2-1:0] ;  //LSBs
assign	BH = B[WIDTH-1:WIDTH/2] ; //MSBs

	 
	 
generate 
if(VBL < 'd8) begin	 BAM_8x8 #(.VBL(VBL))AL_BL(.A(AL),.B(BL),.R(Z1));

    BAM_8x8 #(.VBL(0))AH_BL(.A(AH), .B(BL), .R(Z2));

    BAM_8x8 #(.VBL(0))AL_BH(.A(AL),.B(BH),.R(Z3));

    BAM_8x8 #(.VBL(0))AH_BH(.A(AH),.B(BH),.R(Z4));
    
	assign	R = Z1 + (Z2 << 8) + (Z3 << 8) + (Z4 << 16) ;
end	

else if(VBL < 'd16)
 begin	 
    BAM_8x8 #(.VBL(VBL)) AL_BL (.A(AL),.B(BL),.R(Z1));

    BAM_8x8 #(.VBL(VBL - 'd8))AH_BL(.A(AH), .B(BL), .R(Z2));

    BAM_8x8 #(.VBL(VBL - 'd8))AL_BH(.A(AL),.B(BH),.R(Z3));

    BAM_8x8 #(.VBL(0))AH_BH(.A(AH),.B(BH),.R(Z4));
    
	assign	R = Z1 + (Z2 << 8) + (Z3 << 8) + (Z4 << 16) ;
end	

else
 begin	 
    BAM_8x8 #(.VBL('d16))AL_BL(.A(AL),.B(BL),.R(Z1));

    BAM_8x8 #(.VBL(VBL - 'd8))AH_BL(.A(AH), .B(BL), .R(Z2));

    BAM_8x8 #(.VBL(VBL - 'd8))AL_BH(.A(AL),.B(BH),.R(Z3));

    BAM_8x8 #(.VBL(VBL - 'd16))AH_BH(.A(AH),.B(BH),.R(Z4));
    
	assign	R = Z1 + (Z2 << 8) + (Z3 << 8) + (Z4 << 16) ;
end	



endgenerate
	 
endmodule
