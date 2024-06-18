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
// Create Date: 12/26/2023 07:52:58 PM
// Design Name: 
// Module Name: ASM_pre_approximate
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

module ASM_pre_approximate #(parameter WIDTH = 32, LOG2_WIDTH = $clog2(WIDTH), NIBBLE_WIDTH = 4, LOG2_NIBBLE_WIDTH = $clog2(NIBBLE_WIDTH),NIBBLES = WIDTH/4 )
(
input      [WIDTH-1:0]      A,B,
output     [WIDTH+2:0]      I1_wire, I3_wire, I5_wire, I7_wire, 
output [(LOG2_NIBBLE_WIDTH*NIBBLES)-1:0] SL_out, 
output [(LOG2_NIBBLE_WIDTH*NIBBLES)-1:0] SEL_out, 
output  reg    [2*WIDTH-1:0]    R
);

//localparam NIBBLES = WIDTH/4;

//wire    [WIDTH+2:0]              I1_wire, I3_wire, I5_wire, I7_wire ; 

wire    [LOG2_NIBBLE_WIDTH-1:0]  SEL [NIBBLES-1:0], SL [NIBBLES-1:0];
wire    [WIDTH+2:0]              IX [NIBBLES-1:0];
wire    [2*WIDTH-1:0]            IX_SL [NIBBLES-1:0];
wire    [2*WIDTH-1:0]            Zero_Mux_wire [NIBBLES-1:0];

genvar i;

pre_comp_bank #(.LOG2_WIDTH(LOG2_WIDTH)) pre_comp_bank(.I(A), .I1(I1_wire),.I3(I3_wire),.I5(I5_wire),.I7(I7_wire));

generate
for (i=0; i<NIBBLES; i=i+1) 
begin : nibble_processing
    control_unit #(.LOG2_WIDTH(LOG2_WIDTH), .LOG2_NIBBLE_WIDTH(LOG2_NIBBLE_WIDTH)) control_unit_inst (.operand(B[i*4+3:i*4]), .SEL(SEL[i]), .SL(SL[i]));
//    select_unit #(.LOG2_WIDTH(LOG2_WIDTH), .LOG2_NIBBLE_WIDTH(LOG2_NIBBLE_WIDTH)) select_unit_inst (.I1(I1_wire), .I3(I3_wire), .I5(I5_wire), .I7(I7_wire), .SEL(SEL[i]), .IX(IX[i]));
//    shift_unit #(.LOG2_WIDTH(LOG2_WIDTH), .LOG2_NIBBLE_WIDTH(LOG2_NIBBLE_WIDTH), .WEIGHT_NIBBLE(i*4)) shift_unit_inst (.IX(IX[i]), .SL(SL[i]), .IX_SL(IX_SL[i]));
//    Zero_Mux #(.LOG2_WIDTH(LOG2_WIDTH), .LOG2_NIBBLE_WIDTH(LOG2_NIBBLE_WIDTH)) Zero_Mux_inst (.NIBBLE(B[i*4+3:i*4]), .IN(IX_SL[i]), .OUT(Zero_Mux_wire[i]));
end
endgenerate


generate                // Unpacking the SEL and SL wire memory (2D array) into a single vector 
    for (i=0; i<NIBBLES;i=i+1) begin
        assign SL_out[i*(NIBBLES+1):i*NIBBLES] = SL[i];
        assign SEL_out[i*(NIBBLES+1):i*NIBBLES] = SEL[i];
    end
endgenerate 

//generate
//for (i=0; i<NIBBLES; i=i+1) 
//begin : results_processing
//   assign R = Zero_Mux_wire[i];
//end
//endgenerate

/*
integer j;

always @* begin
    R = 0;
    for (j=0; j<NIBBLES; j=j+1) 
        R = R + Zero_Mux_wire[j];
end

*/
endmodule
