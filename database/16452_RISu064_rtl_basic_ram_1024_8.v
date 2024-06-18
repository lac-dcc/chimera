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
module ram_1024_8(
    input wire clk,
    input wire rst,
    // Read write port
    input wire [9:0] addr0,
    input wire re0,
    output wire [7:0] rd0,
    input wire [7:0] wr0,
    input wire we0,
    // Read only port
    input wire [9:0] addr1,
    input wire re1,
    output wire [7:0] rd1
);

`ifdef SKY130
    sky130_sram_1kbyte_1rw1r_8x1024_8 mem(
        .clk0(clk),
        .csb0(!(re0 || we0)),
        .web0(!we0),
        .wmask0(1'b1),
        .addr0(addr0),
        .din0(wr0),
        .dout0(rd0),
        .clk1(clk),
        .csb1(!re1),
        .addr1(addr1),
        .dout1(rd1)
    );
`else
    reg [7:0] mem [0:1023];
    reg [7:0] rd0_reg;
    reg [7:0] rd1_reg;

    always @(posedge clk) begin
        if (!rst) begin
            if (re0) begin
                rd0_reg <= mem[addr0];
            end
            else if (we0) begin
                mem[addr0] <= wr0;
            end
            
            if (re1) begin
                rd1_reg <= mem[addr1];
            end
        end
    end

    assign rd0 = rd0_reg;
    assign rd1 = rd1_reg;
`endif

endmodule
