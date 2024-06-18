// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

`timescale 1ns / 100ps
/**
 * Input-buffering SRAM's for (antenna) signal IQ data.
 *
 * Every 'COUNT' input samples a full set of (partially-summed) visibility
 * contributions are computed, and forwarded to the final-stage accumulators.
 * The following buffer stores two (or more) banks of these 'COUNT' samples,
 * and streams them (with the correct ordering) to the correlators, switching
 * banks at the end of each block (of 'COUNT' samples).
 */
module sigbuffer #(
    // Number of antennas/sources
    parameter  integer WIDTH = 32,
    localparam integer MSB   = WIDTH - 1,

    // Time-multiplexing is used, so used to map from timeslice to MUX indices
    parameter  integer TRATE = 30,
    localparam integer TBITS = $clog2(TRATE),  // Input MUX bits
    localparam integer TSB   = TBITS - 1,

    // For each antenna-pair, partial (visibility) sums are computed from 'COUNT'
    // cross-correlations. And, for efficiency, 'COUNT' is the product of two
    // smaller loops, 'LOOP0' & 'LOOP1'.
    parameter  integer LOOP0 = 3,
    localparam integer LBITS = $clog2(LOOP0),
    parameter  integer LOOP1 = 5,
    localparam integer HBITS = $clog2(LOOP1),
    localparam integer COUNT = LOOP0 * LOOP1,  // Number of terms in partial sums
    localparam integer CBITS = $clog2(COUNT),  // Bit-width of loop-counter
    localparam integer CSB   = CBITS - 1,

    // At least two banks are required, so that one can be filled, while the other
    // is being read
    localparam integer BBITS = 1,
    localparam integer BANKS = 1 << BBITS,
    localparam integer BSB   = BBITS - 1,

    // SRAM address and size parameters
    localparam integer WORDS = 1 << (CBITS + BBITS),
    localparam integer ABITS = CBITS + BBITS,
    localparam integer ASB   = ABITS - 1
) (
    // Antenna/radio (source-signal) domain
    input sig_clk,
    input reset_n,
    input valid_i,
    input [MSB:0] idata_i,
    input [MSB:0] qdata_i,

    // Correlator clock domain
    input vis_clk,
    input vis_rst,
    output valid_o,
    output first_o,
    output next_o,
    output emit_o,
    output last_o,
    output [TSB:0] taddr_o,
    output [MSB:0] idata_o,
    output [MSB:0] qdata_o
);

  // -- Capture of antenna IQ signals -- //

  localparam [CSB:0] CZERO = {COUNT{1'b0}};

  reg [MSB:0] isram[WORDS];
  reg [MSB:0] qsram[WORDS];
  reg [ASB:0] waddr;
  reg switch;

  wire [ASB:0] wnext = waddr + 1;
  wire [ASB:CBITS] wbank = waddr[ASB:CBITS] + 1;

  always @(posedge sig_clk or negedge reset_n) begin
    if (!reset_n) begin
      waddr  <= {ABITS{1'b0}};
      switch <= 1'b0;
    end else begin
      if (valid_i) begin
        if (wnext[CSB:0] == COUNT[CSB:0]) begin
          // Count-limit reached, switch bank
          waddr  <= {wbank, CZERO};
          switch <= 1'b1;
        end else begin
          waddr  <= wnext;
          switch <= 1'b0;
        end
        isram[waddr] <= idata_i;
        qsram[waddr] <= qdata_i;
      end else begin
        switch <= 1'b0;
      end
    end
  end


  // -- Signal that each bank has been filled -- //

  reg start, fired, ended;

  always @(posedge vis_clk) begin
    if (vis_rst) begin
      start <= 1'b0;
      fired <= 1'b0;
      ended <= 1'b1;
    end else begin
      start <= switch & ~fired;
      fired <= switch;
      ended <= ~valid_i;
    end
  end


  // -- Read-back of antenna IQ signals, with "multistage ordering" -- //

  localparam [TSB:0] TZERO = {TBITS{1'b0}};
  localparam [BSB:0] BZERO = {BBITS{1'b0}};

  reg valid, first, next, emit, last;
  reg [MSB:0] idata, qdata;

  reg frame;
  reg [TSB:0] taddr;
  wire [TSB:0] tnext = taddr + 1;
  wire tlast = tnext == TRATE[TSB:0];
  reg tstep;

  reg [CSB:0] raddr;
  wire [CSB:0] rnext = raddr + 1;
  wire rlast = rnext[CSB:0] == COUNT[CSB:0];
  reg [ASB:CBITS] rbank;

  assign valid_o = valid;
  assign first_o = first;
  assign next_o  = next;
  assign emit_o  = emit;
  assign last_o  = last;
  assign taddr_o = taddr;
  assign idata_o = idata;
  assign qdata_o = qdata;

  //
  // Transaction framing unit
  //
  // A "transaction" loops through 'COUNT' samples, and repeats this 'TRATE'
  // times.
  //
  always @(posedge vis_clk) begin
    if (vis_rst) begin
      taddr <= TZERO;
      frame <= 1'b0;
      rbank <= BZERO;
      tstep <= 1'b0;
    end else begin
      if (start) begin
        frame <= 1'b1;
      end else if (rlast && tlast && ended) begin
        frame <= 1'b0;
      end

      if (rlast && tlast) begin
        rbank <= rbank + 1;
      end

      tstep <= rlast;

      if (!frame && valid) begin
        taddr <= TZERO;
        rbank <= BZERO;
      end else if (tstep) begin
        if (tlast) begin
          taddr <= TZERO;
        end else begin
          taddr <= tnext;
        end
      end
    end
  end

  // Read-address and read-data unit
  always @(posedge vis_clk) begin
    if (vis_rst) begin
      raddr <= CZERO;
    end else begin
      idata <= isram[{rbank, raddr}];
      qdata <= qsram[{rbank, raddr}];

      if (frame) begin
        if (rlast) begin
          raddr <= CZERO;
        end else begin
          raddr <= rnext;
        end
      end else begin
        raddr <= CZERO;
      end
    end
  end

  always @(posedge vis_clk) begin
    if (vis_rst) begin
      valid <= 1'b0;
      first <= 1'b0;
      last  <= 1'b0;
    end else begin
      valid <= frame;
      first <= frame & (~valid | last);
      last  <= rlast & tlast;
    end
  end


  // -- Correlator partial-sum stepper control -- //

  localparam integer LZERO = {LBITS{1'b0}};
  localparam integer HZERO = {HBITS{1'b0}};

  reg [LBITS-1:0] cntlo;
  wire [LBITS-1:0] lnext = cntlo + 1;
  wire lomax = lnext == LOOP0[LBITS-1:0];

  // reg [HBITS-1:0] cnthi;
  // wire [HBITS-1:0] hnext = cnthi + 1;
  // wire himax = hnext == LOOP1[HBITS-1:0];

  // wire cnext = lomax | buf_first_w;  // todo: make synchronous ...

  always @(posedge vis_clk) begin
    if (vis_rst) begin
      cntlo <= LZERO;
      // cnthi <= HZERO;
      next  <= 1'b0;
    end else begin
      if (frame) begin
        next <= ~valid | emit;
        emit <= lomax;

        if (lomax) begin
          cntlo <= LZERO;
        end else begin
          cntlo <= lnext;
        end

      end else begin
        next  <= 1'b0;
        emit  <= 1'b0;

        cntlo <= LZERO;
      end
    end
  end

endmodule  // sigbuffer
