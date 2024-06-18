// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

//
// Read-Modify-Write pipelined accumulator, for the partial-sums from each of
// the first-stage correlators.
//
`timescale 1ns / 100ps
module accumulator #(
    parameter  integer CORES = 18,
    localparam integer NBITS = $clog2(CORES),

    parameter  integer TRATE = 30,
    localparam integer TBITS = $clog2(TRATE), // Input MUX bits

    parameter integer WIDTH = 36,  // Accumulator bit-width
    parameter integer SBITS = 7,   // Partial-sums bit-width

    localparam integer MSB = WIDTH - 1,
    localparam integer SSB = SBITS - 1,

    localparam integer PAIRS = CORES * TRATE,
    localparam integer PBITS = NBITS + TBITS,
    localparam integer PSB   = PBITS - 1,

    localparam integer CBITS = WIDTH - SBITS + 1,
    localparam integer CSB   = CBITS - 1
) (
    input clock,
    input reset,

    input [CSB:0] count_i,
    input frame_i,

    input valid_i,
    input first_i,
    input last_i,
    input [SSB:0] revis_i,
    input [SSB:0] imvis_i,

    output [MSB:0] revis_o,
    output [MSB:0] imvis_o,
    output valid_o,
    output last_o
);

  localparam [MSB:0] VZERO = {WIDTH{1'b0}};
  localparam [PSB:0] CZERO = {CBITS{1'b0}};

  reg [CSB:0] count = CZERO;
  reg czero;


  /**
   *  SRAMs that store the partially-accumulated visibilities.
   */
  reg [MSB:0]    rsram [PAIRS];
  reg [MSB:0]    isram [PAIRS];


  // -- Read cycle -- //

  localparam [PSB:0] PZERO = {PBITS{1'b0}};

  reg  [PSB:0] raddr = PZERO;
  wire [PSB:0] rnext = raddr + 1;

  reg [MSB:0] r_dat, i_dat;
  reg [SSB:0] r_src, i_src;
  reg accum = 1'b0;

  // todo:
  always @(posedge clock) begin
    if (reset) begin
      raddr <= PZERO;
      accum <= 1'b0;
      czero <= 1'b1;
    end else begin

      if (valid_i) begin
        if (rnext == PAIRS) begin
          raddr <= PZERO;
        end else begin
          raddr <= rnext;
        end
      end

      accum <= valid_i;  // Enable for accumulator stage
      czero = count == CZERO;  // Source-select for next stage

      r_src <= revis_i;
      i_src <= imvis_i;

      r_dat <= rsram[raddr];
      i_dat <= isram[raddr];
    end
  end


  /**
   *  Accumulate the partial-sums into full-width visibilities.
   */
  reg [MSB:0] r_acc, i_acc;
  reg write = 1'b0;

  wire [MSB:0] r_vis, i_vis;

  assign r_vis = czero ? VZERO : r_dat;
  assign i_vis = czero ? VZERO : i_dat;

  always @(posedge clock) begin
    if (reset) begin
      write <= 1'b0;
    end else if (accum) begin
      write <= 1'b1;
      r_acc <= r_vis + r_src;
      i_acc <= i_vis + i_src;
    end else begin
      write <= 1'b0;
    end
  end


  /**
   *  Write back the partial-sums into the SRAMs.
   */
  reg  [PSB:0] waddr = PZERO;
  wire [PSB:0] wnext = waddr + 1;
  reg          wlast = 1'b0;

  always @(posedge clock) begin
    if (reset) begin
      waddr <= PZERO;
      wlast <= 1'b0;
    end else begin
      if (write) begin
        if (wnext == PAIRS) begin
          waddr <= PZERO;
        end else begin
          waddr <= wnext;
        end

        rsram[waddr] <= r_acc;
        isram[waddr] <= i_acc;
      end

      if (accum && wnext == PAIRS - 1) begin
        wlast <= 1'b1;
      end else begin
        wlast <= 1'b0;
      end
    end
  end


  /**
   *  "AXI4-Stream"-like output.
   *
   *  Note: does not support bus-idle cycles.
   */
  reg [MSB:0] revis, imvis;
  reg valid = 1'b0;
  reg rlast = 1'b0;

  wire [CSB:0] cnext = count + 1;
  wire cwrap = cnext == count_i;

  assign revis_o = revis;
  assign imvis_o = imvis;
  assign valid_o = valid;
  assign last_o  = rlast;

  always @(posedge clock) begin
    if (reset) begin
      count <= CZERO;
      valid <= 1'b0;
      rlast <= 1'b0;  // todo: logic for this signal
    end else begin

      if (wlast) begin
        if (cwrap) begin
          rlast <= 1'b1;
          count <= CZERO;
        end else begin
          rlast <= 1'b0;
          count <= cnext;
        end
      end else begin
        rlast <= 1'b0;
      end

      if (cwrap) begin  // todo: see 'sigsource' for better logic
        valid <= write;
        revis <= r_acc;
        imvis <= i_acc;
      end else begin
        valid <= 1'b0;
      end

    end
  end


endmodule  // accumulator
