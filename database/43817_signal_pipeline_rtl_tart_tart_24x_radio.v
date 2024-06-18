// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

`timescale 1ns / 100ps
module tart_24x_radio (
    input sig_clock,  //     16.368 MHz
    input areset_n,

    output [5:0] leds,

    input [23:0] sig_data,

    input  SCK,
    input  SSEL,
    input  MOSI,
    output MISO,

    input  UART_RX,
    output UART_TX
);

  // Correlator-source pairs, for each of the 12x time-slices, and for each of
  // the 24x correlators.
  // Todo:
  //  - write a script that converts these to 'xSELS', and 'xTAPS';
  //  - figure out the required MUX-widths;
  parameter PAIRS00_00 = {120'h5854148501384c15814048100380c0};
  parameter PAIRS00_01 = {120'h58d4348d0338cc35894248902388c2};
  parameter PAIRS00_02 = {120'h5954549505394c55914449104390c4};
  parameter PAIRS00_03 = {120'h398205994649906398a02006010020};
  parameter PAIRS01_00 = {120'h88601785c16858188200781c068180};
  parameter PAIRS01_01 = {120'h88e0378dc368d8388a02789c268982};
  parameter PAIRS01_02 = {120'h89605795c56958589204791c469184};
  parameter PAIRS01_03 = {120'h6b0628b20c7b1cc6b0622848118441};
  parameter PAIRS02_00 = {120'hb86c1a868198641b82c0a828098240};
  parameter PAIRS02_01 = {120'hb8ec3a8e8398e43b8ac2a8a8298a42};
  parameter PAIRS02_02 = {120'hb96c5a968599645b92c4a928499244};
  parameter PAIRS02_03 = {120'h9c8a4bcad2aca929c8a428c8328882};
  parameter PAIRS03_00 = {120'h89e0779dc769d8789a06799c669986};
  parameter PAIRS03_01 = {120'h8a6097a5c96a5898a2087a1c86a188};
  parameter PAIRS03_02 = {120'h8ae0b7adcb6ad8b8aa0a7a9ca6a98a};
  parameter PAIRS03_03 = {120'h8c1287ba2d835ed7352859d4749d07};
  parameter PAIRS04_00 = {120'hb9ec7a9e8799e47b9ac6a9a8699a46};
  parameter PAIRS04_01 = {120'hba6c9aa6899a649ba2c8aa2889a248};
  parameter PAIRS04_02 = {120'hbaecbaae8b9ae4bbaacaaaa8a9aa4a};
  parameter PAIRS04_03 = {120'had16aad2f3b4eb3a4d6a5a5495a148};
  parameter PAIRS05_00 = {120'hbb6cdab68d9b64dbb2ccab28c9b24c};
  parameter PAIRS05_01 = {120'hbbecfabe8f9be4fbbaceaba8e9ba4e};
  parameter PAIRS05_02 = {120'hbc6d1ac6919c651bc2d0ac2909c250};
  parameter PAIRS05_03 = {120'hbd9eebdaf5b56f4b52308be0f8ba0e};


  // -- Signals & State -- //

  wire clock, reset;
  wire acq_clock, ack_reset;
  wire cor_clock, cor_rst_p, cor_rst_n;

  wire cap_en, acq_en, cor_en;
  wire vis_ready;

  wire [23:0] itdata_w, qtdata_w;

  wire x_tvalid_w, x_tready_w, x_tlast_w;
  wire [7:0] x_tdata_w;


  assign cor_rst_n = ~cor_rst_p;


  controller U_CONTROL1 (
      .clock_in(sig_clock),
      .ulpi_clk(1'b0),
      .areset_n(areset_n),

      .axi_clk_o(clock),
      .axi_rst_o(reset),

      .cor_clk_o(cor_clock),  // 12x 16.368 MHz
      .cor_rst_o(cor_rst_p),

      .acq_clk_o(acq_clock),
      .tart_reset_o(acq_reset),

      /*
      .s_tvalid(r_tvalid_w),
      .s_tready(r_tready_w),
      .s_tlast (r_tlast_w),
      .s_tdata (r_tdata_w),
*/

      .capture_en_o(cap_en),
      .acquire_en_o(acq_en),
      .correlator_o(cor_en),
      .visibility_i(vis_ready)
  );

  fake_hilbert #(
      .WIDTH(24)
  ) U_FAKE_HILBERT1 (
      .clock_i(acq_clock),
      .reset_i(acq_rst_p),

      .enable_i(cap_en),   // input source & framing signals
      .strobe_i(cap_en),
      .signal_i(sig_data),

      .locked_o(tvalid),
      .strobe_o(),          // new `antenna` sample next cycle
      .framed_o(tlast),     // last cycle of sample
      .sig_re_o(itdata_w),
      .sig_im_o(qtdata_w)
  );

  correlator_24x_radio U_CORRELATOR1 (
      .sig_clock(acq_clock),
      .sig_reset(acq_reset),
      .vis_clock(cor_clock),
      .vis_rst_n(cor_rst_n),

      .capture_i  (cap_en),
      .correlate_i(cor_en),

      .sig_tvalid_i(tvalid),
      .sig_tlast_i (tlast),
      .sig_itdata_i(itdata_w),
      .sig_qtdata_i(qtdata_w),

      .m_tvalid(x_tvalid_w),
      .m_tready(x_tready_w),
      .m_tlast (x_tlast_w),
      .m_tdata (x_tdata_w)
  );


  // Needs to be able to store 2x 576x 32-bit visibilities
  localparam integer BULK_FIFO_SIZE = 8192;

  wire t_tvalid_w, t_tready_w, t_tlast_w;
  wire [7:0] t_tdata_w;
  wire r_tvalid_w, r_tready_w, r_tlast_w;
  wire [7:0] r_tdata_w;

  axis_fifo #(
      .DEPTH(BULK_FIFO_SIZE),
      .DATA_WIDTH(8),
      .KEEP_ENABLE(0),
      .KEEP_WIDTH(1),
      .LAST_ENABLE(1),
      .ID_ENABLE(0),
      .ID_WIDTH(1),
      .DEST_ENABLE(0),
      .DEST_WIDTH(1),
      .USER_ENABLE(0),
      .USER_WIDTH(1),
      .RAM_PIPELINE(1),
      .OUTPUT_FIFO_ENABLE(0),
      .FRAME_FIFO(0),
      .USER_BAD_FRAME_VALUE(0),
      .USER_BAD_FRAME_MASK(0),
      .DROP_BAD_FRAME(0),
      .DROP_WHEN_FULL(0)
  ) U_BULK_FIFO0 (
      .clk(clock),
      .rst(reset),

      .s_axis_tdata (x_tdata_w),  // AXI4-Stream input
      .s_axis_tkeep (1'b1),
      .s_axis_tvalid(x_tvalid_w),
      .s_axis_tready(x_tready_w),
      .s_axis_tlast (x_tlast_w),
      .s_axis_tid   (1'b0),
      .s_axis_tdest (1'b0),
      .s_axis_tuser (1'b0),

      .pause_req(1'b0),

      .m_axis_tdata(t_tdata_w),  // AXI4-Stream output
      .m_axis_tkeep(),
      .m_axis_tvalid(t_tvalid_w),
      .m_axis_tready(t_tready_w),
      .m_axis_tlast(t_tlast_w),
      .m_axis_tid(),
      .m_axis_tdest(),
      .m_axis_tuser(),

      .status_depth(),  // Status
      .status_overflow(),
      .status_bad_frame(),
      .status_good_frame()
  );


  axis_spi_target U_SPI_TARGET1 (
      .clock(clock),
      .reset(reset),

      .SCK_pin(SCK),
      .SSEL(SSEL),
      .MOSI(MOSI),
      .MISO(MISO),

      .s_tvalid(t_tvalid_w),
      .s_tready(t_tready_w),
      .s_tlast (t_tlast_w),
      .s_tdata (t_tdata_w),

      .m_tvalid(r_tvalid_w),
      .m_tready(r_tready_w),
      .m_tlast (r_tlast_w),
      .m_tdata (r_tdata_w)
  );


endmodule  // tart_24x_radio
