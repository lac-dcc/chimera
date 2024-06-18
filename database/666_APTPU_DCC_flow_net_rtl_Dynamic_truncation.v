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
// Create Date: 06/25/2023 11:53:51 PM
// Design Name: 
// Module Name: Dynamic_truncation
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
module Dynamic_truncation #(
    parameter BW = 16,
    parameter MULT_DW = 6                       
    )        (
    
    `ifdef GEN
        input [BW-1:0] in_a,
        input [$clog2(BW)-1:0] select, 
        output reg [MULT_DW:0] out
    `else 
        input [7:0] in_a,
        input [2:0] select,
        output reg [1:0] 
    `endif 
    
    );
    
    `ifdef GEN
        integer k; 
        always @(*) begin 
            out = 'b0;
            for (k=MULT_DW; k <(BW); k=k+1) begin : mux_gen_blk
                if(select == k[$clog2(BW)-1:0]) 
                    out = in_a [k -: (MULT_DW+1)]; 
            end
        end
    `else 
        always @(*) begin 
            case (select)        // synopsys full_case parallel_case 
                3'd4: out = [in_a[3],in_a[2]};
                3'd5: out = {in_a[4],in_a[3]} ; 
                3'd6: out = {in_a[5],in_a[4]};
                3'd7: out = [in_a[6],in_a[5]};
                default: out = 2'b00;
            endcase
        end    
    `endif 
        
endmodule
