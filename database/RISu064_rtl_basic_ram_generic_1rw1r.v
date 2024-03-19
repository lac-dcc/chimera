`timescale 1ns / 1ps
`default_nettype none
//
// RISu64
// Copyright 2022 Wenting Zhang
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
// This won't directly map to ASIC, useful for FPGA prototyping or simulation,
// Design exploration etc.
module ram_generic_1rw1r(
    input wire clk,
    input wire rst,
    // Read write port
    input wire [ABITS-1:0] addr0,
    input wire re0,
    output reg [DBITS-1:0] rd0,
    input wire [DBITS-1:0] wr0,
    input wire we0,
    // Read only port
    input wire [ABITS-1:0] addr1,
    input wire re1,
    output reg [DBITS-1:0] rd1
);

    parameter DBITS = 8;
    parameter ABITS = 12;
    localparam DEPTH = (1 << ABITS);

    reg [DBITS-1:0] mem [0:DEPTH-1];

    always @(posedge clk) begin
        if (!rst) begin
            if (re0) begin
                rd0 <= mem[addr0];
            end
            else if (we0) begin
                mem[addr0] <= wr0;
            end
            
            if (re1) begin
                rd1 <= mem[addr1];
            end
        end
    end

endmodule
