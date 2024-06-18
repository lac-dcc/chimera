// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

`timescale 1ns / 100ps
module toy_correlator #(
    parameter integer USE_ALEX_AFIFO = 1,

    parameter integer WIDTH = 4,  // Number of antennas/signals
    localparam WBITS = $clog2(WIDTH),
    localparam MSB = WIDTH - 1,

    // Source-signal multiplexor parameters
    parameter  integer MUX_N = 3,
    localparam integer XBITS = $clog2(MUX_N),
    localparam integer XSB   = XBITS - 1,

    parameter integer CORES = 1,  // Number of correlator cores
    localparam integer UBITS = $clog2(CORES),  // Log2(#cores)
    localparam integer USB = UBITS - 1,

    // Time-multiplexing rate, i.e., clock multiplier
    parameter  integer TRATE = 8,
    localparam integer TBITS = $clog2(TRATE),  // ceil(Log2(TRATE))
    localparam integer TSB   = TBITS - 1,

    // Every 'COUNT' samples, compute partial-visibilities to accumumlate
    parameter  integer LOOP0 = 3,
    localparam integer LBITS = $clog2(LOOP0),
    parameter  integer LOOP1 = 5,
    localparam integer HBITS = $clog2(LOOP1),
    localparam integer COUNT = LOOP0 * LOOP1,  // Number of terms in partial sums
    localparam integer CBITS = $clog2(COUNT),  // Bit-width of loop-counter
    localparam integer CSB   = CBITS - 1,

    parameter integer ACCUM = 32,  // Bit-width of accumulators
    localparam integer VSB = ACCUM - 1,

    parameter integer ABITS = 4,  // Bit-width of partial-sums
    localparam integer ASB = ABITS - 1,

    parameter integer SBITS = 7,  // Bit-width of partial-sums
    localparam integer SSB = SBITS - 1,

    // Buffer SRAM parameters
    localparam integer BBITS = 1,  // Number of bits for the bank-number
    localparam integer WORDS = 1 << (BBITS + CBITS),  // Buffer SRAM size
    localparam integer BANKS = BBITS << 1,
    localparam integer BSB = BBITS - 1
) (
    input sig_clock,  // 8.168 MHz sample-clock
    input areset_n,

    input bus_clock,  // SPI/USB clock for reading visibilities
    input bus_rst_n,

    input vis_clock,  // Correlator clock
    input vis_reset,

    // Status signals
    output vis_start_o,
    output vis_frame_o,

    // AXI4 Stream of antenna data
    input sig_valid_i,
    input sig_last_i,
    input [MSB:0] sig_idata_i,
    input [MSB:0] sig_qdata_i,

    // AXI4 Stream of visibilities data
    output [VSB:0] bus_revis_o,
    output [VSB:0] bus_imvis_o,
    output bus_valid_o,
    input bus_ready_i,
    output bus_last_o
);

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
  wire [TSB:0] buf_taddr_w;
  wire [MSB:0] buf_idata_w, buf_qdata_w;

  sigbuffer #(
      .WIDTH(WIDTH),
      .TRATE(TRATE),
      .LOOP0(LOOP0),
      .LOOP1(LOOP1)
  ) SIGBUF0 (
      // Antenna/source signals
      .sig_clk(sig_clock),
      .reset_n(areset_n),
      .valid_i(sig_valid_i),
      .idata_i(sig_idata_i),
      .qdata_i(sig_qdata_i),

      // Delayed, up-rated, looped signals
      .vis_clk(vis_clock),
      .vis_rst(vis_reset),
      .valid_o(buf_valid_w),
      .first_o(buf_first_w),
      .next_o (buf_next_w),
      .emit_o (buf_emit_w),
      .last_o (buf_last_w),
      .taddr_o(buf_taddr_w),
      .idata_o(buf_idata_w),
      .qdata_o(buf_qdata_w)
  );


  // -- Correlator status signals -- //

  reg start, frame;

  assign vis_start_o = start;
  assign vis_frame_o = frame;

  always @(posedge vis_clock) begin
    if (vis_reset) begin
      start <= 1'b0;
      frame <= 1'b0;
    end else begin

      if (!frame && buf_valid_w && buf_first_w) begin
        start <= 1'b1;
        frame <= 1'b1;
      end else begin
        start <= 1'b0;
      end

    end
  end


  /**
   *  Correlator array, with daisy-chained outputs.
   */
  wire cor_frame, cor_valid;
  wire [ASB:0] cor_revis, cor_imvis;

  // -- Antenna signal source-select -- //

  // Note: reverse-ordering
  localparam [5:0] ATAPS = {2'b10, 2'b01, 2'b00}; // 2, 1, 0
  localparam [5:0] BTAPS = {2'b11, 2'b10, 2'b01}; // 3, 2, 1

  localparam [7:0] AUTOS = 8'b1100_0000;

  // Note: these index into their respective 'xTAPS', in order to determine the
  //   actual radio-index.
  // Note: reverse-ordering
  localparam [15:0] ASELS = { 2'b10, 2'b00, 2'b10, 2'b01, 2'b01, 2'b00, 2'b00, 2'b00 };
  localparam [15:0] BSELS = { 2'b10, 2'b00, 2'b10, 2'b10, 2'b01, 2'b10, 2'b01, 2'b00 };

  correlator #(
      .WIDTH(WIDTH),
      .ABITS(ABITS),
      .MUX_N(MUX_N),
      .TRATE(TRATE),
      .ATAPS(ATAPS),
      .BTAPS(BTAPS),
      .ASELS(ASELS),
      .BSELS(BSELS),
      .AUTOS(AUTOS)
  ) U_CORE1 (
      .clock(vis_clock),
      .reset(vis_reset),

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

  // Note: this instance would normally be at the end of a `vismerge` "chain,"
  //   which would typically be `LOOP0` in length.
  visaccum #(
      .IBITS(ABITS),
      .OBITS(SBITS),
      .PSUMS(LOOP0),
      .COUNT(LOOP1)
  ) U_VISACC1 (
      .clock(vis_clock),
      .reset(vis_reset),

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
  ) U_ACCUM1 (
      .clock(vis_clock),
      .reset(vis_reset),

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


  /**
   *  Output SRAM's that store visibilities, while waiting to be sent to the
   *  host system.
   */
  wire acc_ready;
  wire [ACCUM+VSB:0] acc_tdata, bus_tdata;

  assign acc_tdata   = {acc_revis, acc_imvis};

  assign bus_revis_o = bus_tdata[ACCUM+VSB:ACCUM];
  assign bus_imvis_o = bus_tdata[VSB:0];

  generate
    if (USE_ALEX_AFIFO) begin : g_alex_afifo

      // Notes:
      //  - a bit naughty, as some of the outputs are combinational ??
      axis_async_fifo #(
          .DEPTH(64),
          .DATA_WIDTH(ACCUM + ACCUM),
          .LAST_ENABLE(1),
          .ID_ENABLE(0),
          .DEST_ENABLE(0),
          .USER_ENABLE(0),
          // .RAM_PIPELINE(0),
          .RAM_PIPELINE(1),
          .OUTPUT_FIFO_ENABLE(0),
          .FRAME_FIFO(0)
      ) U_AFIFO1 (
          .s_clk(vis_clock),
          .s_rst(vis_reset),
          .s_axis_tdata(acc_tdata),
          .s_axis_tkeep(8'bx),
          .s_axis_tvalid(acc_valid),
          .s_axis_tready(acc_ready),
          .s_axis_tlast(acc_last),
          .s_axis_tid(8'bx),
          .s_axis_tdest(8'bx),
          .s_axis_tuser(1'bx),

          .m_clk(bus_clock),
          .m_rst(~bus_rst_n),
          .m_axis_tdata(bus_tdata),
          .m_axis_tkeep(),
          .m_axis_tvalid(bus_valid_o),
          .m_axis_tready(bus_ready_i),
          .m_axis_tlast(bus_last_o),
          .m_axis_tid(),
          .m_axis_tdest(),
          .m_axis_tuser(),

          .s_pause_req(1'b0),
          .s_pause_ack(),
          .m_pause_req(1'b0),
          .m_pause_ack(),

          .s_status_depth(),
          .s_status_depth_commit(),
          .s_status_overflow(),
          .s_status_bad_frame(),
          .s_status_good_frame(),

          .m_status_depth(),
          .m_status_depth_commit(),
          .m_status_overflow(),
          .m_status_bad_frame(),
          .m_status_good_frame()
      );

    end else begin : g_tart_afifo

      // Notes:
      //  - not as mature/tested as Alex's AFIFO (above);
      axis_afifo #(
          .WIDTH(ACCUM + ACCUM),
          .ABITS(4)
      ) U_AFIFO1 (
          .s_aresetn(areset_n),

          .s_aclk(vis_clock),
          .s_tvalid_i(acc_valid),
          .s_tready_o(acc_ready),
          .s_tlast_i(acc_last),
          .s_tdata_i(acc_tdata),

          .m_aclk(bus_clock),
          .m_tvalid_o(bus_valid_o),
          .m_tready_i(bus_ready_i),
          .m_tlast_o(bus_last_o),
          .m_tdata_o(bus_tdata)
      );

    end
  endgenerate


  // -- Simulation sanitisers -- //

`ifdef __icarus

  initial begin : dump_settings
    $display("Settings:");
    $display(" + antennas:  %2d (index bits:  %2d)", WIDTH, WBITS);
    $display(" + mux-width: %2d (select bits: %2d)", MUX_N, XBITS);
  end

  always @(posedge vis_clock) begin
    if (!vis_reset) begin
      if (!acc_ready && acc_valid) begin
        $error("Oh noes, the FIFO has overflowed!");
      end
    end
  end

`endif


endmodule  // toy_correlator
