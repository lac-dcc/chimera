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
// Module Name: approx5_adder
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module approx5_adder #(parameter ADDER_LENGTH = 32, IMPRECISE_PART = 16)
(    
    // Adder's inputs
    input  wire [ADDER_LENGTH-1:0] a,
    input  wire [ADDER_LENGTH-1:0] b,
    
    // Adder's output
    output wire  [ADDER_LENGTH:0]   sum
);

 wire [ADDER_LENGTH: IMPRECISE_PART-1] W1 ; 

// Carry input to precise part of the adder
 assign W1[IMPRECISE_PART-1] = a[IMPRECISE_PART-1];
 
  // Imprecise part of the adder
  assign sum [IMPRECISE_PART-1:0] = b[IMPRECISE_PART-1:0];
   // Precise part 
  genvar i; 
  generate 
     for (i= IMPRECISE_PART ; i < ADDER_LENGTH ; i=i+1) begin 
         full_adder FA_k  (.a(a[i]) , .b(b[i]), .carry_in(W1[i-1]), .s(sum[i]) , .carry_out(W1[i])); 
     end
  endgenerate 
  
  assign sum[ADDER_LENGTH] = W1[ADDER_LENGTH-1];

endmodule
