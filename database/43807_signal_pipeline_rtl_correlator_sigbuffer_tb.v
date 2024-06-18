// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

`timescale 1ns / 100ps
module sigbuffer_tb;

  localparam integer WIDTH = 4;  // 4x antennas
  localparam integer MSB = WIDTH - 1;

  localparam integer TRATE = 5;  // 5x clock multiplier
  localparam integer TBITS = 3;
  localparam integer TSB = TBITS - 1;

  localparam integer LOOP0 = 3;  // Stage-1 loop count
  localparam integer LOOP1 = 5;  // Stage-2 loop count
  localparam integer COUNT = LOOP0 * LOOP1;
  localparam integer CBITS = 4;  // Bit-width of loop counter
  localparam integer CSB = CBITS - 1;

  localparam integer BBITS = 1;  // Number of banks of signal data
  localparam integer ABITS = BBITS + CBITS;  // Address width for signal SRAM
  localparam integer ASB = ABITS - 1;


  // -- Globals -- //

  reg sig_clock = 1'b1;
  reg reset_n = 1'bx;
  reg buf_clock = 1'b1;
  reg buf_reset = 1'bx;

  always #5 buf_clock <= ~buf_clock;
  always #25 sig_clock <= ~sig_clock;

  reg sig_start = 1'b0;
  reg buf_done = 1'b0;
  reg sig_done = 1'b1;


  // -- Simulation stimulus -- //

  initial begin
    $dumpfile("sigbuffer_tb.vcd");
    $dumpvars;

    #15 reset_n <= 1'b0;
    #60 reset_n <= 1'b1;

    #20 sig_start <= 1'b1;
    #10 sig_start <= 1'b0;

    #10 while (!buf_done) #10;

    #80 $finish;
  end

  // Safety-valve
  initial #6000 $finish;


  // -- Generate fake data -- //

  reg sig_valid;
  reg sig_first;
  reg sig_last;
  reg [MSB:0] sig_idata, sig_qdata;

  reg [ASB:0] count;

  wire [ASB:0] cnext = count + 1;
  wire cwrap = cnext[CSB:0] == COUNT[CSB:0];
  wire clast = cnext[CSB:0] == COUNT[CSB:0] - 1;
  wire [ASB:CBITS] cbank = count[ASB:CBITS] + 1;
  wire go_w = sig_start || !sig_done;

  // Fills two banks with (fake) signal data
  always @(posedge sig_clock) begin
    if (!reset_n) begin
      sig_valid <= 1'b0;
      sig_first <= 1'b0;
      sig_last <= 1'b0;
      count <= {ABITS{1'b0}};
      sig_done <= 1'b1;
    end else begin
      // Sig_start/stop logic for the fake data
      if (sig_start) begin
        sig_done <= 1'b0;
      end else if (count[ASB] && clast) begin
        sig_done <= 1'b1;
      end

      // Address/counter
      if (sig_valid) begin
        if (cwrap) begin
          count <= {cbank, {CBITS{1'b0}}};
        end else begin
          count <= cnext;
        end
      end

      // Interleaved, source partial-visibilities and their control signals
      sig_valid <= go_w;
      if (sig_start) begin
        sig_first <= 1'b1;
      end else begin
        sig_first <= cwrap && !sig_done && !count[ASB];  // 1'b0;
      end
      sig_last <= clast && !sig_done;

      if (go_w) begin
        {sig_idata, sig_qdata} <= $urandom;
      end else begin
        {sig_idata, sig_qdata} <= {WIDTH{2'bxx}};
      end
    end
  end

  // Finishing criteria
  reg buf_frame;

  always @(posedge buf_clock) begin
    if (buf_reset) begin
      buf_frame <= 1'b0;
      buf_done  <= 1'b0;
    end else begin
      buf_frame <= buf_valid;

      if (sig_done && buf_frame && !buf_valid) begin
        buf_done <= 1'b1;
      end else begin
        buf_done <= 1'b0;
      end

    end
  end


  // -- Module Under Test -- //

  wire buf_valid, buf_first, buf_last;
  wire [TSB:0] buf_addr;
  wire [MSB:0] buf_idata, buf_qdata;

  sigbuffer #(
      .WIDTH(WIDTH),
      .TRATE(TRATE),
      .LOOP0(LOOP0),
      .LOOP1(LOOP1)
  ) SIGBUF0 (
      // Antenna/source signals
      .sig_clk(sig_clock),
      .reset_n(reset_n),
      .valid_i(sig_valid),
      .idata_i(sig_idata),
      .qdata_i(sig_qdata),

      // Delayed, up-rated, looped signals
      .vis_clk(buf_clock),
      .vis_rst(buf_reset),
      .valid_o(buf_valid),
      .first_o(buf_first),
      .last_o (buf_last),
      .taddr_o(buf_addr),
      .idata_o(buf_idata),
      .qdata_o(buf_qdata)
  );

endmodule  // sigbuffer_tb
