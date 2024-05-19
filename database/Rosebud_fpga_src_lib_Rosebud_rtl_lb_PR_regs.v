// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

  // Register inputs and outputs
  wire [IF_COUNT*DATA_WIDTH-1:0]     data_s_axis_tdata_r;
  wire [IF_COUNT*STRB_WIDTH-1:0]     data_s_axis_tkeep_r;
  wire [IF_COUNT*ID_TAG_WIDTH-1:0]   data_s_axis_tuser_r;
  wire [IF_COUNT-1:0]                data_s_axis_tvalid_r;
  wire [IF_COUNT-1:0]                data_s_axis_tready_r;
  wire [IF_COUNT-1:0]                data_s_axis_tlast_r;

  wire [IF_COUNT*DATA_WIDTH-1:0]     data_m_axis_tdata_n;
  wire [IF_COUNT*STRB_WIDTH-1:0]     data_m_axis_tkeep_n;
  wire [IF_COUNT*ID_TAG_WIDTH-1:0]   data_m_axis_tdest_n;
  wire [IF_COUNT*PORT_WIDTH-1:0]     data_m_axis_tuser_n;
  wire [IF_COUNT-1:0]                data_m_axis_tvalid_n;
  wire [IF_COUNT-1:0]                data_m_axis_tready_n;
  wire [IF_COUNT-1:0]                data_m_axis_tlast_n;

  wire [IF_COUNT*DATA_WIDTH-1:0]     rx_axis_tdata_r;
  wire [IF_COUNT*STRB_WIDTH-1:0]     rx_axis_tkeep_r;
  wire [IF_COUNT-1:0]                rx_axis_tvalid_r;
  wire [IF_COUNT-1:0]                rx_axis_tready_r;
  wire [IF_COUNT-1:0]                rx_axis_tlast_r;
  reg  [IF_COUNT*RX_LINES_WIDTH-1:0] rx_axis_line_count_r;

  wire [IF_COUNT*DATA_WIDTH-1:0]     tx_axis_tdata_n;
  wire [IF_COUNT*STRB_WIDTH-1:0]     tx_axis_tkeep_n;
  wire [IF_COUNT-1:0]                tx_axis_tvalid_n;
  wire [IF_COUNT-1:0]                tx_axis_tready_n;
  wire [IF_COUNT-1:0]                tx_axis_tlast_n;

  wire [CTRL_WIDTH-1:0]              ctrl_s_axis_tdata_r;
  wire                               ctrl_s_axis_tvalid_r;
  wire                               ctrl_s_axis_tready_r;
  wire [CORE_ID_WIDTH-1:0]           ctrl_s_axis_tuser_r;

  wire [CTRL_WIDTH-1:0]              ctrl_m_axis_tdata_n;
  wire                               ctrl_m_axis_tvalid_n;
  wire                               ctrl_m_axis_tready_n;
  wire [CORE_ID_WIDTH-1:0]           ctrl_m_axis_tdest_n;

  genvar q;
  generate
    for (q=0; q<IF_COUNT; q=q+1) begin: int_regs

      /// *** INPUT AND OUTPUT DATA LINE REGISTERS FOR BETTER TIMING *** ///
      axis_pipeline_register # (
        .DATA_WIDTH(DATA_WIDTH),
        .KEEP_ENABLE(1),
        .KEEP_WIDTH(STRB_WIDTH),
        .LAST_ENABLE(1),
        .ID_ENABLE(0),
        .DEST_ENABLE(0),
        .USER_ENABLE(1),
        .USER_WIDTH(ID_TAG_WIDTH),
        .REG_TYPE((DATA_S_RLEN==0) ? 0 : 2),
        .LENGTH  ((DATA_S_RLEN==0) ? 1 : DATA_S_RLEN)
      ) data_s_reg_inst (
        .clk(clk),
        .rst(rst_r),
        // AXI input
        .s_axis_tdata (data_s_axis_tdata[q*DATA_WIDTH +: DATA_WIDTH]),
        .s_axis_tkeep (data_s_axis_tkeep[q*STRB_WIDTH +: STRB_WIDTH]),
        .s_axis_tvalid(data_s_axis_tvalid[q]),
        .s_axis_tready(data_s_axis_tready[q]),
        .s_axis_tlast (data_s_axis_tlast[q]),
        .s_axis_tid   (8'd0),
        .s_axis_tdest (8'd0),
        .s_axis_tuser (data_s_axis_tuser[q*ID_TAG_WIDTH +: ID_TAG_WIDTH]),
        // AXI output
        .m_axis_tdata (data_s_axis_tdata_r[q*DATA_WIDTH +: DATA_WIDTH]),
        .m_axis_tkeep (data_s_axis_tkeep_r[q*STRB_WIDTH +: STRB_WIDTH]),
        .m_axis_tvalid(data_s_axis_tvalid_r[q]),
        .m_axis_tready(data_s_axis_tready_r[q]),
        .m_axis_tlast (data_s_axis_tlast_r[q]),
        .m_axis_tid   (),
        .m_axis_tdest (),
        .m_axis_tuser (data_s_axis_tuser_r[q*ID_TAG_WIDTH +: ID_TAG_WIDTH])
      );

      axis_pipeline_register # (
        .DATA_WIDTH(DATA_WIDTH),
        .KEEP_ENABLE(1),
        .KEEP_WIDTH(STRB_WIDTH),
        .LAST_ENABLE(1),
        .ID_ENABLE(0),
        .DEST_ENABLE(0),
        .USER_ENABLE(0),
        .REG_TYPE((TX_RLEN==0) ? 0 : 2),
        .LENGTH  ((TX_RLEN==0) ? 1 : TX_RLEN)
      ) tx_reg_inst (
        .clk(clk),
        .rst(rst_r),
        // AXI input
        .s_axis_tdata (tx_axis_tdata_n[q*DATA_WIDTH +: DATA_WIDTH]),
        .s_axis_tkeep (tx_axis_tkeep_n[q*STRB_WIDTH +: STRB_WIDTH]),
        .s_axis_tvalid(tx_axis_tvalid_n[q]),
        .s_axis_tready(tx_axis_tready_n[q]),
        .s_axis_tlast (tx_axis_tlast_n[q]),
        .s_axis_tid   (8'd0),
        .s_axis_tdest (8'd0),
        .s_axis_tuser (1'b0),
        // AXI output
        .m_axis_tdata (tx_axis_tdata[q*DATA_WIDTH +: DATA_WIDTH]),
        .m_axis_tkeep (tx_axis_tkeep[q*STRB_WIDTH +: STRB_WIDTH]),
        .m_axis_tvalid(tx_axis_tvalid[q]),
        .m_axis_tready(tx_axis_tready[q]),
        .m_axis_tlast (tx_axis_tlast[q]),
        .m_axis_tid   (),
        .m_axis_tdest (),
        .m_axis_tuser ()
      );

      axis_pipeline_register # (
        .DATA_WIDTH(DATA_WIDTH),
        .KEEP_ENABLE(1),
        .KEEP_WIDTH(STRB_WIDTH),
        .LAST_ENABLE(1),
        .ID_ENABLE(0),
        .DEST_ENABLE(1),
        .DEST_WIDTH(ID_TAG_WIDTH),
        .USER_ENABLE(1),
        .USER_WIDTH(PORT_WIDTH),
        .REG_TYPE((DATA_M_RLEN==0) ? 0 : 2),
        .LENGTH  ((DATA_M_RLEN==0) ? 1 : DATA_M_RLEN)
      ) data_m_reg_inst (
        .clk(clk),
        .rst(rst_r),
        // AXI input
        .s_axis_tdata (data_m_axis_tdata_n[q*DATA_WIDTH +: DATA_WIDTH]),
        .s_axis_tkeep (data_m_axis_tkeep_n[q*STRB_WIDTH +: STRB_WIDTH]),
        .s_axis_tvalid(data_m_axis_tvalid_n[q]),
        .s_axis_tready(data_m_axis_tready_n[q]),
        .s_axis_tlast (data_m_axis_tlast_n[q]),
        .s_axis_tid   (8'd0),
        .s_axis_tdest (data_m_axis_tdest_n[q*ID_TAG_WIDTH +: ID_TAG_WIDTH]),
        .s_axis_tuser (data_m_axis_tuser_n[q*PORT_WIDTH +: PORT_WIDTH]),
        // AXI output
        .m_axis_tdata (data_m_axis_tdata[q*DATA_WIDTH +: DATA_WIDTH]),
        .m_axis_tkeep (data_m_axis_tkeep[q*STRB_WIDTH +: STRB_WIDTH]),
        .m_axis_tvalid(data_m_axis_tvalid[q]),
        .m_axis_tready(data_m_axis_tready[q]),
        .m_axis_tlast (data_m_axis_tlast[q]),
        .m_axis_tid   (),
        .m_axis_tdest (data_m_axis_tdest[q*ID_TAG_WIDTH +: ID_TAG_WIDTH]),
        .m_axis_tuser (data_m_axis_tuser[q*PORT_WIDTH +: PORT_WIDTH])
      );

      axis_pipeline_register # (
        .DATA_WIDTH(DATA_WIDTH),
        .KEEP_ENABLE(1),
        .KEEP_WIDTH(STRB_WIDTH),
        .LAST_ENABLE(1),
        .ID_ENABLE(0),
        .DEST_ENABLE(0),
        .USER_ENABLE(0),
        .REG_TYPE((RX_RLEN==0) ? 0 : 2),
        .LENGTH  ((RX_RLEN==0) ? 1 : RX_RLEN)
      ) rx_reg_inst (
        .clk(clk),
        .rst(rst_r),
        // AXI input
        .s_axis_tdata (rx_axis_tdata[q*DATA_WIDTH +: DATA_WIDTH]),
        .s_axis_tkeep (rx_axis_tkeep[q*STRB_WIDTH +: STRB_WIDTH]),
        .s_axis_tvalid(rx_axis_tvalid[q]),
        .s_axis_tready(rx_axis_tready[q]),
        .s_axis_tlast (rx_axis_tlast[q]),
        .s_axis_tid   (8'd0),
        .s_axis_tdest (8'd0),
        .s_axis_tuser (1'b0),
        // AXI output
        .m_axis_tdata (rx_axis_tdata_r[q*DATA_WIDTH +: DATA_WIDTH]),
        .m_axis_tkeep (rx_axis_tkeep_r[q*STRB_WIDTH +: STRB_WIDTH]),
        .m_axis_tvalid(rx_axis_tvalid_r[q]),
        .m_axis_tready(rx_axis_tready_r[q]),
        .m_axis_tlast (rx_axis_tlast_r[q]),
        .m_axis_tid   (),
        .m_axis_tdest (),
        .m_axis_tuser ()
      );

    end
  endgenerate

  /// *** CTRL PATH REGISTERS FOR BETTER TIMING *** ///
  axis_register # (
    .DATA_WIDTH(CTRL_WIDTH),
    .KEEP_ENABLE(0),
    .KEEP_WIDTH(1),
    .LAST_ENABLE(0),
    .ID_ENABLE(0),
    .DEST_ENABLE(0),
    .USER_ENABLE(1),
    .USER_WIDTH(CORE_ID_WIDTH),
    .REG_TYPE(2)
  ) ctrl_s_reg_inst (
    .clk(clk),
    .rst(rst),
    // AXI input
    .s_axis_tdata (ctrl_s_axis_tdata),
    .s_axis_tkeep (1'b1),
    .s_axis_tvalid(ctrl_s_axis_tvalid),
    .s_axis_tready(ctrl_s_axis_tready),
    .s_axis_tlast (1'b1),
    .s_axis_tid   (8'd0),
    .s_axis_tdest (8'd0),
    .s_axis_tuser (ctrl_s_axis_tuser),
    // AXI output
    .m_axis_tdata (ctrl_s_axis_tdata_r),
    .m_axis_tkeep (),
    .m_axis_tvalid(ctrl_s_axis_tvalid_r),
    .m_axis_tready(ctrl_s_axis_tready_r),
    .m_axis_tlast (),
    .m_axis_tid   (),
    .m_axis_tdest (),
    .m_axis_tuser (ctrl_s_axis_tuser_r)
  );

  axis_register # (
    .DATA_WIDTH(CTRL_WIDTH),
    .KEEP_ENABLE(0),
    .KEEP_WIDTH(1),
    .LAST_ENABLE(0),
    .ID_ENABLE(0),
    .DEST_ENABLE(1),
    .DEST_WIDTH(CORE_ID_WIDTH),
    .USER_ENABLE(0),
    .REG_TYPE(2)
  ) ctrl_m_reg_inst (
    .clk(clk),
    .rst(rst),
    // AXI input
    .s_axis_tdata (ctrl_m_axis_tdata_n),
    .s_axis_tkeep (1'b1),
    .s_axis_tvalid(ctrl_m_axis_tvalid_n),
    .s_axis_tready(ctrl_m_axis_tready_n),
    .s_axis_tlast (1'b1),
    .s_axis_tid   (8'd0),
    .s_axis_tdest (ctrl_m_axis_tdest_n),
    .s_axis_tuser (1'b0),
    // AXI output
    .m_axis_tdata (ctrl_m_axis_tdata),
    .m_axis_tkeep (),
    .m_axis_tvalid(ctrl_m_axis_tvalid),
    .m_axis_tready(ctrl_m_axis_tready),
    .m_axis_tlast (),
    .m_axis_tid   (),
    .m_axis_tdest (ctrl_m_axis_tdest),
    .m_axis_tuser ()
  );

  reg  [28:0]               host_cmd_r;
  reg                       host_cmd_for_ints_r;
  reg  [31:0]               host_cmd_wr_data_r;
  wire [31:0]               host_cmd_rd_data_n;
  reg  [31:0]               host_cmd_rd_data_nr;
  reg                       host_cmd_wr_en_r;

  always @ (posedge clk) begin
    rx_axis_line_count_r <= rx_axis_line_count;
    host_cmd_r           <= host_cmd;
    host_cmd_for_ints_r  <= host_cmd_for_ints;
    host_cmd_wr_data_r   <= host_cmd_wr_data;
    host_cmd_rd_data_nr  <= host_cmd_rd_data_n;
    host_cmd_wr_en_r     <= host_cmd_wr_en;

    if (rst)
      host_cmd_wr_en_r <= 1'b0;
  end

  assign host_cmd_rd_data = host_cmd_rd_data_nr;

