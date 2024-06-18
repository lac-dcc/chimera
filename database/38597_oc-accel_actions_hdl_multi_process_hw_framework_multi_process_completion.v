// This program was cloned from: https://github.com/OpenCAPI/oc-accel
// License: Apache License 2.0

`timescale 1ns/1ps
//Yanheng Lu
//IBM CSL OpenPower
//lyhlu@cn.ibm.com

module mp_completion #(
    parameter ID_WIDTH = 1,
    parameter ARUSER_WIDTH = 9,
    parameter AWUSER_WIDTH = 9,
    parameter DATA_WIDTH = 1024,
    parameter ADDR_WIDTH = 64
)(
    input                           clk                 ,
    input                           rst_n               ,
    input       [8:0]               cmpl_ram_addr_i     ,
    input                           cmpl_ram_hi_i       ,
    input                           cmpl_ram_lo_i       ,
    input       [31:0]              cmpl_ram_data_i     ,
    output                          complete_ready_o    ,
    input                           complete_push_i     ,
    input       [40:0]              return_data_i       ,
    output      [ID_WIDTH-1:0]      m_axi_awid          ,
    output      [ADDR_WIDTH-1:0]    m_axi_awaddr        ,
    output      [7:0]               m_axi_awlen         ,
    output      [2:0]               m_axi_awsize        ,
    output      [1:0]               m_axi_awburst       ,
    output      [3:0]               m_axi_awcache       ,
    output                          m_axi_awlock        ,
    output      [2:0]               m_axi_awprot        ,
    output      [3:0]               m_axi_awqos         ,
    output      [AWUSER_WIDTH-1:0]  m_axi_awuser        ,
    output  reg                     m_axi_awvalid       ,
    input                           m_axi_awready       ,
    output      [ID_WIDTH-1:0]      m_axi_wid           ,
    output      [DATA_WIDTH-1:0]    m_axi_wdata         ,
    output      [DATA_WIDTH/8-1:0]  m_axi_wstrb         ,
    output                          m_axi_wlast         ,
    output  reg                     m_axi_wvalid        ,
    input                           m_axi_wready        ,
    output                          m_axi_bready        ,
    input       [ID_WIDTH - 1:0]    m_axi_bid           ,
    input       [1:0]               m_axi_bresp         ,
    input                           m_axi_bvalid
);

wire    [8:0]       cmpl_read_addr;
wire    [63:0]      cmpl_addr;
wire                cmpl_fifo_pull;
wire                cmpl_fifo_full;
wire                cmpl_fifo_empty;
wire    [3:0]       cmpl_fifo_count;
wire    [40:0]      cmpl_fifo_out;
wire    [31:0]      cmpl_ram_wdata_hi;
wire                cmpl_ram_wr_hi;
wire    [31:0]      cmpl_ram_wdata_lo;
wire                cmpl_ram_wr_lo;
wire    [8:0]       cmpl_ram_waddr;
wire    [63:0]      next_cmpl_addr;
reg                 in_write;
reg                 cmpl_addr_update;
reg     [40:0]      cur_return_code;

always@(posedge clk) if(cmpl_fifo_pull) cur_return_code <= cmpl_fifo_out;

always@(posedge clk or negedge rst_n)
    if(!rst_n)
        m_axi_awvalid <= 1'b0;
    else if(m_axi_wvalid)
        m_axi_awvalid <= 1'b1;
    else if(m_axi_awvalid & m_axi_awready)
        m_axi_awvalid <= 1'b0;

always@(posedge clk or negedge rst_n)
    if(!rst_n)
        m_axi_wvalid <= 1'b0;
    else if(cmpl_fifo_pull)
        m_axi_wvalid <= 1'b1;
    else if(m_axi_wvalid & m_axi_wready)
        m_axi_wvalid <= 1'b0;

always@(posedge clk or negedge rst_n)
    if(!rst_n)
        in_write <= 1'b0;
    else if(cmpl_fifo_pull)
        in_write <= 1'b1;
    else if(m_axi_bvalid & (m_axi_bresp == 2'b00))
        in_write <= 1'b0;

    assign cmpl_read_addr   = cur_return_code[40:32];
    assign cmpl_fifo_pull   = !cmpl_fifo_empty & !in_write;
    assign complete_ready_o = !cmpl_fifo_full;
    assign m_axi_bready     = 1'b1;
    assign m_axi_wdata      = {992'b0,cur_return_code[31:0]};
    assign m_axi_wlast      = m_axi_wvalid;
    assign m_axi_wid        = 'd0;
    assign m_axi_wstrb      = 'hffffffffffffffffffffffffffffffff;
    assign m_axi_awid       = 'd0;
    assign m_axi_awsize     = 3'd7; // 8*2^7=1024
    assign m_axi_awburst    = 2'd1; // INCR mode for memory access
    assign m_axi_awcache    = 4'd3; // Normal Non-cacheable Bufferable
    assign m_axi_awprot     = 3'd0;
    assign m_axi_awqos      = 4'd0;
    assign m_axi_awlock     = 2'b00; // normal access
    assign m_axi_awlen      = 8'd0;
    assign m_axi_awuser     = cur_return_code[40:32];
    assign m_axi_awaddr     = cmpl_addr;

completion_fifo fifo_completion (
    .clk        (clk                ),
    .rst        (!rst_n             ),
    .din        (return_data_i      ),
    .wr_en      (complete_push_i    ),
    .rd_en      (cmpl_fifo_pull     ),
    .dout       (cmpl_fifo_out      ),
    .full       (cmpl_fifo_full     ),
    .empty      (cmpl_fifo_empty    ),
    .data_count (cmpl_fifo_count    )
);

addr_ram cpml_ram_low(
    .clk    ( clk               ),
    .d      ( cmpl_ram_wdata_lo ),
    .dpra   ( cmpl_read_addr    ),
    .a      ( cmpl_ram_waddr    ),
    .we     ( cmpl_ram_wr_lo    ),
    .dpo    ( cmpl_addr[31:0]   )
);

addr_ram cpml_ram_high(
    .clk    (clk                ),
    .d      ( cmpl_ram_wdata_hi ),
    .dpra   ( cmpl_read_addr    ),
    .a      ( cmpl_ram_waddr    ),
    .we     ( cmpl_ram_wr_hi    ),
    .dpo    ( cmpl_addr[63:32]  )
);

assign cmpl_ram_wr_lo = cmpl_ram_lo_i | cmpl_addr_update & !cmpl_ram_hi_i;
assign cmpl_ram_wr_hi = cmpl_ram_hi_i | cmpl_addr_update & !cmpl_ram_lo_i;
assign cmpl_ram_wdata_lo = cmpl_ram_lo_i ? cmpl_ram_data_i : next_cmpl_addr[31:0];
assign cmpl_ram_wdata_hi = cmpl_ram_hi_i ? cmpl_ram_data_i : next_cmpl_addr[63:32];
assign next_cmpl_addr = cmpl_addr + 'd128;
assign cmpl_ram_waddr = (cmpl_ram_lo_i | cmpl_ram_hi_i) ? cmpl_ram_addr_i : cmpl_read_addr;

always@(posedge clk or negedge rst_n)
    if(!rst_n)
        cmpl_addr_update <= 1'b0;
    else if(m_axi_awvalid & m_axi_awready)
        cmpl_addr_update <= 1'b1;
    else if(cmpl_addr_update & !cmpl_ram_hi_i & !cmpl_ram_lo_i)
        cmpl_addr_update <= 1'b0;

endmodule
