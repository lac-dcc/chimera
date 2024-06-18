// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

/*

Copyright (c) 2019-2021 Moein Khazraee

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none

module hash_acc #(
    parameter HASH_WIDTH = 36
)
(
    input  wire                         clk,
    input  wire                         rst,

    input  wire [31:0]                  hash_data,
    input  wire [1:0]                   hash_data_len,
    input  wire                         hash_data_valid,
    input  wire                         hash_clear,

    input  wire [(HASH_WIDTH+4)*8-1:0]  hash_key,

    output wire [31:0]                  hash_out
);

parameter OFFSET_WIDTH = $clog2(HASH_WIDTH);

reg [HASH_WIDTH*8-1:0] hash_data_reg = 0;
reg [OFFSET_WIDTH-1:0] offset_reg = 0;
// reg [31:0] hash_reg;

function [31:0] hash_toep(input [HASH_WIDTH*8-1:0] data, input [5:0] len, input [(HASH_WIDTH+4)*8-1:0] key);
    integer i, j;
    begin
        hash_toep = 0;
        for (i = 0; i < len; i = i + 1) begin
            for (j = 0; j < 8; j = j + 1) begin
                if (data[i*8 + (7-j)]) begin
                    hash_toep = hash_toep ^ key[(HASH_WIDTH+4)*8 - 32 - i*8 - j +: 32];
                end
            end
        end
    end
endfunction

wire [31:0] hash = hash_toep(hash_data_reg, HASH_WIDTH, hash_key);

assign hash_out = hash; // _reg;

always @(posedge clk) begin
    if (hash_data_valid) begin
        if (hash_data_len == 1) begin
            hash_data_reg[offset_reg*8 +: 8] <= hash_data[7:0];
            offset_reg <= offset_reg + 1;
        end else if (hash_data_len == 2) begin
            hash_data_reg[offset_reg*8 +: 16] <= hash_data[15:0];
            offset_reg <= offset_reg + 2;
        end else begin
            hash_data_reg[offset_reg*8 +: 32] <= hash_data;
            offset_reg <= offset_reg + 4;
        end
    end

    // hash_reg <= hash;

    if (rst || hash_clear) begin
        hash_data_reg <= 0;
        offset_reg <= 0;
    end
end

endmodule

`resetall
