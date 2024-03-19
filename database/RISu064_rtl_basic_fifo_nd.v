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
module fifo_nd (
    input  wire             clk,
    input  wire             rst,
    input  wire [WIDTH-1:0] a_data,
    input  wire             a_valid,
    output wire             a_ready,
    output wire             a_almost_full,
    output wire             a_full,
    output wire [WIDTH-1:0] b_data,
    output wire             b_valid,
    input  wire             b_ready
);

    parameter WIDTH = 64;
    parameter ABITS = 2;
    localparam DEPTH = (1 << ABITS);

    reg [WIDTH-1:0] fifo [0:DEPTH-1];
    reg [ABITS:0] fifo_level;
    reg [ABITS-1:0] wr_ptr;
    reg [ABITS-1:0] rd_ptr;

    wire a_active = a_ready && a_valid;
    wire b_active = b_ready && b_valid;

    wire fifo_empty = fifo_level == 0;
    wire fifo_almost_full = fifo_level == DEPTH - 1;
    wire fifo_full = fifo_level == DEPTH;

    always @(posedge clk) begin
        if (a_ready && a_valid)
            fifo[wr_ptr] <= a_data;
        if (a_active && !b_active)
            fifo_level <= fifo_level + 1;
        else if (!a_active && b_active)
            fifo_level <= fifo_level - 1;
        if (a_active)
            wr_ptr <= wr_ptr + 1;
        if (b_active)
            rd_ptr <= rd_ptr + 1;
        
        if (rst) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
            fifo_level <= 0;
        end
    end
    assign b_valid = !fifo_empty;
    assign b_data = fifo[rd_ptr];
    assign a_ready = !fifo_almost_full;
    assign a_almost_full = fifo_almost_full;
    assign a_full = fifo_full;

endmodule
