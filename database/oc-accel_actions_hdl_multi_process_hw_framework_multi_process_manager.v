// This program was cloned from: https://github.com/OpenCAPI/oc-accel
// License: Apache License 2.0

`timescale 1ns/1ps
//Yanheng Lu
//IBM CSL OpenPower
//lyhlu@cn.ibm.com

module mp_manager #(
    parameter ID_WIDTH = 1,
    parameter ARUSER_WIDTH = 9,
    parameter AWUSER_WIDTH = 9,
    parameter DATA_WIDTH = 1024,
    parameter ADDR_WIDTH = 64
)(
        input                               clk             ,
        input                               rst_n           ,
        input      [087:0]                  process_info_i  ,
        input                               process_start_i ,
        output                              process_ready_o ,
        input                               dsc0_pull_i     ,
		output      [1023:0]                dsc0_data_o     ,
        output                              dsc0_ready_o    ,

        //---- AXI bus ----
           // AXI read address channel
        output     [ID_WIDTH - 1:0]       m_axi_arid    ,
        output     [ADDR_WIDTH - 1:0]     m_axi_araddr  ,
        output     [007:0]                m_axi_arlen   ,
        output     [002:0]                m_axi_arsize  ,
        output     [001:0]                m_axi_arburst ,
        output     [ARUSER_WIDTH - 1:0]   m_axi_aruser  ,
        output     [003:0]                m_axi_arcache ,
        output     [001:0]                m_axi_arlock  ,
        output     [002:0]                m_axi_arprot  ,
        output     [003:0]                m_axi_arqos   ,
        output     [003:0]                m_axi_arregion,
        output reg                        m_axi_arvalid ,
        input                             m_axi_arready ,
          // AXI read data channel
        output                            m_axi_rready  ,
        //input      [ARUSER_WIDTH - 1:0]   m_axi_ruser  ,
        input      [ID_WIDTH - 1:0]       m_axi_rid     ,
        input      [DATA_WIDTH - 1:0]     m_axi_rdata   ,
        input      [001:0]                m_axi_rresp   ,
        input                             m_axi_rlast   ,
        input                             m_axi_rvalid
);

    reg     [8:0]       process_num;
    reg                 in_read;
    wire                read_done;
    wire                read_request;
    wire                process_fifo_empty;
    wire                process_fifo_full;
    wire                process_fifo_valid;
    wire                process_fifo_pull;
    wire                process_fifo_push;
    wire    [87:0]      process_fifo_out;
    wire    [87:0]      process_fifo_in;
    wire                dsc_fifo_empty;
    wire                dsc_fifo_full;
    wire                dsc_fifo_valid;
    wire                dsc_fifo_pull;
    wire                dsc_fifo_push;
    wire    [1023:0]    dsc_fifo_out;
    wire    [1023:0]    dsc_fifo_in;
    wire    [5:0]       dsc_fifo_cnt;

    assign m_axi_arid     = 0;
    assign m_axi_arsize   = 3'd7; // 8*2^7=1024
    assign m_axi_arburst  = 2'd1; // INCR mode for memory access
    assign m_axi_arcache  = 4'd3; // Normal Non-cacheable Bufferable
    assign m_axi_arprot   = 3'd0;
    assign m_axi_arqos    = 4'd0;
    assign m_axi_arregion = 4'd0; //?
    assign m_axi_arlock   = 2'b00; // normal access
    assign m_axi_rready   = 1'b1;

process_fifo fifo_process (
    .clk        (clk                ),
    .rst        (!rst_n             ),
    .din        (process_fifo_in    ),
    .wr_en      (process_fifo_push  ),
    .rd_en      (process_fifo_pull  ),
    .dout       (process_fifo_out   ),
    .full       (process_fifo_full  ),
    .empty      (process_fifo_empty ),
    .data_count (                   )
);

	assign process_ready_o = !(read_done & (m_axi_rdata[1023:960] != 'd0));
    assign m_axi_araddr = process_fifo_out[63:0];
    assign m_axi_aruser = process_fifo_out[72:64];
    assign m_axi_arlen  = process_fifo_out[77:73];
    assign process_fifo_pull = read_done;
    assign process_fifo_push = (read_done & (m_axi_rdata[1023:960] != 'd0)) | process_start_i;
    assign process_fifo_in = (read_done & (m_axi_rdata[1023:960] != 'd0)) ? {10'b0,m_axi_rdata[12:8],process_num,m_axi_rdata[1023:960]} : process_info_i;
    assign read_done = m_axi_rvalid & m_axi_rlast & (m_axi_rresp == 2'b0) & (m_axi_rid == 5'b00000);
    assign read_request = ((dsc_fifo_cnt + m_axi_arlen) <'d63) & !in_read;

    always@(posedge clk) if(m_axi_arready & m_axi_arvalid) process_num <= m_axi_aruser;

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            in_read <= 1'b0;
        else if(m_axi_arready & m_axi_arvalid)
            in_read <= 1'b1;
        else if(read_done)
            in_read <= 1'b0;

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            m_axi_arvalid <= 1'b0;
        else if(m_axi_arready & m_axi_arvalid)
            m_axi_arvalid <= 1'b0;
        else if(read_request & !process_fifo_empty)
            m_axi_arvalid <= 1'b1;

descriptor_fifo fifo_descriptor (
    .clk        (clk            ), // input clk
    .rst        (!rst_n         ), // input rst
    .din        (dsc_fifo_in        ), // input [511 : 0] din
    .wr_en      (dsc_fifo_push      ), // input wr_en
    .rd_en      (dsc_fifo_pull      ), // input rd_en
    .dout       (dsc_fifo_out       ), // output [511 : 0] dout
    .full       (dsc_fifo_full      ), // output full
    .empty      (dsc_fifo_empty     ), // output empty
    .data_count (dsc_fifo_cnt       ) // output [4 : 0] data_count
);

    assign dsc_fifo_in = {23'b0, process_num, m_axi_rdata[991:0]};
    assign dsc_fifo_push = m_axi_rvalid & (m_axi_rid == 5'b00000) & (m_axi_rresp == 2'b00);
    assign dsc_fifo_pull = dsc0_pull_i;
    assign dsc0_data_o = dsc_fifo_out;
    assign dsc0_ready_o = !dsc_fifo_empty;

endmodule
