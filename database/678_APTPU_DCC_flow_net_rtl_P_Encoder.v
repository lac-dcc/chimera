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
// Create Date: 02/26/2021 04:28:57 PM
// Design Name: 
// Module Name: P_Encoder
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

`define GEN 
module P_Encoder #(
       parameter BW = 8
    )             (
    `ifdef GEN
        input [BW-1:0] in_a,
        output reg [$clog2(BW)-1:0] out_a  
     `else 
        input [7:0] in_a,
        output reg [2:0] out_a
     `endif 
    );
    
   `ifdef GEN
        integer k;
        
        always @(*) begin 
            out_a = 0; 
            for (k=BW-1; k>=0; k=k-1) begin 
                if (in_a[k]) 
                    out_a = k[$clog2(BW)-1:0];
            end 
        end
    `else 
        always @(*) begin 
            case (in_a)                     // synopsys full_case parallel_case 
                8'b0000_0001: out_a = 3'h0;
                8'b0000_0010: out_a = 3'h1; 
                8'b0000_0100: out_a = 3'h2;
                8'b0000_1000: out_a = 3'h3;
                8'b0001_0000: out_a = 3'h4;
                8'b0010_0000: out_a = 3'h5; 
                8'b0100_0000: out_a = 3'h6; 
                8'b1000_0000: out_a = 3'h7;
                //default: out_a =3'h0;
            endcase 
        end
    `endif
     
endmodule
