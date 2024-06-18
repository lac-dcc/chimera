// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

/*

Copyright (c) 2019-2021 Moein Khazraee

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none

module accel_wrap #(
  parameter IO_DATA_WIDTH   = 32,
  parameter IO_STRB_WIDTH   = (IO_DATA_WIDTH/8),
  parameter IO_ADDR_WIDTH   = 22,
  parameter DATA_WIDTH      = 128,
  parameter STRB_WIDTH      = (DATA_WIDTH/8),
  parameter PMEM_ADDR_WIDTH = 8,
  parameter AROM_ADDR_WIDTH = 21,
  parameter AROM_DATA_WIDTH = 72,
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

assign acc_en_b1 = 0;
assign acc_wen_b1 = 0;
assign acc_addr_b1 = 0;
assign acc_wr_data_b1 = 0;

assign acc_en_b2 = 0;
assign acc_wen_b2 = 0;
assign acc_addr_b2 = 0;
assign acc_wr_data_b2 = 0;


reg [31:0]  src_ip_reg = 0;
reg         src_ip_valid_reg = 0;
reg         read_data_stall_reg;

wire fw_match, fw_valid;

reg [IO_DATA_WIDTH-1:0] read_data_reg;
reg read_data_valid_reg;

assign io_rd_data = read_data_reg;
assign io_rd_valid = read_data_valid_reg;

always @(posedge clk) begin
  src_ip_valid_reg    <= 1'b0;
  read_data_valid_reg <= 1'b0;

  // Memory mapped I/O writes
  if (io_en && io_wen) begin
    if (io_addr[3:2]==2'b00) begin
        src_ip_reg       <= io_wr_data;
        src_ip_valid_reg <= 1'b1;
    end
  end

  // Memory mapped I/O reads
  // There are 2 cases of read stall, for CDN or DoS
  if (io_en && !io_wen) begin
    read_data_reg <= 0;
    read_data_valid_reg <= 1'b1;

    // <1xx xxxx> for IP write for CDN and DoS accels + DMA stat
    if (io_addr[3:2]==2'b00) begin
      read_data_reg <= src_ip_reg;
    end else begin
      read_data_reg       <=  fw_match;
      read_data_valid_reg <=  fw_valid && (!src_ip_valid_reg);
      read_data_stall_reg <= (!fw_valid) || src_ip_valid_reg;
    end
  end

  // core keeps the address in case of stall, there is only 1 accel
  if (read_data_stall_reg) begin
    read_data_reg       <=  fw_match;
    read_data_valid_reg <=  fw_valid;
    read_data_stall_reg <= !fw_valid;
  end

  if (rst) begin
    src_ip_valid_reg    <= 1'b0;
    read_data_stall_reg <= 1'b0;
    read_data_valid_reg <= 1'b0;
  end
end

// Might neet to add FIFO to increase perf?

// fw_match and fw_valid keep their value until new valid is asserted
// It needs byte swap due to network packets endian
firewall firewall_inst (
  .clk(clk),
  .rst(rst),
  .addr({src_ip_reg[7:0], src_ip_reg[15:8],
         src_ip_reg[23:16], src_ip_reg[31:24]}),
  .valid(src_ip_valid_reg),
  .match(fw_match),
  .done(fw_valid)
);

endmodule

`resetall
