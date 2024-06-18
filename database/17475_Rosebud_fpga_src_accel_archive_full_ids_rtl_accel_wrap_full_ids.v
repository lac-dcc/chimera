// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

module accel_wrap #(
  parameter IO_DATA_WIDTH   = 32,
  parameter IO_STRB_WIDTH   = (IO_DATA_WIDTH/8),
  parameter IO_ADDR_WIDTH   = 22,
  parameter DATA_WIDTH      = 128,
  parameter STRB_WIDTH      = (DATA_WIDTH/8),
  parameter PMEM_ADDR_WIDTH = 8,
  parameter AROM_ADDR_WIDTH = 1,
  parameter AROM_DATA_WIDTH = 1,
  parameter SLOW_M_B_LINES  = 4096,
  parameter ACC_ADDR_WIDTH  = $clog2(SLOW_M_B_LINES),
  parameter PMEM_SEL_BITS   = PMEM_ADDR_WIDTH-$clog2(STRB_WIDTH)
                              -1-$clog2(SLOW_M_B_LINES),
  parameter ACC_MEM_BLOCKS  = 2**PMEM_SEL_BITS,
  parameter SLOT_COUNT      = 16
) (
  input  wire                                     clk,
  input  wire                                     rst,

  input  wire                                     io_en,
  input  wire                                     io_wen,
  input  wire [IO_STRB_WIDTH-1:0]                 io_strb,
  input  wire [IO_ADDR_WIDTH-1:0]                 io_addr,
  input  wire [IO_DATA_WIDTH-1:0]                 io_wr_data,
  output wire [IO_DATA_WIDTH-1:0]                 io_rd_data,
  output wire                                     io_rd_valid,

  input  wire [AROM_ADDR_WIDTH-1:0]               acc_rom_wr_addr,
  input  wire [AROM_DATA_WIDTH-1:0]               acc_rom_wr_data,
  input  wire                                     acc_rom_wr_en,

  output wire [ACC_MEM_BLOCKS-1:0]                acc_en_b1,
  output wire [ACC_MEM_BLOCKS*STRB_WIDTH-1:0]     acc_wen_b1,
  output wire [ACC_MEM_BLOCKS*ACC_ADDR_WIDTH-1:0] acc_addr_b1,
  output wire [ACC_MEM_BLOCKS*DATA_WIDTH-1:0]     acc_wr_data_b1,
  input  wire [ACC_MEM_BLOCKS*DATA_WIDTH-1:0]     acc_rd_data_b1,

  output wire [ACC_MEM_BLOCKS-1:0]                acc_en_b2,
  output wire [ACC_MEM_BLOCKS*STRB_WIDTH-1:0]     acc_wen_b2,
  output wire [ACC_MEM_BLOCKS*ACC_ADDR_WIDTH-1:0] acc_addr_b2,
  output wire [ACC_MEM_BLOCKS*DATA_WIDTH-1:0]     acc_wr_data_b2,
  input  wire [ACC_MEM_BLOCKS*DATA_WIDTH-1:0]     acc_rd_data_b2,

  output wire                                     error,
  input  wire                                     error_ack
);

assign error = 1'b0;

localparam TCP_SME_COUNT  = 4;
localparam UDP_SME_COUNT  = 4;
localparam HTTP_SME_COUNT = 4;

localparam ACCEL_COUNT = TCP_SME_COUNT+UDP_SME_COUNT+HTTP_SME_COUNT+1;
localparam DEST_WIDTH  = $clog2(ACCEL_COUNT);

localparam LEN_WIDTH = 14;

reg [PMEM_ADDR_WIDTH-1:0] cmd_addr_reg;
reg [LEN_WIDTH-1:0]       cmd_len_reg;
reg                       cmd_valid_reg;
reg [DEST_WIDTH-1:0]      cmd_accel_reg;
reg [ACCEL_COUNT-1:0]     cmd_stop_reg;
reg [ACCEL_COUNT-1:0]     cmd_init_reg;
reg [63:0]                cmd_state_reg;
wire [ACCEL_COUNT-1:0]    accel_busy;

