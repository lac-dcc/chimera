// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

`timescale 1ns / 1ps
module axis_async_fifo_tb;

  // Parameters
  parameter DEPTH = 4;
  parameter DATA_WIDTH = 8;
  parameter KEEP_ENABLE = 0;
  parameter KEEP_WIDTH = (DATA_WIDTH / 8);
  parameter LAST_ENABLE = 1;
  parameter ID_ENABLE = 0;
  parameter ID_WIDTH = 8;
  parameter DEST_ENABLE = 0;
  parameter DEST_WIDTH = 8;
  parameter USER_ENABLE = 0;
  parameter USER_WIDTH = 1;
  parameter RAM_PIPELINE = 1;
  parameter FRAME_FIFO = 0;
  parameter USER_BAD_FRAME_VALUE = 1'b1;
  parameter USER_BAD_FRAME_MASK = 1'b1;
  parameter DROP_BAD_FRAME = 0;
  parameter DROP_WHEN_FULL = 0;

  // Inputs
  reg async_rst = 0;
  reg s_clk = 0;
  reg m_clk = 0;

  always #3.5 s_clk <= ~s_clk;
  always #5.0 m_clk <= ~m_clk;


  reg [7:0] current_test = 0;

  reg [DATA_WIDTH-1:0] s_axis_tdata = 0;
  reg [KEEP_WIDTH-1:0] s_axis_tkeep = 0;
  reg s_axis_tvalid = 0;
  reg s_axis_tlast = 0;
  reg [ID_WIDTH-1:0] s_axis_tid = 0;
  reg [DEST_WIDTH-1:0] s_axis_tdest = 0;
  reg [USER_WIDTH-1:0] s_axis_tuser = 0;
  reg m_axis_tready = 0;

  // Outputs
  wire s_axis_tready;
  wire [DATA_WIDTH-1:0] m_axis_tdata;
  wire [KEEP_WIDTH-1:0] m_axis_tkeep;
  wire m_axis_tvalid;
  wire m_axis_tlast;
  wire [ID_WIDTH-1:0] m_axis_tid;
  wire [DEST_WIDTH-1:0] m_axis_tdest;
  wire [USER_WIDTH-1:0] m_axis_tuser;


  initial begin
    $dumpfile("../vcd/axis_async_fifo_tb.vcd");
    $dumpvars;

    #10 async_rst <= 1'b1;
    #95 async_rst <= 1'b0;

    #30 s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    s_axis_tdata <= $urandom;

    #7 while(!s_axis_tready) #7;
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    s_axis_tdata <= 8'bx;

    #10 m_axis_tready <= 1'b1;
    #10 while (!m_axis_tvalid) #10;
    #10 m_axis_tready <= 1'b0;

    #40 $finish;
  end


  // Safety-valve
  initial #6000 $finish;


  // -- Module Under Test -- //

  axis_async_fifo #(
      .DEPTH(DEPTH),
      .DATA_WIDTH(DATA_WIDTH),
      .KEEP_ENABLE(KEEP_ENABLE),
      .KEEP_WIDTH(KEEP_WIDTH),
      .LAST_ENABLE(LAST_ENABLE),
      .ID_ENABLE(ID_ENABLE),
      .ID_WIDTH(ID_WIDTH),
      .DEST_ENABLE(DEST_ENABLE),
      .DEST_WIDTH(DEST_WIDTH),
      .USER_ENABLE(USER_ENABLE),
      .USER_WIDTH(USER_WIDTH),
      .RAM_PIPELINE(RAM_PIPELINE),
      .FRAME_FIFO(FRAME_FIFO),
      .USER_BAD_FRAME_VALUE(USER_BAD_FRAME_VALUE),
      .USER_BAD_FRAME_MASK(USER_BAD_FRAME_MASK),
      .DROP_BAD_FRAME(DROP_BAD_FRAME),
      .DROP_WHEN_FULL(DROP_WHEN_FULL)
  ) axis_async_fifo_inst (
      // AXI input
      .s_clk(s_clk),
      .s_rst(async_rst),
      .s_axis_tdata(s_axis_tdata),
      .s_axis_tkeep(s_axis_tkeep),
      .s_axis_tvalid(s_axis_tvalid),
      .s_axis_tready(s_axis_tready),
      .s_axis_tlast(s_axis_tlast),
      .s_axis_tid(s_axis_tid),
      .s_axis_tdest(s_axis_tdest),
      .s_axis_tuser(s_axis_tuser),

      // AXI output
      .m_clk(m_clk),
      .m_rst(async_rst),
      .m_axis_tdata(m_axis_tdata),
      .m_axis_tkeep(m_axis_tkeep),
      .m_axis_tvalid(m_axis_tvalid),
      .m_axis_tready(m_axis_tready),
      .m_axis_tlast(m_axis_tlast),
      .m_axis_tid(m_axis_tid),
      .m_axis_tdest(m_axis_tdest),
      .m_axis_tuser(m_axis_tuser),

      .s_pause_req(1'b0),
      .m_pause_req(1'b0),

      // Status
      .s_status_overflow(),
      .s_status_bad_frame(),
      .s_status_good_frame(),
      .m_status_overflow(),
      .m_status_bad_frame(),
      .m_status_good_frame()
  );

endmodule  // axis_async_fifo_tb
