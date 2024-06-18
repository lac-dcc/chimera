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
module fifo_2d_fwft (
    input  wire             clk,
    input  wire             rst,
    input  wire [WIDTH-1:0] a_data,
    input  wire             a_valid,
    output wire             a_ready,
    output wire             a_almost_full,
    output wire [WIDTH-1:0] b_data,
    output wire             b_valid,
    input  wire             b_ready
);

    parameter WIDTH = 64;

    reg [WIDTH-1:0] fifo_top;
    reg [WIDTH-1:0] fifo_bottom;
    reg fifo_empty;
    reg fifo_full;
    reg [1:0] rd_ptr;
    always @(posedge clk) begin
        if (a_ready && a_valid) begin
            fifo_top <= a_data;
            fifo_bottom <= fifo_top;
            if (!b_ready) begin
                // Enqueue
                if (fifo_empty) begin
                    rd_ptr <= 2'd1;
                    fifo_empty <= 1'b0;
                end
                else if (fifo_full) begin
                    // Cry
                    $display("IF FIFO overflow!");
                end
                else begin
                    rd_ptr <= 2'd2;
                    fifo_full <= 1'b1;
                end
            end
            else begin
                // Data coming in and out normally
            end
        end
        else if (b_ready) begin
            // Dequeue
            if (fifo_empty) begin
                // Cry
            end
            else if (fifo_full) begin
                fifo_full <= 1'b0;
                rd_ptr <= 2'd1;
            end
            else begin
                fifo_empty <= 1'b1;
                rd_ptr <= 2'd0;
            end
        end
        if (rst) begin
            fifo_full <= 1'b0;
            fifo_empty <= 1'b1;
            rd_ptr <= 2'd0;
        end
    end
    assign b_valid = !fifo_empty || a_valid;
    assign b_data = (rd_ptr == 2'd0) ? a_data :
            (rd_ptr == 2'd1) ? fifo_top : fifo_bottom;
    assign a_ready = !fifo_full;
    assign a_almost_full = !fifo_empty;

endmodule