reg  [ACCEL_COUNT-1:0]    status_match;
reg  [ACCEL_COUNT-1:0]    status_done;
reg  [ACCEL_COUNT*32-1:0] match_1hot;
reg  [ACCEL_COUNT-1:0]    done_err;
wire [ACCEL_COUNT-1:0]    desc_error;
wire [ACCEL_COUNT*64-1:0] accel_state;

reg [31:0]  ip_addr_reg = 0;
reg         ip_addr_valid_reg = 0;
reg         read_data_stall_reg;

reg [IO_DATA_WIDTH-1:0] read_data_reg;
reg read_data_valid_reg;

assign io_rd_data = read_data_reg;
assign io_rd_valid = read_data_valid_reg;

always @(posedge clk) begin
  done_err <= done_err | (status_done & accel_busy);
  if (rst) begin
    done_err <= {ACCEL_COUNT{1'b0}};
  end
end

always @(posedge clk) begin
  cmd_valid_reg <= 'b0;
  cmd_stop_reg  <= {ACCEL_COUNT{1'b0}};
  cmd_init_reg  <= {ACCEL_COUNT{1'b0}};

  ip_addr_valid_reg   <= 1'b0;
  read_data_valid_reg <= 1'b0;

  if (io_en && io_wen) begin
    if (io_addr[11]) begin
      ip_addr_reg <= io_wr_data;
      ip_addr_valid_reg <= 1'b1;
    end else if (!io_addr[10]) begin
      case ({io_addr[5:2], 2'b00})
        6'h00: begin
          if (io_strb[0]) begin
            cmd_valid_reg <= io_wr_data[0];
            cmd_accel_reg <= io_addr[9:6];
            cmd_stop_reg [io_addr[9:6]] <= cmd_stop_reg [io_addr[9:6]] || io_wr_data[4];
            cmd_init_reg [io_addr[9:6]] <= cmd_init_reg [io_addr[9:6]] || io_wr_data[0];
          end
        end
        6'h04: begin
          cmd_len_reg <= io_wr_data;
        end
        6'h08: begin
          cmd_addr_reg <= io_wr_data;
        end
        6'h10: begin
          cmd_state_reg[31:0] <= io_wr_data;
        end
        6'h14: begin
          cmd_state_reg[63:32] <= io_wr_data;
        end
        // can go to 6'h3c
      endcase
    end
  end

  if (io_en && !io_wen) begin
    read_data_reg <= 0;
    read_data_valid_reg <= 1'b1;
    if (io_addr[11]) begin
      read_data_reg       <=  ip_match;
      read_data_valid_reg <=  ip_done;
      read_data_stall_reg <= !ip_done;
    end else if (io_addr[10]) begin
      case ({io_addr[5:2], 2'b00})
        6'h00: begin
          read_data_reg <= status_done|status_match;
        end
        6'h04: begin
          read_data_reg <= status_done;
        end
        6'h08: begin
          read_data_reg <= status_match;
        end
        6'h0c: begin
          read_data_reg <= accel_busy;
        end
        6'h10: begin
          read_data_reg <= cmd_state_reg[63:32];
        end
        6'h14: begin
          read_data_reg <= cmd_state_reg[31:0];
        end
        6'h18: begin
          read_data_reg <= desc_error;
        end
        6'h1c: begin
          read_data_reg <= done_err;
        end
        // can go to 6'h3c
      endcase
    end else if (!io_addr[10]) begin
      case ({io_addr[5:2], 2'b00})
        6'h00: begin
          read_data_reg[0] <= 1'b0; // cmd_valid_reg[io_addr[6:4]];
          read_data_reg[1] <= accel_busy[io_addr[9:6]];
          read_data_reg[8] <= status_done[io_addr[9:6]];
          read_data_reg[9] <= status_match[io_addr[9:6]];
        end
        6'h04: begin
          read_data_reg <= cmd_len_reg[io_addr[9:6]];
        end
        6'h08: begin
          read_data_reg <= cmd_addr_reg[io_addr[9:6]];
        end
        6'h0c: begin
          read_data_reg <= match_1hot[io_addr[9:6]*32+:32];
          read_data_valid_reg <=   (status_done [io_addr[9:6]]
                                 || status_match[io_addr[9:6]]);
          read_data_stall_reg <= ! (status_done [io_addr[9:6]]
                                 || status_match[io_addr[9:6]]);
        end
        6'h10: begin
          read_data_reg <= accel_state[(io_addr[9:6]*64)+:32];
        end
        6'h14: begin
          read_data_reg <= accel_state[(io_addr[9:6]*64+32)+:32];
        end
        // can go to 6'h3c
      endcase
    end
  end

  // core keeps the address in case of stall
  if (read_data_stall_reg) begin
    if (io_addr[11]) begin
      read_data_valid_reg <=  ip_done;
      read_data_stall_reg <= !ip_done;

    end else begin // There is only 1 remaining stall case
      read_data_valid_reg <=   (status_done [io_addr[9:6]]
                             || status_match[io_addr[9:6]]);
      read_data_stall_reg <= ! (status_done [io_addr[9:6]]
                             || status_match[io_addr[9:6]]);
    end
  end

  if (rst) begin
    cmd_valid_reg <= 1'b0;
    cmd_init_reg  <= {ACCEL_COUNT{1'b0}};
    cmd_stop_reg  <= {ACCEL_COUNT{1'b0}};

    ip_addr_valid_reg   <= 1'b0;
    read_data_stall_reg <= 1'b0;
    read_data_valid_reg <= 1'b0;
  end
end

// DMA engine for single block of the packet memory
localparam BLOCK_ADDR_WIDTH =PMEM_ADDR_WIDTH-PMEM_SEL_BITS;
localparam ATTACHED_CNT = SLOT_COUNT/8;
localparam ATTACHED = ACC_MEM_BLOCKS-ATTACHED_CNT;
localparam USER_WIDTH = $clog2(DATA_WIDTH/8);

wire [ACCEL_COUNT*DATA_WIDTH-1:0] accel_tdata;
wire [ACCEL_COUNT*USER_WIDTH-1:0] accel_tuser;
wire [ACCEL_COUNT-1:0]            accel_tlast;
wire [ACCEL_COUNT-1:0]            accel_tvalid;
wire [ACCEL_COUNT-1:0]            accel_tready;

// Fixed_loc IP takes 8 bytes at each cycle
wire [(ACCEL_COUNT-1)*8+64-1:0]   accel_tdata_r;
wire [(ACCEL_COUNT-1)*1+8-1:0]    accel_tkeep_r;
wire [ACCEL_COUNT-1:0]            accel_tlast_r;
wire [ACCEL_COUNT-1:0]            accel_tvalid_r;
wire [ACCEL_COUNT-1:0]            accel_tready_r;

accel_rd_dma_sp # (
  .DATA_WIDTH(DATA_WIDTH),
  .KEEP_WIDTH(DATA_WIDTH/8),
  .ADDR_WIDTH(BLOCK_ADDR_WIDTH+1),
  .ACCEL_COUNT(ACCEL_COUNT),
  .DEST_WIDTH(DEST_WIDTH),
  .LEN_WIDTH(LEN_WIDTH),
  .MEM_LINES(SLOW_M_B_LINES),
  .FIFO_LINES(32)
) accel_dma_engine (
  .clk(clk),
  .rst(rst),

  .desc_accel_id(cmd_accel_reg),
  .desc_addr(cmd_addr_reg[BLOCK_ADDR_WIDTH+1-1:0]),
  .desc_len(cmd_len_reg),
  .desc_valid(cmd_valid_reg),
  .desc_error(desc_error),

  .accel_busy(accel_busy),
  .accel_stop(cmd_stop_reg),

  .mem_b1_rd_addr(acc_addr_b1[ATTACHED*ACC_ADDR_WIDTH +: ATTACHED_CNT*ACC_ADDR_WIDTH]),
  .mem_b1_rd_en(acc_en_b1[ATTACHED+:ATTACHED_CNT]),
  .mem_b1_rd_data(acc_rd_data_b1[ATTACHED*DATA_WIDTH +: ATTACHED_CNT*DATA_WIDTH]),

  .mem_b2_rd_addr(acc_addr_b2[ATTACHED*ACC_ADDR_WIDTH +: ATTACHED_CNT*ACC_ADDR_WIDTH]),
  .mem_b2_rd_en(acc_en_b2[ATTACHED+:ATTACHED_CNT]),
  .mem_b2_rd_data(acc_rd_data_b2[ATTACHED*DATA_WIDTH +: ATTACHED_CNT*DATA_WIDTH]),

  .m_axis_tdata(accel_tdata),
  .m_axis_tuser(accel_tuser),
  .m_axis_tlast(accel_tlast),
  .m_axis_tvalid(accel_tvalid),
  .m_axis_tready(accel_tready)
);

assign acc_wen_b1[ATTACHED*STRB_WIDTH +: ATTACHED_CNT*STRB_WIDTH] = {ATTACHED_CNT*STRB_WIDTH{1'b0}};
assign acc_wen_b2[ATTACHED*STRB_WIDTH +: ATTACHED_CNT*STRB_WIDTH] = {ATTACHED_CNT*STRB_WIDTH{1'b0}};
assign accel_tready_r = {ACCEL_COUNT{1'b1}};

genvar i;

generate
  for (i = 0; i < (ACC_MEM_BLOCKS-ATTACHED_CNT); i = i + 1) begin: other_mem_ens
    assign acc_en_b1[i]  = 1'b0;
    assign acc_en_b2[i]  = 1'b0;
    assign acc_wen_b1[i*STRB_WIDTH +: STRB_WIDTH] = {STRB_WIDTH{1'b0}};
    assign acc_wen_b2[i*STRB_WIDTH +: STRB_WIDTH] = {STRB_WIDTH{1'b0}};
  end
endgenerate

// SME accelerators
wire [ACCEL_COUNT-1:0] sme_match;

genvar n;
generate

  // TCP
  for (n = 0; n < ACCEL_COUNT-1; n = n + 1) begin: width_converters_1B
    accel_width_conv # (
      .DATA_IN_WIDTH(DATA_WIDTH),
      .DATA_OUT_WIDTH(8),
      .USER_WIDTH(USER_WIDTH)
    ) accel_width_conv_inst (
      .clk(clk),
      .rst(rst),

      .s_axis_tdata (accel_tdata[n*DATA_WIDTH+:DATA_WIDTH]),
      .s_axis_tuser (accel_tuser[n*USER_WIDTH+:USER_WIDTH]),
      .s_axis_tlast (accel_tlast[n]),
      .s_axis_tvalid(accel_tvalid[n]),
      .s_axis_tready(accel_tready[n]),

      .m_axis_tdata (accel_tdata_r[n*8 +: 8]),
      .m_axis_tkeep (accel_tkeep_r[n]),
      .m_axis_tlast (accel_tlast_r[n]),
      .m_axis_tvalid(accel_tvalid_r[n]),
      .m_axis_tready(accel_tready_r[n])
    );
  end

  for (n = ACCEL_COUNT-1; n < ACCEL_COUNT; n = n + 1) begin: width_converters_8B
    accel_width_conv # (
      .DATA_IN_WIDTH(DATA_WIDTH),
      .DATA_OUT_WIDTH(64),
      .USER_WIDTH(USER_WIDTH)
    ) accel_width_conv_inst (
      .clk(clk),
      .rst(rst),

      .s_axis_tdata (accel_tdata[n*DATA_WIDTH+:DATA_WIDTH]),
      .s_axis_tuser (accel_tuser[n*USER_WIDTH+:USER_WIDTH]),
      .s_axis_tlast (accel_tlast[n]),
      .s_axis_tvalid(accel_tvalid[n]),
      .s_axis_tready(accel_tready[n]),

      .m_axis_tdata (accel_tdata_r[n*8 +: 64]),
      .m_axis_tkeep (accel_tkeep_r[n +: 8]),
      .m_axis_tlast (accel_tlast_r[n]),
      .m_axis_tvalid(accel_tvalid_r[n]),
      .m_axis_tready(accel_tready_r[n])
    );
  end

  for (n = 0; n < TCP_SME_COUNT; n = n + 1) begin: tcp_sme
    wire [7:0] match;

    tcp_sme tcp_sme_inst
    (
      .clk(clk),
      .rst(rst),

      .s_axis_tdata(accel_tdata_r[n*8 +: 8]),
      .s_axis_tvalid(accel_tvalid_r[n]),

      .state_out(accel_state[n*64+:21]),
      .state_in(cmd_state_reg[20:0]),
      .state_load(cmd_init_reg[n]),

      .match(match)
    );

    always @ (posedge clk)
      if (cmd_init_reg[n] | rst)
        match_1hot[n*32+:32] <= 0;
      else
        match_1hot[n*32+:32] <= match_1hot[n*32+:32] | match;

    assign sme_match[n] = |match;
    assign accel_state[(n*64)+63:(n*64)+21] = 0;
  end

  // UDP
  for (n = TCP_SME_COUNT; n < TCP_SME_COUNT+UDP_SME_COUNT; n = n + 1) begin: udp_sme
    wire [20:0] match;

    udp_sme udp_sme_inst
    (
      .clk(clk),
      .rst(rst),

      .s_axis_tdata(accel_tdata_r[n*8 +: 8]),
      .s_axis_tvalid(accel_tvalid_r[n]),

      .state_out(accel_state[n*64+:31]),
      .state_in(cmd_state_reg[30:0]),
      .state_load(cmd_init_reg[n]),

      .match(match)
    );

    always @ (posedge clk)
      if (cmd_init_reg[n] | rst)
        match_1hot[n*32+:32] <= 0;
      else
        match_1hot[n*32+:32] <= match_1hot[n*32+:32] | match;

    assign sme_match[n] = |match;
    assign accel_state[(n*64)+63:(n*64)+31] = 0;
  end

  // HTTP
  for (n = TCP_SME_COUNT+UDP_SME_COUNT; n < TCP_SME_COUNT+UDP_SME_COUNT+HTTP_SME_COUNT; n = n + 1) begin: http_sme
    wire [31:0] match;

    http_sme http_sme_inst
    (
      .clk(clk),
      .rst(rst),

      .s_axis_tdata(accel_tdata_r[n*8 +: 8]),
      .s_axis_tvalid(accel_tvalid_r[n]),

      .state_out(accel_state[n*64+:64]),
      .state_in(cmd_state_reg[63:0]),
      .state_load(cmd_init_reg[n]),

      .match(match)
    );

    always @ (posedge clk)
      if (cmd_init_reg[n] | rst)
        match_1hot[n*32+:32] <= 0;
      else
        match_1hot[n*32+:32] <= match_1hot[n*32+:32] | match;

    assign sme_match[n] = |match;
  end

  // Fixed location SME
  for (n = ACCEL_COUNT-1; n < ACCEL_COUNT; n = n + 1) begin: fied_loc_sme
    wire [27:0] match;

    fixed_loc_sme fixed_loc_sme_inst
    (
      .clk(clk),
      .rst(rst | cmd_init_reg[n]),

      .s_axis_tdata(accel_tdata_r[n*8 +: 64]),
      .s_axis_tkeep(accel_tkeep_r[n +: 8]),
      .s_axis_tvalid(accel_tvalid_r[n]),
      .match(match)
    );

    always @ (posedge clk)
      if (cmd_init_reg[n] | rst)
        match_1hot[n*32+:32] <= 0;
      else
        match_1hot[n*32+:32] <= match_1hot[n*32+:32] | match;

    assign sme_match[n] = |match;
  end

endgenerate

always @ (posedge clk) begin
  status_match <= (status_match | sme_match) & (~cmd_init_reg);
  status_done  <= (status_done | (accel_tvalid_r&accel_tlast_r) | cmd_stop_reg) & (~cmd_init_reg);

  if (rst) begin
    status_match <= {ACCEL_COUNT{1'b0}};
    status_done  <= {ACCEL_COUNT{1'b0}};
  end
end

// CND IP check accelerator
// ip_match and ip_done keep their value until new valid is asserted
// It needs byte swap due to network packets endian
ip_match ip_match_inst (
  .clk(clk),
  .rst(rst),
  .addr({ip_addr_reg[7:0], ip_addr_reg[15:8],
         ip_addr_reg[23:16], ip_addr_reg[31:24]}),
  .valid(ip_addr_valid_reg),
  .match(ip_match),
  .done(ip_done)
);

endmodule
