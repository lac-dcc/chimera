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
// Module Name: BAM_8x8
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

module BAM_8x8 #(parameter LOG2_WIDTH =3, WIDTH = 2**LOG2_WIDTH, VBL = 3) //4-bit wallace multiplier, //VBL --> Vertical breaking level
(
input	wire	[WIDTH-1:0]		A,B,
output	wire	[2*WIDTH-1:0]	R
);

wire	[2*WIDTH-1:0]	X_wire,Y_wire ;


wire SH_S1_C2,CH_S1_C2,SF_S1_C3,CF_S1_C3,SF_S1_C4,CF_S1_C4;
wire SH_S2_C3,CH_S2_C3,SF_S2_C5,CF_S2_C5,CF_S1_C7_1,CF_S2_C8_1 ;
wire CF_S2_C4,SF_S2_C7,CF_S2_C6,CF_S1_C8_2,SH_S1_C7,SF_S2_C8_1 ;
wire SF_S3_C7,CF_S3_C6,CF_S4_C8,CH_S4_C7,CF_S3_C5,CF_S1_C7_2;
wire SH_S3_C5,SF_S3_C6,SF_S1_C5_2,SF_S2_C4,SF_S1_C6_1,CF_S3_C8 ;
wire SF_S1_C6_2,CF_S1_C5_1,CF_S1_C6_1,SF_S1_C5_1,CF_S1_C8_1 ;
wire SH_S1_C4,SF_S2_C6,CF_S1_C5_2,CF_S1_C6_2,SH_S2_C6,CH_S2_C7 ;
wire CH_S2_C6,CF_S2_C7,CF_S3_C7,SF_S3_C8,SH_S4_C7,CH_S3_C5 ;
wire CH_S4_C14,CH_S4_C13,CH_S4_C12,CH_S4_C11,CH_S4_C10,CF_S4_C9 ;
wire CH_S3_C14,SH_S4_C14,SH_S4_C13,SH_S4_C12,SH_S4_C11,SH_S4_C10;
wire SF_S4_C9,SF_S4_C8,SH_S2_C7,CH_S1_C4,SF_S1_C7_1,SF_S1_C7_2 ;
wire CH_S1_C7,SF_S2_C10,CF_S2_C10,CF_S2_C11,CH_S2_C12,CF_S2_C13 ;
wire SF_S3_C9,CF_S3_C9,SF_S1_C8_1,SF_S1_C8_2,SF_S1_C9_1,SF_S1_C10 ;
wire CF_S1_C9_1,SF_S1_C11,CF_S1_C10,SF_S1_C12,CF_S1_C11,SF_S1_C9_2 ;
wire SF_S2_C9,SH_S1_C10,SF_S2_C11,SH_S2_C12,SF_S2_C13,SF_S2_C8_2 ;
wire SF_S3_C10,SF_S3_C11,CF_S3_C10,SH_S3_C12,CF_S3_C11,SH_S3_C13 ;
wire CH_S3_C12,SH_S3_C14,CH_S3_C13,CF_S1_C9_2,CH_S1_C10,CF_S1_C12 ;
wire CF_S2_C9,CF_S2_C8_2 ;
 
     

		/////	Stage 1	  /////

generate
if(VBL < 3)	
    Half_adder HA_S1_C2  //step 1 coloumn 2
    (
    .a(A[2] & B[0]),
    .b(A[0] & B[2]),
    .s(SH_S1_C2), // Sum_HALF_Step1_Coloumn2
    .carry_out(CH_S1_C2) // carry_out_HALF_Step1_Coloumn2
    );	

else
begin
    assign SH_S1_C2 = 1'd0 ;
    assign CH_S1_C2 = 1'd0 ;
 end
endgenerate

generate
if(VBL < 4)
    full_adder FA_S1_C3  
    (
    .a(A[3] & B[0]),
    .b(A[0] & B[3]),
    .carry_in(A[2] & B[1]),
    .s(SF_S1_C3),
    .carry_out(CF_S1_C3) // carry_out_FULL_Step1_Coloumn2
    );

