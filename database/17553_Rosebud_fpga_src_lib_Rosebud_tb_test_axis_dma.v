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

module test_axis_dma;

// Parameters
parameter DATA_WIDTH       = 64;
parameter ADDR_WIDTH       = 16;   
parameter LEN_WIDTH        = 16;
parameter DEST_WIDTH_IN    = 8; 
parameter DEST_WIDTH_OUT   = 4; 
parameter USER_WIDTH_IN    = 4; 
parameter USER_WIDTH_OUT   = 8; 
parameter STRB_WIDTH       = (DATA_WIDTH/8);

// Inputs
reg clk = 0;
reg rst = 0;

reg [DATA_WIDTH-1:0]     s_axis_tdata = 0;
reg [STRB_WIDTH-1:0]     s_axis_tkeep = 0;
reg                      s_axis_tvalid = 0;
reg                      s_axis_tlast = 0;
reg [DEST_WIDTH_IN-1:0]  s_axis_tdest = 0;
reg [USER_WIDTH_IN-1:0]  s_axis_tuser = 0;
reg [ADDR_WIDTH-1:0]     wr_base_addr = 0;
reg                      mem_wr_ready = 0;
reg                      recv_desc_ready = 0;
reg                      m_axis_tready = 0;
reg                      mem_rd_ready = 1;
reg                      send_desc_valid = 0;
reg [ADDR_WIDTH-1:0]     send_desc_addr = 0;
reg [LEN_WIDTH-1:0]      send_desc_len = 0;
reg [DEST_WIDTH_OUT-1:0] send_desc_tdest = 0;
reg [USER_WIDTH_OUT-1:0] send_desc_tuser = 0;

// Outputs
wire                      mem_wr_en;
wire [STRB_WIDTH-1:0]     mem_wr_strb;
wire [ADDR_WIDTH-1:0]     mem_wr_addr;
wire [DATA_WIDTH-1:0]     mem_wr_data;
wire                      mem_wr_last;
wire                      recv_desc_valid;
wire [ADDR_WIDTH-1:0]     recv_desc_addr;
wire [LEN_WIDTH-1:0]      recv_desc_len;
wire [DEST_WIDTH_IN-1:0]  recv_desc_tdest;
wire [USER_WIDTH_IN-1:0]  recv_desc_tuser;
wire                      s_axis_tready;
wire [DATA_WIDTH-1:0]     m_axis_tdata;
wire [STRB_WIDTH-1:0]     m_axis_tkeep;
wire                      m_axis_tvalid;
wire                      m_axis_tlast;
wire [DEST_WIDTH_OUT-1:0] m_axis_tdest;
wire [USER_WIDTH_OUT-1:0] m_axis_tuser;
wire                      mem_rd_en;
wire [ADDR_WIDTH-1:0]     mem_rd_addr;
wire                      mem_rd_last;
wire                      mem_rd_data_ready;
wire                      send_desc_ready;
wire                      pkt_sent;

// inside testbench
wire [DATA_WIDTH-1:0]    mem_rd_data;
wire [DATA_WIDTH-1:0]    sel_mem_rd_data;
reg  [DATA_WIDTH-1:0]    mem_rd_data_r;
reg                      mem_rd_data_v = 0;
reg                      mem_rd_data_ready_r;

initial begin
    // myhdl integration
    $from_myhdl(
        clk,
        rst,
        s_axis_tdata,
        s_axis_tkeep, 
        s_axis_tvalid,
        s_axis_tlast, 
        s_axis_tdest, 
        s_axis_tuser, 
        mem_wr_ready,
        recv_desc_ready,
        m_axis_tready,
        mem_rd_ready,
        // mem_rd_data,
        // mem_rd_data_v,
        send_desc_valid,
        send_desc_addr,
        send_desc_len,
        send_desc_tdest,
        send_desc_tuser,
        wr_base_addr
    );
    $to_myhdl(
        mem_wr_en,
        mem_wr_strb,
        mem_wr_last,
        mem_wr_addr,
        mem_wr_data,
        recv_desc_valid,
        recv_desc_addr,
        recv_desc_len,
        recv_desc_tdest,
        recv_desc_tuser,
        s_axis_tready,
        m_axis_tdata,
        m_axis_tkeep,
        m_axis_tvalid,
        m_axis_tlast,
        m_axis_tdest,
        m_axis_tuser,
        mem_rd_en,
        mem_rd_addr,
        mem_rd_last,
        mem_rd_data_ready,
        send_desc_ready,
        pkt_sent
    );

    // dump file
    $dumpfile("test_axis_dma.lxt");
    $dumpvars(0, test_axis_dma);
