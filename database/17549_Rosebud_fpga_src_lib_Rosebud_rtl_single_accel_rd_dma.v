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

module single_accel_rd_dma # (
  parameter DATA_WIDTH     = 128, // each bank of a block
  parameter KEEP_WIDTH     = (DATA_WIDTH/8),
  parameter ADDR_WIDTH     = 18,  // 256KB
  parameter LEN_WIDTH      = 14, // up to 16K
  parameter MEM_LINES      = 4096,
  parameter MASK_BITS      = $clog2(KEEP_WIDTH),
  parameter MEM_ADDR_WIDTH = $clog2(MEM_LINES),
  parameter MEM_SEL_BITS   = ADDR_WIDTH-1-MASK_BITS
                               -MEM_ADDR_WIDTH,
  parameter MEM_BLOCKS     = 2**MEM_SEL_BITS,
  parameter FIFO_LINES     = 2
) (
  input  wire                                 clk,
  input  wire                                 rst,

  // Descriptor input
  input  wire [ADDR_WIDTH-1:0]                desc_addr,
  input  wire [LEN_WIDTH-1:0]                 desc_len,
  input  wire                                 desc_valid,
  input  wire                                 accel_stop,
  output wire                                 desc_ready,

  // Memory read channels per bank
  output wire [MEM_BLOCKS-1:0]                mem_b1_rd_en,
  output wire [MEM_BLOCKS*MEM_ADDR_WIDTH-1:0] mem_b1_rd_addr,
  input  wire [MEM_BLOCKS*DATA_WIDTH-1:0]     mem_b1_rd_data,

  output wire [MEM_BLOCKS-1:0]                mem_b2_rd_en,
  output wire [MEM_BLOCKS*MEM_ADDR_WIDTH-1:0] mem_b2_rd_addr,
  input  wire [MEM_BLOCKS*DATA_WIDTH-1:0]     mem_b2_rd_data,

  // Read data output
  output wire [DATA_WIDTH-1:0]                m_axis_tdata,
  output wire [MASK_BITS-1:0]                 m_axis_tempty,
  output wire                                 m_axis_tfirst,
  output wire                                 m_axis_tlast,
  output wire                                 m_axis_tvalid,
  input  wire                                 m_axis_tready
);

// *** Parse the descriptor into memory address, offset, number of lines
// to be read, and last byte pointer in last read. *** //
localparam LINE_CNT_WIDTH    = LEN_WIDTH-MASK_BITS;
localparam LINE_ADDR_WIDTH   = ADDR_WIDTH-MASK_BITS;
localparam SAFE_MEM_SEL_BITS = (MEM_SEL_BITS > 0) ? MEM_SEL_BITS : 1;

reg accel_stop_r;

wire [MASK_BITS-1:0]       req_rd_offset;
wire [MASK_BITS-1:0]       req_rd_final_empty;
wire [LINE_ADDR_WIDTH-1:0] req_rd_addr;
wire [LINE_CNT_WIDTH-1:0]  req_rd_count;
wire [MASK_BITS-1:0]       remainder_bytes;

assign remainder_bytes    = desc_len [MASK_BITS-1:0];
assign req_rd_addr        = desc_addr[ADDR_WIDTH-1:MASK_BITS];
assign req_rd_offset      = desc_addr[MASK_BITS-1:0];
assign req_rd_count       = (remainder_bytes == 0) ? desc_len [LEN_WIDTH-1:MASK_BITS] :
                                                     desc_len [LEN_WIDTH-1:MASK_BITS]+1;
