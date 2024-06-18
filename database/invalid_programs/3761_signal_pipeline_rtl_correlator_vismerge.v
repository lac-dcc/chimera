// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

`timescale 1ns / 100ps
/**
 * Chain of values, with source-select 2:1 MUX, for loading data into the chain
 * from the attached functional units.
 *
 * Note:
 *  - the source units must not over-saturate the chain;
 *  - resource usage is $2*WIDTH+2$ LEs (LUT4 + DFF);
 *
 * Todo:
 *  - currently non-functioning, and just a "sketch" -- still relevant ??
 *
 */
module vismerge #(
  parameter integer WIDTH = 7,
  localparam integer MSB = WIDTH - 1
) (
  input clock,
  input reset,

  // Loads new data from attached visibilities unit
  input load_i,
  input [MSB:0] re_i,
  input [MSB:0] im_i,

  // From preceding registers in the chain
  input valid_i,
  input [MSB:0] data_i,

  // To the following registers in the chain
  output valid_o,
  output [MSB:0] data_o
);

  // -- 2:1 interleaving for (partial sums of) real & imaginary visibilities -- //

  assign valid_o = vld0;
  assign data_o  = dat0;

  always @(posedge clock) begin
    if (reset) begin
      {vld0, vld1} <= 2'b00;
      {dat0, dat1} <= {2 * WIDTH{1'bx}};
    end else begin
      if (load_i) begin
        {vld0, vld1} <= 2'b11;
        {dat0, dat1} <= {re_i, im_i};
      end else begin
        {vld0, vld1} <= {vld1, valid_i};
        {dat0, dat1} <= {dat1, data_i};
      end
    end
  end

endmodule  // vismerge
