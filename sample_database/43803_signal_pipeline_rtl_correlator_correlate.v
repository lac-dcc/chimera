// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

`timescale 1ns / 100ps
module correlate #(
    // Bit-width of local adders
    parameter  integer WIDTH = 4,
    localparam integer MSB   = WIDTH - 1
) (
    input clock,
    input reset,

    // AX4-Stream like interface, with no backpressure
    input valid_i,
    input first_i,
    input last_i,
    input auto_i,  // todo: compute auto-correlations
    input ai_i,  // 4x data bits
    input aq_i,
    input bi_i,
    input bq_i,

    // AX4-Stream like interface, with no backpressure
    output frame_o,
    output valid_o,
    output [MSB:0] rdata_o,
    output [MSB:0] idata_o
);

  // -- State & Signals -- //

  reg valid, frame;
  reg [MSB:0] rdata, idata;


  // -- I/O Assignments -- //

  assign frame_o = frame;
  assign valid_o = valid;
  assign rdata_o = rdata;
  assign idata_o = idata;


  // -- Perform 1-bit correlation -- //

  wire [3:0] bits = {ai_i, aq_i, bi_i, bq_i};
  wire [1:0] re_w, im_w;

  // todo: auto-correlations
  wire re_inc = bits == 4'h0 || bits == 4'h5 || bits == 4'ha || bits == 4'hf;
  wire re_dec = bits == 4'h3 || bits == 4'h6 || bits == 4'h9 || bits == 4'hc;
  wire im_inc = bits == 4'h1 || bits == 4'h7 || bits == 4'h8 || bits == 4'he;
  wire im_dec = bits == 4'h2 || bits == 4'h4 || bits == 4'hb || bits == 4'hd;

  wire [1:0] xr_w = {re_inc, ~re_inc & ~re_dec};  // values in {0, 1, 2}
  wire [1:0] xi_w = {im_inc, ~im_inc & ~im_dec};

  // Signal means
  wire [1:0] aa_w = aq_i + ai_i;
  wire [1:0] ba_w = bq_i + bi_i;

  // 2-stage cross-correlation then accumulate.
  reg [1:0] xr_r, xi_r;
  reg vld_r, fst_r, lst_r;

  always @(posedge clock) begin
    if (reset) begin
      vld_r <= 1'b0;
      fst_r <= 1'b0;
      lst_r <= 1'b0;

      frame <= 1'b0;
      valid <= 1'b0;
    end else begin
      // Pipeline registers
      vld_r <= valid_i;
      fst_r <= first_i;
      lst_r <= last_i;

      if (valid_i) begin
        xr_r <= auto_i ? aa_w : xr_w;
        xi_r <= auto_i ? ba_w : xi_w;
      end

      if (vld_r) begin
        if (fst_r) begin
          rdata <= xr_r;
          idata <= xi_r;
        end else begin
          rdata <= rdata + xr_r;
          idata <= idata + xi_r;
        end

        valid <= lst_r;
      end else begin
        valid <= 1'b0;
      end

      if (!frame && vld_r && lst_r) begin
        frame <= 1'b1;
      end else if (frame && valid && !vld_r) begin
        frame <= 1'b0;
      end
    end
  end

endmodule  // correlate
