// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

`timescale 1ns / 100ps
module top #(
    parameter ANTENNAS = 24,
    parameter WB_DATA_BITS = 8
) (
    // -- Global 16.368 MHz clock oscillator -- //
    input CLK_16,
    input clk_26,
    input rst_n,

    // -- SPI interface to the RPi -- //
    input  SCLK,
    output MISO,
    input  MOSI,
    input  CS,

    // -- Radio signals -- //
    output RADIO_RECONFIG,
    input [ANTENNAS-1:0] I1,
    input [ANTENNAS-1:0] Q1,

    // -- USB PHY (ULPI) -- //
    output wire       ulpi_rst,
    input  wire       ulpi_clk,
    input  wire       ulpi_dir,
    input  wire       ulpi_nxt,
    output wire       ulpi_stp,
    inout  wire [7:0] ulpi_data
);

  localparam FPGA_VENDOR = "gowin";
  localparam FPGA_FAMILY = "gw2a";
  localparam [63:0] SERIAL_NUMBER = "FACE0123";

  localparam HIGH_SPEED = 1'b1;
  localparam CHANNEL_IN_ENABLE = 1'b1;
  localparam CHANNEL_OUT_ENABLE = 1'b1;
  localparam PACKET_MODE = 1'b0;

  localparam integer COUNT_VALUE = 13_499_999;  // The number of times needed to time 0.5S


  // -- IOBs -- //

  // -- PLL -- //

  wire axi_clk, axi_lock;
  wire usb_clk, usb_rst_n;
  wire vis_clock, vis_lock, vis_reset;

  // So 27.0 MHz divided by 9, then x40 = 120 MHz.
  gowin_rpll #(
      .FCLKIN("27"),
      .IDIV_SEL(8),  // ~=  9
      .FBDIV_SEL(39),  // ~= 40
      .ODIV_SEL(8)
  ) axi_rpll_inst (
      .clkout(axi_clk),   // 120 MHz
      .lock  (axi_lock),
      .clkin (clk_26)
  );

  // Correlator clock domain runs at 15x the global clock for the radios.
  gowin_rpll #(
      .FCLKIN("16.368"),
      .IDIV_SEL(0),  // ~=  1
      .FBDIV_SEL(14),  // ~= 15
      .ODIV_SEL(8)
  ) vis_rpll_inst (
      .clkout(vis_clock),  // 245.52 MHz
      .lock  (vis_lock),
      .clkin (CLK_16)
  );


  // -- Globalists -- //

  // Synchronous reset signal (when 'HI'), for the AXI clock-domain.
  wire axi_rst;

  sync_reset #(
      .N(2)
  ) axi_sync_reset (
      .clk(axi_clk),
      .rst(~rst_n),
      .out(axi_rst)
  );

  // Synchronous reset (active 'LO') for the correlator unit.
  wire vis_rst_n;

  sync_reset #(
      .N(2)
  ) vis_sync_reset (
      .clk(vis_clock),
      .rst(~rst_n),
      .out(vis_reset)
  );

  // SPI clock, 24.0 MHz.
  wire clock_b;

  gowin_clkdiv #(
      .DIV_MODE("5")
  ) gowin_clkdiv_inst (
      .hclkin(axi_clk),
      .resetn(axi_lock),
      .clkout(clock_b)
  );

  // Synchronous reset (active 'LO') for the SPI unit.
  wire bus_rst_n;

  sync_reset #(
      .N(2)
  ) bus_sync_reset (
      .clk(clock_b),
      .rst(rst_n),
      .out(bus_rst_n)
  );


  // -- Acquisition -- //

  reg [23:0] I_data;
  reg [23:0] Q_data;

  reg [23:0] count_value_reg;  // counter_value
  reg        count_value_flag;  // IO chaneg flag
  reg        RECONFIG_reg = 1'b0;  // Initial state

  assign RADIO_RECONFIG = RECONFIG_reg;

  // Latch the data
  always @(posedge CLK_16) begin
    I_data <= I1;
    Q_data <= Q1;
  end

  always @(posedge CLK_16) begin
    if (count_value_reg <= COUNT_VALUE) begin  //not count to 0.5S
      count_value_reg  <= count_value_reg + 1'b1;  // Continue counting
      count_value_flag <= 1'b0;  // No flip flag
    end else begin  //Count to 0.5S
      count_value_reg <= 23'b0;  // Clear counter,prepare for next time counting.
      count_value_flag <= 1'b1;  // Flip flag
      RECONFIG_reg <= I_data[0];
    end
  end


  // -- SDRAM -- //

  // -- Correlator -- //

  wire vis_start, vis_frame;

  wire spi_stb, spi_ack, spi_cyc, spi_we;
  wire [15:0] spi_adr;
  wire [31:0] spi_real, spi_imag;

  reg spi_wat = 1'b0;
  reg [7:0] spi_dtx;

  always @(posedge clock_b) begin
    case (spi_adr[15:13])
      3'b000:  spi_dtx <= spi_real[31:24];
      3'b001:  spi_dtx <= spi_real[23:16];
      3'b010:  spi_dtx <= spi_real[15:8];
      3'b011:  spi_dtx <= spi_real[7:0];
      3'b100:  spi_dtx <= spi_imag[31:24];
      3'b101:  spi_dtx <= spi_imag[23:16];
      3'b110:  spi_dtx <= spi_imag[15:8];
      3'b111:  spi_dtx <= spi_imag[7:0];
      default: $error("Yuck!");
    endcase
    spi_wat <= ~spi_ack;
  end

  // Calculate visibilities for 4 antennas, with fixed MUX-inputs, for testing.
  toy_correlator #(
      .WIDTH(4),
      .MUX_N(4),
      .TRATE(30),
      .LOOP0(3),
      .LOOP1(5),
      .ACCUM(32),
      .SBITS(7)
  ) tart_correlator_inst (
      .sig_clock(CLK_16),
      .bus_clock(clock_b),
      .bus_rst_n(bus_rst_n),

      .vis_clock(vis_clock),
      .vis_reset(vis_reset),

      .sig_valid_i(axi_lock),
      .sig_last_i (1'b0),
      .sig_idata_i(I_data),
      .sig_qdata_i(Q_data),

      .vis_start_o(vis_start),
      .vis_frame_o(vis_frame),

      .bus_revis_o(spi_real),
      .bus_imvis_o(spi_imag),
      .bus_valid_o(spi_ack),
      .bus_ready_i(spi_stb),
      .bus_last_o ()
  );


  // -- Output SRAM's -- //


  // -- SPI connection to RPi -- //

  localparam integer PIPED = 1;
  localparam integer CHECK = 1;

  wire spi_rty, spi_err;
  wire [7:0] spi_drx;

  wire sys_status;
  wire spi_busy, spi_oflow, spi_uflow;

  wire spi_rst = ~bus_rst_n;

  assign spi_rty = 1'b0;
  assign spi_err = 1'b0;

  spi_slave_wb #(
      .WIDTH(8),
      .ASYNC(1),
      .PIPED(PIPED),
      .CHECK(CHECK)
  ) SPI0 (
      .clk_i(clock_b),
      .rst_i(spi_rst),

      //  Wishbone master interface.
      .cyc_o(spi_cyc),
      .stb_o(spi_stb),
      .we_o (spi_we),
      .ack_i(spi_ack),
      .wat_i(spi_wat),
      .rty_i(spi_rty),
      .err_i(spi_err),
      .adr_o(spi_adr),
      .dat_i(spi_dtx),
      .dat_o(spi_drx),

      .active_o  (spi_busy),
      .status_i  (sys_status),
      .overflow_o(spi_oflow),
      .underrun_o(spi_uflow),

      .SCK_pin(SCLK),
      .MOSI   (MOSI),
      .MISO   (MISO),
      .SSEL   (CS)
  );


  // -- USB ULPI Bulk transfer endpoint (IN & OUT) -- //

  wire ulpi_data_t;
  wire [7:0] ulpi_data_o;

  assign ulpi_rst  = usb_rst_n;
  assign usb_clk   = ~ulpi_clk;
  assign ulpi_data = ulpi_data_t ? {8{1'bz}} : ulpi_data_o;

  wire s_tvalid, s_tready, s_tlast;
  wire [7:0] s_tdata;

  wire m_tvalid, m_tready, m_tlast;
  wire [7:0] m_tdata;

  ulpi_bulk_axis #(
      .FPGA_VENDOR(FPGA_VENDOR),
      .FPGA_FAMILY(FPGA_FAMILY),
      .HIGH_SPEED(HIGH_SPEED),
      .SERIAL_NUMBER(SERIAL_NUMBER),
      .CHANNEL_IN_ENABLE(CHANNEL_IN_ENABLE),
      .CHANNEL_OUT_ENABLE(CHANNEL_OUT_ENABLE),
      .PACKET_MODE(PACKET_MODE)
  ) ulpi_bulk_axis_inst (
      .ulpi_clock_i(usb_clk),
      .ulpi_reset_o(usb_rst_n),

      .ulpi_dir_i (ulpi_dir),
      .ulpi_nxt_i (ulpi_nxt),
      .ulpi_stp_o (ulpi_stp),
      .ulpi_data_t(ulpi_data_t),
      .ulpi_data_i(ulpi_data),
      .ulpi_data_o(ulpi_data_o),

      .aclk(axi_clk),
      .aresetn(~axi_rst),

      .s_axis_tvalid_i(s_tvalid),
      .s_axis_tready_o(s_tready),
      .s_axis_tlast_i (s_tlast),
      .s_axis_tdata_i (s_tdata),

      .m_axis_tvalid_o(m_tvalid),
      .m_axis_tready_i(m_tready),
      .m_axis_tlast_o (m_tlast),
      .m_axis_tdata_o (m_tdata)
  );


  // -- Just echo/loop IN <-> OUT -- //

  // todo: switch to the synchronous FIFO core, and use a BSRAM for the memory.
  // `define __USE_ALEX_FIFO
