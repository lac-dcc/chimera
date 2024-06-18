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

localparam ACCEL_COUNT = 8;
localparam DEST_WIDTH  = $clog2(ACCEL_COUNT);

localparam LEN_WIDTH = 14;

reg [PMEM_ADDR_WIDTH-1:0] cmd_addr_reg;
reg [LEN_WIDTH-1:0]       cmd_len_reg;
reg                       cmd_valid_reg;
reg [DEST_WIDTH-1:0]      cmd_accel_reg;
reg [ACCEL_COUNT-1:0]     cmd_stop_reg;
reg [ACCEL_COUNT-1:0]     cmd_init_reg;
wire [ACCEL_COUNT-1:0]    accel_busy;

reg [ACCEL_COUNT-1:0]    status_match;
reg [ACCEL_COUNT-1:0]    status_done;

reg  [ACCEL_COUNT-1:0]    done_err;
wire [ACCEL_COUNT-1:0]    desc_error;

reg [31:0]  hash_data_reg = 0;
reg [1:0]   hash_data_len_reg = 0;
reg         hash_data_valid_reg = 0;
reg         hash_clear_reg = 0;
reg         hash_rd_stall_reg;

wire [31:0]  hash_out;

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

  hash_data_valid_reg <= 1'b0;
  hash_clear_reg      <= 1'b0;
  hash_rd_stall_reg   <= 1'b0;

  read_data_valid_reg <= 1'b0;

  if (io_en && io_wen) begin
    if (io_addr[8]) begin
      hash_data_reg <= io_wr_data;
      case ({io_addr[7:2], 2'b00})
        8'h00: begin
          hash_clear_reg <= 1'b1;
        end
        8'h04: begin
          hash_data_len_reg <= 1;
          hash_data_valid_reg <= 1'b1;
        end
        8'h08: begin
          hash_data_len_reg <= 2;
          hash_data_valid_reg <= 1'b1;
        end
        8'h0C: begin
          hash_data_len_reg <= 0;
          hash_data_valid_reg <= 1'b1;
        end
      endcase
    end else if (!io_addr[7]) begin
      case ({io_addr[3:2], 2'b00})
        4'h0: begin
          if (io_strb[0]) begin
            cmd_valid_reg <= io_wr_data[0];
            cmd_accel_reg <= io_addr[6:4];
            cmd_stop_reg [io_addr[6:4]] <= cmd_stop_reg [io_addr[6:4]] || io_wr_data[4];
            cmd_init_reg [io_addr[6:4]] <= cmd_init_reg [io_addr[6:4]] || io_wr_data[0];
          end
        end
        4'h4: begin
          cmd_len_reg <= io_wr_data;
        end
        4'h8: begin
          cmd_addr_reg <= io_wr_data;
        end
      endcase
    end
  end

  if (io_en && !io_wen) begin
    read_data_reg <= 0;
    read_data_valid_reg <= 1'b1;
    if (io_addr[8]) begin
      read_data_reg <= hash_out;
      read_data_valid_reg <= ~ hash_data_valid_reg; // one cycle stall after last wr
      hash_rd_stall_reg <= hash_data_valid_reg;
    end else if (io_addr[7]) begin
      read_data_reg <= status_done|status_match;
    end else if (!io_addr[7]) begin
      case ({io_addr[3:2], 2'b00})
        4'h0: begin
          read_data_reg[0] <= 1'b0; // cmd_valid_reg[io_addr[6:4]];
          read_data_reg[1] <= accel_busy[io_addr[6:4]];
          read_data_reg[8] <= status_done[io_addr[6:4]];
          read_data_reg[9] <= status_match[io_addr[6:4]];
        end
        4'h4: begin
          read_data_reg <= cmd_len_reg[io_addr[6:4]];
        end
        4'h8: begin
          read_data_reg <= cmd_addr_reg[io_addr[6:4]];
        end
      endcase
    end
  end

  if (hash_rd_stall_reg) begin
      read_data_reg <= hash_out;
      read_data_valid_reg <= 1'b1;
  end

  if (rst) begin
    cmd_valid_reg <= 1'b0;
    cmd_init_reg  <= {ACCEL_COUNT{1'b0}};
    cmd_stop_reg  <= {ACCEL_COUNT{1'b0}};

    hash_data_valid_reg <= 1'b0;
    hash_clear_reg      <= 1'b0;
    hash_rd_stall_reg   <= 1'b0;

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

wire [ACCEL_COUNT*8-1:0]          accel_tdata_r;
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

// RegEx accelerators
wire [ACCEL_COUNT-1:0] re_match;

genvar n;
generate
  for (n = 0; n < ACCEL_COUNT; n = n + 1) begin: accelerators

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
      .m_axis_tlast (accel_tlast_r[n]),
      .m_axis_tvalid(accel_tvalid_r[n]),
      .m_axis_tready(accel_tready_r[n])
    );

    re re_inst(
      .clk(clk),
      .rst(rst),
      .in(accel_tdata_r[n*8 +: 8]),
      .valid(accel_tvalid_r[n]),
      .init_state(32'd0),
      .init_assert(cmd_init_reg[n]),
      .match(re_match[n])
    );
  end
endgenerate

always @ (posedge clk) begin
  status_match <= (status_match | re_match) & (~cmd_init_reg);
  status_done  <= (status_done | (accel_tvalid_r&accel_tlast_r) | cmd_stop_reg) & (~cmd_init_reg);

  if (rst) begin
    status_match <= {ACCEL_COUNT{1'b0}};
    status_done  <= {ACCEL_COUNT{1'b0}};
  end
end

// Toeplitz hash accelerator
hash_acc #(
  .HASH_WIDTH(36)
) hash_acc_inst (
  .clk(clk),
  .rst(rst),

  .hash_data(hash_data_reg),
  .hash_data_len(hash_data_len_reg),
  .hash_data_valid(hash_data_valid_reg),
  .hash_clear(hash_clear_reg),

  .hash_key(320'h6d5a56da255b0ec24167253d43a38fb0d0ca2bcbae7b30b477cb2da38030f20c6a42b73bbeac01fa),

  .hash_out(hash_out)
);

endmodule