else
begin
    assign SF_S1_C3 = 1'd0 ;
    assign CF_S1_C3 = 1'd0 ;
end
endgenerate


generate
if(VBL < 5)
    full_adder FA_S1_C4  
    (
    .a(A[4] & B[0]),
    .b(A[0] & B[4]),
    .carry_in(A[3] & B[1]),
    .s(SF_S1_C4),
    .carry_out(CF_S1_C4) 
    );
else
begin
    assign SF_S1_C4 = 1'd0 ;
    assign CF_S1_C4 = 1'd0 ;
end
endgenerate

generate
if(VBL < 5)	
    Half_adder HA_S1_C4  //step 1 coloumn 2
    (
    .a(A[1] & B[3]),
    .b(A[2] & B[2]),
    .s(SH_S1_C4), // Sum_HALF_Step1_Coloumn2
    .carry_out(CH_S1_C4) // carry_out_HALF_Step1_Coloumn2
    );	

else
begin
 assign SH_S1_C4 = 1'd0 ;
 assign CH_S1_C4 = 1'd0 ;
 end
endgenerate

generate
if(VBL < 6)
    full_adder FA_S1_C5_1
    (
    .a(A[5] & B[0]),
    .b(A[0] & B[5]),
    .carry_in(A[4] & B[1]),
    .s(SF_S1_C5_1),
    .carry_out(CF_S1_C5_1) 
    );
else
begin
    assign SF_S1_C5_1 = 1'd0 ;
    assign CF_S1_C5_1 = 1'd0 ;
end
endgenerate


generate
if(VBL < 6)
    full_adder FA_S1_C5_2
    (
    .a(A[1] & B[4]),
    .b(A[3] & B[2]),
    .carry_in(A[2] & B[3]),
    .s(SF_S1_C5_2),
    .carry_out(CF_S1_C5_2) 
    );
else
begin
 assign SF_S1_C5_2 = 1'd0 ;
 assign CF_S1_C5_2 = 1'd0 ;
end
endgenerate

generate
if(VBL < 7)
    full_adder FA_S1_C6_1
    (
    .a(A[6] & B[0]),
    .b(A[0] & B[6]),
    .carry_in(A[5] & B[1]),
    .s(SF_S1_C6_1),
    .carry_out(CF_S1_C6_1) 
    );
else
begin
    assign SF_S1_C6_1 = 1'd0 ;
    assign CF_S1_C6_1 = 1'd0 ;
end
endgenerate

generate
    if(VBL < 7)
    full_adder FA_S1_C6_2
    (
    .a(A[1] & B[5]),
    .b(A[4] & B[2]),
    .carry_in(A[2] & B[4]),
    .s(SF_S1_C6_2),
    .carry_out(CF_S1_C6_2) 
    );
else
begin
 assign SF_S1_C6_2 = 1'd0 ;
 assign CF_S1_C6_2 = 1'd0 ;
end
endgenerate


generate
if(VBL < 8) 
    full_adder FA_S1_C7_1
    (
    .a(A[7] & B[0]),
    .b(A[0] & B[7]),
    .carry_in(A[6] & B[1]),
    .s(SF_S1_C7_1),
    .carry_out(CF_S1_C7_1) 
    );
else // VBL >= 8
begin
    assign SF_S1_C7_1 = 1'd0 ;
    assign CF_S1_C7_1 = 1'd0 ;
end
endgenerate

generate
if(VBL < 8) // VBL >= 8
    full_adder FA_S1_C7_2
    (
    .a(A[1] & B[6]),
    .b(A[5] & B[2]),
    .carry_in(A[2] & B[5]),
    .s(SF_S1_C7_2),
    .carry_out(CF_S1_C7_2) 
    );
else
begin
 assign SF_S1_C7_2 = 1'd0 ;
 assign CF_S1_C7_2 = 1'd0 ;
end
endgenerate


generate
if(VBL < 8) 
    Half_adder HA_S1_C7  
    (
    .a(A[4] & B[3]),
    .b(A[3] & B[4]),
    .s(SH_S1_C7), 
    .carry_out(CH_S1_C7) 
    );
