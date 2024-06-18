// This program was cloned from: https://github.com/hipersys-team/lightning
// License: MIT License

// Language: Verilog 2001

// Maxs elements of the input vector using an comparison tree
// Copies input_copy_tdata to output_copy_tdata with the same latency
// Nonblocking

`resetall
`timescale 1ns / 1ps
`default_nettype none

function [15:0] signed_max16 ([15:0] x, [15:0] y);
  signed_max16 = ($signed(x) >= $signed(y)) ? x : y;
endfunction

 (* KEEP_HIERARCHY = "YES" *) module parallel_max_and_copy # (
    parameter VECTOR_WIDTH = 160,
    parameter DATA_WIDTH = 16
)(
    input wire clk,
    input wire rst,

    input wire [VECTOR_WIDTH-1:0] input_tdata,
    input wire [VECTOR_WIDTH-1:0] input_copy_tdata,
    input wire input_tvalid,

    output reg [VECTOR_WIDTH-1:0] output_copy_tdata,
    output reg [DATA_WIDTH-1:0] output_max_tdata,
    output reg output_tvalid

);

   localparam  ELEMENTS_PER_VECTOR = VECTOR_WIDTH / DATA_WIDTH;

   reg [5 * DATA_WIDTH-1:0] accum0;
   reg [3 * DATA_WIDTH-1:0] accum1;
   reg [2 * DATA_WIDTH-1:0] accum2;
   
   reg [VECTOR_WIDTH-1:0]  copy0;
   reg [VECTOR_WIDTH-1:0]  copy1;
   reg [VECTOR_WIDTH-1:0]  copy2;
   
   reg tvalid0, tvalid1, tvalid2;
   

   genvar i;
   generate
      for (i = 0; i < 5; i = i + 1) begin
	 // sign extend to DATA_WIDTH
	 wire [DATA_WIDTH-1:0] lhs = input_tdata[DATA_WIDTH * i +: DATA_WIDTH];
	 wire [DATA_WIDTH-1:0] rhs = input_tdata[DATA_WIDTH * (i + 1) +: DATA_WIDTH];
	 always @ (posedge clk) begin
	    accum0[DATA_WIDTH * i +: DATA_WIDTH] <= signed_max16(lhs, rhs);
	 end
      end
   endgenerate
   genvar j;
   generate
      for (j = 0; j < 2; j = j + 1) begin
	 wire [DATA_WIDTH-1:0] lhs = accum0[DATA_WIDTH * 2 * j +: DATA_WIDTH];
	 wire [DATA_WIDTH-1:0] rhs = accum0[DATA_WIDTH * (2 * j + 1) +: DATA_WIDTH];
	 always @ (posedge clk) begin
	    accum1[DATA_WIDTH * j +: DATA_WIDTH] <= signed_max16(lhs, rhs);
	 end
      end
   endgenerate

   always @ (posedge clk) begin

      accum1[DATA_WIDTH * 2 +: DATA_WIDTH] <= accum0[DATA_WIDTH * 4 +: DATA_WIDTH];

      accum2[DATA_WIDTH * 0 +: DATA_WIDTH] <= signed_max16(accum1[DATA_WIDTH * 0 +: DATA_WIDTH], accum1[DATA_WIDTH * 1 +: DATA_WIDTH]);
      accum2[DATA_WIDTH * 1 +: DATA_WIDTH] <= accum1[DATA_WIDTH * 2 +: DATA_WIDTH];

      output_max_tdata <= accum2[DATA_WIDTH * 0 +: DATA_WIDTH] + accum2[DATA_WIDTH * 1 +: DATA_WIDTH];

      copy0 <= input_copy_tdata;
      copy1 <= copy0;
      copy2 <= copy1;
      output_copy_tdata <= copy2;

      tvalid0 <= input_tvalid;
      tvalid1 <= tvalid0;
      tvalid2 <= tvalid1;
      output_tvalid <= tvalid2;

   end

endmodule

`resetall

