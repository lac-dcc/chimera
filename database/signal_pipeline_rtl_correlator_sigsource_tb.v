// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

`timescale 1ns / 100ps
module sigsource_tb;

  // 12x antennas
  localparam integer WIDTH = 12;
  localparam integer SBITS = 4;

  // 8:1 MUX parameters, but with only 5/8 being used
  localparam integer XBITS = 3;
  localparam integer MUX_N = 5;

  // 6:1 time-multiplexing
  localparam integer TRATE = 6;
  localparam integer TBITS = 3;

  localparam integer COUNT = 15;
  localparam integer CBITS = 4;

  localparam integer MSB = WIDTH - 1;
  localparam integer SSB = SBITS - 1;
  localparam integer TSB = TBITS - 1;
  localparam integer CSB = CBITS - 1;

  // Map antenna signal indices to A-/B- MUX inputs
  localparam integer PBITS = SBITS * MUX_N;
  localparam integer PSB = PBITS - 1;

  localparam unsigned [PSB:0] ATAPS = {4'h1, 4'h5, 4'h7, 4'h8, 4'hb};
  localparam unsigned [PSB:0] BTAPS = {4'h0, 4'h2, 4'h3, 4'h9, 4'ha};

  // Map time-multiplexing index to A-/B- MUX source-selects
  localparam integer QBITS = TRATE * XBITS;  // Time-interval to MUX-sel bits
  localparam integer QSB = QBITS - 1;

  localparam unsigned [QSB:0] ASELS = {3'h0, 3'h1, 3'h2, 3'h3, 3'h4, 3'h0};
  localparam unsigned [QSB:0] BSELS = {3'h1, 3'h1, 3'h2, 3'h4, 3'h0, 3'h3};


  // -- Globals -- //

  reg clock = 1'b1;
  reg reset = 1'bx;

  always #5 clock <= ~clock;

  reg src_start = 1'b0;
  reg src_done = 1'b0;
  reg mux_done = 1'b0;


  // -- Simulation stimulus -- //

  initial begin
    $dumpfile("sigsource_tb.vcd");
    $dumpvars;

    #15 reset <= 1'b1;
    #60 reset <= 1'b0;

    #20 src_start <= 1'b1;
    #10 src_start <= 1'b0;

    #10 while (!mux_done) #10;

    #80 $finish;
  end

  // Safety-valve
  initial #6000 $finish;

  // Finishing criteria
  reg mux_frame;
  wire mux_valid, mux_first, mux_last;

  always @(posedge clock) begin
    if (reset) begin
      mux_frame <= 1'b0;
      mux_done  <= 1'b0;
    end else begin
      mux_frame <= mux_valid;

      if (src_done && mux_frame && !mux_valid) begin
        mux_done <= 1'b1;
      end

    end
  end


  // -- Generate fake data -- //

  reg src_valid, src_first, src_last;
  reg [MSB:0] src_idata, src_qdata;
  reg [TSB:0] src_taddr;

  localparam unsigned [TSB:0] TZERO = {TBITS{1'b0}};
  localparam unsigned [CSB:0] CZERO = {CBITS{1'b0}};

  reg [TSB:0] taddr;
  wire [TSB:0] tnext = taddr + 1;
  wire tlast = tnext == TRATE[TSB:0];

  reg [CSB:0] count;
  wire [CSB:0] cnext = count + 1;
  wire clast = cnext == COUNT[CSB:0];

  wire src_frame = (src_start | src_valid) & ~src_done;

  always @(posedge clock) begin
    if (reset) begin
      src_done <= 1'b0;
      src_valid <= 1'b0;
      src_first <= 1'b0;
      src_last <= 1'b0;
      count <= CZERO;
      taddr <= TZERO;
    end else begin

      if (src_start) begin
        src_valid <= 1'b1;
        src_first <= 1'b1;
      end else begin
        src_first <= 1'b0;
      end

      if (src_frame) begin
        src_taddr <= taddr;
        src_idata <= $urandom;
        src_qdata <= $urandom;
      end else begin
        src_valid <= 1'b0;
      end

      if (clast) begin
        count <= CZERO;
        if (tlast) begin
          src_done <= 1'b1;
          taddr <= TZERO;
        end else begin
          taddr <= tnext;
        end
      end else if (src_frame) begin
        count <= cnext;
      end

      src_last <= clast & tlast & ~src_done;

    end
  end


  // -- Module Under Test -- //

  wire ai, aq, bi, bq;

  sigsource #(
      .WIDTH(WIDTH),
      .SBITS(SBITS),
      .XBITS(XBITS),
      .MUX_N(MUX_N),
      .TRATE(TRATE),
      .TBITS(TBITS),
      .ATAPS(ATAPS),
      .BTAPS(BTAPS),
      .ASELS(ASELS),
      .BSELS(BSELS)
  ) SIGSRC0 (
      .clock(clock),
      .reset(reset),
      // Inputs
      .valid_i(src_valid),
      .first_i(src_first),
      .last_i(src_last),
      .taddr_i(src_taddr),
      .idata_i(src_idata),
      .qdata_i(src_qdata),
      // Outputs
      .valid_o(mux_valid),
      .first_o(mux_first),
      .last_o(mux_last),
      .ai_o(ai),
      .aq_o(aq),
      .bi_o(bi),
      .bq_o(bq)
  );

endmodule  // sigsource_tb
