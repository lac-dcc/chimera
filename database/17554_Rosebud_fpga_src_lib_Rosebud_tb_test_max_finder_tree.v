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

module test_max_finder_tree;

// Parameters
parameter DATA_WIDTH = 8;
parameter PORT_COUNT = 16;
parameter ADDR_WIDTH = $clog2(PORT_COUNT);

// Inputs
reg [PORT_COUNT*DATA_WIDTH-1:0] values;

// Outputs
wire [DATA_WIDTH-1:0] max_val;
wire [ADDR_WIDTH-1:0] max_ptr;

initial begin
    // myhdl integration
    $from_myhdl(values);
    $to_myhdl(max_val, max_ptr);

    // dump file
    $dumpfile("test_max_finder_tree.lxt");
    $dumpvars(0, test_max_finder_tree);
end

max_finder_tree # (
  .PORT_COUNT(PORT_COUNT),
  .DATA_WIDTH(DATA_WIDTH)
) UUT ( 
  .values (values),
  .max_val(max_val),
  .max_ptr(max_ptr)
);

endmodule

`resetall
