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

module test_spaced_2lvl_penc # (
  parameter INPUT_WIDTH  = 8192,
  parameter PENC1_SIZE   = 32,
  parameter PENC2_SIZE   = 32,
  parameter BIN_COUNT    = 8,
  parameter LARGE_BLOCK  = BIN_COUNT*PENC1_SIZE*PENC2_SIZE,
  parameter OUTPUT_WIDTH = $clog2(LARGE_BLOCK)
) (
  input  wire clk,
  input  wire rst,

  input  wire [INPUT_WIDTH-1:0]            one_hot,

  output wire [OUTPUT_WIDTH-1:0]           index [BIN_COUNT],
  output wire [BIN_COUNT-1:0]              valid,
  output wire [BIN_COUNT-1:0]              error,
  output wire                              error_merged
);

  wire [BIN_COUNT*OUTPUT_WIDTH-1:0] index_n;

  spaced_2lvl_penc # (
    .INPUT_WIDTH (INPUT_WIDTH ),
    .PENC1_SIZE  (PENC1_SIZE  ),
    .PENC2_SIZE  (PENC2_SIZE  ),
    .BIN_COUNT   (BIN_COUNT   ),
    .LARGE_BLOCK (LARGE_BLOCK ),
    .OUTPUT_WIDTH(OUTPUT_WIDTH)
  ) dut (
    .clk(clk),
    .rst(rst),

    .one_hot(one_hot),

    .index(index_n),
    .valid(valid),
    .error(error)
  );

  assign error_merged = |error;

  genvar i;
  generate
    for (i=0; i<BIN_COUNT; i=i+1)
      assign index[i] = index_n[i*OUTPUT_WIDTH +: OUTPUT_WIDTH];
  endgenerate

  integer j; //,k;
  initial begin
    $dumpfile ("sim_results.fst");
    for (j=0; j<BIN_COUNT; j=j+1)
      $dumpvars (0,index[j]);
    // for (k=0; k<BIN_COUNT*PENC2_SIZE; k=k+1)
    //   $dumpvars (0,dut.lvl1_index[k]);
    #1;
  end

endmodule

`resetall
