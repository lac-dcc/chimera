// This program was cloned from: https://github.com/zephray/RISu064
// License: MIT License

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
// FIFO for decoder-issue use, input 2x instruction bundle, output 2x, but both
// may only put/ take 0/1/2.
// [ A1 A0 -> B1 B0 ]
// Output must be sequential in terms of program order, if it takes B1 it must
// also take B0. Input may not. For example the eariler is a predicted taken
// branch, then the second one may not be valid. Or if it's jumping to address
// not aligned to 8, then only the second one is valid.
// Generally, A0 is lower address (early) instruction (lower bits of memory),
// and A1 is higher address (later) instruction. A1 could be active alone, and
// the FIFO would then skip A0 and only push in A1.
// B0 would then be early instruction and B1 is the later instruction.
// Given that the FE always fetch and decode 2x instructions (but one of them
// may be invalid), both A side share the same ready signal
module fifo_2w2r (
    input  wire             clk,
    input  wire             rst,
    input  wire [WIDTH-1:0] a1_data,
    input  wire             a1_valid,
    input  wire [WIDTH-1:0] a0_data,
    input  wire             a0_valid,
    output wire             a_ready,
    output wire             a_almost_full,
    output wire             a_full,
    output wire [WIDTH-1:0] b1_data,
    output wire             b1_valid,
    input  wire             b1_ready,
    output wire [WIDTH-1:0] b0_data,
    output wire             b0_valid,
    input  wire             b0_ready
);

    parameter WIDTH = 64;
    parameter ABITS = 2;
    parameter DEPTH = 4;
    //localparam DEPTH = (1 << ABITS);

    reg [WIDTH-1:0] fifo [0:DEPTH-1];
    reg [ABITS:0] fifo_level;
    reg [ABITS-1:0] wr_ptr;
    reg [ABITS-1:0] rd_ptr;

    wire a0_active = a_ready && a0_valid;
    wire a1_active = a_ready && a1_valid;
    wire b0_active = b0_ready && b0_valid;
    wire b1_active = b1_ready && b1_valid;

    wire a_active = a0_active || a1_active;
    wire a_both_active = a0_active && a1_active;
    wire b_active = b0_active || b1_active;
    wire b_both_active = b0_active && b1_active;

    always @(posedge clk) begin
        if (b1_active && !b0_active) begin
            $display("Invalid FIFO input, taking data OoO");
        end
    end

    wire fifo_empty = fifo_level == 0;
    wire fifo_almost_empty = fifo_level == 1;
    wire fifo_almost_full = fifo_level >= DEPTH - 3;
    wire fifo_full = fifo_level >= DEPTH - 1;

    wire [1:0] incoming_count = (a_both_active) ? 2 : (a_active) ? 1 : 0;
    wire [1:0] outgoing_count = (b_both_active) ? 2 : (b_active) ? 1 : 0;

    wire [ABITS-1:0] wr_ptr_plus_2 = (wr_ptr + 2 >= DEPTH) ?
            (wr_ptr + 2 - DEPTH) : (wr_ptr + 2);
    wire [ABITS-1:0] wr_ptr_plus_1 = (wr_ptr + 1 >= DEPTH) ?
            (wr_ptr + 1 - DEPTH) : (wr_ptr + 1);
    wire [ABITS-1:0] rd_ptr_plus_2 = (rd_ptr + 2 >= DEPTH) ?
            (rd_ptr + 2 - DEPTH) : (rd_ptr + 2);
    wire [ABITS-1:0] rd_ptr_plus_1 = (rd_ptr + 1 >= DEPTH) ?
            (rd_ptr + 1 - DEPTH) : (rd_ptr + 1);

    always @(posedge clk) begin
        // Data in
        if (a_active) begin
            if (a_both_active) begin
                fifo[wr_ptr] <= a0_data[WIDTH-1:0];
                fifo[wr_ptr_plus_1] <= a1_data[WIDTH-1:0];
            end
            else if (a1_active) begin
                fifo[wr_ptr] <= a1_data[WIDTH-1:0];
            end
            else if (a0_active) begin
                fifo[wr_ptr] <= a0_data[WIDTH-1:0];
            end
        end

        // Level update
        fifo_level <= fifo_level + incoming_count - outgoing_count;

        // Pointer update
        if (a_active)
            wr_ptr <= (a_both_active) ? wr_ptr_plus_2 : wr_ptr_plus_1;
        if (b_active)
            rd_ptr <= (b_both_active) ? rd_ptr_plus_2 : rd_ptr_plus_1;
        
        if (rst) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
            fifo_level <= 0;
        end
    end
    assign b0_valid = !fifo_empty;
    assign b1_valid = !fifo_almost_empty;
    assign b0_data = fifo[rd_ptr];
    assign b1_data = fifo[rd_ptr_plus_1];
    assign a_ready = !fifo_full;
    assign a_almost_full = fifo_almost_full;
    assign a_full = fifo_full;


endmodule