end

axis_dma # (
  .DATA_WIDTH     (DATA_WIDTH),
  .ADDR_WIDTH     (ADDR_WIDTH),       
  .LEN_WIDTH      (LEN_WIDTH),        
  .DEST_WIDTH_IN  (DEST_WIDTH_IN),   
  .DEST_WIDTH_OUT (DEST_WIDTH_OUT),  
  .USER_WIDTH_IN  (USER_WIDTH_IN),   
  .USER_WIDTH_OUT (USER_WIDTH_OUT)  
) UUT (
  .clk(clk),
  .rst(rst),

  .s_axis_tdata (s_axis_tdata),
  .s_axis_tkeep (s_axis_tkeep),
  .s_axis_tvalid(s_axis_tvalid),
  .s_axis_tready(s_axis_tready),
  .s_axis_tlast (s_axis_tlast),
  .s_axis_tdest (s_axis_tdest),
  .s_axis_tuser (s_axis_tuser),
  
  .wr_base_addr (wr_base_addr),

  .m_axis_tdata (m_axis_tdata),
  .m_axis_tkeep (m_axis_tkeep),
  .m_axis_tvalid(m_axis_tvalid),
  .m_axis_tready(m_axis_tready),
  .m_axis_tlast (m_axis_tlast),
  .m_axis_tdest (m_axis_tdest),
  .m_axis_tuser (m_axis_tuser),
  
  .mem_wr_en   (mem_wr_en),
  .mem_wr_strb (mem_wr_strb),
  .mem_wr_addr (mem_wr_addr),
  .mem_wr_data (mem_wr_data),
  .mem_wr_last (mem_wr_last),
  .mem_wr_ready(mem_wr_ready),
  
  .mem_rd_en        (mem_rd_en),
  .mem_rd_addr      (mem_rd_addr),
  .mem_rd_last      (mem_rd_last),
  .mem_rd_ready     (mem_rd_ready),
  .mem_rd_data      (sel_mem_rd_data),
  .mem_rd_data_v    (mem_rd_data_v),
  .mem_rd_data_ready(mem_rd_data_ready),
  
  .recv_desc_valid(recv_desc_valid),
  .recv_desc_ready(recv_desc_ready),
  .recv_desc_addr (recv_desc_addr),
  .recv_desc_len  (recv_desc_len),
  .recv_desc_tdest(recv_desc_tdest),
  .recv_desc_tuser(recv_desc_tuser),

  .send_desc_valid(send_desc_valid),
  .send_desc_ready(send_desc_ready),
  .send_desc_addr (send_desc_addr),
  .send_desc_len  (send_desc_len),
  .send_desc_tdest(send_desc_tdest),
  .send_desc_tuser(send_desc_tuser),

  .pkt_sent       (pkt_sent)

);

mem_1r1w #(
  .BYTES_PER_LINE(STRB_WIDTH),
  .ADDR_WIDTH(ADDR_WIDTH-$clog2(STRB_WIDTH))    
) test (
  .clka(clk),
  .ena(mem_wr_en),
  .wea(mem_wr_strb),
  .addra(mem_wr_addr[ADDR_WIDTH-1:$clog2(STRB_WIDTH)]),
  .dina(mem_wr_data),

  .clkb(clk),
  .enb(mem_rd_en),
  .addrb(mem_rd_addr[ADDR_WIDTH-1:$clog2(STRB_WIDTH)]),
  .doutb(mem_rd_data)
);

always @ (posedge clk) begin
  mem_rd_data_ready_r <= mem_rd_data_ready;
  if (mem_rd_data_v)
    mem_rd_data_r <= mem_rd_data;
end

assign sel_mem_rd_data = (!mem_rd_data_ready_r) ? mem_rd_data_r : mem_rd_data;

always @ (posedge clk)
  if (rst)
    mem_rd_data_v <= 1'b0;
  else
    mem_rd_data_v <= (mem_rd_en && mem_rd_ready) || (mem_rd_data_v && !mem_rd_data_ready);

integer i,j;
initial begin
    for (i = 0; i < 2**(ADDR_WIDTH); i = i + 2**((ADDR_WIDTH-1)/2)) begin
        for (j = i; j < i + 2**((ADDR_WIDTH-1)/2); j = j + 1) begin
            test.mem[j] = j;
        end
    end
end

endmodule

`resetall
