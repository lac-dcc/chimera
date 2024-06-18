// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

`timescale 1ns / 100ps
/**
 *
 * Todo:
 *  - currently incomplete, and just a "sketch" -- still relevant ??
 *
 */
module visfinal #(
  // Input and output bit-widths
  parameter integer IBITS = 7,
  localparam integer ISB = IBITS - 1,

  parameter integer OBITS = 36,
  localparam integer OSB = OBITS - 1,

  // Total number of visibility components, and the number of required address
  // bits
  parameter integer NSUMS = 1024,
  localparam integer ABITS = $clog2(NSUMS),
  localparam integer ASB = ABITS - 1
) (
  input clock,
  input reset,

  // "Interleaved" AX4-Stream like interface, but with no backpressure
  input valid_i,
  input first_i,
  input last_i,
  input [ISB:0] data_i,

  // AX4-Stream like interface, but with no backpressure
  output valid_o,
  output first_o,
  output last_o,
  output [OSB:0] data_o
);

  //
  // todo: doesn't belong here? the 'last_i' signals should be used, so that the
  //   correlator-control module determines the number of partial-visibilities to
  //   accumulate?
  //
  // // Number of partial-sums to accumulate, per visibility component
  // parameter integer COUNT = 200_000;
  // parameter integer CBITS = 29;
  // localparam integer CSB = CBITS - 1;


  // -- Read-Modify-Write Unit -- //

  reg accum, alast;
  reg write, wlast;
  reg [ISB:0] adata;

  reg [OSB:0] vsums [NSUMS];
  reg [OSB:0] rdata, wdata;

  reg [ASB:0] raddr, aaddr, waddr;
  wire [ASB:0] rnext = raddr + 1;

  always @(posedge clock) begin
    if (reset) begin
      raddr <= {ABITS{1'b0}};
      waddr <= {ABITS{1'b0}};

      accum <= 1'b0;
      alast <= 1'b0;

      write <= 1'b0;
      wlast <= 1'b0;
    end else begin
      // Pipeline registers for the (SRAM-) read stage
      accum <= valid_i;
      alast <= last_i;
      adata <= data_i;
      aaddr <= raddr;

      if (valid_i && rnext == NSUMS) begin  // todo:
        raddr <= {ABITS{1'b0}};
      end else begin
        raddr <= rnext;
      end

      if (first_i) begin
        rdata <= {OBITS{1'b0}};
      end else begin
        rdata <= vsums[raddr];
      end

      // Pipeline registers for the accumulate stage
      write <= accum;
      wlast <= alast;
      waddr <= aaddr;
      wdata <= rdata + adata;

      // Write-back stage
      if (write) begin
        vsums[waddr] <= wdata;
      end
    end
  end


  // -- Generate output data stream -- //

  reg valid, first, olast;
  reg  [OSB:0] odata;
  reg  [ASB:0] count;
  wire [ASB:0] cnext = count + 1;

  assign valid_o = valid;
  assign first_o = first;
  assign last_o  = olast;
  assign data_o  = odata;

  always @(posedge clock) begin
    if (reset) begin
      valid <= 1'b0;
      first <= 1'b0;
      olast <= 1'b0;
      count <= {ABITS{1'b0}};
    end else begin
      // Output each of the last visibility-sums (from each correlator)
      valid <= wlast;
      first <= !valid && wlast;
      olast <= !alast && wlast;

      if (wlast) begin
        odata <= wdata;
      end else begin
        odata <= {OBITS{1'bx}};
      end

    end
  end

endmodule  // visfinal
