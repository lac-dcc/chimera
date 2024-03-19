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
module fifo_1d_64to22(
    input  wire         clk,
    input  wire         rst,
    // Incoming port
    input  wire         a_short,
    input  wire [63:0]  a_data,
    input  wire         a_valid,
    output wire         a_ready,
    // Outgoing port
    output wire [21:0]  b_data,
    output wire         b_valid,
    input  wire         b_ready
);
    // Transfer higher order byte to lower order
    reg [63:0] fifo;
    reg [1:0] fifo_level;
    wire fifo_almost_empty = (fifo_level == 1);
    wire fifo_empty = (fifo_level == 0);
    wire [1:0] full_level = a_short ? 2 : 3;

    always @(posedge clk) begin
        if (fifo_empty) begin
            // Output invalid, if with valid input, fill input
            if (a_valid) begin
                fifo <= a_data;
                fifo_level <= full_level;
            end
        end
        else if (fifo_almost_empty) begin
            // Almost empty, output valid, input ready only if output is ready
            if (b_ready && a_valid) begin
                fifo <= a_data;
                fifo_level <= full_level;
            end
            else if (b_ready) begin
                fifo_level <= 0;
            end
        end
        else begin
            // Output valid, input not ready, if with valid output, shift
            if (b_ready) begin
                fifo_level <= fifo_level - 1;
            end
        end

        if (rst) begin
            fifo_level <= 0;
        end
    end

    // RX data if fifo is empty
    assign a_ready = fifo_empty || (fifo_almost_empty && b_ready);
    assign b_valid = !fifo_empty;
    assign b_data =
            (fifo_level == 3) ? {2'b0, fifo[63:44]} :
            (fifo_level == 2) ? fifo[43:22] :
            (fifo_level == 1) ? fifo[21:0] : 22'bx;

endmodule