else	// VBL >= 8
begin
 assign SH_S1_C7 = 1'd0 ;
 assign CH_S1_C7 = 1'd0 ;
end
endgenerate


generate
if(VBL < 9) 
    full_adder FA_S1_C8_1
    (
    .a(A[7] & B[1]),
    .b(A[1] & B[7]),
    .carry_in(A[6] & B[2]),
    .s(SF_S1_C8_1),
    .carry_out(CF_S1_C8_1) 
    );
else 	//VBL >= 9
begin
 assign SF_S1_C8_1 = 1'd0 ;
 assign CF_S1_C8_1 = 1'd0 ;
end
endgenerate


generate
if(VBL < 9) 
    full_adder FA_S1_C8_2
    (
    .a(A[2] & B[6]),
    .b(A[5] & B[3]),
    .carry_in(A[3] & B[5]),
    .s(SF_S1_C8_2),
    .carry_out(CF_S1_C8_2) 
    );
else 	//VBL >= 9
begin
 assign SF_S1_C8_2 = 1'd0 ;
 assign CF_S1_C8_2 = 1'd0 ;
end
endgenerate


generate
if(VBL < 10) 
    full_adder FA_S1_C9_1
    (
    .a(A[7] & B[2]),
    .b(A[2] & B[7]),
    .carry_in(A[6] & B[3]),
    .s(SF_S1_C9_1),
    .carry_out(CF_S1_C9_1) 
);
else 	//VBL >= 10
begin
    assign SF_S1_C9_1 = 1'd0 ;
    assign CF_S1_C9_1 = 1'd0 ;
end
endgenerate


generate
if(VBL < 10)
    full_adder FA_S1_C9_2
    (
    .a(A[3] & B[6]),
    .b(A[5] & B[4]),
    .carry_in(A[4] & B[5]),
    .s(SF_S1_C9_2),
    .carry_out(CF_S1_C9_2) 
    );
else 	//VBL >= 10
begin
    assign SF_S1_C9_2 = 1'd0 ;
    assign CF_S1_C9_2 = 1'd0 ;
end
endgenerate


generate
if(VBL < 11)
    full_adder FA_S1_C10
    (
    .a(A[7] & B[3]),
    .b(A[3] & B[7]),
    .carry_in(A[6] & B[4]),
    .s(SF_S1_C10),
    .carry_out(CF_S1_C10) 
    );
else 	//VBL >= 11
begin
 assign SF_S1_C10 = 1'd0 ;
 assign CF_S1_C10 = 1'd0 ;
end
endgenerate


generate
if(VBL < 11)
    Half_adder HA_S1_C10 
    (
    .a(A[4] & B[6]),
    .b(A[5] & B[5]),
    .s(SH_S1_C10), 
    .carry_out(CH_S1_C10) 
    );
else 	//VBL >= 11
begin
 assign SH_S1_C10 = 1'd0 ;
 assign CH_S1_C10 = 1'd0 ;
end
endgenerate


generate
if(VBL < 12)
    full_adder FA_S1_C11
    (
    .a(A[7] & B[4]),
    .b(A[4] & B[7]),
    .carry_in(A[6] & B[5]),
    .s(SF_S1_C11),
    .carry_out(CF_S1_C11) 
    );
else 	//VBL >= 12
begin
 assign SF_S1_C11 = 1'd0 ;
 assign CF_S1_C11 = 1'd0 ;
end
endgenerate


generate
if(VBL < 13)
    full_adder FA_S1_C12
    (
    .a(A[7] & B[5]),
    .b(A[5] & B[7]),
    .carry_in(A[6] & B[6]),
    .s(SF_S1_C12),
    .carry_out(CF_S1_C12) 
    );
else 	//VBL >= 12
begin
 assign SF_S1_C12 = 1'd0 ;
 assign CF_S1_C12 = 1'd0 ;
end
endgenerate

		/////	Stage 2	  /////

