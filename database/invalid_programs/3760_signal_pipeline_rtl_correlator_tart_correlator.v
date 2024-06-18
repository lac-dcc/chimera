// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

`timescale 1ns / 100ps
module tart_correlator (
    sig_clock,
    vis_clock,
    bus_clock,
    reset_n,

    sig_valid_i,
    sig_last_i,
    sig_idata_i,
    sig_qdata_i,

    vis_start_o,
    vis_frame_o,

    bus_revis_o,
    bus_imvis_o,
    bus_valid_o,
    bus_ready_i,
    bus_last_o
);

  // FIXME: The `COUNT` parameter has to be the same as `CORES`, due to the way
  //   that results are pipelined? Explicitly, after summing `COUNT` values,
  //   this partial-sum is output onto the pipelined "MUX", to be sent to the
  //   accumulator FU?

  parameter integer WIDTH = 32;  // Number of antennas/signals
  localparam integer WBITS = $clog2(WIDTH);
  localparam integer MSB = WIDTH - 1;

  // Source-signal multiplexor parameters
  parameter integer MUX_N = 7;
  // parameter integer XBITS = 3;
  localparam integer XBITS = $clog2(MUX_N);
  localparam integer XSB = XBITS - 1;

  parameter integer CORES = 18;  // Number of correlator cores
  // parameter integer UBITS = 5;  // Log2(#cores)
  localparam integer UBITS = $clog2(CORES);  // Log2(#cores)
  localparam integer USB = UBITS - 1;

  // Time-multiplexing rate; i.e., clock multiplier
  parameter integer TRATE = 30;
  // parameter integer TBITS = 5;  // ceil(Log2(TRATE))
  localparam integer TBITS = $clog2(TRATE);
  localparam integer TSB = TBITS - 1;

  // Every 'COUNT' samples, compute partial-visibilities to accumumlate
  parameter integer LOOP0 = 3;
  localparam integer LBITS = $clog2(LOOP0);
  parameter integer LOOP1 = 5;
  localparam integer HBITS = $clog2(LOOP1);
  localparam integer COUNT = LOOP0 * LOOP1;  // Number of terms in partial sums
  localparam integer CBITS = $clog2(COUNT);  // Bit-width of loop-counter
  localparam integer CSB = CBITS - 1;

  // parameter integer ADDR = 4;
  // localparam integer ASB = ADDR - 1;
  parameter integer ACCUM = 36;  // Bit-width of accumulators
  parameter integer SBITS = 7;  // Bit-width of partial-sums
  localparam integer SSB = SBITS - 1;

  // Buffer SRAM parameters
  localparam integer BBITS = 1;  // Number of bits for the bank-number
  localparam integer WORDS = 1 << (BBITS + CBITS);  // Buffer SRAM size
  localparam integer BANKS = BBITS << 1;
  localparam integer BSB = BBITS - 1;


  input sig_clock;  // note: the clock from the radio RX ADC's
  input vis_clock;  // note: must be (integer multiple) sync to 'sig_clock'
  input bus_clock;  // note: typically ascynchronous, relative to the above
  input reset_n;

  // AXI4-Stream input for the visibilities
  input [MSB:0] sig_idata_i;
  input [MSB:0] sig_qdata_i;
  input sig_valid_i;
  input sig_last_i;  // todo: not useful?
  output sig_ready_o;

  // Control and status signals
  output vis_start_o;
  output vis_frame_o;

  // AXI4-Stream output for the visibilities
  output [ACCUM-1:0] bus_revis_o;
  output [ACCUM-1:0] bus_imvis_o;
  input bus_ready_i;
  output bus_valid_o;
  output bus_last_o;


  /**
   * Input-buffering SRAM's for (antenna) signal IQ data.
   *
   * Every 'COUNT' input samples a full set of (partially-summed) visibility
   * contributions are computed, and forwarded to the final-stage accumulators.
   * The following buffer stores two (or more) banks of these 'COUNT' samples,
   * and streams them (with the correct ordering) to the correlators, switching
   * banks at the end of each block (of 'COUNT' samples).
   */
  wire buf_valid_w, buf_first_w, buf_last_w;
  wire [TSB:0] buf_taddr_w;
  wire [MSB:0] buf_idata_w, buf_qdata_w;

  sigbuffer #(
      .WIDTH(WIDTH),
      .TRATE(TRATE),
      .LOOP0(LOOP0),
      .LOOP1(LOOP1)
  ) SIGBUF0 (
      .sig_clk(sig_clock),
      .vis_clk(vis_clock),
      .reset_n(reset_n),
      // Antenna/source signals
      .valid_i(sig_valid_i),
      .idata_i(sig_idata_i),
      .qdata_i(sig_qdata_i),
      // Delayed, up-rated, looped signals
      .valid_o(buf_valid_w),
      .first_o(buf_first_w),
      .last_o (buf_last_w),
      .taddr_o(buf_taddr_w),
      .idata_o(buf_idata_w),
      .qdata_o(buf_qdata_w)
  );


  // -- Correlator control-signals -- //

  localparam integer LZERO = {LBITS{1'b0}};
  localparam integer HZERO = {HBITS{1'b0}};

  reg [LBITS-1:0] cntlo;
  wire [LBITS-1:0] lnext = cntlo + 1;
  wire lomax = lnext == LOOP0[LBITS-1:0];

  reg [HBITS-1:0] cnthi;
  wire [HBITS-1:0] hnext = cnthi + 1;
  wire himax = hnext == LOOP1[HBITS-1:0];

  wire cnext = lomax | buf_first_w;  // todo: make synchronous ...

  always @(posedge vis_clock) begin
    if (!reset_n) begin
      cntlo <= LZERO;
      cnthi <= HZERO;
    end else if (buf_valid_w) begin
      if (lomax) begin
        cntlo <= LZERO;
        if (himax) begin
          cnthi <= HZERO;
        end else begin
          cnthi <= hnext;
        end
      end else begin
        cntlo <= lnext;
      end
    end
  end


  /**
   *  Correlator array, with daisy-chained outputs.
   */
  wire [SSB:0] re_w[CORES+1];
  wire [SSB:0] im_w[CORES+1];

  wire [SSB:0] acc_re, acc_im;
  wire [CORES:0] vlds;

  assign re_w[0] = {SBITS{1'bx}};
  assign im_w[0] = {SBITS{1'bx}};

  assign acc_re  = re_w[CORES];
  assign acc_im  = im_w[CORES];

  genvar ii;
  generate
    for (ii = 0; ii < CORES; ii = ii + 1) begin : gen_corr_inst
      correlator #(
          .WIDTH(WIDTH),
          .MUX_N(MUX_N),
          .TRATE(TRATE)
      ) CORR (
          // Inputs
          .clock  (vis_clock),
          .reset_n(reset_n),

          .valid_i(buf_valid_w),
          .first_i(buf_first_w),
          .next_i (cnext),
          .last_i (buf_last_w),
          .taddr_i(buf_taddr_w),
          .idata_i(buf_idata_w),
          .qdata_i(buf_qdata_w),

          .prevs_i(vlds[ii]),
          .revis_i(re_w[ii]),
          .imvis_i(im_w[ii]),

          // Outputs
          .revis_o(re_w[ii+1]),
          .imvis_o(im_w[ii+1]),
          .valid_o(vlds[ii+1])
      );
    end  // gen_corr_inst
  endgenerate


  /**
   *  Accumulates each of the partial-sums into the full-width visibilities.
   */
  wire vis_first = 1'b0;  // todo: ...
  wire vis_last = 1'b0;

  wire [ACCUM-1:0] acc_revis, acc_imvis;
  wire acc_valid, acc_last;

  accumulator #(
      .CORES(CORES),
      .TRATE(TRATE),
      .WIDTH(ACCUM),
      .SBITS(SBITS)
  ) ACCUM0 (
      .clock  (vis_clock),
      .reset_n(reset_n),

      // Inputs
      .valid_i(vlds[CORES]),
      .first_i(vis_first),
      .last_i (vis_last),
      .revis_i(re_w[CORES]),
      .imvis_i(im_w[CORES]),

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
  localparam integer TOTAL = CORES * TRATE;
  localparam integer OSIZE = BANKS * TOTAL;
  localparam integer OBITS = CBITS + TBITS;
  localparam integer OSB = OBITS - 1;

  // -- Write port -- //

  reg [ACCUM-1:0] reram[OSIZE];
  reg [ACCUM-1:0] imram[OSIZE];
  reg [OSB:0] oaddr = {OBITS{1'b0}};
  wire [OSB:0] onext = oaddr + 1;
  reg [BSB:0] obank = {BBITS{1'b0}};

  always @(posedge vis_clock) begin
    if (!reset_n) begin
      oaddr <= {OBITS{1'b0}};
      obank <= {BBITS{1'b0}};
    end else begin
      // todo: handle case when all banks full?

      if (acc_valid) begin
        // todo: there are some edge-cases to handle, when 'onext == 0'?
        if (onext == TOTAL) begin
          oaddr <= {OBITS{1'b0}};
          obank <= obank + 1;
        end else begin
          oaddr <= onext;
        end

        // todo:
        reram[{obank, oaddr}] <= acc_revis;
        imram[{obank, oaddr}] <= acc_imvis;
      end
    end
  end

  // todo: cross-domain signals for indicating that data is ready ...

  // -- AXI4-Stream Read Port -- //

  reg [ACCUM-1:0] revis;
  reg [ACCUM-1:0] imvis;
  reg [OSB:0] baddr = {OBITS{1'b0}};
  wire [OSB:0] bnext = baddr + 1;
  reg [BSB:0] bbank = {BBITS{1'b0}};
  reg b_vld = 1'b0;
  reg b_lst = 1'b0;

  assign bus_valid_o = b_vld;
  assign bus_last_o  = b_lst;
  assign bus_revis_o = revis;
  assign bus_imvis_o = imvis;

  always @(posedge bus_clock) begin
    if (!reset_n) begin
      baddr <= {OBITS{1'b0}};
      bbank <= {BBITS{1'b0}};
      b_vld <= 1'b0;
      b_lst <= 1'b0;
    end else begin
      // todo: 'b_vld' logic

      if (b_vld && bus_ready_i) begin
        if (bnext == TOTAL) begin
          baddr <= {OBITS{1'b0}};
          bbank <= bbank + 1;
        end else begin
          baddr <= bnext;
        end

        // todo: correct?
        if (bnext == TOTAL - 1) begin
          b_lst <= 1'b1;
        end else begin
          b_lst <= 1'b0;
        end

        revis <= reram[{bbank, baddr}];
        imvis <= imram[{bbank, baddr}];
      end
    end
  end

endmodule  // tart_correlator
