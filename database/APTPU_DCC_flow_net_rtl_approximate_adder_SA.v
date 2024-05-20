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
// Create Date: 02/26/2021 03:49:06 PM
// Design Name: 
// Module Name: approximate_adder_SA
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

`define USC
module approximate_adder_SA#(
    parameter DW_a = 16,
    parameter DW_b = 19,
    parameter DW_c = (DW_a>DW_b)? (DW_a): (DW_b),
    parameter percentage = 4
    )                      (
    input [DW_a-1:0] a,
    input [DW_b-1:0] b,
    output [DW_c-1:0] c
    );
    
    `ifdef USC 
        wire [DW_c-1:(DW_c/percentage)] w;
        wire w_and;
        
        genvar i;
        
        generate 
            for (i=0; i<(DW_c/percentage); i=i+1) begin                           // Generate the OR gates for the lower parts of the operands
                or (c[i],a[i],b[i]);
            end
        endgenerate
        
        /* The accurate adder logic (The upper parts of the operands) */ 
        and (w_and, a [(DW_c/percentage)-1], b[(DW_c/percentage)-1]); 
        //assign w[DW_c:(DW_c/percentage)] = a[DW_a-1:(DW_c/percentage)] + b[DW_b-1:(DW_c/percentage)] + w_and; 
        //assign c[DW_c:(DW_c/percentage)] = w; 
        
        assign w[DW_c-1:(DW_c/percentage)] = a[DW_a-1:(DW_c/percentage)] + b[DW_b-1:(DW_c/percentage)] + w_and; 
        assign c[DW_c-1:(DW_c/percentage)] = w; 
    
   `else
        
        //  wire carry_in;
        wire [DW_c: (DW_c/percentage) -1] W1 ; 
        // reg [DW:0] c;
        genvar i; 
        generate 
            for (i=0; i < ((DW_c/percentage)); i=i+1) begin 
                or (c[i],a[i],b[i]); 
            end 
        endgenerate

        // and (carry_in, a[(DW/4)-1] , b[(DW/4)-1]); 
        genvar k;
        generate 
            for (k= (DW_c/percentage) ; k<DW_c ; k=k+1) begin 
                full_adder FA_k  (.a(a[k]) , .b(b[k]), .carry_in(W1[k-1]), .s(c[k]) , .carry_out(W1[k])); 
            end
         //assign c[DW] = W1[DW];
         endgenerate 
         
         and (W1[(DW_c/percentage)-1], a[(DW_c/percentage)-1] , b[(DW_c/percentage)-1]); 
         // FA_k full_adder (.a(a[(DW/2)]) , .b(b[(DW/2)]), .carry_in(W1[k-1]), .s(c[k]) , .carry_out(W1[k])); 
            
         //assign c[DW_c] = W1[DW_c-1];
   `endif  
   
    
endmodule