generate
if(VBL < 3)
    Half_adder HA_S2_C3  //step 1 coloumn 2
    (
    .a(CH_S1_C2),
    .b(SF_S1_C3),
    .s(SH_S2_C3), // Sum_HALF_Step1_Coloumn2
    .carry_out(CH_S2_C3) // carry_out_HALF_Step1_Coloumn2
    );	
else
begin
 assign SH_S2_C3 = SF_S1_C3 ;
 assign CH_S2_C3 = CH_S1_C2 ;
 end
endgenerate



generate
if(VBL < 4)
    full_adder FA_S2_C4  //step 1 coloumn 2
    (
    .a(CF_S1_C3),
    .b(SF_S1_C4),
    .carry_in(SH_S1_C4),
    .s(SF_S2_C4), // Sum_HALF_Step1_Coloumn2
    .carry_out(CF_S2_C4) // carry_out_HALF_Step1_Coloumn2
    );	
else if(VBL < 5) // turn into half adder
    Half_adder HA_S2_C4  //step 1 coloumn 2
    (
    .a(SF_S1_C4),
    .b(SH_S1_C4),
    .s(SF_S2_C4), // Sum_HALF_Step1_Coloumn2
    .carry_out(CF_S2_C4) // carry_out_HALF_Step1_Coloumn2
    );
else
begin
 assign SF_S2_C4 = SF_S1_C4 ;
 assign CF_S2_C4 = CF_S1_C3 ;
 end
endgenerate


generate
if(VBL < 5)
    full_adder FA_S2_C5  //step 1 coloumn 2
    (
    .a(CF_S1_C4),
    .b(CH_S1_C4),
    .carry_in(SF_S1_C5_1),
    .s(SF_S2_C5), // Sum_HALF_Step1_Coloumn2
    .carry_out(CF_S2_C5) // carry_out_HALF_Step1_Coloumn2
    );	

else
begin
 assign SF_S2_C5 = SF_S1_C5_1 ;
 assign CF_S2_C5 = CF_S1_C4 ;
 end
endgenerate

generate
if(VBL < 6)
    full_adder FA_S2_C6  //step 1 coloumn 2
    (
    .a(CF_S1_C5_1),
    .b(CF_S1_C5_2),
    .carry_in(SF_S1_C6_1),
    .s(SF_S2_C6), // Sum_HALF_Step1_Coloumn2
    .carry_out(CF_S2_C6) // carry_out_HALF_Step1_Coloumn2
    );	

else
begin
 assign SF_S2_C6 = SF_S1_C6_1 ;
 assign CF_S2_C6 = CF_S1_C5_1 ;
 end
endgenerate

generate
if(VBL < 7)
    Half_adder HA_S2_C6  
    (
    .a(SF_S1_C6_2),
    .b((A[3]&B[3])),
    .s(SH_S2_C6), // Sum_HALF_Step1_Coloumn2
    .carry_out(CH_S2_C6) // carry_out_HALF_Step1_Coloumn2
    );	
else
begin
 assign SH_S2_C6 = SF_S1_C6_2 ; ////////   modifed from 
 assign CH_S2_C6 = CF_S1_C5_1 ; // any cause all are zero
 end
endgenerate



generate
if(VBL < 7)
    full_adder FA_S2_C7
    (
    .a(CF_S1_C6_1),
    .b(CF_S1_C6_2),
    .carry_in(SF_S1_C7_1),
    .s(SF_S2_C7), // Sum_HALF_Step1_Coloumn2
    .carry_out(CF_S2_C7) // carry_out_HALF_Step1_Coloumn2
    );	
else
begin
 assign SF_S2_C7 = SF_S1_C7_1 ;
 assign CF_S2_C7 = CF_S1_C6_1 ;
 end
endgenerate

generate
if(VBL < 8)
    Half_adder HA_S2_C7  
    (
    .a(SF_S1_C7_2),
    .b(SH_S1_C7),
    .s(SH_S2_C7), // Sum_HALF_Step1_Coloumn2
    .carry_out(CH_S2_C7) // carry_out_HALF_Step1_Coloumn2
    );	
else
begin
 assign SH_S2_C7 = SF_S1_C7_2 ;
 assign CH_S2_C7 = SH_S1_C7 ;
 end
