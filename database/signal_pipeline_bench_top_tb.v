// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

`timescale 1ns / 100ps
module top_tb;

  localparam integer WIDTH = 32;
  localparam integer MUX_N = 7;
  localparam integer CORES = 18;
  localparam integer LOOP0 = 3;
  localparam integer LOOP1 = 5;
  localparam integer COUNT = LOOP0 * LOOP1;
  localparam integer TRATE = 30;

  // The full visibilities accumulator has `ACCUM` bits, but the first-stage only
  // uses `SUMBITS`-wide adders.
  localparam integer ACCUM = 36;
  localparam integer SUMBITS = 7;

  localparam integer MSB = WIDTH - 1;
  localparam integer ASB = ACCUM - 1;


  /**
   *  System-wide signals.
   */
  reg reset_n = 1'b0;
  reg enable = 1'b0;
  reg sig_clock = 1'b1;
  reg vis_clock = 1'b1;
  reg bus_clock = 1'b1;

  always #150 sig_clock <= ~sig_clock;
  always #5 vis_clock <= ~vis_clock;
  always #10 bus_clock <= ~bus_clock;

  initial begin : SIM_INIT
    #305 reset_n <= 1'b1;

    #300 enable <= 1'b1;
    while (!bus_last) #300 valid <= 1'b1;

    #6000 $finish;
  end

  // Safety-valve
  initial #6000 $finish;

  reg valid;


  /**
   *  Source signal data generation and streaming.
   */
  localparam integer SAMPLES = 1024;
  localparam integer SAMPLEBITS = 10;

  reg [MSB:0] isamples[SAMPLES];
  reg [MSB:0] qsamples[SAMPLES];

  integer ii;
  initial begin : SIM_DATA
    for (ii = 0; ii < SAMPLES; ii = ii + 1) begin
      isamples[ii] = $urandom;
      qsamples[ii] = $urandom;
    end
  end  // SIM_DATA

  reg  [SAMPLEBITS-1:0] saddr = {SAMPLEBITS{1'b0}};
  wire [SAMPLEBITS-1:0] snext = saddr + 1;

  always @(posedge sig_clock) begin
    if (!reset_n) begin
      saddr <= {SAMPLEBITS{1'b0}};
    end else begin
      if (valid) begin
        saddr <= snext;
      end
    end
  end


  reg  sig_valid = 1'b0;
  reg  sig_first = 1'b0;
  reg  sig_last = 1'b0;
  wire sig_ready;
  wire [ASB:0] sig_idata, sig_qdata;

  wire start_w, frame_w;

  wire [ASB:0] bus_revis, bus_imvis;
  wire bus_valid, bus_last;
  reg bus_ready = 1'b0;

  always @(posedge bus_clock) begin
    if (!reset_n) begin
      bus_ready <= 1'b0;
    end else begin
      if (enable) begin
        bus_ready <= 1'b1;
      end else if (bus_valid && bus_ready && bus_last) begin
        bus_ready <= 1'b0;
      end
    end
  end


  /**
   *  Correlator Under Test.
   */
  tart_correlator #(
      .WIDTH(WIDTH),
      .MUX_N(MUX_N),
      .CORES(CORES),
      .TRATE(TRATE),
      .LOOP0(LOOP0),
      .LOOP1(LOOP1),
      .ACCUM(ACCUM),
      .SBITS(SUMBITS)
  ) CORRELATOR0 (
      .sig_clock(sig_clock),
      .vis_clock(vis_clock),
      .bus_clock(bus_clock),
      .reset_n  (reset_n),

      // Control and status signals
      .vis_start_o(start_w),
      .vis_frame_o(frame_w),

      // Antenna source signals
      .sig_valid_i(sig_valid),
      .sig_last_i (sig_last),
      .sig_idata_i(sig_idata),
      .sig_qdata_i(sig_qdata),

      // AXI4-Stream for the visibilities to the system bus
      .bus_revis_o(bus_revis),
      .bus_imvis_o(bus_imvis),
      .bus_valid_o(bus_valid),
      .bus_ready_i(bus_ready),
      .bus_last_o (bus_last)
  );

endmodule  // top_tb
