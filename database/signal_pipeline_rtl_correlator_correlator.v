// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

// TODO:
//  - figure out how to parameterise the input MUXs
//  - 'sigsource.v' for input MUXs
//  - 'viscalc.v' for first-stage correlation
`timescale 1ns / 100ps
module correlator #(
    parameter integer WIDTH = 32,  // Number of antennas/signals
    localparam integer SBITS = $clog2(WIDTH),
    localparam integer MSB = WIDTH - 1,

    parameter integer ABITS = 4,  // Adder bit-width
    localparam integer ASB = ABITS - 1,

    parameter integer MUX_N = 7,  // A- & B- MUX widths
    localparam integer XBITS = $clog2(MUX_N),  // Input MUX bits
    localparam integer XSB = XBITS - 1,

    parameter integer TRATE = 30,  // Time-multiplexing rate
    localparam integer TBITS = $clog2(TRATE),  // Time-slice counter bits
    localparam integer TSB = TBITS - 1,

    localparam integer PBITS = SBITS * MUX_N,  // Signal taps for A-/B- MUX inputs
    localparam integer PSB   = PBITS - 1,

    localparam integer QBITS = TRATE * XBITS,  // Time-interval to MUX-sel bits
    localparam integer QSB   = QBITS - 1,

    // todo: produce these values using the 'generator' utility
    parameter unsigned [PSB:0] ATAPS = {PBITS{1'bx}},
    parameter unsigned [PSB:0] BTAPS = {PBITS{1'bx}},

    parameter unsigned [QSB:0] ASELS = {QBITS{1'bx}},
    parameter unsigned [QSB:0] BSELS = {QBITS{1'bx}},

    parameter unsigned [TSB:0] AUTOS = {TBITS{1'bx}}
) (
    input clock,
    input reset,

    input valid_i,
    input first_i,
    input next_i,
    input emit_i,
    input last_i,
    input [TSB:0] taddr_i,
    input [MSB:0] idata_i,
    input [MSB:0] qdata_i,

    input prevs_i,
    input [ASB:0] revis_i,  // Inputs of each stage are outputs of the previous
    input [ASB:0] imvis_i,

    output [ASB:0] revis_o,
    output [ASB:0] imvis_o,
    output frame_o,
    output valid_o
);


  // -- Pipelined control-signals -- //
  /*
  reg last, next, valid;

  always @(posedge clock) begin
    if (reset) begin
      valid <= 1'b0;
      last  <= 1'b0;
      next  <= 1'b0;
    end else begin
      valid <= valid_i;

      if (valid) begin
        last <= next_i;
        next <= last;
      end else begin
        last <= 1'b0;
        next <= 1'b0;
      end
    end
  end
*/

  reg [TSB:0] autos;

  always @(posedge clock) begin
    if (reset) begin
      autos <= AUTOS;
    end else begin
      autos <= {1'bx, autos[TSB:1]};
    end
  end


  // -- Antenna signal source-select -- //

  wire mux_valid, mux_first, mux_next, mux_last;
  wire mux_ai, mux_aq, mux_bi, mux_bq;

  sigsource #(
      .WIDTH(WIDTH),
      .MUX_N(MUX_N),
      .TRATE(TRATE),
      .ATAPS(ATAPS),
      .BTAPS(BTAPS),
      .ASELS(ASELS),
      .BSELS(BSELS)
  ) SIGSRC0 (
      .clock(clock),
      .reset(reset),

      .valid_i(valid_i),
      .first_i(first_i),
      .next_i(next_i),
      .last_i(emit_i),
      .taddr_i(taddr_i),
      .idata_i(idata_i),
      .qdata_i(qdata_i),

      .valid_o(mux_valid),
      .first_o(mux_first),
      .next_o(mux_next),
      .last_o(mux_last),
      .ai_o(mux_ai),
      .aq_o(mux_aq),
      .bi_o(mux_bi),
      .bq_o(mux_bq)
  );


  // -- Cross-correlator -- //

  wire auto = 1'b0;  // todo: ...
  wire cor_frame, cor_valid;
  wire [ASB:0] cor_revis, cor_imvis;

  correlate #(
      .WIDTH(ABITS)
  ) CORRELATE0 (
      .clock(clock),
      .reset(reset),
      // Inputs
      .valid_i(mux_valid),
      .first_i(mux_next),
      .last_i(mux_last),
      .auto_i(auto),
      .ai_i(mux_ai),
      .aq_i(mux_aq),
      .bi_i(mux_bi),
      .bq_i(mux_bq),
      // Outputs
      .frame_o(cor_frame),
      .valid_o(cor_valid),
      .rdata_o(cor_revis),
      .idata_o(cor_imvis)
  );


  // -- Output select & pipeline -- //

  reg succs, frame;
  reg [ASB:0] revis, imvis;

  assign frame_o = frame;
  assign valid_o = succs;
  assign revis_o = revis;
  assign imvis_o = imvis;

  always @(posedge clock) begin
    if (reset) begin
      frame <= 1'b0;
      succs <= 1'b0;
      revis <= {ABITS{1'bx}};
      imvis <= {ABITS{1'bx}};
    end else begin
      succs <= cor_valid | prevs_i;
      frame <= cor_frame;

      if (cor_valid) begin
        revis <= cor_revis;
        imvis <= cor_imvis;
      end else begin
        revis <= revis_i;
        imvis <= imvis_i;
      end
    end
  end


endmodule  // correlator