endgenerate


generate
if(VBL < 8)
    full_adder FA_S2_C8_1
    (
    .a(CF_S1_C7_1),
    .b(CF_S1_C7_2),
    .carry_in(CH_S1_C7),
    .s(SF_S2_C8_1), // Sum_HALF_Step1_Coloumn2
    .carry_out(CF_S2_C8_1) // carry_out_HALF_Step1_Coloumn2
    );	
else
begin
 assign SF_S2_C8_1 = CF_S1_C7_1 ;
 assign CF_S2_C8_1 = CF_S1_C7_2 ;
 end
endgenerate


generate
if(VBL < 9)
    full_adder FA_S2_C8_2
    (
    .a(SF_S1_C8_1),
    .b(SF_S1_C8_2),
    .carry_in(A[4]&B[4]),
    .s(SF_S2_C8_2), // Sum_HALF_Step1_Coloumn2
    .carry_out(CF_S2_C8_2) // carry_out_HALF_Step1_Coloumn2
    );
else
begin
 assign SF_S2_C8_2 = SF_S1_C8_1 ;
 assign CF_S2_C8_2 = SF_S1_C8_2 ;
 end
endgenerate


generate
if(VBL < 9)
    full_adder FA_S2_C9
    (
    .a(CF_S1_C8_1),
    .b(CF_S1_C8_2),
    .carry_in(SF_S1_C9_1),
    .s(SF_S2_C9), // Sum_HALF_Step1_Coloumn2
    .carry_out(CF_S2_C9) // carry_out_HALF_Step1_Coloumn2
    );
else
begin
 assign SF_S2_C9 = SF_S1_C9_1 ;
 assign CF_S2_C9 = CF_S1_C8_2 ;
 end
endgenerate



generate
if(VBL < 10)
    full_adder FA_S2_C10
    (
    .a(CF_S1_C9_1),
    .b(CF_S1_C9_2),
    .carry_in(SF_S1_C10),
    .s(SF_S2_C10), // Sum_HALF_Step1_Coloumn2
    .carry_out(CF_S2_C10) // carry_out_HALF_Step1_Coloumn2
    );
else
begin
 assign SF_S2_C10 = SF_S1_C10 ;
 assign CF_S2_C10 = CF_S1_C9_1 ;
 end
endgenerate



generate
if(VBL < 11)
    full_adder FA_S2_C11
    (
    .a(CF_S1_C10),
    .b(CH_S1_C10),
    .carry_in(SF_S1_C11),
    .s(SF_S2_C11), 
    .carry_out(CF_S2_C11) 
    );
else
begin
 assign SF_S2_C11 = SF_S1_C11 ;
 assign CF_S2_C11 = CF_S1_C10 ;
 end
endgenerate


generate
if(VBL < 12)
    Half_adder HA_S2_C12
    (
    .a(CF_S1_C11),
    .b(SF_S1_C12),
    .s(SH_S2_C12),
    .carry_out(CH_S2_C12) 
    );
else
begin
 assign SH_S2_C12 = SF_S1_C12 ;
 assign CH_S2_C12 = CF_S1_C11 ;
 end
endgenerate


generate
if(VBL < 13)
    full_adder FA_S2_C13
    (
    .a(CF_S1_C12),
    .b(A[7]&B[6]),
    .carry_in(A[6]&B[7]),
    .s(SF_S2_C13), 
    .carry_out(CF_S2_C13) 
    );
else
begin
 assign SF_S2_C13 = SF_S1_C12 ;
 assign CF_S2_C13 = 'd0 ;
 end
endgenerate






		////		STAGE 3			////

generate
if(VBL < 5)
    Half_adder HA_S3_C5
    (
    .a(CF_S2_C4),
    .b(SF_S2_C5),
    .s(SH_S3_C5),
    .carry_out(CH_S3_C5) 
    );
else
begin 
assign SH_S3_C5 = SF_S2_C5 ;
assign CH_S3_C5 = CF_S2_C4 ;
end

endgenerate


