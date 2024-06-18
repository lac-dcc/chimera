// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

`timescale 1ns / 100ps
/**
 * Selects the antenna (IQ) signals to be used at each time-step.
 *
 * Note: Two pipeline stages.
 */
module sigsource #(
    parameter integer WIDTH = 32,  // Number of antennas/signals
    localparam integer MSB = WIDTH - 1,
    // parameter integer SBITS = 5,
    localparam integer SBITS = $clog2(WIDTH),
    localparam integer SSB = SBITS - 1,

    parameter integer MUX_N = 7,  // Number of assigned A-/B- MUX inputs
    // parameter integer XBITS = 3,  // Input MUX source-select bit-width
    localparam integer XBITS = $clog2(MUX_N),  // Input MUX source-select bit-width
    localparam integer XSB = XBITS - 1,

    parameter integer TRATE = 30,  // Time-multiplexing rate
    // parameter integer TBITS = 5,  // Input MUX bits
    localparam integer TBITS = $clog2(TRATE),  // Input MUX bits
    localparam integer TSB = TBITS - 1,

    localparam integer PBITS = SBITS * MUX_N,  // Signal taps for A-/B- MUX inputs
    localparam integer PSB   = PBITS - 1,

    localparam integer QBITS = TRATE * XBITS,  // Time-interval to MUX-sel bits
    localparam integer QSB   = QBITS - 1,

    // todo: produce these values using the 'generator' utility
    parameter unsigned [PSB:0] ATAPS = {PBITS{1'bx}},
    parameter unsigned [PSB:0] BTAPS = {PBITS{1'bx}},

    parameter unsigned [QSB:0] ASELS = {QBITS{1'bx}},
    parameter unsigned [QSB:0] BSELS = {QBITS{1'bx}}
) (
    input clock,
    input reset,

    // Interleaved, AXI4-Stream like antenna IQ source-data inputs
    input valid_i,
    input first_i,
    input next_i,
    input last_i,
    input [TSB:0] taddr_i,
    input [MSB:0] idata_i,
    input [MSB:0] qdata_i,

    // Output IQ, A- & B- signals to the correlator
    output reg valid_o,
    output reg first_o,
    output reg next_o,
    output reg last_o,
    output reg ai_o,
    output reg aq_o,
    output reg bi_o,
    output reg bq_o
);


  /**
   * Map from 'taddr_i' to MUX 'sel' bits, for A- and B- MUXs.
   */
  localparam unsigned [XSB:0] XZERO = {XBITS{1'b0}};

  reg [XSB:0] a_sels[TRATE];  // 'taddr_i' to 'asel' ROM
  reg [XSB:0] b_sels[TRATE];  // 'taddr_i' to 'bsel' ROM
  reg [XSB:0] asel, bsel;

  genvar ii;
  generate
    for (ii = 0; ii < TRATE; ii = ii + 1) begin : gen_mux_sels

      initial begin
        a_sels[ii] = ASELS[ii*XBITS+XSB:ii*XBITS];
        b_sels[ii] = BSELS[ii*XBITS+XSB:ii*XBITS];
      end

    end  // gen_mux_sels
  endgenerate

  always @(posedge clock) begin
    if (reset) begin
      asel <= XZERO;
      bsel <= XZERO;
    end else begin
      asel <= a_sels[taddr_i];
      bsel <= b_sels[taddr_i];
    end
  end


  /**
   * Tap off the subset of used antenna signals, and for each MUX.
   */
  reg [MUX_N-1:0] ai_src, aq_src, bi_src, bq_src;

  generate
    for (ii = 0; ii < MUX_N; ii = ii + 1) begin : gen_sig_taps

      wire [SSB:0] a_taps = ATAPS[ii*SBITS+SSB:ii*SBITS];
      wire [SSB:0] b_taps = BTAPS[ii*SBITS+SSB:ii*SBITS];

      always @(posedge clock) begin
        ai_src[ii] <= idata_i[a_taps[SSB:0]];
        aq_src[ii] <= qdata_i[a_taps[SSB:0]];

        bi_src[ii] <= idata_i[b_taps[SSB:0]];
        bq_src[ii] <= qdata_i[b_taps[SSB:0]];
      end

    end  // gen_sig_taps
  endgenerate


  /**
   * A- & B- inputs MUXs that select the output antenna (IQ) signals.
   */
  reg valid, first, next, last;

  always @(posedge clock) begin
    if (reset) begin
      {valid_o, valid} <= 2'b00;
      {first_o, first} <= 2'b00;
      {next_o, next}   <= 2'b00;
      {last_o, last}   <= 2'b00;
    end else begin
      {valid_o, valid} <= {valid, valid_i};
      {first_o, first} <= {first, first_i};
      {next_o, next}   <= {next, next_i};
      {last_o, last}   <= {last, last_i};
    end

    ai_o <= ai_src[asel];
    aq_o <= aq_src[asel];

    bi_o <= bi_src[bsel];
    bq_o <= bq_src[bsel];
  end

endmodule  // sigsource
