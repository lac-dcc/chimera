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
module fifo_1d_32to64(
    input  wire         clk,
    input  wire         rst,
    // Incoming port
    input  wire [31:0]  a_data,
    input  wire         a_valid,
    output wire         a_ready,
    // Outgoing port
    output wire [63:0]  b_data,
    output wire         b_valid,
    input  wire         b_ready
);

    reg [63:0] fifo;
    reg fifo_full;
    reg fifo_empty;
    always @(posedge clk) begin
        if (fifo_empty) begin
            // Output invalid, if with valid input, fill input
            if (a_valid) begin
                fifo <= {a_data, 32'b0};
                fifo_empty <= 1'b0;
                fifo_full <= 1'b0;
            end
        end
        else if (fifo_full) begin
            // Output valid, input not ready, if with valid output, shift
            if (b_ready && a_valid) begin
                fifo <= {a_data, 32'b0};
                fifo_empty <= 1'b0;
                fifo_full <= 1'b0;
            end
            else if (b_ready) begin
                fifo_full <= 1'b0;
                fifo_empty <= 1'b1;
            end
        end
        else begin
            // Half empty, output not valid, input ready
            if (a_valid) begin
                fifo <= {fifo[63:32], a_data};
                fifo_full <= 1'b1;
                fifo_empty <= 1'b0;
            end
        end

        if (rst) begin
            fifo_full <= 1'b0;
            fifo_empty <= 1'b1;
        end
    end

    // RX data if fifo is empty
    assign a_ready = !fifo_full || (fifo_full && b_ready);
    assign b_valid = fifo_full;
    assign b_data = fifo;

endmodule
