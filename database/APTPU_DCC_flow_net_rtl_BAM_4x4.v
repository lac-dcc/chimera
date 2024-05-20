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
// Module Name: BAM_4x4
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

module BAM_4x4 #(parameter LOG2_WIDTH = 4, WIDTH = 2**LOG2_WIDTH, VBL = 3) //4-bit wallace multiplier, //VBL --> Vertical breaking level
(
input	wire	[WIDTH-1:0]		A,B,
output	wire	[2*WIDTH-1:0]	R
);

wire	[2*WIDTH-1:0]	X_wire,Y_wire ;


wire SH_S1_C2,CH_S1_C2,SF_S1_C3,CF_S1_C3,SF_S1_C4,CF_S1_C4;
wire SH_S2_C3,CH_S2_C3,SH_S2_C4,CH_S2_C4,SF_S2_C5,CF_S2_C5 ;


		/////	Stage 1	  /////

generate
if(VBL < 3)	//step 1 coloumn 2                              // Sum_HALF_Step1_Coloumn2
 Half_adder HA_S1_C2  ( .A(A[2] & B[0]), .B(A[1] & B[1]), .S(SH_S1_C2), .Cout(CH_S1_C2) ); // Cout_HALF_Step1_Coloumn2	

else
begin
 assign SH_S1_C2 = 1'd0 ;
 assign CH_S1_C2 = 1'd0 ;
 end
endgenerate

/////	Stage 2	  /////

generate
if(VBL < 3)
    Half_adder HA_S2_C3  //step 1 coloumn 2
    (.A(CH_S1_C2),.B(SF_S1_C3),.S(SH_S2_C3), // Sum_HALF_Step1_Coloumn2
    .Cout(CH_S2_C3) // Cout_HALF_Step1_Coloumn2
    );	
else
begin
 assign SH_S2_C3 = SF_S1_C3 ;
 assign CH_S2_C3 = CH_S1_C2 ;
 end
endgenerate


generate
if(VBL < 4)
    full_adder FA_S1_C3(.a(A[0] & B[3]),.b(A[2] & B[1]),.carry_in(A[1] & B[2]),.s(SF_S1_C3),.carry_out(CF_S1_C3) ); // Cout_FULL_Step1_Coloumn2

else
begin
 assign SF_S1_C3 = 1'd0 ;
 assign CF_S1_C3 = 1'd0 ;
end
endgenerate

	/////	Stage 2	  /////
	
generate
    if(VBL < 4)
        Half_adder HA_S2_C4  //step 1 coloumn 2
        (.a(CF_S1_C3),.b(SF_S1_C4),.s(SH_S2_C4), // Sum_HALF_Step1_Coloumn2
        .carry_out(CH_S2_C4) // Cout_HALF_Step1_Coloumn2
        );    
    
    else
    begin
     assign SH_S2_C4 = SF_S1_C4 ;
     assign CH_S2_C4 = CF_S1_C3 ;
     end
    endgenerate


generate
if(VBL < 5)
    full_adder FA_S1_C4  (.a(A[1] & B[3]),.b(A[3] & B[1]),.carry_in(A[2] & B[2]),.s(SF_S1_C4),.carry_out(CF_S1_C4));

else begin
 assign SF_S1_C4 = 1'd0 ;
 assign CF_S1_C4 = 1'd0 ;
end
endgenerate

		/////	Stage 2	  /////

full_adder FA_S2_C5 (.a(CF_S1_C4),.b(A[3] & B[2]),.carry_in(A[2] & B[3]),.s(SF_S2_C5),.carry_out(CF_S2_C5) );

generate 

if(VBL < 1)
 begin
	assign X_wire = {CF_S2_C5, CH_S2_C4, CH_S2_C3, SH_S2_C3, SH_S1_C2, (A[1] & B[0]), (A[0] & B[0])};
	assign Y_wire = {(A[3] & B[3]), SF_S2_C5, SH_S2_C4, (A[3] & B[0]), (A[0] & B[2]), (A[0] & B[1]), 1'b0};
 end
 
else if(VBL < 2)
 begin
	assign X_wire = {CF_S2_C5, CH_S2_C4, CH_S2_C3, SH_S2_C3, SH_S1_C2, (A[1] & B[0]), 1'b0};
	assign Y_wire = {(A[3] & B[3]), SF_S2_C5, SH_S2_C4, (A[3] & B[0]), (A[0] & B[2]), (A[0] & B[1]), 1'b0};
 end
 
else if(VBL < 3)
 begin
	assign X_wire = {CF_S2_C5, CH_S2_C4, CH_S2_C3, SH_S2_C3, SH_S1_C2, 1'b0, 1'b0};
	assign Y_wire = {(A[3] & B[3]), SF_S2_C5, SH_S2_C4, (A[3] & B[0]), (A[0] & B[2]), 1'b0, 1'b0};
 end
 
else if(VBL < 4)
 begin
	assign X_wire = {CF_S2_C5, CH_S2_C4, CH_S2_C3, SH_S2_C3, SH_S1_C2, 1'b0, 1'b0};
	assign Y_wire = {(A[3] & B[3]), SF_S2_C5, SH_S2_C4, (A[3] & B[0]), 1'b0, 1'b0, 1'b0};
 end
 
else // VBL >= 4
 begin
	assign X_wire = {CF_S2_C5, CH_S2_C4, CH_S2_C3, SH_S2_C3, SH_S1_C2, 1'b0, 1'b0};
	assign Y_wire = {(A[3] & B[3]), SF_S2_C5, SH_S2_C4,  1'b0, 1'b0, 1'b0, 1'b0};
 end
 
endgenerate

assign R = X_wire + Y_wire ;

endmodule
