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

localparam ACCEL_COUNT = ACC_MEM_BLOCKS;

localparam LEN_WIDTH = 16;

reg [PMEM_ADDR_WIDTH-1:0] cmd_addr_reg[ACCEL_COUNT-1:0];
reg [LEN_WIDTH-1:0]       cmd_len_reg[ACCEL_COUNT-1:0];
reg [ACCEL_COUNT-1:0]     cmd_valid_reg;
wire [ACCEL_COUNT-1:0]    cmd_ready;

wire [ACCEL_COUNT-1:0]    status_match;
wire [ACCEL_COUNT-1:0]    status_done;

reg [IO_DATA_WIDTH-1:0] read_data_reg;
reg read_data_valid_reg;

assign io_rd_data = read_data_reg;
assign io_rd_valid = read_data_valid_reg;

always @(posedge clk) begin
  cmd_valid_reg <= cmd_valid_reg & ~cmd_ready;

  read_data_valid_reg <= 1'b0;

  if (io_en && io_wen) begin
    if (io_addr[7]) begin

    end else begin
      case ({io_addr[3:2], 2'b00})
        4'h0: begin
          if (io_strb[0]) begin
            cmd_valid_reg[io_addr[6:4]] <= cmd_valid_reg[io_addr[6:4]] || io_wr_data[0];
          end
        end
        4'h4: begin
          cmd_len_reg[io_addr[6:4]] <= io_wr_data;
        end
        4'h8: begin
          cmd_addr_reg[io_addr[6:4]] <= io_wr_data;
        end
      endcase
    end
  end

  if (io_en && !io_wen) begin
    read_data_reg <= 0;
    read_data_valid_reg <= 1'b1;
    if (io_addr[7]) begin
      read_data_reg <= status_done;
    end else begin
      case ({io_addr[3:2], 2'b00})
        4'h0: begin
          read_data_reg[0] <= cmd_valid_reg[io_addr[6:4]];
          read_data_reg[1] <= cmd_ready[io_addr[6:4]];
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

  if (rst) begin
    cmd_valid_reg <= 1'b0;
    read_data_valid_reg <= 1'b0;
  end
end

generate

genvar n;

for (n = 0; n < ACCEL_COUNT; n = n + 1) begin

  regex_acc #(
    .DATA_WIDTH(DATA_WIDTH),
    .STRB_WIDTH(STRB_WIDTH),
    .PMEM_ADDR_WIDTH(PMEM_ADDR_WIDTH),
    .SLOW_M_B_LINES(SLOW_M_B_LINES),
    .ACC_ADDR_WIDTH(ACC_ADDR_WIDTH),
    .PMEM_SEL_BITS(0),
    .ACC_MEM_BLOCKS(1)
  ) regex_acc_inst (
    .clk(clk),
    .rst(rst),

    .cmd_addr(cmd_addr_reg[n]),
    .cmd_len(cmd_len_reg[n]),
    .cmd_valid(cmd_valid_reg[n]),
    .cmd_ready(cmd_ready[n]),

    .status_match(status_match[n]),
    .status_done(status_done[n]),

    .acc_en_b1(acc_en_b1[n*1 +: 1]),
    .acc_wen_b1(acc_wen_b1[n*STRB_WIDTH +: STRB_WIDTH]),
    .acc_addr_b1(acc_addr_b1[n*ACC_ADDR_WIDTH +: ACC_ADDR_WIDTH]),
    .acc_wr_data_b1(acc_wr_data_b1[n*DATA_WIDTH +: DATA_WIDTH]),
    .acc_rd_data_b1(acc_rd_data_b1[n*DATA_WIDTH +: DATA_WIDTH]),

    .acc_en_b2(acc_en_b2[n*1 +: 1]),
    .acc_wen_b2(acc_wen_b2[n*STRB_WIDTH +: STRB_WIDTH]),
    .acc_addr_b2(acc_addr_b2[n*ACC_ADDR_WIDTH +: ACC_ADDR_WIDTH]),
    .acc_wr_data_b2(acc_wr_data_b2[n*DATA_WIDTH +: DATA_WIDTH]),
    .acc_rd_data_b2(acc_rd_data_b2[n*DATA_WIDTH +: DATA_WIDTH])
  );

end

endgenerate

endmodule
