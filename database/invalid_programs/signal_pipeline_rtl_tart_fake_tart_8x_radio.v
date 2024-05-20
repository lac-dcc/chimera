// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

`timescale 1ns / 100ps
module fake_tart_8x_radio (
    // Clock and reset from the dev-board
    input clk_26,
    input rst_n,   // 'S2' button for async-reset

    input send_n,  // 'S4' button for telemetry read-back
    output [5:0] leds,

    // Debug UART (via FTDI, '/dev/ttyUSB1')
    input  uart_rx,
    output uart_tx,

    // USB ULPI pins on the dev-board
    input ulpi_clk,
    output ulpi_rst,
    input ulpi_dir,
    input ulpi_nxt,
    output ulpi_stp,
    inout [7:0] ulpi_data
);

  // -- Settings -- //

  localparam ANTENNA_NUM = 8;
  localparam NSB = ANTENNA_NUM - 1;


  // -- Signals & State Registers -- //

  wire usb_clock, usb_reset, usb_ready;
  wire [3:0] cbits;

  // Datapath to/from the controller module
  wire ep1_s_tvalid, ep1_s_tready, ep1_s_tlast, ep1_s_tkeep;
  wire ep1_m_tvalid, ep1_m_tready, ep1_m_tlast, ep1_m_tkeep;
  wire [7:0] ep1_s_tdata, ep1_m_tdata;

  // Data to/from the visibilities module
  wire ep2_s_tvalid, ep2_s_tready, ep2_s_tlast, ep2_s_tkeep;
  wire ep2_m_tvalid, ep2_m_tready, ep2_m_tlast, ep2_m_tkeep;
  wire [7:0] ep2_s_tdata, ep2_m_tdata;


  assign leds = {~cbits, 2'b11};


  //
  //  Fake Radios
  ///
  reg [NSB:0] dat_i = {ANTENNA_NUM{1'b0}}, dat_q = {ANTENNA_NUM{1'b0}};
  wire [NSB:0] sig_i, sig_q;

  genvar ant;
  generate
    for (ant = 0; ant < ANTENNA_NUM; ant = ant + 1) begin
      radio_dummy #(
          .ANT_NUM(ant)
      ) r0 (
          .clk16(clk16),
          .i1(dat_i[ant]),
          .q1(dat_q[ant]),
          .data_i(sig_i[ant]),
          .data_q(sig_q[ant])
      );
    end
  endgenerate

  always @(posedge clk16) begin
    dat_i <= sig_i;
    dat_q <= sig_q;
  end


  //
  //  TART Configuration Module
  ///
  controller U_CONTROL1 (
      .clock_in(sig_clock),
      .ulpi_clk(ulpi_clk),
      .areset_n(rst_n),

      .axi_clk_o(usb_clock),
      .axi_rst_o(usb_reset),

      .cor_clk_o(cor_clock),  // 12x 16.368 MHz
      .cor_rst_o(cor_rst_p),

      .acq_clk_o(acq_clock),
      .tart_reset_o(acq_reset),

      .s_tvalid(ep1_m_tvalid),
      .s_tready(ep1_m_tready),
      .s_tlast (ep1_m_tlast),
      .s_tkeep (ep1_m_tkeep),
      .s_tdata (ep1_m_tdata),

      .m_tvalid(ep1_s_tvalid),
      .m_tready(ep1_s_tready),
      .m_tlast (ep1_s_tlast),
      .m_tkeep (ep1_s_tkeep),
      .m_tdata (ep1_s_tdata),

      .capture_en_o(cap_en),
      .acquire_en_o(acq_en),
      .correlator_o(cor_en),
      .visibility_i(vis_ready)
  );


  //
  //  USB (OPTIONAL, and requires a ULPI PHY)
  ///
  assign ep2_m_tready = 1'b0;

  usb_ulpi_wrapper #(
      .DEBUG(1)
  ) U_USB1 (
      .clk_26(clk_26),
      .rst_n (rst_n),

      // USB ULPI pins on the dev-board
      .ulpi_clk (ulpi_clk),
      .ulpi_rst (ulpi_rst),
      .ulpi_dir (ulpi_dir),
      .ulpi_nxt (ulpi_nxt),
      .ulpi_stp (ulpi_stp),
      .ulpi_data(ulpi_data),

      // Debug UART signals
      .send_ni  (send_n),
      .uart_rx_i(uart_rx),
      .uart_tx_o(uart_tx),

      .configured_o(usb_ready),
      .status_o(cbits),

      // Same clock-domain as the AXI4-Stream ports
      .usb_clk_o(usb_clock),
      .usb_rst_o(usb_reset),

      // USB BULK endpoint #1 //
      .ep1_in_ready_i (bulk_in_ready_q),
      .ep1_out_ready_i(bulk_out_ready_q),

      .m1_tvalid(ep1_m_tvalid),
      .m1_tready(ep1_m_tready),
      .m1_tlast (ep1_m_tlast),
      .m1_tkeep (ep1_m_tkeep),
      .m1_tdata (ep1_m_tdata),

      .s1_tvalid(ep1_s_tvalid),
      .s1_tready(ep1_s_tready),
      .s1_tlast (ep1_s_tlast),
      .s1_tkeep (ep1_s_tkeep),
      .s1_tdata (ep1_s_tdata),

      // USB BULK endpoint #2 //
      .ep2_in_ready_i (1'b0),
      .ep2_out_ready_i(1'b0),

      .m2_tvalid(ep2_m_tvalid),
      .m2_tready(ep2_m_tready),
      .m2_tlast (ep2_m_tlast),
      .m2_tkeep (ep2_m_tkeep),
      .m2_tdata (ep2_m_tdata),

      .s2_tvalid(ep2_s_tvalid),
      .s2_tready(ep2_s_tready),
      .s2_tlast (ep2_s_tlast),
      .s2_tkeep (ep2_s_tkeep),
      .s2_tdata (ep2_s_tdata)
  );


endmodule  // fake_tart_8x_radio
