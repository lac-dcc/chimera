// This program was cloned from: https://github.com/alexforencich/verilog-cam
// License: MIT License

/*

Copyright (c) 2015-2016 Alex Forencich

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

`timescale 1ns / 1ps

/*
 * Testbench for cam_srl
 */
module test_cam_srl;

// Parameters
parameter DATA_WIDTH = 64;
parameter ADDR_WIDTH = 5;
parameter SLICE_WIDTH = 4;

// Inputs
reg clk = 0;
reg rst = 0;
reg [7:0] current_test = 0;

reg [ADDR_WIDTH-1:0] write_addr = 0;
reg [DATA_WIDTH-1:0] write_data = 0;
reg write_delete = 0;
reg write_enable = 0;
reg [DATA_WIDTH-1:0] compare_data = 0;

// Outputs
wire write_busy;
wire [2**ADDR_WIDTH-1:0] match_many;
wire [2**ADDR_WIDTH-1:0] match_single;
wire [ADDR_WIDTH-1:0] match_addr;
wire match;

initial begin
    // myhdl integration
    $from_myhdl(
        clk,
        rst,
        current_test,
        write_addr,
        write_data,
        write_delete,
        write_enable,
        compare_data
    );
    $to_myhdl(
        write_busy,
        match_many,
        match_single,
        match_addr,
        match
    );

    // dump file
    $dumpfile("test_cam_srl.lxt");
    $dumpvars(0, test_cam_srl);
end

cam_srl #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .SLICE_WIDTH(SLICE_WIDTH)
)
UUT (
    .clk(clk),
    .rst(rst),
    .write_addr(write_addr),
    .write_data(write_data),
    .write_delete(write_delete),
    .write_enable(write_enable),
    .write_busy(write_busy),
    .compare_data(compare_data),
    .match_many(match_many),
    .match_single(match_single),
    .match_addr(match_addr),
    .match(match)
);

endmodule