generate
if(VBL < 6)
    full_adder FA_S3_C6
    (
    .a(CF_S2_C5),
    .b(SF_S2_C6),
    .carry_in(SH_S2_C6),
    .s(SF_S3_C6), 
    .carry_out(CF_S3_C6) 
    );
else if(VBL < 7) 
    Half_adder HA_S3_C6
    (
    .a(SF_S2_C6),
    .b(SH_S2_C6),
    .s(SF_S3_C6),
    .carry_out(CF_S3_C6) 
    );
else
begin
assign SF_S3_C6 = SF_S2_C6 ;
assign CF_S3_C6 = CF_S2_C5 ;
end

endgenerate


generate
if(VBL < 7)
    full_adder FA_S3_C7
    (
    .a(CF_S2_C6),
    .b(CH_S2_C6),
    .carry_in(SF_S2_C7),
    .s(SF_S3_C7), 
    .carry_out(CF_S3_C7) 
    );
else
begin
assign SF_S3_C7 = SF_S2_C7 ;
assign CF_S3_C7 = CF_S2_C6 ;
end

endgenerate



generate
if(VBL < 8)
    full_adder FA_S3_C8
    (
    .a(CF_S2_C7),
    .b(CH_S2_C7),
    .carry_in(SF_S2_C8_1),
    .s(SF_S3_C8), 
    .carry_out(CF_S3_C8) 
    );
else
begin
assign SF_S3_C8 = SF_S2_C8_1 ;
assign CF_S3_C8 = CH_S2_C7 ;
end

endgenerate

generate
if(VBL < 9)
    full_adder FA_S3_C9
    (
    .a(CF_S2_C8_1),
    .b(CF_S2_C8_2),
    .carry_in(SF_S2_C9),
    .s(SF_S3_C9), 
    .carry_out(CF_S3_C9) 
    );
else
begin
assign SF_S3_C9 = SF_S2_C9 ;
assign CF_S3_C9 = CF_S2_C8_1 ;
end
endgenerate

generate
if(VBL < 10)
    full_adder FA_S3_C10
    (
    .a(CF_S2_C9),
    .b(SF_S2_C10),
    .carry_in(SH_S1_C10),
    .s(SF_S3_C10), 
    .carry_out(CF_S3_C10) 
    );
else
begin
assign SF_S3_C10 = SH_S1_C10 ;
assign CF_S3_C10 = SF_S2_C10 ;
end
endgenerate


generate
if(VBL < 11)
    full_adder FA_S3_C11
    (
    .a(CF_S2_C10),
    .b(SF_S2_C11),
    .carry_in(A[5]&B[6]),
    .s(SF_S3_C11), 
    .carry_out(CF_S3_C11) 
    );
else
begin
assign SF_S3_C11 = SF_S2_C11 ;
assign CF_S3_C11 = CF_S2_C10 ;
end
endgenerate



generate
if(VBL < 12)
    Half_adder HA_S3_C12
    (
    .a(CF_S2_C11),
    .b(SH_S2_C12),
    .s(SH_S3_C12),
    .carry_out(CH_S3_C12) 
    );
else
begin
assign SH_S3_C12 = SH_S2_C12 ;
assign CH_S3_C12 = CF_S2_C11 ;
end
endgenerate


generate
if(VBL < 13)
    Half_adder HA_S3_C13
    (
    .a(CH_S2_C12),
    .b(SF_S2_C13),
    .s(SH_S3_C13),
    .carry_out(CH_S3_C13) 
    );
else
begin
assign SH_S3_C13 = SF_S2_C13 ;
assign CH_S3_C13 = CH_S2_C12 ;
end
endgenerate



generate
if(VBL < 14)
    Half_adder HA_S3_C14
    (
    .a(CF_S2_C13),
    .b(A[7]&B[7]),
    .s(SH_S3_C14),
    .carry_out(CH_S3_C14) 
    );
