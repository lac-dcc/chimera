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
// Create Date: 12/28/2023 05:45:21 PM
// Design Name: 
// Module Name: mitchell_multiplication_unit
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

module mitchell_multiplication_unit #(parameter A_BW = 32, B_BW = 32, max_op = (A_BW>B_BW)? A_BW : B_BW, log2_max = $clog2(max_op))
(
    //input [A_BW-1:0] A , 
    input [$clog2(A_BW)-1:0] k_1,
    input [$clog2(B_BW)-1:0] k_2,
    input [A_BW-1:0]         x_1,
    input [B_BW-1:0]         x_2,
    input                    A_zero_flag,
    input                    B_zero_flag,
    
    //input [B_BW-1:0] B , 
    output [(A_BW+B_BW)-1:0] C
    );


//internal signals
//wire [$clog2(A_BW)-1:0]k_1;
//wire [$clog2(B_BW)-1:0]k_2;

//wire [A_BW-1:0] LOD_A_wire;
//wire [B_BW-1:0] LOD_B_wire;

//reg [A_BW-1:0] x_1;
//reg [B_BW-1:0] x_2;
reg [log2_max:0]k_1_2;
reg [max_op:0]x_1_2;
reg [log2_max+1:0]k_1_2_new;
reg [2*max_op+max_op-1:0]internal_product;
wire [max_op-1:0]zero;
reg [A_BW-1:0] shift_A;
reg [B_BW-1:0] shift_B;
reg [(A_BW+B_BW)-1:0] C_int;
reg [(A_BW+B_BW):0]internal_sum;

assign zero =  'd0;
//modules instances
//LOD # (.n(n))LOD_A(    .A(A),    .k(k_1));

 //LOD#(.BW(A_BW))  LOD_A (.in_a(A),.out_a(LOD_A_wire));
 
// P_Encoder #(.BW(A_BW)) PE_A (.in_a(LOD_A_wire),.out_a(k_1) );

//LOD # (.n(n))LOD_B(    .A(B),    .k(k_2));
 //LOD#(.BW(B_BW))  LOD_B (.in_a(B),.out_a(LOD_B_wire));
 //P_Encoder #(.BW(B_BW)) PE_B (.in_a(LOD_B_wire),.out_a(k_2) );

//combinational logic

always@(*)
begin
    //shift_A = A_BW-k_1; //subtractor
    //shift_B = B_BW-k_2; //subtractor
    //x_1 = A << shift_A; //shifter
    //x_2 = B << shift_B; //shifting left
    k_1_2 = k_1 + k_2; //adder
    x_1_2 = x_1 + x_2; //adder
    internal_sum = x_1_2 + {1'b1 , zero}; //adder
    if(x_1_2[max_op] == 1) //mux
    begin
        k_1_2_new = k_1_2 + 1; //adder
        internal_product = x_1_2 << k_1_2_new; //shifter
    end
    else
    begin
        k_1_2_new = k_1_2;
        internal_product = internal_sum << k_1_2_new; //shifter
    end
    
    C_int = internal_product[2*max_op+max_op-1:max_op];
    /*
    if(A == 0 || B == 0)    //mux to check whether any operand is equal to zero 
    begin
        C = 0;              // If one of the operands is zero, then the output is automatically Zero and the calculations get negelected
    end
    else begin
        C = C_int;
    end                     // end else 
    */
end

assign C = (A_zero_flag|B_zero_flag)? 'd0 : C_int;

endmodule
