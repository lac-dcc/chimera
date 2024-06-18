// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

`timescale 1ns / 100ps
module correlator_24x_radio (
    input sig_clock,  //     16.368 MHz
    input sig_reset,

    input vis_clock,  // 12x 16.368 MHz
    input vis_rst_n,

    input bus_clock,  //  3x 16.368 MHz
    input bus_reset,

    input capture_i,
    input correlate_i,

    input sig_tvalid_i,
    input [23:0] sig_itdata_i,
    input [23:0] sig_qtdata_i,

    output m_tvalid,
    input m_tready,
    output m_tlast,
    output [7:0] m_tdata
);

  localparam integer LOOP0 = 3;
  localparam integer LOOP1 = 5;


  /**
   * Input-buffering SRAM's for (antenna) signal IQ data.
   *
   * Every 'COUNT' input samples a full set of (partially-summed) visibility
   * contributions are computed, and forwarded to the final-stage accumulators.
   * The following buffer stores two (or more) banks of these 'COUNT' samples,
   * and streams them (with the correct ordering) to the correlators, switching
   * banks at the end of each block (of 'COUNT' samples).
   */
  wire buf_valid_w, buf_first_w, buf_next_w, buf_emit_w, buf_last_w;
  wire [3:0] buf_taddr_w;
  wire [23:0] buf_idata_w, buf_qdata_w;

  sigbuffer #(
      .WIDTH(24),
      .TRATE(12),
      .LOOP0(LOOP0),
      .LOOP1(LOOP1)
  ) SIGBUF0 (
      .sig_clk(sig_clock),
      .vis_clk(vis_clock),
      .reset_n(vis_rst_n),

      // Antenna/source signals
      .valid_i(sig_tvalid_i),
      .idata_i(sig_itdata_i),
      .qdata_i(sig_qtdata_i),

      // Delayed, up-rated, looped signals
      .valid_o(buf_valid_w),
      .first_o(buf_first_w),
      .next_o (buf_next_w),
      .emit_o (buf_emit_w),
      .last_o (buf_last_w),
      .taddr_o(buf_taddr_w),
      .idata_o(buf_idata_w),
      .qdata_o(buf_qdata_w)
  );

  genvar ii;
  generate
    begin : g_correlators

      for (ii = 0; ii < 24; ii = ii + 1) begin

        correlator #(
            .WIDTH(WIDTH),
            .ABITS(ABITS),
            .MUX_N(MUX_N),
            .TRATE(TRATE),
            .ATAPS(ATAPS),
            .BTAPS(BTAPS),
            .ASELS(ASELS),
            .BSELS(BSELS)
        ) correlator_inst (
            .clock  (vis_clock),
            .reset_n(vis_rst_n),

            .valid_i(buf_valid_w),
            .first_i(buf_first_w),
            .next_i (buf_next_w),
            .emit_i (buf_emit_w),
            .last_i (buf_last_w),
            .taddr_i(buf_taddr_w),
            .idata_i(buf_idata_w),
            .qdata_i(buf_qdata_w),

            .prevs_i(1'b0),
            .revis_i({ABITS{1'bx}}),
            .imvis_i({ABITS{1'bx}}),

            .frame_o(cor_frame),
            .valid_o(cor_valid),
            .revis_o(cor_revis),
            .imvis_o(cor_imvis)
        );


        wire vis_frame, vis_valid, vis_first, vis_last;
        wire [SSB:0] vis_rdata, vis_idata;

        visaccum #(
            .IBITS(ABITS),
            .OBITS(SBITS),
            .PSUMS(LOOP0),
            .COUNT(LOOP1)
        ) visaccum_inst (
            .clock  (vis_clock),
            .reset_n(vis_rst_n),

            .frame_i(cor_frame),
            .valid_i(cor_valid),
            .rdata_i(cor_revis),
            .idata_i(cor_imvis),

            .frame_o(vis_frame),
            .valid_o(vis_valid),
            .first_o(vis_first),
            .last_o (vis_last),
            .rdata_o(vis_rdata),
            .idata_o(vis_idata)
        );

      end

    end
  endgenerate


  /**
   *  Accumulates each of the partial-sums into the full-width visibilities.
   */

  localparam LSB = ACCUM - SBITS;

  wire [LSB:0] vis_limit = 3;

  wire [ACCUM-1:0] acc_revis, acc_imvis;
  wire acc_valid, acc_last;

  accumulator #(
      .CORES(LOOP0),
      .TRATE(TRATE),
      .WIDTH(ACCUM),
      .SBITS(SBITS)
  ) accumulator_inst (
      .clock  (vis_clock),
      .reset_n(vis_rst_n),

      .count_i(vis_limit),
      .frame_i(vis_frame),

      // Inputs
      .valid_i(vis_valid),
      .first_i(vis_first),
      .last_i (vis_last),
      .revis_i(vis_rdata),
      .imvis_i(vis_idata),

      // Outputs
      .valid_o(acc_valid),
      .last_o (acc_last),
      .revis_o(acc_revis),
      .imvis_o(acc_imvis)
  );


endmodule  // correlator_24x_radio