else if(VBL < 15)
begin
assign SH_S3_C14 = (A[7]&B[7]) ;
assign CH_S3_C14 = CF_S2_C13 ;
end
else
begin
assign SH_S3_C14 = (1'd0) ;
assign CH_S3_C14 = CF_S2_C13 ;
end
endgenerate



		///		STAGE 4		//// /// tracing stopped here

generate
if(VBL < 7)
    Half_adder HA_S4_C7
    (
    .a(CF_S3_C6),
    .b(SF_S3_C7),
    .s(SH_S4_C7),
    .carry_out(CH_S4_C7) 
    );
else
begin
assign SH_S4_C7 = SF_S3_C7 ;
assign CH_S4_C7 = CF_S3_C6 ;
end

endgenerate

generate
if(VBL < 8)
    full_adder FA_S4_C8
    (
    .a(CF_S3_C7),
    .b(SF_S3_C8),
    .carry_in(SF_S2_C8_2),
    .s(SF_S4_C8),
    .carry_out(CF_S4_C8) 
    );
else if(VBL < 9)
    Half_adder HA_S4_C8
    (
    .a(SF_S3_C8),
    .b(SF_S2_C8_2),
    .s(SF_S4_C8),
    .carry_out(CF_S4_C8) 
    );
else
begin
assign SF_S4_C8 = SF_S2_C8_2 ;
assign CF_S4_C8 = SF_S3_C8 ;
end
endgenerate


generate
if(VBL < 9)
    full_adder FA_S4_C9
    (
    .a(CF_S3_C8),
    .b(SF_S3_C9),
    .carry_in(SF_S1_C9_2),
    .s(SF_S4_C9),
    .carry_out(CF_S4_C9) 
    );
else if(VBL < 10)
    Half_adder HA_S4_C9
    (
    .a(SF_S3_C9),
    .b(SF_S1_C9_2),
    .s(SF_S4_C9),
    .carry_out(CF_S4_C9) 
    );
else
begin
assign SF_S4_C9 = SF_S1_C9_2 ;
assign CF_S4_C9 = SF_S3_C9 ;
end
endgenerate


generate
if(VBL < 10)
    Half_adder HA_S4_C10
    (
    .a(CF_S3_C9),
    .b(SF_S3_C10),
    .s(SH_S4_C10),
    .carry_out(CH_S4_C10) 
    );
else
begin
assign SH_S4_C10 = SF_S3_C10 ;
assign CH_S4_C10 = CF_S3_C9 ;
end
endgenerate


generate
if(VBL < 11)
    Half_adder HA_S4_C11
    (
    .a(CF_S3_C10),
    .b(SF_S3_C11),
    .s(SH_S4_C11),
    .carry_out(CH_S4_C11) 
    );
else
begin
assign SH_S4_C11 = SF_S3_C11 ;
assign CH_S4_C11 = CF_S3_C10 ;
end
endgenerate


generate
if(VBL < 12)
    Half_adder HA_S4_C12
    (
    .a(CF_S3_C11),
    .b(SH_S3_C12),
    .s(SH_S4_C12),
    .carry_out(CH_S4_C12) 
    );
else
begin
assign SH_S4_C12 = SH_S3_C12 ;
assign CH_S4_C12 = CF_S3_C11 ;
end
endgenerate

generate
if(VBL < 13)
    Half_adder HA_S4_C13
    (
    .a(CH_S3_C12),
    .b(SH_S3_C13),
    .s(SH_S4_C13),
    .carry_out(CH_S4_C13) 
    );
else
begin
assign SH_S4_C13 = SH_S3_C13 ;
assign CH_S4_C13 = CH_S3_C12 ;
end
endgenerate


generate
if(VBL < 14)
    Half_adder HA_S4_C14
    (
    .a(CH_S3_C13),
    .b(SH_S3_C14),
    .s(SH_S4_C14),
    .carry_out(CH_S4_C14) 
    );
else
begin
assign SH_S4_C14 = SH_S3_C14 ;
assign CH_S4_C14 = CH_S3_C13 ;
end
endgenerate

generate 

if(VBL < 1) // VBL = 0 :Exact Multiplier
 begin
	assign X_wire = {CH_S4_C14, CH_S4_C13, CH_S4_C12, CH_S4_C11, CH_S4_C10, CF_S4_C9,  CF_S4_C8, CH_S4_C7, SH_S4_C7, CH_S3_C5, SH_S3_C5,   CH_S2_C3,  SH_S2_C3,      SH_S1_C2,     (A[1] & B[0]), (A[0] & B[0])};
	assign Y_wire = {CH_S3_C14, SH_S4_C14, SH_S4_C13, SH_S4_C12, SH_S4_C11, SH_S4_C10, SF_S4_C9, SF_S4_C8, SH_S2_C7, SF_S3_C6, SF_S1_C5_2, SF_S2_C4, (A[1] & B[2]), (A[1] & B[1]), (A[0] & B[1]),  1'b0};
 end
 
else if(VBL < 2) //VBL = 1 
 begin
	assign X_wire = {CH_S4_C14, CH_S4_C13, CH_S4_C12, CH_S4_C11, CH_S4_C10, CF_S4_C9,  CF_S4_C8, CH_S4_C7, SH_S4_C7, CH_S3_C5, SH_S3_C5,   CH_S2_C3,  SH_S2_C3,      SH_S1_C2,     (A[1] & B[0]), 1'b0};
	assign Y_wire = {CH_S3_C14, SH_S4_C14, SH_S4_C13, SH_S4_C12, SH_S4_C11, SH_S4_C10, SF_S4_C9, SF_S4_C8, SH_S2_C7, SF_S3_C6, SF_S1_C5_2, SF_S2_C4, (A[1] & B[2]), (A[1] & B[1]), (A[0] & B[1]), 1'b0};
 end
 
else if(VBL < 3) //VBL = 2
 begin
	assign X_wire = {CH_S4_C14, CH_S4_C13, CH_S4_C12, CH_S4_C11, CH_S4_C10, CF_S4_C9,  CF_S4_C8, CH_S4_C7, SH_S4_C7, CH_S3_C5, SH_S3_C5,   CH_S2_C3,  SH_S2_C3,     SH_S1_C2,      1'b0, 1'b0};
	assign Y_wire = {CH_S3_C14, SH_S4_C14, SH_S4_C13, SH_S4_C12, SH_S4_C11, SH_S4_C10, SF_S4_C9, SF_S4_C8, SH_S2_C7, SF_S3_C6, SF_S1_C5_2, SF_S2_C4, (A[1] & B[2]), (A[1] & B[1]), 1'b0, 1'b0};
 end
 
else if(VBL < 4) //VBL = 3
 begin
	assign X_wire = {CH_S4_C14, CH_S4_C13, CH_S4_C12, CH_S4_C11, CH_S4_C10, CF_S4_C9,  CF_S4_C8, CH_S4_C7, SH_S4_C7, CH_S3_C5, SH_S3_C5,   CH_S2_C3,  SH_S2_C3,     SH_S1_C2, 1'b0, 1'b0};
	assign Y_wire = {CH_S3_C14, SH_S4_C14, SH_S4_C13, SH_S4_C12, SH_S4_C11, SH_S4_C10, SF_S4_C9, SF_S4_C8, SH_S2_C7, SF_S3_C6, SF_S1_C5_2, SF_S2_C4, (A[1] & B[2]), 1'b0,     1'b0, 1'b0};
 end
 
else  //VBL >= 4
 begin
	assign X_wire = {CH_S4_C14, CH_S4_C13, CH_S4_C12, CH_S4_C11, CH_S4_C10, CF_S4_C9,  CF_S4_C8, CH_S4_C7, SH_S4_C7, CH_S3_C5, SH_S3_C5,   CH_S2_C3, SH_S2_C3,     SH_S1_C2, 1'b0, 1'b0};
	assign Y_wire = {CH_S3_C14, SH_S4_C14, SH_S4_C13, SH_S4_C12, SH_S4_C11, SH_S4_C10, SF_S4_C9, SF_S4_C8, SH_S2_C7, SF_S3_C6, SF_S1_C5_2, SF_S2_C4, 1'b0 ,        1'b0,     1'b0, 1'b0};
 end
 
endgenerate

assign R = X_wire + Y_wire ;

endmodule
