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

module spaced_2lvl_penc # (
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

  output reg  [BIN_COUNT*OUTPUT_WIDTH-1:0] index,
  output reg  [BIN_COUNT-1:0]              valid,
  output reg  [BIN_COUNT-1:0]              error
);

  initial begin
    if (LARGE_BLOCK < INPUT_WIDTH) begin
      $error("Error: BIN_COUNT is not large enough.");
      $finish;
    end
  end

  localparam JUMP        = BIN_COUNT*PENC2_SIZE;
  localparam PENC1_WIDTH = $clog2(PENC1_SIZE);
  localparam PENC2_WIDTH = $clog2(PENC2_SIZE);
  localparam BIN_WIDTH   = $clog2(BIN_COUNT);

  wire [LARGE_BLOCK-1:0] adjusted_input = {{(LARGE_BLOCK-INPUT_WIDTH){1'b0}}, one_hot};

  // Stage 1
  reg [PENC1_WIDTH-1:0] lvl1_index [0:JUMP-1];
  reg [JUMP-1:0]        lvl1_valid;
  reg [JUMP-1:0]        lvl1_error;

  genvar i,j;
  generate
    for (i=0; i<JUMP; i=i+1) begin: lvl1

      wire [PENC1_SIZE-1:0]  penc1_input;

      for (j=0; j<PENC1_SIZE; j=j+1) begin: lvl1_reorder
        assign penc1_input[j] = adjusted_input[j*JUMP+i];
      end

      reg [PENC1_WIDTH-1:0] penc1_output;
      reg [PENC1_WIDTH-1:0] ones1;

      integer k;

      always @ (*) begin: lvl1_penc
        penc1_output = {PENC1_WIDTH{1'b0}};
        ones1        = {PENC1_WIDTH{1'b0}};
        for (k=PENC1_SIZE-1;k>=0;k=k-1)
          if (penc1_input[k]) begin
            penc1_output = k;
            ones1 = ones1 + 1;
          end
      end

      always @ (posedge clk) begin: lvl1_reg
        lvl1_index[i] <= penc1_output;
        if (rst) begin
          lvl1_valid[i] <= 1'b0;
          lvl1_error[i] <= 1'b0;
        end else begin
          lvl1_valid[i] <= |penc1_input;
          lvl1_error[i] <= (ones1>1);
        end
      end

    end  // lvl1 for loop
  endgenerate

  // Stage 2
  reg [PENC2_WIDTH-1:0] second_index [0:BIN_COUNT-1];
  reg [BIN_COUNT-1:0]   second_valid;

  genvar p,q;
  generate
    for (p=0; p<BIN_COUNT; p=p+1) begin: lvl2

      wire [PENC2_SIZE-1:0]  penc2_input;

      for (q=0; q<PENC2_SIZE; q=q+1) begin: lvl2_reorder
        assign penc2_input[q] = lvl1_valid[q*BIN_COUNT+p];
      end

      reg [PENC2_WIDTH-1:0] penc2_output;
      reg [PENC2_WIDTH-1:0] ones2;

      reg [PENC1_WIDTH-1:0] lvl1_selected_index;
      reg                   lvl1_selected_error;

      integer r;

      always @ (*) begin: lvl2_penc
        penc2_output = {PENC2_WIDTH{1'b0}};
        ones2        = {PENC2_WIDTH{1'b0}};
        lvl1_selected_index = lvl1_index[p];
        lvl1_selected_error = lvl1_error[p];
        for (r=PENC2_SIZE-1;r>=0;r=r-1)
          if (penc2_input[r]) begin
            penc2_output = r;
            ones2 = ones2 + 1;
            lvl1_selected_index = lvl1_index[r*BIN_COUNT+p];
            lvl1_selected_error = lvl1_error[r*BIN_COUNT+p];
          end
      end

      always @ (posedge clk) begin: lvl1_reg
        index[p*OUTPUT_WIDTH                       +: BIN_WIDTH]   <= p;
        index[p*OUTPUT_WIDTH+BIN_WIDTH             +: PENC2_WIDTH] <= penc2_output;
        index[p*OUTPUT_WIDTH+BIN_WIDTH+PENC2_WIDTH +: PENC1_WIDTH] <= lvl1_selected_index;
        if (rst) begin
          valid[p] <= 1'b0;
          error[p] <= 1'b0;
        end else begin
          valid[p] <= |penc2_input;
          error[p] <= (ones2>1) | lvl1_selected_error;
        end
      end

    end  // lvl2 for loop
  endgenerate

endmodule

`resetall
