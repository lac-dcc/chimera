// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

  // Register inputs and outputs
  wire                  dma_cmd_wr_en_r;
  wire [25:0]           dma_cmd_wr_addr_r;
  wire                  dma_cmd_hdr_wr_en_r;
  wire [23:0]           dma_cmd_hdr_wr_addr_r;
  wire [DATA_WIDTH-1:0] dma_cmd_wr_data_r;
  wire [STRB_WIDTH-1:0] dma_cmd_wr_strb_r;
  wire                  dma_cmd_wr_last_r;
  wire                  dma_cmd_wr_ready_r;

  pipe_register # (
    .WIDTH(DATA_WIDTH+24+26+STRB_WIDTH+2)
  ) dma_wr_reg (
    .clk(clk),
    .rst(rst_r),

    .din     ({dma_cmd_wr_data, dma_cmd_wr_addr, dma_cmd_hdr_wr_addr,
               dma_cmd_hdr_wr_en, dma_cmd_wr_strb, dma_cmd_wr_last}),
    .din_valid(dma_cmd_wr_en),
    .din_ready(dma_cmd_wr_ready),

    .dout     ({dma_cmd_wr_data_r, dma_cmd_wr_addr_r, dma_cmd_hdr_wr_addr_r,
                dma_cmd_hdr_wr_en_r, dma_cmd_wr_strb_r, dma_cmd_wr_last_r}),
    .dout_valid(dma_cmd_wr_en_r),
    .dout_ready(dma_cmd_wr_ready_r)
  );

  wire        dma_cmd_rd_en_r;
  wire [25:0] dma_cmd_rd_addr_r;
  wire        dma_cmd_rd_last_r;
  wire        dma_cmd_rd_ready_r;

  pipe_register # (
    .WIDTH(26+1)
  ) dma_rd_reg (
    .clk(clk),
    .rst(rst_r),

    .din     ({dma_cmd_rd_addr,dma_cmd_rd_last}),
    .din_valid(dma_cmd_rd_en),
    .din_ready(dma_cmd_rd_ready),

    .dout     ({dma_cmd_rd_addr_r,dma_cmd_rd_last_r}),
    .dout_valid(dma_cmd_rd_en_r),
    .dout_ready(dma_cmd_rd_ready_r)
  );

  wire                  dma_rd_resp_valid_n;
  wire [DATA_WIDTH-1:0] dma_rd_resp_data_n;
  wire                  dma_rd_resp_ready_n;

  pipe_register # (
    .WIDTH(DATA_WIDTH)
  ) dma_rd_resp_reg (
    .clk(clk),
    .rst(rst_r),

    .din      (dma_rd_resp_data_n),
    .din_valid(dma_rd_resp_valid_n),
    .din_ready(dma_rd_resp_ready_n),

    .dout      (dma_rd_resp_data),
    .dout_valid(dma_rd_resp_valid),
    .dout_ready(dma_rd_resp_ready)
  );

  wire [63:0] in_desc_r;
  wire        in_desc_valid_r;
  wire        in_desc_taken_r;

  pipe_register # (
    .WIDTH(64)
  ) in_desc_reg (
    .clk(clk),
    .rst(rst_r || core_reset_r),

    .din      (in_desc),
    .din_valid(in_desc_valid),
    .din_ready(in_desc_taken),

    .dout      (in_desc_r),
    .dout_valid(in_desc_valid_r),
    .dout_ready(in_desc_taken_r)
  );

  wire [63:0] out_desc_n;
  wire        out_desc_2nd_n;
  wire        out_desc_valid_n;
  wire        out_desc_ready_n;

  pipe_register # (
    .WIDTH(65)
  ) out_desc_reg (
    .clk(clk),
    .rst(rst_r || core_reset_r),

    .din     ({out_desc_2nd_n,out_desc_n}),
    .din_valid(out_desc_valid_n),
    .din_ready(out_desc_ready_n),

    .dout     ({out_desc_2nd,out_desc}),
    .dout_valid(out_desc_valid),
    .dout_ready(out_desc_ready)
  );

  wire [MSG_WIDTH-1:0]  bc_msg_in_r;
  wire                  bc_msg_in_valid_r;

  pipe_register # (
    .WIDTH(MSG_WIDTH)
  ) bc_msg_in_reg (
    .clk(clk),
    .rst(rst_r || core_reset_r),

    .din      (bc_msg_in),
    .din_valid(bc_msg_in_valid),
    .din_ready(),

    .dout      (bc_msg_in_r),
    .dout_valid(bc_msg_in_valid_r),
    .dout_ready(1'b1)
  );

  wire [MSG_WIDTH-1:0]  bc_msg_out_n;
  wire                  bc_msg_out_valid_n;
  wire                  bc_msg_out_ready_n;

  pipe_register # (
    .WIDTH(MSG_WIDTH)
  ) bc_msg_out_reg (
    .clk(clk),
    .rst(rst_r),

    .din      (bc_msg_out_n),
    .din_valid(bc_msg_out_valid_n),
    .din_ready(bc_msg_out_ready_n),

    .dout      (bc_msg_out),
    .dout_valid(bc_msg_out_valid),
    .dout_ready(bc_msg_out_ready)
  );

  reg  [31:0] intercon_status_data_r;
  reg  [2:0]  intercon_status_addr_r;
  wire [31:0]  rpu_status_data_n;
  wire [2:0]   rpu_status_addr_n;

  always @ (posedge clk) begin
    intercon_status_data_r <= intercon_status_data;
    intercon_status_addr_r <= intercon_status_addr;
    rpu_status_data      <= rpu_status_data_n;
    rpu_status_addr      <= rpu_status_addr_n;
  end

