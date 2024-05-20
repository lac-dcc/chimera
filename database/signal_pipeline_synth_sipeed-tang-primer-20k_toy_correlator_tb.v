// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

`timescale 1ns / 100ps
module toy_correlator_tb;

  // -- Testbench Constants -- //

  localparam integer USE_DUMMY_RADIOS = 1;
  localparam integer ANTENNA_NUM = 4;
  localparam integer NSB = ANTENNA_NUM - 1;
  localparam integer NZERO = {ANTENNA_NUM{1'b0}};
  localparam integer MSB = ANTENNA_NUM*2-1;

  localparam integer ACCUM = 32;
  localparam integer MUX_N = 3;
  localparam integer TRATE = 8;
  localparam integer LOOP0 = 3;
  localparam integer LOOP1 = 5;

  localparam integer COUNT = 10*LOOP0*LOOP1;
  localparam integer CLAST = COUNT - 1;
  localparam integer CBITS = $clog2(COUNT);
  localparam integer CZERO = {CBITS{1'b0}};
  localparam integer CSB = CBITS - 1;


  // -- Global Signals -- //

  reg sig_clk = 1'b1;
  reg bus_clk = 1'b1;
  reg vis_clk = 1'b1;
  reg rst_n;

  always #20 sig_clk <= ~sig_clk;
  always #5 bus_clk <= ~bus_clk;
  always #2.5 vis_clk <= ~vis_clk;


  // -- Generate some data, and read it out -- //

  integer dcnt;
  reg start = 1'b0;
  reg done = 1'b0;
  reg a_vld, a_lst;
  wire a_rdy;

  initial begin
    $dumpfile("toy_correlator_tb.vcd");
    $dumpvars;

    #20 rst_n <= 1'b0;
    #60 rst_n <= 1'b1;

    #20 start <= 1'b1;
    while (!a_rdy || !a_vld) #20;

    #20 start <= 1'b0;

    while (!done) #10;

    #80 $finish;
  end

  initial begin
    #15000 $finish;
  end


  //
  //  Fake Radios
  ///
  reg [NSB:0] dat_i = NZERO, dat_q = NZERO;
  wire [NSB:0] sig_i, sig_q;

  genvar ant;
  generate
    for (ant = 0; ant < ANTENNA_NUM; ant = ant + 1) begin
      radio_dummy #(
          .ANT_NUM(ant)
      ) r0 (
          .clk16(sig_clk),
          .rst_n(rst_n),
          .i1(dat_i[ant]),
          .q1(dat_q[ant]),
          .data_i(sig_i[ant]),
          .data_q(sig_q[ant])
      );
    end
  endgenerate

  always @(posedge sig_clk) begin
    if (!rst_n) begin
      dat_i <= NZERO;
      dat_q <= NZERO;
    end else begin
      dat_i <= sig_i;
      dat_q <= sig_q;
    end
  end


  // -- Send random data to the A port -- //

  reg  [MSB:0] a_dat;
  reg  [CSB:0] count;
  wire [CSB:0] cnext = count + 1;

  always @(posedge sig_clk) begin
    if (!rst_n) begin
      count <= CZERO;
      a_vld <= 1'b0;
      a_lst <= 1'b0;
    end else begin
      if (a_vld && a_rdy && a_lst) begin
        a_vld <= 1'b0;
        a_lst <= 1'b0;
        count <= CZERO;
      end else if (start && a_rdy) begin
        a_vld <= 1'b1;
        a_dat <= USE_DUMMY_RADIOS ? {dat_i, dat_q} : $urandom;
        count <= cnext;
      end else if (a_vld && a_rdy) begin
        a_dat <= USE_DUMMY_RADIOS ? {dat_i, dat_q} : $urandom;
        count <= cnext;

        if (cnext == CLAST[CSB:0]) begin
          a_lst <= 1'b1;
        end
      end
    end
  end

  // Count the visibilities that are produced ...
  always @(posedge bus_clk) begin
    if (!rst_n) begin
      dcnt <= 0;
      done <= 1'b0;
    end else begin

      if (b_vld && b_rdy && b_lst) begin
        dcnt <= dcnt + 1;
      end

      if (dcnt == 3) begin
        done <= 1'b1;
      end

    end
  end


  // -- Module Under Test -- //

  reg b_rdy;
  wire vis_start, vis_frame;
  wire b_vld, b_lst;
  wire [31:0] r_dat, i_dat;

  assign a_rdy = start | a_vld;

  always @(posedge bus_clk) begin
    if (!rst_n) begin
      b_rdy <= 1'b0;
    end else begin
      if (b_vld) begin
        b_rdy <= 1'b1;
      end else if (b_vld && b_rdy && b_lst) begin
        b_rdy <= 1'b0;
      end
    end
  end


  toy_correlator #(
      .WIDTH(ANTENNA_NUM),
      .MUX_N(MUX_N),
      .TRATE(TRATE),
      .LOOP0(LOOP0),
      .LOOP1(LOOP1),
      .ACCUM(ACCUM),
      .SBITS(7)
  ) U_TOY1 (
      .sig_clock(sig_clk),
      .areset_n (rst_n),
      .bus_clock(bus_clk),
      .bus_rst_n(rst_n),

      .vis_clock(vis_clk),
      .vis_reset(~rst_n),

      .sig_valid_i(a_vld),
      .sig_last_i (a_lst),
      .sig_idata_i(a_dat[7:4]),
      .sig_qdata_i(a_dat[3:0]),

      .vis_start_o(vis_start),
      .vis_frame_o(vis_frame),

      .bus_revis_o(r_dat),
      .bus_imvis_o(i_dat),
      .bus_valid_o(b_vld),
      .bus_ready_i(b_rdy),
      .bus_last_o (b_lst)
  );


endmodule  // toy_correlator_tb
