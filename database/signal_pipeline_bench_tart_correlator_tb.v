// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

`timescale 1ns / 100ps
module tart_correlator_tb;

  localparam integer WIDTH = 16;  // 16x antennas
  localparam integer WBITS = 4;
  localparam integer MSB = WIDTH - 1;

  // Source-signal multiplexor parameters
  localparam integer MUX_N = 5;
  localparam integer XBITS = 3;
  localparam integer XSB = XBITS - 1;

  localparam integer CORES = 18;  // Number of correlator cores
  localparam integer UBITS = 5;  // Log2(#cores)
  localparam integer USB = UBITS - 1;

  localparam integer TRATE = 5;  // 5x clock multiplier
  localparam integer TBITS = 3;
  localparam integer TSB = TBITS - 1;

  localparam integer LOOP0 = 3;  // Stage-1 loop count
  localparam integer LBITS = 2;
  localparam integer LOOP1 = 5;  // Stage-2 loop count
  localparam integer HBITS = 3;
  localparam integer COUNT = LOOP0 * LOOP1;
  localparam integer CBITS = 4;  // Bit-width of loop counter
  localparam integer CSB = CBITS - 1;

  localparam integer ACCUM = 20;
  localparam integer SBITS = 7;


  // -- Globals -- //

  reg sig_clock = 1'b1;
  reg vis_clock = 1'b1;
  reg bus_clock = 1'b1;
  reg reset_n = 1'bx;

  always #5 vis_clock <= ~vis_clock;
  always #25 sig_clock <= ~sig_clock;
  always #15 bus_clock <= ~bus_clock;

  reg sig_start = 1'b0;
  reg sig_done = 1'b1;
  reg tart_done = 1'b0;


  // -- Simulation stimulus -- //

  initial begin
    $dumpfile("../vcd/tart_correlator_tb.vcd");
    $dumpvars;

    #15 reset_n <= 1'b0;
    #60 reset_n <= 1'b1;

    #20 sig_start <= 1'b1;
    #10 sig_start <= 1'b0;

    #10 while (!tart_done) #10;

    #80 $finish;
  end

  // Safety-valve
  initial #6000 $finish;


  // -- Generate fake data -- //

  reg sig_valid;
  reg sig_first;
  reg sig_last;
  reg [MSB:0] sig_idata, sig_qdata;

  reg [CBITS:0] count;
  wire [CBITS:0] cnext = count + 1;
  wire cwrap = cnext[CSB:0] == COUNT[CSB:0];
  wire clast = cnext[CSB:0] == COUNT[CSB:0] - 1;
  wire cbank = count[CBITS] + 1;

  wire go_w = sig_start || !sig_done;

  // Fills two banks with (fake) signal data
  always @(posedge sig_clock) begin
    if (!reset_n) begin
      sig_valid <= 1'b0;
      sig_first <= 1'b0;
      sig_last <= 1'b0;
      count <= {1'b0, {CBITS{1'b0}}};
      sig_done <= 1'b1;
    end else begin
      // Sig_start/stop logic for the fake data
      if (sig_start) begin
        sig_done <= 1'b0;
      end else if (count[CBITS] && clast) begin
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
        sig_first <= cwrap && !sig_done && !count[CBITS];  // 1'b0;
      end
      sig_last <= clast && !sig_done;

      if (go_w) begin
        {sig_idata, sig_qdata} <= $urandom;
      end else begin
        {sig_idata, sig_qdata} <= {WIDTH{2'bxx}};
      end
    end
  end


  // -- Module Under Test -- //

  wire vis_start, vis_frame;
  wire bus_valid, bus_last, bus_ready;
  wire [ACCUM-1:0] bus_rdata, bus_idata;

  assign bus_ready = 1'b1;

  tart_correlator #(
      .WIDTH(WIDTH),
      .MUX_N(MUX_N),
      .CORES(CORES),
      .TRATE(TRATE),
      .LOOP0(LOOP0),
      .LOOP1(LOOP1),
      .ACCUM(ACCUM),
      .SBITS(SBITS)
  ) TARTCOR0 (
      .sig_clock(sig_clock),
      .vis_clock(vis_clock),
      .bus_clock(bus_clock),
      .reset_n  (reset_n),

      .sig_valid_i(sig_valid),
      .sig_last_i (sig_last),
      .sig_idata_i(sig_idata),
      .sig_qdata_i(sig_qdata),

      .vis_start_o(vis_start),
      .vis_frame_o(vis_frame),

      .bus_valid_o(bus_valid),
      .bus_ready_i(bus_ready),
      .bus_last_o (bus_last),
      .bus_revis_o(bus_rdata),
      .bus_imvis_o(bus_idata)
  );

endmodule  // tart_correlator_tb
