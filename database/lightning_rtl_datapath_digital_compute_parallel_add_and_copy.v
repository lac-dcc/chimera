// Language: Verilog 2001

// Adds elements of the input vector using an adder tree
// Copies input_copy_tdata to output_copy_tdata with the same latency
// Nonblocking

`resetall
`timescale 1ns / 1ps
`default_nettype none


 (* KEEP_HIERARCHY = "YES" *) module parallel_add_and_copy # (
    parameter VECTOR_WIDTH = 160,
    parameter DATA_WIDTH = 16,
    parameter ACCUMSIZE = 32
)(
    input wire clk,
    input wire rst,

    input wire [VECTOR_WIDTH-1:0] input_tdata,
    input wire [VECTOR_WIDTH-1:0] input_copy_tdata,
    input wire input_tvalid,

    output reg [VECTOR_WIDTH-1:0] output_copy_tdata,
    output reg [ACCUMSIZE-1:0] output_sum_tdata,
    output reg output_tvalid 

);

   localparam  ELEMENTS_PER_VECTOR = VECTOR_WIDTH / DATA_WIDTH;

   reg [5 * ACCUMSIZE-1:0] accum0;
   reg [3 * ACCUMSIZE-1:0] accum1;
   reg [2 * ACCUMSIZE-1:0] accum2;

   reg [VECTOR_WIDTH-1:0]  copy0;
   reg [VECTOR_WIDTH-1:0]  copy1;
   reg [VECTOR_WIDTH-1:0]  copy2;

   reg tvalid0, tvalid1, tvalid2;


   genvar i;
   generate
      for (i = 0; i < 5; i = i + 1) begin
         // zero extend to ACCUMSIZE
         wire [DATA_WIDTH-1:0] input_lhs = input_tdata[DATA_WIDTH * 2 * i +: DATA_WIDTH];
         wire [DATA_WIDTH-1:0] input_rhs = input_tdata[DATA_WIDTH * (2 * i + 1) +: DATA_WIDTH];
         wire [ACCUMSIZE-1:0]  lhs = {{ACCUMSIZE-DATA_WIDTH{1'b0}}, input_lhs[DATA_WIDTH-1:0]};
         wire [ACCUMSIZE-1:0]  rhs = {{ACCUMSIZE-DATA_WIDTH{1'b0}}, input_rhs[DATA_WIDTH-1:0]};
         always @ (posedge clk) begin
            accum0[ACCUMSIZE * i +: ACCUMSIZE] <= lhs + rhs;
         end
      end
   endgenerate
   genvar j;
   generate
      for (j = 0; j < 2; j = j + 1) begin
         always @ (posedge clk) begin
            accum1[ACCUMSIZE * j +: ACCUMSIZE] <= accum0[ACCUMSIZE * 2 * j +: ACCUMSIZE] + accum0[ACCUMSIZE * (2 * j + 1) +: ACCUMSIZE];
         end
      end
   endgenerate

   always @ (posedge clk) begin

      accum1[ACCUMSIZE * 2 +: ACCUMSIZE] <= accum0[ACCUMSIZE * 4 +: ACCUMSIZE];

      accum2[ACCUMSIZE * 0 +: ACCUMSIZE] <= accum1[ACCUMSIZE * 0 +: ACCUMSIZE] + accum1[ACCUMSIZE * 1 +: ACCUMSIZE];
      accum2[ACCUMSIZE * 1 +: ACCUMSIZE] <= accum1[ACCUMSIZE * 2 +: ACCUMSIZE];

      output_sum_tdata <= accum2[ACCUMSIZE * 0 +: ACCUMSIZE] + accum2[ACCUMSIZE * 1 +: ACCUMSIZE];

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