assign req_rd_final_empty = (remainder_bytes == 0) ? {MASK_BITS{1'b0}} :
                                                      KEEP_WIDTH - remainder_bytes;

// Register to keep current state
localparam DESC_MEM_WIDTH = LINE_ADDR_WIDTH+LINE_CNT_WIDTH+MASK_BITS+MASK_BITS+1;
reg [DESC_MEM_WIDTH-1:0] act_mem;
reg                      act_mem_v;

wire [LINE_ADDR_WIDTH-1:0] act_rd_addr;
wire [LINE_CNT_WIDTH-1:0]  act_rd_count;
wire [MASK_BITS-1:0]       act_rd_final_empty;
wire [MASK_BITS-1:0]       act_rd_offset;
wire                       act_rd_first;

// MSB trim for next address and count
wire [LINE_ADDR_WIDTH-1:0] act_rd_addr_n  = act_rd_addr  + 1;
wire [LINE_CNT_WIDTH-1:0]  act_rd_count_n = act_rd_count - 1;

// ** stall if fifo is not ready ** //
wire accel_fifo_ready;

always @ (posedge clk)
  if (desc_valid && desc_ready)
    act_mem <= {1'b1, req_rd_addr, req_rd_count,
                req_rd_final_empty, req_rd_offset};
  else if (act_mem_v && accel_fifo_ready)
    act_mem <= {1'b0, act_rd_addr_n, act_rd_count_n,
                act_rd_final_empty, act_rd_offset};

assign {act_rd_first, act_rd_addr, act_rd_count,
              act_rd_final_empty, act_rd_offset} = act_mem;

always @ (posedge clk) begin
  if (desc_valid && desc_ready)
    act_mem_v <= !accel_stop_r;
  else if (act_rd_count==1 && accel_fifo_ready) //!
    act_mem_v <= 1'b0;
  else
    act_mem_v <= act_mem_v && !accel_stop_r;

  if (rst)
    act_mem_v <= 1'b0;
end

assign desc_ready = !act_mem_v || (act_rd_count==1 && accel_fifo_ready);

// Send request to memory, with an input register
reg [MASK_BITS-1:0] mem_rd_offset, mem_rd_empty;
reg                 mem_rd_last, mem_rd_first, mem_rd_bank, mem_rd_valid;

wire                  act_rd_last = (act_rd_count == 1);

wire [MASK_BITS-1:0] act_rd_empty = act_rd_last ? act_rd_final_empty :
                                                  {MASK_BITS{1'b0}};

wire [LINE_ADDR_WIDTH-1:0] mem_rd_addr   = act_rd_addr;
wire [LINE_ADDR_WIDTH-1:0] mem_rd_addr_n = act_rd_addr_n;

reg  [MEM_BLOCKS-1:0]     mem_b1_rd_en_n;
reg  [MEM_ADDR_WIDTH-1:0] mem_b1_rd_addr_n;
reg  [MEM_BLOCKS-1:0]     mem_b2_rd_en_n;
reg  [MEM_ADDR_WIDTH-1:0] mem_b2_rd_addr_n;

reg  [SAFE_MEM_SEL_BITS-1:0] mem_b1_sel_rr, mem_b2_sel_rr;
reg  [SAFE_MEM_SEL_BITS-1:0] mem_b1_sel_rrr, mem_b2_sel_rrr;
reg  [SAFE_MEM_SEL_BITS-1:0] mem_b1_sel_r, mem_b2_sel_r;
wire [SAFE_MEM_SEL_BITS-1:0] mem_b1_sel = mem_rd_addr[0] ?
         mem_rd_addr_n[LINE_ADDR_WIDTH-1:MEM_ADDR_WIDTH+1] :
         mem_rd_addr  [LINE_ADDR_WIDTH-1:MEM_ADDR_WIDTH+1] ;
wire [SAFE_MEM_SEL_BITS-1:0] mem_b2_sel = mem_rd_addr[0] ?
         mem_rd_addr  [LINE_ADDR_WIDTH-1:MEM_ADDR_WIDTH+1] :
         mem_rd_addr_n[LINE_ADDR_WIDTH-1:MEM_ADDR_WIDTH+1] ;

integer j;
always @ (posedge clk) begin
  mem_rd_empty     <= act_rd_empty;
  mem_rd_offset    <= act_rd_offset;
  mem_rd_last      <= act_rd_last;
  mem_rd_first     <= act_rd_first;

  mem_rd_bank      <= mem_rd_addr[0];
  mem_rd_valid     <= act_mem_v && accel_fifo_ready;

  mem_b1_rd_addr_n <= mem_rd_addr[0] ? mem_rd_addr_n[MEM_ADDR_WIDTH:1] :
                                       mem_rd_addr  [MEM_ADDR_WIDTH:1] ;
  mem_b2_rd_addr_n <= mem_rd_addr[0] ? mem_rd_addr  [MEM_ADDR_WIDTH:1] :
                                       mem_rd_addr_n[MEM_ADDR_WIDTH:1] ;

  if(MEM_SEL_BITS>0) begin
    mem_b1_sel_r     <= mem_b1_sel;
    mem_b2_sel_r     <= mem_b2_sel;
    for (j=0; j<MEM_BLOCKS; j=j+1) begin
      mem_b1_rd_en_n[j] <= act_mem_v && (mem_b1_sel==j);
      mem_b2_rd_en_n[j] <= act_mem_v && (mem_b2_sel==j);
    end
  end else begin
    mem_b1_rd_en_n <= act_mem_v;
    mem_b2_rd_en_n <= act_mem_v;
  end

  if (rst) begin
    mem_b1_rd_en_n <= {MEM_BLOCKS{1'b0}};
    mem_b2_rd_en_n <= {MEM_BLOCKS{1'b0}};
  end

end

genvar k;
generate
  for (k=0; k<MEM_BLOCKS; k=k+1) begin
    assign mem_b1_rd_en[k] = mem_b1_rd_en_n[k];
    assign mem_b2_rd_en[k] = mem_b2_rd_en_n[k];

    assign mem_b1_rd_addr[k*MEM_ADDR_WIDTH+:MEM_ADDR_WIDTH] = mem_b1_rd_addr_n;
    assign mem_b2_rd_addr[k*MEM_ADDR_WIDTH+:MEM_ADDR_WIDTH] = mem_b2_rd_addr_n;
  end
endgenerate

// Register memory output
reg [DATA_WIDTH-1:0]   mem_b1_rd_data_rr, mem_b2_rd_data_rr;
reg                    mem_rd_valid_r, mem_rd_valid_rr, mem_rd_valid_rrr;

always @ (*) begin // read data is already registered in mem_sys module.
  if(MEM_SEL_BITS>0) begin
    mem_b1_rd_data_rr = mem_b1_rd_data[mem_b1_sel_rrr*DATA_WIDTH +: DATA_WIDTH];
    mem_b2_rd_data_rr = mem_b2_rd_data[mem_b2_sel_rrr*DATA_WIDTH +: DATA_WIDTH];
  end else begin
    mem_b1_rd_data_rr = mem_b1_rd_data;
    mem_b2_rd_data_rr = mem_b2_rd_data;
  end
end

always @ (posedge clk) begin
  if(MEM_SEL_BITS>0) begin
    mem_b1_sel_rr  <= mem_b1_sel_r;
    mem_b2_sel_rr  <= mem_b2_sel_r;
    mem_b1_sel_rrr <= mem_b1_sel_rr;
    mem_b2_sel_rrr <= mem_b2_sel_rr;
  end else begin
    mem_b1_sel_rr  <= 1'b0;
    mem_b2_sel_rr  <= 1'b0;
    mem_b1_sel_rrr <= 1'b0;
    mem_b2_sel_rrr <= 1'b0;
  end

  mem_rd_valid_r   <= mem_rd_valid;
  mem_rd_valid_rr  <= mem_rd_valid_r;
  mem_rd_valid_rrr <= mem_rd_valid_rr;

  if (rst) begin
    mem_rd_valid_r   <= 1'b0;
    mem_rd_valid_rr  <= 1'b0;
    mem_rd_valid_rrr <= 1'b0;
  end
end

// Accompanying metadata
reg                  mem_rd_last_r,   mem_rd_last_rr,  mem_rd_last_rrr;
reg                  mem_rd_first_r,  mem_rd_first_rr, mem_rd_first_rrr;
reg                  mem_rd_bank_r,   mem_rd_bank_rr;
reg [MASK_BITS-1:0]  mem_rd_offset_r, mem_rd_offset_rr;
reg [MASK_BITS-1:0]  mem_rd_empty_r,  mem_rd_empty_rr, mem_rd_empty_rrr;

always @ (posedge clk) begin
  mem_rd_last_r    <= mem_rd_last;
  mem_rd_last_rr   <= mem_rd_last_r;
  mem_rd_last_rrr  <= mem_rd_last_rr;
  mem_rd_first_r   <= mem_rd_first;
  mem_rd_first_rr  <= mem_rd_first_r;
  mem_rd_first_rrr <= mem_rd_first_rr;
  mem_rd_offset_r  <= mem_rd_offset;
  mem_rd_offset_rr <= mem_rd_offset_r;
  mem_rd_bank_r    <= mem_rd_bank;
  mem_rd_bank_rr   <= mem_rd_bank_r;
  mem_rd_empty_r   <= mem_rd_empty;
  mem_rd_empty_rr  <= mem_rd_empty_r;
  mem_rd_empty_rrr <= mem_rd_empty_rr;
end

reg [DATA_WIDTH-1:0] mem_rd_data_rrr;

always @ (posedge clk)
  mem_rd_data_rrr <= (mem_rd_bank_rr ? {mem_b1_rd_data_rr, mem_b2_rd_data_rr}:
                                       {mem_b2_rd_data_rr, mem_b1_rd_data_rr})
                                       >> (8*mem_rd_offset_rr);

always @ (posedge clk) begin
  accel_stop_r <= accel_stop_r | accel_stop;
  if (desc_valid)
    accel_stop_r <= 1'b0;
  if (rst)
    accel_stop_r <= 1'b0;
end

// Counter to avoid overflow
reg [$clog2(FIFO_LINES):0] counter;

always @ (posedge clk) begin

  if (accel_stop_r)
    counter <= 0;
  else if (m_axis_tvalid && m_axis_tready) begin
    if (!(act_mem_v && accel_fifo_ready))
      counter <= counter - 1;
    // else, both asserted, no change
  end else if (act_mem_v && accel_fifo_ready)
    counter <= counter + 1;
    // else, none asserted, no change

  if (rst)
    counter <= 0;
end

// Gets simplified to single bit for FIFO_LINES power of 2
assign accel_fifo_ready = (counter < FIFO_LINES);

basic_fifo # (
  .DEPTH(FIFO_LINES),
  .DATA_WIDTH(2+MASK_BITS+DATA_WIDTH)
) accel_fifo (
  .clk(clk),
  .rst(rst),
  .clear(accel_stop_r),

  .din_valid(mem_rd_valid_rrr),
  .din({mem_rd_first_rrr, mem_rd_last_rrr, mem_rd_empty_rrr, mem_rd_data_rrr}),
  .din_ready(),

  .dout_valid(m_axis_tvalid),
  .dout({m_axis_tfirst, m_axis_tlast, m_axis_tempty, m_axis_tdata}),
  .dout_ready(m_axis_tready),

  .item_count(),
  .full(),
  .empty()
);

endmodule

`resetall
