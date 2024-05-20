// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

`timescale 1ns / 100ps
module correlate_tb;

  localparam integer WIDTH = 4;
  localparam integer MSB = WIDTH - 1;

  // 6:1 time-multiplexing
  localparam integer TRATE = 12;
  localparam integer TBITS = 4;
  localparam integer TSB = TBITS - 1;

  // Number of correlation terms to sum
  localparam integer COUNT = 3;
  localparam integer CBITS = 2;
  localparam integer CSB = CBITS - 1;


  // -- Globals -- //

  reg clock = 1'b1;
  reg reset = 1'bx;

  always #5 clock <= ~clock;

  reg src_start = 1'b0;
  reg src_done = 1'b0;
  reg src_auto = 1'b0;  // todo: auto-correlation-ish ??
  reg cor_done = 1'b0;


  // -- Simulation stimulus -- //

  initial begin
    $dumpfile("correlate_tb.vcd");
    $dumpvars;

    #15 reset <= 1'b1;
    #60 reset <= 1'b0;

    #20 src_start <= 1'b1;
    #10 src_start <= 1'b0;

    #10 while (!cor_done) #10;

    #80 $finish;
  end

  // Safety-valve
  initial #6000 $finish;

  // Finishing criteria
  reg cor_frame;
  wire cor_valid, cor_frame_w;

  always @(posedge clock) begin
    if (reset) begin
      cor_frame <= 1'b0;
      cor_done  <= 1'b0;
    end else begin
      if (src_start) begin
        cor_frame <= 1'b1;
      end else if (src_done) begin
        cor_frame <= 1'b0;
      end

      if (src_done && cor_frame && !cor_valid) begin
        cor_done <= 1'b1;
      end
    end
  end


  // -- Generate fake data -- //

  reg src_valid, src_first, src_last;
  reg [1:0] src_idata, src_qdata;
  reg [TSB:0] src_taddr;

  localparam unsigned [TSB:0] TZERO = {TBITS{1'b0}};
  localparam integer TAUTO = TRATE - 2;
  localparam unsigned [CSB:0] CZERO = {CBITS{1'b0}};

  reg [TSB:0] taddr;
  wire [TSB:0] tnext = taddr + 1;
  wire tauto = tnext >= TAUTO[TSB:0];
  // wire tauto = taddr >= TAUTO[TSB:0];
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
      src_auto <= 1'b0;
      src_last <= 1'b0;
      count <= CZERO;
      taddr <= TZERO;
    end else begin

      if (src_start) begin
        src_valid <= 1'b1;
        src_first <= 1'b1;
      end else begin
        src_first <= src_last & ~src_done;
      end

      if (src_frame) begin
        src_taddr <= taddr;
        src_idata <= $urandom;
        src_qdata <= $urandom;
      end else begin
        src_valid <= 1'b0;
        src_auto  <= 1'b0;
      end

      if (clast) begin
        count <= CZERO;
        if (tlast) begin
          src_auto <= 1'b0;
          src_done <= 1'b1;
          taddr <= TZERO;
        end else begin
          taddr <= tnext;
          src_auto <= tauto;
        end
      end else if (src_frame) begin
        count <= cnext;
      end

      src_last <= clast & ~src_done;  // todo: ...

    end
  end


  // -- Module Under Test -- //

  wire ai = src_idata[0];
  wire aq = src_qdata[0];
  wire bi = src_idata[1];
  wire bq = src_qdata[1];
  wire [MSB:0] cor_rdata, cor_idata;

  correlate #(
      .WIDTH(WIDTH)
  ) CORREL0 (
      .clock(clock),
      .reset(reset),

      .valid_i(src_valid),
      .first_i(src_first),
      .last_i(src_last),
      .auto_i(src_auto),
      .ai_i(ai),
      .aq_i(aq),
      .bi_i(bi),
      .bq_i(bq),

      .frame_o(cor_frame_w),
      .valid_o(cor_valid),
      .rdata_o(cor_rdata),
      .idata_o(cor_idata)
  );


endmodule  // correlate_tb