`ifdef __USE_ALEX_FIFO
  axis_async_fifo #(
      .DEPTH(16),
      .DATA_WIDTH(8),
      .LAST_ENABLE(1),
      .ID_ENABLE(0),
      .DEST_ENABLE(0),
      .USER_ENABLE(0),
      .RAM_PIPELINE(1),
      .OUTPUT_FIFO_ENABLE(0),
      .FRAME_FIFO(0)
  ) axis_async_fifo_inst (
      .s_clk(axi_clk),
      .s_rst(axi_rst),
      .s_axis_tdata(m_tdata),
      .s_axis_tkeep('bx),
      .s_axis_tvalid(m_tvalid),
      .s_axis_tready(m_tready),
      .s_axis_tlast(m_tlast),
      .s_axis_tid('bx),
      .s_axis_tdest('bx),
      .s_axis_tuser('bx),

      .m_clk(axi_clk),
      .m_rst(axi_rst),
      .m_axis_tdata(s_tdata),
      .m_axis_tkeep(),
      .m_axis_tvalid(s_tvalid),
      .m_axis_tready(s_tready),
      .m_axis_tlast(s_tlast),
      .m_axis_tid(),
      .m_axis_tdest(),
      .m_axis_tuser(),

      .s_pause_req(1'b0),
      .s_pause_ack(),
      .m_pause_req(1'b0),
      .m_pause_ack(),

      .s_status_depth(),
      .s_status_depth_commit(),
      .s_status_overflow(),
      .s_status_bad_frame(),
      .s_status_good_frame(),

      .m_status_depth(),
      .m_status_depth_commit(),
      .m_status_overflow(),
      .m_status_bad_frame(),
      .m_status_good_frame()
  );
`else  // Paddy FIFO
  axis_afifo #(
      .WIDTH(8),
      .ABITS(4)
  ) axis_afifo_inst (
      .s_aresetn(rst_n),

      .s_aclk    (axi_clk),
      .s_tvalid_i(m_tvalid),
      .s_tready_o(m_tready),
      .s_tlast_i (m_tlast),
      .s_tdata_i (m_tdata),

      .m_aclk    (axi_clk),
      .m_tvalid_o(s_tvalid),
      .m_tready_i(s_tready),
      .m_tlast_o (s_tlast),
      .m_tdata_o (s_tdata)
  );
`endif

endmodule  // top
