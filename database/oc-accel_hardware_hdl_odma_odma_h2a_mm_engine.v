// This program was cloned from: https://github.com/OpenCAPI/oc-accel
// License: Apache License 2.0

/*
 * Copyright 2019 International Business Machines
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
`include  "odma_defines.v"

module odma_h2a_mm_engine #(
                  parameter    AXI_ID_WIDTH    = 5   ,
                  parameter    AXI_ADDR_WIDTH  = 64  ,
                  parameter    AXI_DATA_WIDTH  = 1024,
                  parameter    AXI_WUSER_WIDTH  = 1, 
                  parameter    AXI_BUSER_WIDTH  = 1, 
                  parameter    AXI_AWUSER_WIDTH  = 9
)
(
                   input                                          clk               ,
                   input                                          rst_n             ,
                   //---------- Descriptor Interface ---------------------------//
                   output                                         dsc_ready         ,
                   input                                          dsc_valid         ,
                   input        [0255:0]                          dsc_data          ,
                   //---------- Completion Interface ---------------------------//
                   output reg                                     cmp_valid_0       ,
                   output reg   [0511:0]                          cmp_data_0        ,
                   input                                          cmp_resp_0        ,
                   output reg                                     cmp_valid_1       ,
                   output reg   [0511:0]                          cmp_data_1        ,
                   input                                          cmp_resp_1        ,
                   output reg                                     cmp_valid_2       ,
                   output reg   [0511:0]                          cmp_data_2        ,
                   input                                          cmp_resp_2        ,
                   output reg                                     cmp_valid_3       ,
                   output reg   [0511:0]                          cmp_data_3        ,
                   input                                          cmp_resp_3        ,
                   //---------- LCL Read Interface -----------------------------//
                   //---------- Read Addr/Req Channel --------------------------//
                   output                                         lcl_rd_valid      ,
                   output       [0063:0]                          lcl_rd_ea         ,
                   output       [AXI_ID_WIDTH - 1:0]              lcl_rd_axi_id     ,
                   output                                         lcl_rd_first      ,
                   output                                         lcl_rd_last       ,
                   output       [0127:0]                          lcl_rd_be         ,
                   output       [0008:0]                          lcl_rd_ctx        ,
                   output                                         lcl_rd_ctx_valid  ,
                   input                                          lcl_rd_ready      ,
                   //---------- Read Data/Resp Channel -------------------------//
                   input                                          lcl_rd_data_valid ,
                   input        [1023:0]                          lcl_rd_data       ,
                   input        [AXI_ID_WIDTH - 1:0]              lcl_rd_data_axi_id,
                   input                                          lcl_rd_data_last  ,
                   input                                          lcl_rd_rsp_code   ,
                   output       [0003:0]                          lcl_rd_rsp_ready  ,
                   output       [0003:0]                          lcl_rd_rsp_ready_hint,
                   //---------- AXI4-MM Write Interface -----------------------//
                   //---------- Write Addr/Req Channel -------------------------//
                   output reg   [AXI_ADDR_WIDTH - 1:0]            m_axi_awaddr      ,
                   output reg   [AXI_ID_WIDTH - 1:0]              m_axi_awid        ,
                   output reg   [0007:0]                          m_axi_awlen       ,
                   output       [0002:0]                          m_axi_awsize      ,
                   output       [0001:0]                          m_axi_awburst     ,
                   output       [0002:0]                          m_axi_awprot      ,
                   output       [0003:0]                          m_axi_awqos       ,
                   output       [0003:0]                          m_axi_awregion    ,
                   output       [AXI_AWUSER_WIDTH - 1:0]          m_axi_awuser      ,
                   output reg                                     m_axi_awvalid     ,
                   output       [0001:0]                          m_axi_awlock      ,
                   output       [0003:0]                          m_axi_awcache     ,
                   input                                          m_axi_awready     ,
                   //---------- Write Data Channel -----------------------------//
                   output reg   [AXI_DATA_WIDTH - 1:0]            m_axi_wdata       ,
                   output reg                                     m_axi_wlast       ,
                   output reg   [AXI_DATA_WIDTH/8 - 1:0]          m_axi_wstrb       ,
                   output reg                                     m_axi_wvalid      ,
                   output       [AXI_WUSER_WIDTH - 1:0]           m_axi_wuser       ,
                   input                                          m_axi_wready      ,
                   //---------- Write Response Channel -------------------------//
                   input                                          m_axi_bvalid      ,
                   input        [0001:0]                          m_axi_bresp       ,
                   input        [AXI_ID_WIDTH - 1:0]              m_axi_bid         ,
                   input        [AXI_BUSER_WIDTH - 1:0]           m_axi_buser       ,
                   output                                         m_axi_bready 
                  );


reg    [0255:0]    dsc_data_0;
reg    [0255:0]    dsc_data_1;
reg    [0001:0]    dsc_data_status;
reg    [0002:0]    dsc_cnt;
wire   [0002:0]    dsc_cmp_cnt;

reg    [0021:0]    lcl_rd_req_cnt;
reg    [0021:0]    lcl_rd_req_number;
//reg    [0007:0]    lcl_rd_first_len;
//reg    [0006:0]    lcl_rd_last_len;
reg    [0127:0]    lcl_rd_be_last;
reg    [0127:0]    lcl_rd_be_first;
reg                parser_ready;
reg    [0005:0]    rd_axi_id_reg;
reg    [0063:0]    lcl_src_addr;

reg                dsc0_onflight;
reg                dsc0_interrupt_req;
reg    [0001:0]    dsc0_channel_id;
reg    [0029:0]    dsc0_dsc_id;
reg    [0015:0]    dsc0_axi_req_number;
reg    [0015:0]    dsc0_axi_req_cnt;
reg    [0015:0]    dsc0_axi_burst_cnt;
reg    [0015:0]    dsc0_axi_burst_data_cnt;
reg    [0007:0]    dsc0_first_awlen;
reg    [0007:0]    dsc0_last_awlen;
reg    [0020:0]    dsc0_axi_data_cnt;
reg    [0020:0]    dsc0_axi_data_number;
reg    [0127:0]    dsc0_axi_wstrb_first; 
reg    [0127:0]    dsc0_axi_wstrb_last; 
reg    [0006:0]    dsc0_axi_data_last_byte; 
reg    [0015:0]    dsc0_axi_resp_cnt;
reg    [0063:0]    dsc0_dst_addr;
reg                dsc0_lcl_rd_error;
reg    [0063:0]    dsc0_lcl_src_addr;
reg    [0063:0]    dsc0_error_src_addr;
reg                dsc0_axi_wr_error;
reg    [0063:0]    dsc0_axi_dst_addr;
reg    [0063:0]    dsc0_error_dst_addr;

wire               dsc0_axi_data_first_beat;
wire               dsc0_axi_data_last_beat; 

reg                dsc1_onflight;
reg                dsc1_interrupt_req;
reg    [0001:0]    dsc1_channel_id;
reg    [0029:0]    dsc1_dsc_id;
reg    [0015:0]    dsc1_axi_req_number;
reg    [0015:0]    dsc1_axi_req_cnt;
reg    [0015:0]    dsc1_axi_burst_cnt;
reg    [0015:0]    dsc1_axi_burst_data_cnt;
reg    [0007:0]    dsc1_first_awlen;
reg    [0007:0]    dsc1_last_awlen;
reg    [0020:0]    dsc1_axi_data_cnt;
reg    [0020:0]    dsc1_axi_data_number;
reg    [0127:0]    dsc1_axi_wstrb_first; 
reg    [0127:0]    dsc1_axi_wstrb_last; 
reg    [0006:0]    dsc1_axi_data_last_byte; 
reg    [0015:0]    dsc1_axi_resp_cnt;
reg    [0063:0]    dsc1_dst_addr;
reg                dsc1_lcl_rd_error;
reg    [0063:0]    dsc1_lcl_src_addr;
reg    [0063:0]    dsc1_error_src_addr;
reg                dsc1_axi_wr_error;
reg    [0063:0]    dsc1_axi_dst_addr;
reg    [0063:0]    dsc1_error_dst_addr;

wire               dsc1_axi_data_first_beat;
wire               dsc1_axi_data_last_beat; 

reg                dsc2_onflight;
reg                dsc2_interrupt_req;
reg    [0001:0]    dsc2_channel_id;
reg    [0029:0]    dsc2_dsc_id;
reg    [0015:0]    dsc2_axi_req_number;
reg    [0015:0]    dsc2_axi_req_cnt;
reg    [0015:0]    dsc2_axi_burst_cnt;
reg    [0015:0]    dsc2_axi_burst_data_cnt;
reg    [0007:0]    dsc2_first_awlen;
reg    [0007:0]    dsc2_last_awlen;
reg    [0020:0]    dsc2_axi_data_cnt;
reg    [0020:0]    dsc2_axi_data_number;
reg    [0127:0]    dsc2_axi_wstrb_first; 
reg    [0127:0]    dsc2_axi_wstrb_last; 
reg    [0006:0]    dsc2_axi_data_last_byte; 
reg    [0015:0]    dsc2_axi_resp_cnt;
reg    [0063:0]    dsc2_dst_addr;
reg                dsc2_lcl_rd_error;
reg    [0063:0]    dsc2_lcl_src_addr;
reg    [0063:0]    dsc2_error_src_addr;
reg                dsc2_axi_wr_error;
reg    [0063:0]    dsc2_axi_dst_addr;
reg    [0063:0]    dsc2_error_dst_addr;

wire               dsc2_axi_data_first_beat;
wire               dsc2_axi_data_last_beat; 

reg                dsc3_onflight;
reg                dsc3_interrupt_req;
reg    [0001:0]    dsc3_channel_id;
reg    [0029:0]    dsc3_dsc_id;
reg    [0015:0]    dsc3_axi_req_number;
reg    [0015:0]    dsc3_axi_req_cnt;
reg    [0015:0]    dsc3_axi_burst_cnt;
reg    [0015:0]    dsc3_axi_burst_data_cnt;
reg    [0007:0]    dsc3_first_awlen;
reg    [0007:0]    dsc3_last_awlen;
reg    [0020:0]    dsc3_axi_data_cnt;
reg    [0020:0]    dsc3_axi_data_number;
reg    [0127:0]    dsc3_axi_wstrb_first; 
reg    [0127:0]    dsc3_axi_wstrb_last; 
reg    [0006:0]    dsc3_axi_data_last_byte; 
reg    [0015:0]    dsc3_axi_resp_cnt;
reg    [0063:0]    dsc3_dst_addr;
reg                dsc3_lcl_rd_error;
reg    [0063:0]    dsc3_lcl_src_addr;
reg    [0063:0]    dsc3_error_src_addr;
reg                dsc3_axi_wr_error;
reg    [0063:0]    dsc3_axi_dst_addr;
reg    [0063:0]    dsc3_error_dst_addr;

wire               dsc3_axi_data_first_beat;
wire               dsc3_axi_data_last_beat; 

reg    [0003:0]    dsc0_axi_wr_status;
reg    [0003:0]    dsc1_axi_wr_status;
reg    [0003:0]    dsc2_axi_wr_status;
reg    [0003:0]    dsc3_axi_wr_status;

wire               lcl_rd_issue;
wire   [0002:0]    engine_id;
reg    [0255:0]    descriptor;
wire               is_dsc_valid;
wire               interrupt_req;
wire   [0001:0]    channel_id;
wire   [0029:0]    dsc_id;
wire   [0027:0]    dsc_len;
wire   [0028:0]    dst_len_128B_extend;
wire   [0028:0]    src_len_128B_extend;
wire   [0063:0]    src_addr;
wire   [0063:0]    dst_addr;
wire               dst_data_4KB_align;

wire               add_dsc0;
wire               add_dsc1;
wire               add_dsc2;
wire               add_dsc3;

wire   [0003:0]    dsc_cmp;
wire               dsc0_cmp;
wire               dsc1_cmp;
wire               dsc2_cmp;
wire               dsc3_cmp;
wire               dsc_move_1_0;
wire               dsc_move_2_0;
wire               dsc_move_3_0;
wire               dsc_move_2_1;
wire               dsc_move_3_1;
wire               dsc_move_3_2;

reg    [0002:0]    axi_wr_req_id;
reg    [0002:0]    axi_wr_data_id;
reg    [0002:0]    axi_wr_resp_id;

wire               dsc0_axi_req_issue;
wire               dsc1_axi_req_issue;
wire               dsc2_axi_req_issue;
wire               dsc3_axi_req_issue;

wire               dsc0_axi_burst_issue;
wire               dsc1_axi_burst_issue;
wire               dsc2_axi_burst_issue;
wire               dsc3_axi_burst_issue;

wire               dsc0_axi_data_issue;
wire               dsc1_axi_data_issue;
wire               dsc2_axi_data_issue;
wire               dsc3_axi_data_issue;

wire               dsc0_axi_resp_received;
wire               dsc1_axi_resp_received;
wire               dsc2_axi_resp_received;
wire               dsc3_axi_resp_received;

wire               dsc0_axi_req_complete;
wire               dsc1_axi_req_complete;
wire               dsc2_axi_req_complete;
wire               dsc3_axi_req_complete;

wire               dsc0_axi_data_complete;
wire               dsc1_axi_data_complete;
wire               dsc2_axi_data_complete;
wire               dsc3_axi_data_complete;

wire               dsc0_axi_resp_complete;
wire               dsc1_axi_resp_complete;
wire               dsc2_axi_resp_complete;
wire               dsc3_axi_resp_complete;

wire   [0002:0]    lcl_rd_data_dsc_id;
wire               lcl_rd_data_receive_dsc0;
wire               lcl_rd_data_receive_dsc1;
wire               lcl_rd_data_receive_dsc2;
wire               lcl_rd_data_receive_dsc3;

reg    [0002:0]    current_data_channel_id;
wire               data_id_match;
wire               rdata_to_fifo;

// LCL Read Data FIFO signals
reg    [1023:0]    rdata_fifo0_din;
reg                rdata_fifo0_wen;
wire               rdata_fifo0_ren;
wire               rdata_fifo0_valid;
wire   [1023:0]    rdata_fifo0_dout;
wire               rdata_fifo0_full;
wire               rdata_fifo0_almost_full;
wire   [0005:0]    rdata_fifo0_cnt;
wire               rdata_fifo0_empty;
wire               rdata_fifo0_almost_empty;

reg    [1023:0]    rdata_fifo1_din;
reg                rdata_fifo1_wen;
wire               rdata_fifo1_ren;
wire               rdata_fifo1_valid;
wire   [1023:0]    rdata_fifo1_dout;
wire               rdata_fifo1_full;
wire               rdata_fifo1_almost_full;
wire   [0005:0]    rdata_fifo1_cnt;
wire               rdata_fifo1_empty;
wire               rdata_fifo1_almost_empty;

reg    [1023:0]    rdata_fifo2_din;
reg                rdata_fifo2_wen;
wire               rdata_fifo2_ren;
wire               rdata_fifo2_valid;
wire   [1023:0]    rdata_fifo2_dout;
wire               rdata_fifo2_full;
wire               rdata_fifo2_almost_full;
wire   [0005:0]    rdata_fifo2_cnt;
wire               rdata_fifo2_empty;
wire               rdata_fifo2_almost_empty;

reg    [1023:0]    rdata_fifo3_din;
reg                rdata_fifo3_wen;
wire               rdata_fifo3_ren;
wire               rdata_fifo3_valid;
wire   [1023:0]    rdata_fifo3_dout;
wire               rdata_fifo3_full;
wire               rdata_fifo3_almost_full;
wire   [0005:0]    rdata_fifo3_cnt;
wire               rdata_fifo3_empty;
wire               rdata_fifo3_almost_empty;

reg                rdata_lcl_ren;

wire               dsc0_sts_error;
wire               dsc1_sts_error;
wire               dsc2_sts_error;
wire               dsc3_sts_error;

wire   [0511:0]    dsc0_cmp_data;   
wire   [0511:0]    dsc1_cmp_data;   
wire   [0511:0]    dsc2_cmp_data;   
wire   [0511:0]    dsc3_cmp_data;   

reg    [0002:0]    cmp0_dsc_id;
reg    [0002:0]    cmp1_dsc_id;
reg    [0002:0]    cmp2_dsc_id;
reg    [0002:0]    cmp3_dsc_id;

reg                axi_data_valid;
reg                wdata_from_fifo;

reg                dsc0_cmp_status;
reg                dsc1_cmp_status;
reg                dsc2_cmp_status;
reg                dsc3_cmp_status;

wire   [0012:0]    dst_first_4KB_len;
wire   [0027:0]    dst_len_without_first_burst;


`ifdef ACTION_DATA_WIDTH_512
    reg    [0007:0]   m_axi_awlen_128B;
    reg               m_axi_wvalid_even;
    reg    [1023:0]   m_axi_wdata_128B;
    reg    [0127:0]   m_axi_wstrb_128B;
    reg               m_axi_wvalid_odd;
    reg    [0511:0]   m_axi_wdata_64B_odd;
    reg    [0063:0]   m_axi_wstrb_64B_odd;
    wire              axi_wdata_onduty;
    reg               m_axi_wbeat_even;
    reg               m_axi_wbeat_odd;
    wire   [0007:0]   dsc0_first_awlen_64B;
    wire   [0007:0]   dsc0_last_awlen_64B; 
    wire   [0007:0]   dsc1_first_awlen_64B;
    wire   [0007:0]   dsc1_last_awlen_64B; 
    wire   [0007:0]   dsc2_first_awlen_64B;
    wire   [0007:0]   dsc2_last_awlen_64B; 
    wire   [0007:0]   dsc3_first_awlen_64B;
    wire   [0007:0]   dsc3_last_awlen_64B; 
    wire              axi_data_issue_odd;
    wire              m_axi_wready_odd;
    wire               dsc0_axi_data_first_beat_128B; 
    wire               dsc1_axi_data_first_beat_128B; 
    wire               dsc2_axi_data_first_beat_128B; 
    wire               dsc3_axi_data_first_beat_128B; 
    wire               dsc0_axi_data_last_beat_128B; 
    wire               dsc1_axi_data_last_beat_128B; 
    wire               dsc2_axi_data_last_beat_128B; 
    wire               dsc3_axi_data_last_beat_128B; 
`endif


/////////////////////////////
//
// For debug
//
/////////////////////////////


reg [27:0] lcl_rd_cnt;
reg [27:0] lcl_rd_data_cnt;

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        lcl_rd_cnt <= 28'd0;
    else if (lcl_rd_valid && lcl_rd_ready && (lcl_rd_axi_id == 5'b00010))
        lcl_rd_cnt <= (lcl_rd_last)? 28'd0 : lcl_rd_cnt + 1;
    else
        lcl_rd_cnt <= lcl_rd_cnt;

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        lcl_rd_data_cnt <= 28'd0;
    else if (lcl_rd_data_valid && lcl_rd_rsp_ready[2] && (lcl_rd_data_axi_id == 5'b00010))
        lcl_rd_data_cnt <= (lcl_rd_data_last)? 28'd0 : lcl_rd_data_cnt + 1;
    else
        lcl_rd_data_cnt <= lcl_rd_data_cnt;


/////////////////////////////////////////////////////////////////////////////
//
//                            dsc_buffer
//                          +------------+  descriptor     
//  +---------+  dsc_data   | dsc_data_0 | ------------>  +------------+
//  | dsc_eng | --------->  --------------                | dsc_parser |
//  +---------+ <---------  | dsc_data_1 | <------------  +------------+ 
//               dsc_ready  +------------+  parser_ready
//
//
//  dsc_data_status: bit0 - Data is pushed into dsc_data_0;
//                   bit1 - Data is pushed into dsc_data_1.
//
//  When dsc_valid is 1, the dsc_buffer will receive the dsc_data and push
//  into the dsc_buffer. 
//  When parser_ready is 1, the dsc_buffer will send the descriptor to the
//  dsc_parser.
//  There are 2 cylces for dsc_data transfer from dsc_eng to dsc_parser.
//
/////////////////////////////////////////////////////////////////////////////



always@(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc_data_0 <= 256'b0;
    else 
        casex ({dsc_valid, parser_ready, dsc_data_status})
            4'b1x00: dsc_data_0 <= dsc_data;
            4'b1110: dsc_data_0 <= dsc_data;
            4'b0101: dsc_data_0 <= 256'b0;
            4'b1101: dsc_data_0 <= dsc_data;
            4'bx010: dsc_data_0 <= dsc_data_1;
            4'b0111: dsc_data_0 <= dsc_data_1;
            default: dsc_data_0 <= dsc_data_0;
        endcase

always@(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc_data_1 <= 256'b0;
    else
        casex ({dsc_valid, parser_ready, dsc_data_status})
            4'b1001: dsc_data_1 <= dsc_data;
            4'b1101: dsc_data_1 <= 256'b0;
            4'b1010: dsc_data_1 <= dsc_data;
            4'b0x10: dsc_data_1 <= 256'b0;
            4'b1110: dsc_data_1 <= 256'b0;
            4'b0111: dsc_data_1 <= 256'b0;
            default: dsc_data_1 <= dsc_data_1;
        endcase

always@(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc_data_status <= 2'b00;
    else 
      casex ({dsc_data_status[1:0], dsc_valid, parser_ready})
        4'b001x:  dsc_data_status <= 2'b01;                  // dsc_data will be pushed into the data_buffer first
        4'b0101:  dsc_data_status <= 2'b00;
        4'b0110:  dsc_data_status <= 2'b11;
        4'b1000:  dsc_data_status <= 2'b01;
        4'b1001:  dsc_data_status <= 2'b00;
        4'b1010:  dsc_data_status <= 2'b11;
        4'b1011:  dsc_data_status <= 2'b01;
        4'b1101:  dsc_data_status <= 2'b01;
        default:  dsc_data_status <= dsc_data_status;
      endcase

assign dsc_ready = ~(dsc_data_status[0] & dsc_data_status[1]);

//*****************************************************//
//                                                     //
//  When parser_ready is high and there is valid data  //
//  in the descriptor buffer, the buffer will send one //
//  descriptor to the dsc_parser.                      //
//                                                     //
//*****************************************************//

always @(*) begin
    casex ({parser_ready, dsc_data_status[1:0]})
        3'b1x1:   descriptor = dsc_data_0;
        3'b110:   descriptor = dsc_data_1;
        default:  descriptor = 256'b0;
    endcase
end

assign is_dsc_valid = (descriptor[31:16] == 16'had4b);
assign dsc_len = descriptor[59:32];
assign src_addr = descriptor[127:64];
assign dst_addr = descriptor[191:128];
assign channel_id = descriptor[223:222];
assign dsc_id = descriptor[221:192];
assign engine_id = `H2AMM_ENGINE_ID;
assign interrupt_req = descriptor[1];

wire             is_dsc_unalign;
wire [0127:0]    full_wr_be;
wire [0127:0]    lcl_first_be;
wire [0127:0]    lcl_last_be;
wire [0021:0]    lcl_req_len;
wire [0007:0]    lcl_first_len;
wire [0007:0]    lcl_first_extended_len;


wire [0021:0]    axi_wdata_len;
wire [0007:0]    axi_wbeat_first;
wire [0127:0]    axi_wstrb_first;
wire [0127:0]    axi_wstrb_last;

assign full_wr_be = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
assign is_dsc_unalign = (src_addr[6:0] != 7'b0) || (dst_addr[6:0] != 7'b0);

assign dst_len_128B_extend = dsc_len + dst_addr[6:0];
assign src_len_128B_extend = dsc_len + src_addr[6:0];


assign lcl_first_extended_len = src_addr[6:0];
assign lcl_req_len = (src_len_128B_extend[6:0] == 7'd0)? (src_len_128B_extend >> 7) : ((src_len_128B_extend >> 7) + 1);
assign lcl_first_len = (dsc_len > (8'd128 - src_addr[6:0]))? (8'd128 - src_addr[6:0]) : dsc_len;
assign lcl_first_be = (dsc_len > (8'd128 - src_addr[6:0]))? ((full_wr_be >> (8'd128 - lcl_first_len)) << (8'd128 - lcl_first_len)) : (full_wr_be << (8'd128 - lcl_first_extended_len - lcl_first_len) >> (8'd128 - lcl_first_len) << (lcl_first_extended_len));
assign lcl_last_be = (src_len_128B_extend[6:0] == 7'd0)? full_wr_be : (full_wr_be >> (8'd128 - src_len_128B_extend[6:0]));

assign axi_wdata_len = (dst_len_128B_extend[6:0] == 7'd0)?  (dst_len_128B_extend >> 7) : ((dst_len_128B_extend >> 7) + 1); 
assign axi_wbeat_first = (dsc_len > (8'd128 - dst_addr[6:0]))? (8'd128 - dst_addr[6:0]) : dsc_len;
//assign axi_wstrb_first = (full_wr_be >> (8'd128 - axi_wbeat_first)) << (8'd128 - axi_wbeat_first);
assign axi_wstrb_first = lcl_first_be;
assign axi_wstrb_last = (dst_len_128B_extend[6:0] == 7'd0)? full_wr_be : (full_wr_be >> (8'd128 - dst_len_128B_extend[6:0]));


assign dst_first_4KB_len = (dst_len_128B_extend > (13'h1000 - {dst_addr[11:7], 7'b0000000}))? (13'h1000 - {dst_addr[11:7], 7'b0000000}) : dst_len_128B_extend;
assign dst_len_without_first_burst = (dst_len_128B_extend > dst_first_4KB_len)? (dst_len_128B_extend - dst_first_4KB_len) : 28'h0;

assign dst_data_4KB_align = (dst_len_without_first_burst[11:0] == 12'd0);

////////////////////////////////////////////////////////////////////////////////////////////
//
//                                 +----------------+             +-----------------------+                
//   +------------+  descriptor    |                | ----------> |                       |         
//   | dsc_buffer | <------------> |   dsc_parser   |             | lcl_rd_req dispatcher |                    
//   +------------+  parser_ready  |                | <---------- |                       | 
//                                 +----------------+             +-----------------------+ 
//                                                                
//  parser_ready: 1) For an idle scenario, the parser_ready is always pulled up.
//                2) From a specific dscriptor is valid at the dsc_parser to the last beat 
//                   of LCL Read Request is sent out, we call the dsc_parser is busy. 
//                   parser_ready will be pulled down when the dsc_parser is busy.
//
////////////////////////////////////////////////////////////////////////////////////////////

assign dsc_cmp_cnt = dsc0_cmp + dsc1_cmp + dsc2_cmp + dsc3_cmp;
// onflight descriptor counter
// dsc_cmp_cnt from 3'd0 to 3'd4
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc_cnt <= 0;
    else
        case ({is_dsc_valid, dsc_cmp_cnt})
            4'b1000:   dsc_cnt <= dsc_cnt + 1;
            4'b1010:   dsc_cnt <= dsc_cnt - 1;
            4'b1011:   dsc_cnt <= dsc_cnt - 2;
            4'b1100:   dsc_cnt <= dsc_cnt - 3;
            4'b0001:   dsc_cnt <= dsc_cnt - 1;
            4'b0010:   dsc_cnt <= dsc_cnt - 2;
            4'b0011:   dsc_cnt <= dsc_cnt - 3;
            4'b0100:   dsc_cnt <= dsc_cnt - 4;
            default: dsc_cnt <= dsc_cnt;
        endcase

always @(posedge clk or negedge rst_n)
    if(!rst_n)
        rd_axi_id_reg <= 5'b0;
    else if (is_dsc_valid)
        rd_axi_id_reg <= {channel_id, engine_id};
    else
        rd_axi_id_reg <= rd_axi_id_reg;

// lcl_rd_req_cnt for lcl read request beat counter
// is_dsc_valid and lcl_rd_valid can not be pulled up at the same cycle
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        lcl_rd_req_cnt <= 0;
    else
        case ({is_dsc_valid, lcl_rd_issue})
            2'b10:  lcl_rd_req_cnt <= lcl_req_len;
            2'b01:  lcl_rd_req_cnt <= lcl_rd_req_cnt - 1;
            default: lcl_rd_req_cnt <= lcl_rd_req_cnt;
        endcase

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        lcl_rd_req_number <= 22'd0;
    else if (is_dsc_valid)
        lcl_rd_req_number <= lcl_req_len;
    else
        lcl_rd_req_number <= lcl_rd_req_number;

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        lcl_rd_be_first <= 128'h0;
    else if (is_dsc_valid)
        lcl_rd_be_first <= lcl_first_be;
    else
        lcl_rd_be_first <= lcl_rd_be_first;

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        lcl_rd_be_last <= 128'h0;
    else if (is_dsc_valid)
        lcl_rd_be_last <= lcl_last_be;
    else
        lcl_rd_be_last <= lcl_rd_be_last;

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        lcl_src_addr <= 64'b0;
    else if (is_dsc_valid)
        lcl_src_addr <= {src_addr[63:7], 7'b0000000};
    else if (lcl_rd_issue && (~lcl_rd_last))
        lcl_src_addr <= lcl_src_addr + 64'd128;
    else 
        lcl_src_addr <= lcl_src_addr;

assign lcl_rd_issue = lcl_rd_valid & lcl_rd_ready;

// LCL Read Requst Interface signals        
assign lcl_rd_valid = (lcl_rd_req_cnt != 0);
assign lcl_rd_axi_id = rd_axi_id_reg;
assign lcl_rd_first = (lcl_rd_req_cnt != 0) & (lcl_rd_req_cnt == lcl_rd_req_number);
assign lcl_rd_last = (lcl_rd_req_cnt != 0) & (lcl_rd_req_cnt == 21'd1);
assign lcl_rd_ea = lcl_src_addr;
assign lcl_rd_ctx = 9'b0;
assign lcl_rd_ctx_valid = 0;
assign lcl_rd_be = (lcl_rd_first)? lcl_rd_be_first : ((lcl_rd_last)? lcl_rd_be_last : 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF);

// parser_ready signal back to dsc_buffer
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        parser_ready <= 1;
    else if (is_dsc_valid)
        parser_ready <= 0;
    else if (lcl_rd_last && lcl_rd_issue)
        parser_ready <= (dsc_cnt != 3'd4)? 1 : ((dsc_cmp_cnt > 0)? 1 : 0);
    else if ((!lcl_rd_valid) && (dsc_cnt == 3'd4) && (dsc_cmp_cnt > 0))
        parser_ready <= 1;
    else
        parser_ready <= parser_ready;


////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//                                                                
//   +----------------+              +------------------+               
//   |                | <----------  |                  |
//   |   dsc_parser   |              |    wdata_mux     |               
//   |                | ---------->  |                  |
//   +----------------+              +------------------+
//                                    
//  For each onflight descriptor, we will keep 3 kinds of information for each descriptor:
//      1) dsc*_channel_id:
//      2) dsc*_axi_req_cnt:  the AXI-MM WR Arbiter will determine how many AXI Write requests will be sent 
//                  to the action. For now, we will try to send AXI Write burst with 4KB max.
//      3) dsc*_axi_data_cnt: 
//      4) dsc*_axi_resp_cnt:  
//      5) dsc*_src_addr: 
//      6) dsc*_axi_wr_status[3:0]: if pull up dsc*_axi_wr_status[0] - the descriptor completes parsing and is ready for AXI-MM Write transfer
//                                  if pull up dsc*_axi_wr_status[1] - the descriptor completes AXI-MM Write Address/Requests transfer
//                                  if pull up dsc*_axi_wr_status[2] - the descriptor completes AXI-MM Write Data transfer
//                                  if pull up dsc*_axi_wr_status[3] - the descriptor completes AXI-MM Response transfer
//
////////////////////////////////////////////////////////////////////////////////////////////////

// descriptor new add logic
assign add_dsc0 = is_dsc_valid && (dsc_cmp_cnt == dsc_cnt);
assign add_dsc1 = is_dsc_valid && ((dsc_cmp_cnt + 1) == dsc_cnt);
assign add_dsc2 = is_dsc_valid && ((dsc_cmp_cnt + 2) == dsc_cnt);
assign add_dsc3 = is_dsc_valid && ((dsc_cmp_cnt + 3) == dsc_cnt);

// descriptor move logic
assign dsc_cmp = {dsc0_cmp, dsc1_cmp, dsc2_cmp, dsc3_cmp};
assign dsc_move_1_0 = ((dsc_cnt == 3'd2) && (dsc_cmp == 4'b1000)) || ((dsc_cnt == 3'd3) && ((dsc_cmp == 4'b1000) || (dsc_cmp == 4'b1010))) || ((dsc_cnt == 3'd4) && (dsc_cmp[3:2] == 2'b10));
assign dsc_move_2_0 = ((dsc_cnt == 3'd3) && (dsc_cmp == 4'b1100)) || ((dsc_cnt == 3'd4) && ((dsc_cmp == 4'b1100) || (dsc_cmp == 4'b1101)));
assign dsc_move_3_0 = (dsc_cnt == 3'd4) && (dsc_cmp == 4'b1110);
assign dsc_move_2_1 = ((dsc_cnt == 3'd3) && ((dsc_cmp == 4'b1000) || (dsc_cmp == 4'b0100))) || ((dsc_cnt == 3'd4) && ((dsc_cmp == 4'b1000) || (dsc_cmp == 4'b0100) || (dsc_cmp == 4'b1001) || (dsc_cmp == 4'b0101)));
assign dsc_move_3_1 = (dsc_cnt == 3'd4) && ((dsc_cmp == 4'b1100) || (dsc_cmp == 4'b1010));
assign dsc_move_3_2 = (dsc_cnt == 3'd4) && ((dsc_cmp == 4'b1000) || (dsc_cmp == 4'b0100) || (dsc_cmp == 4'b0010)); 
assign dsc3_clear = (dsc_cnt == 3'd4) && (!add_dsc3) && (dsc0_cmp || dsc1_cmp || dsc2_cmp || dsc3_cmp);

always @(*) begin
    casex({dsc0_axi_wr_status[1:0], dsc1_axi_wr_status[1:0], dsc2_axi_wr_status[1:0], dsc3_axi_wr_status[1:0]})
        8'b01xxxxxx: axi_wr_req_id = 3'd0;
        8'b1101xxxx: axi_wr_req_id = 3'd1;
        8'b111101xx: axi_wr_req_id = 3'd2;
        8'b11111101: axi_wr_req_id = 3'd3;
        default:     axi_wr_req_id = 3'd7;
    endcase
end

always @(*) begin
    casex({dsc0_axi_wr_status[2], dsc0_axi_wr_status[0], dsc1_axi_wr_status[2], dsc1_axi_wr_status[0], dsc2_axi_wr_status[2], dsc2_axi_wr_status[0], dsc3_axi_wr_status[2], dsc3_axi_wr_status[0]})
        8'b01xxxxxx: axi_wr_data_id = 3'd0;
        8'b1101xxxx: axi_wr_data_id = 3'd1;
        8'b111101xx: axi_wr_data_id = 3'd2;
        8'b11111101: axi_wr_data_id = 3'd3;
        default:     axi_wr_data_id = 3'd7;
    endcase
end
        
assign dsc0_axi_req_issue = m_axi_awvalid && m_axi_awready && (axi_wr_req_id == 3'd0);
assign dsc1_axi_req_issue = m_axi_awvalid && m_axi_awready && (axi_wr_req_id == 3'd1);
assign dsc2_axi_req_issue = m_axi_awvalid && m_axi_awready && (axi_wr_req_id == 3'd2);
assign dsc3_axi_req_issue = m_axi_awvalid && m_axi_awready && (axi_wr_req_id == 3'd3);

assign dsc0_axi_data_issue = m_axi_wvalid && m_axi_wready && (axi_wr_data_id == 3'd0); 
assign dsc1_axi_data_issue = m_axi_wvalid && m_axi_wready && (axi_wr_data_id == 3'd1); 
assign dsc2_axi_data_issue = m_axi_wvalid && m_axi_wready && (axi_wr_data_id == 3'd2); 
assign dsc3_axi_data_issue = m_axi_wvalid && m_axi_wready && (axi_wr_data_id == 3'd3); 

assign dsc0_axi_burst_issue = m_axi_wvalid && m_axi_wready && m_axi_wlast && (axi_wr_data_id == 3'd0); 
assign dsc1_axi_burst_issue = m_axi_wvalid && m_axi_wready && m_axi_wlast && (axi_wr_data_id == 3'd1); 
assign dsc2_axi_burst_issue = m_axi_wvalid && m_axi_wready && m_axi_wlast && (axi_wr_data_id == 3'd2); 
assign dsc3_axi_burst_issue = m_axi_wvalid && m_axi_wready && m_axi_wlast && (axi_wr_data_id == 3'd3); 

//*****************************************//
//     registers for Descriptor0           //
//*****************************************//

// for dsc0_onflight
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc0_onflight <= 1'b0;
    else
        casex ({add_dsc0, dsc0_cmp, dsc_move_1_0, dsc_move_2_0, dsc_move_3_0})
            5'b10000: dsc0_onflight <= 1'b1;
            5'b0x100: dsc0_onflight <= dsc1_onflight;
            5'b0x010: dsc0_onflight <= dsc2_onflight;
            5'b0x001: dsc0_onflight <= dsc3_onflight;
            5'b01000: dsc0_onflight <= 1'b0;
            default:  dsc0_onflight <= dsc0_onflight;
        endcase

// for dsc0_interrupt_req
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc0_interrupt_req <= 1'b0;
    else
        case ({add_dsc0, dsc_move_1_0, dsc_move_2_0, dsc_move_3_0})
            4'b1000: dsc0_interrupt_req <= interrupt_req;
            4'b0100: dsc0_interrupt_req <= dsc1_interrupt_req;
            4'b0010: dsc0_interrupt_req <= dsc2_interrupt_req;
            4'b0001: dsc0_interrupt_req <= dsc3_interrupt_req;
            default: dsc0_interrupt_req <= dsc0_interrupt_req;
        endcase

// for dsc0_channel_id
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc0_channel_id <= 2'b00;
    else
        case ({add_dsc0, dsc_move_1_0, dsc_move_2_0, dsc_move_3_0})
            4'b1000: dsc0_channel_id <= channel_id;
            4'b0100: dsc0_channel_id <= dsc1_channel_id;
            4'b0010: dsc0_channel_id <= dsc2_channel_id;
            4'b0001: dsc0_channel_id <= dsc3_channel_id;
            default: dsc0_channel_id <= dsc0_channel_id;
        endcase

// for dsc0_dsc_id
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc0_dsc_id <= 30'b0;
    else
        case ({add_dsc0, dsc_move_1_0, dsc_move_2_0, dsc_move_3_0})
            4'b1000: dsc0_dsc_id <= dsc_id;
            4'b0100: dsc0_dsc_id <= dsc1_dsc_id;
            4'b0010: dsc0_dsc_id <= dsc2_dsc_id;
            4'b0001: dsc0_dsc_id <= dsc3_dsc_id;
            default: dsc0_dsc_id <= dsc0_dsc_id;
        endcase

// for dsc0_axi_req_number
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc0_axi_req_number <= 16'd0;
    else
        case ({add_dsc0, dsc_move_1_0, dsc_move_2_0, dsc_move_3_0})
            4'b1000:  dsc0_axi_req_number <= (dst_data_4KB_align)? (dst_len_without_first_burst[27:12] + 1) : (dst_len_without_first_burst[27:12] + 2);// TODO: Need to make sure whether it need a +1 when data unalignment occurs
            4'b0100:  dsc0_axi_req_number <= dsc1_axi_req_number;
            4'b0010:  dsc0_axi_req_number <= dsc2_axi_req_number;
            4'b0001:  dsc0_axi_req_number <= dsc3_axi_req_number;
            default:  dsc0_axi_req_number <= dsc0_axi_req_number; 
        endcase 

// for dsc0_axi_req_cnt
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc0_axi_req_cnt <= 16'd0;
    else
        case ({add_dsc0, dsc0_axi_req_issue, dsc_move_1_0, dsc_move_2_0, dsc_move_3_0})
            5'b10000:  dsc0_axi_req_cnt <= (dst_data_4KB_align)? (dst_len_without_first_burst[27:12] + 1) : (dst_len_without_first_burst[27:12] + 2);// TODO: Need to make sure whether it need a +1 when data unalignment occurs
            5'b01000:  dsc0_axi_req_cnt <= dsc0_axi_req_cnt - 1;
            5'b00100:  dsc0_axi_req_cnt <= (dsc1_axi_req_issue)? (dsc1_axi_req_cnt - 1) : dsc1_axi_req_cnt;
            5'b00010:  dsc0_axi_req_cnt <= (dsc2_axi_req_issue)? (dsc2_axi_req_cnt - 1) : dsc2_axi_req_cnt;
            5'b00001:  dsc0_axi_req_cnt <= (dsc3_axi_req_issue)? (dsc3_axi_req_cnt - 1) : dsc3_axi_req_cnt;
            default:   dsc0_axi_req_cnt <= dsc0_axi_req_cnt; 
        endcase 

// for dsc0_axi_burst_cnt
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc0_axi_burst_cnt <= 16'd0;
    else
        casex ({add_dsc0, dsc0_axi_burst_issue, dsc_move_1_0, dsc_move_2_0, dsc_move_3_0})
            5'b10000:  dsc0_axi_burst_cnt <= (dst_data_4KB_align)? (dst_len_without_first_burst[27:12] + 1) : (dst_len_without_first_burst[27:12] + 2);// TODO: Need to make sure whether it need a +1 when data unalignment occurs
            5'b01000:  dsc0_axi_burst_cnt <= (dsc0_axi_burst_cnt == 16'd1)? dsc0_axi_burst_cnt : (dsc0_axi_burst_cnt - 1);
            5'b0x100:  dsc0_axi_burst_cnt <= (dsc1_axi_burst_issue)? (dsc1_axi_burst_cnt - 1) : dsc1_axi_burst_cnt;
            5'b0x010:  dsc0_axi_burst_cnt <= (dsc2_axi_burst_issue)? (dsc2_axi_burst_cnt - 1) : dsc2_axi_burst_cnt;
            5'b00001:  dsc0_axi_burst_cnt <= (dsc3_axi_burst_issue)? (dsc3_axi_burst_cnt - 1) : dsc3_axi_burst_cnt;
            default:   dsc0_axi_burst_cnt <= dsc0_axi_burst_cnt; 
        endcase 

// for dsc0_dst_addr
// TODO: Address is not alignment with 4K
always @(posedge clk or negedge rst_n)
    if(!rst_n)
        dsc0_dst_addr <= 64'h0;
    else
        case ({add_dsc0, dsc0_axi_req_issue, dsc_move_1_0, dsc_move_2_0, dsc_move_3_0})
            5'b10000:  dsc0_dst_addr <= {dst_addr[63:7], 7'b0000000};
            5'b01000:  dsc0_dst_addr <= (dsc0_axi_req_cnt == 16'd1)? dsc0_dst_addr : {(dsc0_dst_addr[63:12] + 1), 12'h0};        // Each AXI-MM Write transfer is a 4K busrt
            5'b00100:  dsc0_dst_addr <= (dsc1_axi_req_issue)? ((dsc1_axi_req_cnt == 16'd1)? dsc1_dst_addr : {(dsc1_dst_addr[63:12] + 1), 12'h0}) : dsc1_dst_addr;
            5'b00010:  dsc0_dst_addr <= (dsc2_axi_req_issue)? ((dsc2_axi_req_cnt == 16'd1)? dsc2_dst_addr : {(dsc2_dst_addr[63:12] + 1), 12'h0}) : dsc2_dst_addr;
            5'b00001:  dsc0_dst_addr <= (dsc3_axi_req_issue)? ((dsc3_axi_req_cnt == 16'd1)? dsc3_dst_addr : {(dsc3_dst_addr[63:12] + 1), 12'h0}) : dsc3_dst_addr;
            default:   dsc0_dst_addr <= dsc0_dst_addr;
        endcase

//for dsc0_first_awlen
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc0_first_awlen <= 8'h0;
    else
        case ({add_dsc0, dsc_move_1_0, dsc_move_2_0, dsc_move_3_0})
            4'b1000: dsc0_first_awlen <= (dst_first_4KB_len[6:0] == 7'b0)? ((dst_first_4KB_len >> 7) - 1) : (dst_first_4KB_len >> 7);
            4'b0100: dsc0_first_awlen <= dsc1_first_awlen; 
            4'b0010: dsc0_first_awlen <= dsc2_first_awlen; 
            4'b0001: dsc0_first_awlen <= dsc3_first_awlen;
            default: dsc0_first_awlen <= dsc0_first_awlen;
        endcase 

// for dsc0_last_awlen
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc0_last_awlen <= 8'b0;
    else
        case ({add_dsc0, dsc_move_1_0, dsc_move_2_0, dsc_move_3_0})
            4'b1000: dsc0_last_awlen <= (dst_data_4KB_align)? 8'd31 : ((dst_len_without_first_burst[6:0] != 7'b0000000)? dst_len_without_first_burst[11:7] :(dst_len_without_first_burst[11:7] - 1));
            4'b0100: dsc0_last_awlen <= dsc1_last_awlen;
            4'b0010: dsc0_last_awlen <= dsc2_last_awlen;
            4'b0001: dsc0_last_awlen <= dsc3_last_awlen;
            default: dsc0_last_awlen <= dsc0_last_awlen;
        endcase


`ifdef ACTION_DATA_WIDTH_512
// TODO
    // for dsc0_axi_data_cnt
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            dsc0_axi_data_cnt <= 21'd0;
        else
            case ({add_dsc0, dsc0_axi_data_issue, dsc_move_1_0, dsc_move_2_0, dsc_move_3_0})
                5'b10000:  dsc0_axi_data_cnt <= (axi_wdata_len << 1); 
                5'b01000:  dsc0_axi_data_cnt <= dsc0_axi_data_cnt - 1;
                5'b00100:  dsc0_axi_data_cnt <= (dsc1_axi_data_issue)? (dsc1_axi_data_cnt - 1) : dsc1_axi_data_cnt;
                5'b00010:  dsc0_axi_data_cnt <= (dsc2_axi_data_issue)? (dsc2_axi_data_cnt - 1) : dsc2_axi_data_cnt;
                5'b00001:  dsc0_axi_data_cnt <= (dsc1_axi_data_issue)? (dsc3_axi_data_cnt - 1) : dsc3_axi_data_cnt;
                default:   dsc0_axi_data_cnt <= dsc0_axi_data_cnt; 
            endcase 
    
    // for dsc0_axi_data_number
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            dsc0_axi_data_number <= 21'd0;
        else
            case ({add_dsc0, dsc_move_1_0, dsc_move_2_0, dsc_move_3_0})
                4'b1000:  dsc0_axi_data_number <= (axi_wdata_len << 1);
                4'b0100:  dsc0_axi_data_number <= dsc1_axi_data_number;
                4'b0010:  dsc0_axi_data_number <= dsc2_axi_data_number;
                4'b0001:  dsc0_axi_data_number <= dsc3_axi_data_number;
                default:  dsc0_axi_data_number <= dsc0_axi_data_number; 
            endcase 


    assign dsc0_first_awlen_64B = (dsc0_first_awlen << 1) + 1;
    assign dsc0_last_awlen_64B  = (dsc0_last_awlen << 1) + 1;
    // for dsc0_axi_burst_data_cnt
    always @(*) begin
        if (dsc0_axi_burst_cnt == dsc0_axi_req_number)          // if there is only 1 burst, it will not trun to the 1st else if
            dsc0_axi_burst_data_cnt = dsc0_first_awlen_64B + 1;
        else if (dsc0_axi_burst_cnt == 16'd1)
            dsc0_axi_burst_data_cnt = (dsc0_first_awlen_64B + 1) + ((dsc0_axi_req_number - 2) << 6) + (dsc0_last_awlen_64B + 1);
        else
            dsc0_axi_burst_data_cnt = (dsc0_first_awlen_64B + 1) + ((dsc0_axi_req_number - dsc0_axi_burst_cnt) << 6);
    end
    assign dsc0_axi_data_first_beat_128B = (dsc0_axi_data_cnt == dsc0_axi_data_number || (dsc0_axi_data_cnt == dsc0_axi_data_number - 1)) && dsc0_onflight;
    assign dsc0_axi_data_last_beat_128B = (dsc0_axi_data_cnt == 21'd2 || dsc0_axi_data_cnt == 21'd1) && dsc0_onflight;
`else
    // for dsc0_axi_data_cnt
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            dsc0_axi_data_cnt <= 21'd0;
        else
            case ({add_dsc0, dsc0_axi_data_issue, dsc_move_1_0, dsc_move_2_0, dsc_move_3_0})
                5'b10000:  dsc0_axi_data_cnt <= axi_wdata_len; 
                5'b01000:  dsc0_axi_data_cnt <= dsc0_axi_data_cnt - 1;
                5'b00100:  dsc0_axi_data_cnt <= (dsc1_axi_data_issue)? (dsc1_axi_data_cnt - 1) : dsc1_axi_data_cnt;
                5'b00010:  dsc0_axi_data_cnt <= (dsc2_axi_data_issue)? (dsc2_axi_data_cnt - 1) : dsc2_axi_data_cnt;
                5'b00001:  dsc0_axi_data_cnt <= (dsc1_axi_data_issue)? (dsc3_axi_data_cnt - 1) : dsc3_axi_data_cnt;
                default:   dsc0_axi_data_cnt <= dsc0_axi_data_cnt; 
            endcase 
    
    // for dsc0_axi_data_number
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            dsc0_axi_data_number <= 21'd0;
        else
            case ({add_dsc0, dsc_move_1_0, dsc_move_2_0, dsc_move_3_0})
                4'b1000:  dsc0_axi_data_number <= axi_wdata_len;
                4'b0100:  dsc0_axi_data_number <= dsc1_axi_data_number;
                4'b0010:  dsc0_axi_data_number <= dsc2_axi_data_number;
                4'b0001:  dsc0_axi_data_number <= dsc3_axi_data_number;
                default:  dsc0_axi_data_number <= dsc0_axi_data_number; 
            endcase 

    // for dsc0_axi_burst_data_cnt
    always @(*) begin
        if (dsc0_axi_burst_cnt == dsc0_axi_req_number)          // if there is only 1 burst, it will not trun to the 1st else if
            dsc0_axi_burst_data_cnt = dsc0_first_awlen + 1;
        else if (dsc0_axi_burst_cnt == 16'd1)
            dsc0_axi_burst_data_cnt = (dsc0_first_awlen + 1) + ((dsc0_axi_req_number - 2) << 5) + (dsc0_last_awlen + 1);
        else
            dsc0_axi_burst_data_cnt = (dsc0_first_awlen + 1) + ((dsc0_axi_req_number - dsc0_axi_burst_cnt) << 5);
    end
`endif

assign dsc0_axi_data_first_beat = (dsc0_axi_data_cnt == dsc0_axi_data_number) && dsc0_onflight;
assign dsc0_axi_data_last_beat = (dsc0_axi_data_cnt == 21'd1) && dsc0_onflight;

// for  dsc0_axi_wstrb_first
always @(posedge clk or negedge rst_n)
    if (!rst_n)
         dsc0_axi_wstrb_first <= 128'b0;
    else
        case ({add_dsc0, dsc_move_1_0, dsc_move_2_0, dsc_move_3_0})
            4'b1000: dsc0_axi_wstrb_first <= axi_wstrb_first;
            4'b0100: dsc0_axi_wstrb_first <= dsc1_axi_wstrb_first;
            4'b0010: dsc0_axi_wstrb_first <= dsc2_axi_wstrb_first;
            4'b0001: dsc0_axi_wstrb_first <= dsc3_axi_wstrb_first;
            default: dsc0_axi_wstrb_first <= dsc0_axi_wstrb_first;
        endcase

// for dsc0_axi_wstrb_last
always @(posedge clk or negedge rst_n)
    if (!rst_n)
         dsc0_axi_wstrb_last <= 128'b0;
    else
        case ({add_dsc0, dsc_move_1_0, dsc_move_2_0, dsc_move_3_0})
            4'b1000: dsc0_axi_wstrb_last <= axi_wstrb_last;
            4'b0100: dsc0_axi_wstrb_last <= dsc1_axi_wstrb_last;
            4'b0010: dsc0_axi_wstrb_last <= dsc2_axi_wstrb_last;
            4'b0001: dsc0_axi_wstrb_last <= dsc3_axi_wstrb_last;
            default: dsc0_axi_wstrb_last <= dsc0_axi_wstrb_last;
        endcase

// for dsc0_axi_resp_cnt
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc0_axi_resp_cnt <= 16'd0;
    else
        casex ({add_dsc0, dsc0_axi_resp_received, dsc_move_1_0, dsc_move_2_0, dsc_move_3_0})
            5'b10000:  dsc0_axi_resp_cnt <= (dst_data_4KB_align)? (dst_len_without_first_burst[27:12] + 1) : (dst_len_without_first_burst[27:12] + 2);
            5'b01000:  dsc0_axi_resp_cnt <= dsc0_axi_resp_cnt - 1;
            5'b0x100:  dsc0_axi_resp_cnt <= (dsc1_axi_resp_received)? (dsc1_axi_resp_cnt - 1) : dsc1_axi_resp_cnt;
            5'b0x010:  dsc0_axi_resp_cnt <= (dsc2_axi_resp_received)? (dsc2_axi_resp_cnt - 1) : dsc2_axi_resp_cnt;
            5'b0x001:  dsc0_axi_resp_cnt <= (dsc3_axi_resp_received)? (dsc3_axi_resp_cnt - 1) : dsc3_axi_resp_cnt;
            default:   dsc0_axi_resp_cnt <= dsc0_axi_resp_cnt;
        endcase

// for dsc0_lcl_rd_error
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc0_lcl_rd_error <= 1'b0;
    else if (dsc_move_1_0 || dsc_move_2_0 || dsc_move_3_0)
        case ({dsc_move_1_0, dsc_move_2_0, dsc_move_3_0 })
            3'b100: dsc0_lcl_rd_error <= dsc1_lcl_rd_error;
            3'b010: dsc0_lcl_rd_error <= dsc2_lcl_rd_error;
            3'b001: dsc0_lcl_rd_error <= dsc3_lcl_rd_error;
            default:;
        endcase
    else if (dsc0_lcl_rd_error)
        dsc0_lcl_rd_error <= 1'b1;
    else if ((lcl_rd_data_dsc_id == 3'd0) && lcl_rd_data_valid)
        dsc0_lcl_rd_error <= lcl_rd_rsp_code;
    else
        dsc0_lcl_rd_error <= 1'b0;

// for dsc0_lcl_src_addr
always @(posedge clk or negedge rst_n)
    if (!rst_n)
         dsc0_lcl_src_addr <= 64'h0;
    else
    // TODO : when dsc_move_* is high, the lcl_rd_data_receive_dsc* is also high             
        case ({add_dsc0, lcl_rd_data_receive_dsc0, dsc_move_1_0, dsc_move_2_0, dsc_move_3_0})
            5'b10000: dsc0_lcl_src_addr <= src_addr;
            5'b01000: dsc0_lcl_src_addr <= dsc0_lcl_src_addr + 64'd128;
            5'b00100: dsc0_lcl_src_addr <= dsc1_lcl_src_addr;
            5'b00010: dsc0_lcl_src_addr <= dsc2_lcl_src_addr;
            5'b00001: dsc0_lcl_src_addr <= dsc3_lcl_src_addr;
            default:;
        endcase

// for dsc0_error_src_addr
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc0_error_src_addr <= 64'h0;
    else if (dsc_move_1_0 || dsc_move_2_0 || dsc_move_3_0)
        case ({dsc_move_1_0, dsc_move_2_0, dsc_move_3_0 })
            3'b100: dsc0_error_src_addr <= dsc1_error_src_addr;
            3'b010: dsc0_error_src_addr <= dsc2_error_src_addr;
            3'b001: dsc0_error_src_addr <= dsc3_error_src_addr;
            default:;
        endcase
    else if (dsc0_lcl_rd_error)
        dsc0_error_src_addr <= dsc0_error_src_addr;
    else if ((lcl_rd_data_dsc_id == 3'd0) && lcl_rd_data_valid)
        dsc0_error_src_addr <= dsc0_lcl_src_addr;
    else
        dsc0_error_src_addr <= 64'h0;

// for dsc0_axi_wr_error
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc0_axi_wr_error <= 1'b0;
    else if (dsc_move_1_0 || dsc_move_2_0 || dsc_move_3_0)
        case ({dsc_move_1_0, dsc_move_2_0, dsc_move_3_0 })
            3'b100: dsc0_axi_wr_error <= dsc1_axi_wr_error;
            3'b010: dsc0_axi_wr_error <= dsc2_axi_wr_error;
            3'b001: dsc0_axi_wr_error <= dsc3_axi_wr_error;
            default:;
        endcase
    else if (dsc0_axi_wr_error)
        dsc0_axi_wr_error <= 1'b1;
    else if (m_axi_bvalid && m_axi_bready && (axi_wr_resp_id == 3'd0))
        dsc0_axi_wr_error <= m_axi_bresp[0] | m_axi_bresp[1];
    else
        dsc0_axi_wr_error <= 1'b0;

// for dsc0_axi_dst_addr
always @(posedge clk or negedge rst_n)
    if (!rst_n)
         dsc0_axi_dst_addr <= 64'h0;
    else
    // TODO : when dsc_move_* is high, the dsc*_axi_resp_received is also high             
        case ({add_dsc0, dsc0_axi_resp_received, dsc_move_1_0, dsc_move_2_0, dsc_move_3_0})
            5'b10000: dsc0_axi_dst_addr <= {dst_addr[63:7], 7'b0000000};
            5'b01000: dsc0_axi_dst_addr <= dsc0_axi_dst_addr + 64'd4096;
            5'b00100: dsc0_axi_dst_addr <= dsc1_axi_dst_addr;
            5'b00010: dsc0_axi_dst_addr <= dsc2_axi_dst_addr;
            5'b00001: dsc0_axi_dst_addr <= dsc3_axi_dst_addr;
            default:;
        endcase

// for dsc0_error_dst_addr
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc0_error_dst_addr <= 64'h0;
    else if (dsc_move_1_0 || dsc_move_2_0 || dsc_move_3_0)
        case ({dsc_move_1_0, dsc_move_2_0, dsc_move_3_0})
            3'b100: dsc0_error_dst_addr <= dsc1_error_dst_addr;
            3'b010: dsc0_error_dst_addr <= dsc2_error_dst_addr;
            3'b001: dsc0_error_dst_addr <= dsc3_error_dst_addr;
            default:;
        endcase
    else if (dsc0_axi_wr_error)
        dsc0_error_dst_addr <= dsc0_error_dst_addr;
    else if (m_axi_bvalid && m_axi_bready && (axi_wr_resp_id == 3'd0))
        dsc0_error_dst_addr <= dsc0_axi_dst_addr;
    else
        dsc0_error_dst_addr <= 64'h0;
    

//*****************************************//
//     registers for Descriptor1           //
//*****************************************//

// for dsc1_onflight
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc1_onflight <= 1'b0;
    else
        casex ({add_dsc1, (dsc1_cmp | dsc_move_1_0), dsc_move_2_1, dsc_move_3_1})
            4'b1000: dsc1_onflight <= 1'b1;
            4'b0x10: dsc1_onflight <= dsc2_onflight;
            4'b0x01: dsc1_onflight <= dsc3_onflight;
            4'b0100: dsc1_onflight <= 1'b0;
            default: dsc1_onflight <= dsc1_onflight;
        endcase
        
// for dsc1_interrupt_req
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc1_interrupt_req <= 1'b0;
    else
        case ({add_dsc1, dsc_move_2_1, dsc_move_3_1})
            3'b100: dsc1_interrupt_req <= interrupt_req;
            3'b010: dsc1_interrupt_req <= dsc2_interrupt_req;
            3'b001: dsc1_interrupt_req <= dsc3_interrupt_req;
            default:dsc1_interrupt_req <= dsc1_interrupt_req;
        endcase

// for dsc1_channel_id
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc1_channel_id <= 2'b00;
    else
        case ({add_dsc1, dsc_move_2_1, dsc_move_3_1})
            3'b100: dsc1_channel_id <= channel_id;
            3'b010: dsc1_channel_id <= dsc2_channel_id;
            3'b001: dsc1_channel_id <= dsc3_channel_id;
            default:dsc1_channel_id <= dsc1_channel_id;
        endcase

// for dsc1_dsc_id
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc1_dsc_id <= 30'b0;
    else
        case ({add_dsc1, dsc_move_2_1, dsc_move_3_1})
            3'b100: dsc1_dsc_id <= dsc_id;
            3'b010: dsc1_dsc_id <= dsc2_dsc_id;
            3'b001: dsc1_dsc_id <= dsc3_dsc_id;
            default:dsc1_dsc_id <= dsc1_dsc_id;
        endcase

// for dsc1_axi_req_number
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc1_axi_req_number <= 16'd0;
    else
        case ({add_dsc1, dsc_move_2_1, dsc_move_3_1})
            3'b100: dsc1_axi_req_number <= (dst_data_4KB_align)? (dst_len_without_first_burst[27:12] + 1) : (dst_len_without_first_burst[27:12] + 2);
            3'b010: dsc1_axi_req_number <= dsc2_axi_req_number;
            3'b001: dsc1_axi_req_number <= dsc3_axi_req_number;
            default:dsc1_axi_req_number <= dsc1_axi_req_number;
        endcase

// for dsc1_axi_req_cnt
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc1_axi_req_cnt <= 16'd0;
    else
        case ({add_dsc1, dsc1_axi_req_issue, dsc_move_2_1, dsc_move_3_1})
            4'b1000: dsc1_axi_req_cnt <= (dst_data_4KB_align)? (dst_len_without_first_burst[27:12] + 1) : (dst_len_without_first_burst[27:12] + 2);
            4'b0100: dsc1_axi_req_cnt <= dsc1_axi_req_cnt - 1;
            4'b0010: dsc1_axi_req_cnt <= (dsc2_axi_req_issue)? (dsc2_axi_req_cnt - 1) : dsc2_axi_req_cnt;
            4'b0001: dsc1_axi_req_cnt <= (dsc3_axi_req_issue)? (dsc3_axi_req_cnt - 1) : dsc3_axi_req_cnt;
            default: dsc1_axi_req_cnt <= dsc1_axi_req_cnt;
        endcase

// for dsc1_axi_burst_cnt
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc1_axi_burst_cnt <= 16'd0;
    else
        casex ({add_dsc1, dsc1_axi_burst_issue, dsc_move_2_1, dsc_move_3_1})
            //4'b1000: dsc1_axi_burst_cnt <= (dst_data_4KB_align)? (dst_len_without_first_burst[27:12] + 1) : (dst_len_without_first_burst[27:12] + 2);
            4'b1x00: dsc1_axi_burst_cnt <= (dst_data_4KB_align)? (dst_len_without_first_burst[27:12] + 1) : (dst_len_without_first_burst[27:12] + 2);
            4'b0100: dsc1_axi_burst_cnt <= (dsc1_axi_burst_cnt == 16'd1)? dsc1_axi_burst_cnt : (dsc1_axi_burst_cnt - 1);
            4'b0x10: dsc1_axi_burst_cnt <= (dsc2_axi_burst_issue)? (dsc2_axi_burst_cnt - 1) : dsc2_axi_burst_cnt;
            4'b0x01: dsc1_axi_burst_cnt <= (dsc3_axi_burst_issue)? (dsc3_axi_burst_cnt - 1) : dsc3_axi_burst_cnt;
            default: dsc1_axi_burst_cnt <= dsc1_axi_burst_cnt;
        endcase

// for dsc1_dst_addr
always @(posedge clk or negedge rst_n)
    if(!rst_n)
        dsc1_dst_addr <= 64'h0;
    else
        case ({add_dsc1, dsc1_axi_req_issue, dsc_move_2_1, dsc_move_3_1})
            4'b1000:  dsc1_dst_addr <= {dst_addr[63:7], 7'b0000000};
            4'b0100:  dsc1_dst_addr <= (dsc1_axi_req_cnt == 16'd1)? dsc1_dst_addr : {(dsc1_dst_addr[63:12] + 1), 12'h000};        // Each AXI-MM Write transfer is a 4K busrt
            4'b0010:  dsc1_dst_addr <= (dsc2_axi_req_issue)? ((dsc2_axi_req_cnt == 16'd1)? dsc2_dst_addr : {(dsc2_dst_addr[63:12] + 1), 12'h000}) : dsc2_dst_addr;
            4'b0001:  dsc1_dst_addr <= (dsc3_axi_req_issue)? ((dsc3_axi_req_cnt == 16'd1)? dsc3_dst_addr : {(dsc3_dst_addr[63:12] + 1), 12'h000}) : dsc3_dst_addr;
            default:  dsc1_dst_addr <= dsc1_dst_addr;
        endcase

// for dsc1_first_awlen
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc1_first_awlen <= 8'd0;
    else
        case ({add_dsc1, dsc_move_2_1, dsc_move_3_1})
            3'b100: dsc1_first_awlen <= (dst_first_4KB_len[6:0] == 7'b0)? ((dst_first_4KB_len >> 7) - 1) : (dst_first_4KB_len >> 7);
            3'b010: dsc1_first_awlen <= dsc2_first_awlen;
            3'b001: dsc1_first_awlen <= dsc3_first_awlen;
            default: dsc1_first_awlen <= dsc1_first_awlen;
        endcase

// for dsc1_last_awlen
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc1_last_awlen <= 8'b0;
    else
        case ({add_dsc1, dsc_move_2_1, dsc_move_3_1})
            3'b100:  dsc1_last_awlen <= (dst_data_4KB_align)? 8'd31 : ((dst_len_without_first_burst[6:0] != 7'b0000000)? dst_len_without_first_burst[11:7] :(dst_len_without_first_burst[11:7] - 1));
            3'b010:  dsc1_last_awlen <= dsc2_last_awlen;
            3'b001:  dsc1_last_awlen <= dsc3_last_awlen;
            default: dsc1_last_awlen <= dsc1_last_awlen;
        endcase

`ifdef ACTION_DATA_WIDTH_512
// TODO
// for dsc1_axi_data_cnt
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            dsc1_axi_data_cnt <= 21'd0;
        else
            casex ({add_dsc1, dsc1_axi_data_issue, dsc_move_2_1, dsc_move_3_1})
                4'b1xxx: dsc1_axi_data_cnt <= (axi_wdata_len << 1);
                4'b0100: dsc1_axi_data_cnt <= dsc1_axi_data_cnt - 1;
                4'b0x10: dsc1_axi_data_cnt <= (dsc2_axi_data_issue)? (dsc2_axi_data_cnt - 1) : dsc2_axi_data_cnt;
                4'b0x01: dsc1_axi_data_cnt <= (dsc3_axi_data_issue)? (dsc3_axi_data_cnt - 1) : dsc3_axi_data_cnt;
                default: dsc1_axi_data_cnt <= dsc1_axi_data_cnt;
            endcase
    
    // for dsc1_axi_data_number
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            dsc1_axi_data_number <= 21'd0;
        else
            case ({add_dsc1, dsc_move_2_1, dsc_move_3_1})
                3'b100: dsc1_axi_data_number <= (axi_wdata_len << 1);
                3'b010: dsc1_axi_data_number <= dsc2_axi_data_number;
                3'b001: dsc1_axi_data_number <= dsc3_axi_data_number;
                default: dsc1_axi_data_number <= dsc1_axi_data_number;
            endcase

    assign dsc1_first_awlen_64B = (dsc1_first_awlen << 1) + 1;
    assign dsc1_last_awlen_64B  = (dsc1_last_awlen << 1) + 1;
    // for dsc1_axi_burst_data_cnt
    always @(*) begin
        if (dsc1_axi_burst_cnt == dsc1_axi_req_number)          // if there is only 1 burst, it will not trun to the 1st else if
            dsc1_axi_burst_data_cnt = dsc1_first_awlen_64B + 1;
        else if (dsc1_axi_burst_cnt == 16'd1)
            dsc1_axi_burst_data_cnt = (dsc1_first_awlen_64B + 1) + ((dsc1_axi_req_number - 2) << 6) + (dsc1_last_awlen_64B + 1);
        else
            dsc1_axi_burst_data_cnt = (dsc1_first_awlen_64B + 1) + ((dsc1_axi_req_number - dsc1_axi_burst_cnt) << 6);
    end
    assign dsc1_axi_data_first_beat_128B = (dsc1_axi_data_cnt == dsc1_axi_data_number || (dsc1_axi_data_cnt == dsc1_axi_data_number - 1)) && dsc1_onflight;
    assign dsc1_axi_data_last_beat_128B = (dsc1_axi_data_cnt == 21'd2 || dsc1_axi_data_cnt == 21'd1) && dsc1_onflight;
`else
    // for dsc1_axi_data_cnt
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            dsc1_axi_data_cnt <= 21'd0;
        else
            casex ({add_dsc1, dsc1_axi_data_issue, dsc_move_2_1, dsc_move_3_1})
                4'b1xxx: dsc1_axi_data_cnt <= axi_wdata_len;
                4'b0100: dsc1_axi_data_cnt <= dsc1_axi_data_cnt - 1;
                4'b0x10: dsc1_axi_data_cnt <= (dsc2_axi_data_issue)? (dsc2_axi_data_cnt - 1) : dsc2_axi_data_cnt;
                4'b0x01: dsc1_axi_data_cnt <= (dsc3_axi_data_issue)? (dsc3_axi_data_cnt - 1) : dsc3_axi_data_cnt;
                default: dsc1_axi_data_cnt <= dsc1_axi_data_cnt;
            endcase
    
    // for dsc1_axi_data_number
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            dsc1_axi_data_number <= 21'd0;
        else
            case ({add_dsc1, dsc_move_2_1, dsc_move_3_1})
                3'b100: dsc1_axi_data_number <= axi_wdata_len;
                3'b010: dsc1_axi_data_number <= dsc2_axi_data_number;
                3'b001: dsc1_axi_data_number <= dsc3_axi_data_number;
                default: dsc1_axi_data_number <= dsc1_axi_data_number;
            endcase

    // for dsc1_axi_burst_data_cnt
    always @(*) begin
        if (dsc1_axi_burst_cnt == dsc1_axi_req_number)          // if there is only 1 burst, it will not trun to the 1st else if
            dsc1_axi_burst_data_cnt = dsc1_first_awlen + 1;
        else if (dsc1_axi_burst_cnt == 16'd1)
            dsc1_axi_burst_data_cnt = (dsc1_first_awlen + 1) + ((dsc1_axi_req_number - 2) << 5) + (dsc1_last_awlen + 1);
        else
            dsc1_axi_burst_data_cnt = (dsc1_first_awlen + 1) + ((dsc1_axi_req_number - dsc1_axi_burst_cnt) << 5);
    end
`endif

assign dsc1_axi_data_first_beat = (dsc1_axi_data_cnt == dsc1_axi_data_number) && dsc1_onflight;
assign dsc1_axi_data_last_beat = (dsc1_axi_data_cnt == 21'd1) && dsc1_onflight;

// for dsc1_axi_wstrb_first
always @(posedge clk or negedge rst_n)
    if (!rst_n)
         dsc1_axi_wstrb_first <= 128'b0;
    else
        case ({add_dsc1, dsc_move_2_1, dsc_move_3_1})
            3'b100:  dsc1_axi_wstrb_first <= axi_wstrb_first;
            3'b010:  dsc1_axi_wstrb_first <= dsc2_axi_wstrb_first;
            3'b001:  dsc1_axi_wstrb_first <= dsc3_axi_wstrb_first;
            default: dsc1_axi_wstrb_first <= dsc1_axi_wstrb_first;
        endcase

// for dsc1_axi_data_last_byte
always @(posedge clk or negedge rst_n)
    if (!rst_n)
         dsc1_axi_wstrb_last <= 128'b0;
    else
        case ({add_dsc1, dsc_move_2_1, dsc_move_3_1})
            3'b100:  dsc1_axi_wstrb_last <= axi_wstrb_last;
            3'b010:  dsc1_axi_wstrb_last <= dsc2_axi_wstrb_last;
            3'b001:  dsc1_axi_wstrb_last <= dsc3_axi_wstrb_last;
            default: dsc1_axi_wstrb_last <= dsc1_axi_wstrb_last;
        endcase

// for dsc1_axi_resp_cnt
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc1_axi_resp_cnt <= 16'd0;
    else
        casex ({add_dsc1, dsc1_axi_resp_received, dsc_move_2_1, dsc_move_3_1})
            4'b1000: dsc1_axi_resp_cnt <= (dst_data_4KB_align)? (dst_len_without_first_burst[27:12] + 1) : (dst_len_without_first_burst[27:12] + 2);
            4'b0100: dsc1_axi_resp_cnt <= dsc1_axi_resp_cnt - 1;
            4'b0x10: dsc1_axi_resp_cnt <= (dsc2_axi_resp_received)? (dsc2_axi_resp_cnt - 1) : dsc2_axi_resp_cnt;
            4'b0x01: dsc1_axi_resp_cnt <= (dsc3_axi_resp_received)? (dsc3_axi_resp_cnt - 1) : dsc3_axi_resp_cnt;
            default:;
        endcase

// for dsc1_lcl_rd_error
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc1_lcl_rd_error <= 1'b0;
    else if (dsc_move_2_1 || dsc_move_3_1)
        case ({dsc_move_2_1, dsc_move_3_1 })
            2'b10: dsc1_lcl_rd_error <= dsc2_lcl_rd_error;
            2'b01: dsc1_lcl_rd_error <= dsc3_lcl_rd_error;
            default:;
        endcase
    else if (dsc1_lcl_rd_error)
        dsc1_lcl_rd_error <= 1'b1;
    else if ((lcl_rd_data_dsc_id == 3'd1) && lcl_rd_data_valid)
        dsc1_lcl_rd_error <= lcl_rd_rsp_code;
    else
        dsc1_lcl_rd_error <= 1'b0;

// for dsc1_lcl_src_addr
always @(posedge clk or negedge rst_n)
    if (!rst_n)
         dsc1_lcl_src_addr <= 64'h0;
    else
        case ({add_dsc1, lcl_rd_data_receive_dsc1, dsc_move_2_1, dsc_move_3_1})
            4'b1000: dsc1_lcl_src_addr <= src_addr;
            4'b0100: dsc1_lcl_src_addr <= dsc1_lcl_src_addr + 64'd128;
            4'b0010: dsc1_lcl_src_addr <= dsc2_lcl_src_addr;
            4'b0001: dsc1_lcl_src_addr <= dsc3_lcl_src_addr;
            default:;
        endcase

// for dsc1_error_src_addr
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc1_error_src_addr <= 64'h0;
    else if (dsc_move_2_1 || dsc_move_3_1)
        case ({dsc_move_2_1, dsc_move_3_1})
            2'b10: dsc1_error_src_addr <= dsc2_error_src_addr;
            2'b01: dsc1_error_src_addr <= dsc3_error_src_addr;
            default:;
        endcase
    else if (dsc1_lcl_rd_error)
        dsc1_error_src_addr <= dsc1_error_src_addr;
    else if ((lcl_rd_data_dsc_id == 3'd1) && lcl_rd_data_valid)
        dsc1_error_src_addr <= dsc1_lcl_src_addr;
    else
        dsc1_error_src_addr <= 64'h0;

// for dsc1_axi_wr_error
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc1_axi_wr_error <= 1'b0;
    else if (dsc_move_2_1 || dsc_move_3_1)
        case ({dsc_move_2_1, dsc_move_3_1})
            2'b10: dsc1_axi_wr_error <= dsc2_axi_wr_error;
            2'b01: dsc1_axi_wr_error <= dsc3_axi_wr_error;
            default:;
        endcase
    else if (dsc1_axi_wr_error)
        dsc1_axi_wr_error <= 1'b1;
    else if (m_axi_bvalid && m_axi_bready && (axi_wr_resp_id == 3'd1))
        dsc1_axi_wr_error <= m_axi_bresp[0] | m_axi_bresp[1];
    else
        dsc1_axi_wr_error <= 1'b0;

// for dsc1_axi_dst_addr
always @(posedge clk or negedge rst_n)
    if (!rst_n)
         dsc1_axi_dst_addr <= 64'h0;
    else
        case ({add_dsc1, dsc1_axi_resp_received, dsc_move_2_1, dsc_move_3_1})
            4'b1000: dsc1_axi_dst_addr <= {dst_addr[63:7], 7'b0000000};
            4'b0100: dsc1_axi_dst_addr <= dsc1_axi_dst_addr + 64'd4096;
            4'b0010: dsc1_axi_dst_addr <= dsc2_axi_dst_addr;
            4'b0001: dsc1_axi_dst_addr <= dsc3_axi_dst_addr;
            default:;
        endcase

// for dsc1_error_dst_addr
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc1_error_dst_addr <= 64'h0;
    else if (dsc_move_2_1 || dsc_move_3_1)
        case ({dsc_move_2_1, dsc_move_3_1})
            2'b10: dsc1_error_dst_addr <= dsc2_error_dst_addr;
            2'b01: dsc1_error_dst_addr <= dsc3_error_dst_addr;
            default:;
        endcase
    else if (dsc1_axi_wr_error)
        dsc1_error_dst_addr <= dsc1_error_dst_addr;
    else if (m_axi_bvalid && m_axi_bready && (axi_wr_resp_id == 3'd1))
        dsc1_error_dst_addr <= dsc1_axi_dst_addr;
    else
        dsc1_error_dst_addr <= 64'h0;


//*****************************************//
//     registers for Descriptor2           //
//*****************************************//

// for dsc2_onflight
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc2_onflight <= 1'b0;
    else
        casex ({add_dsc2, (dsc2_cmp || dsc_move_2_0 || dsc_move_2_1), dsc_move_3_2})
            3'b100: dsc2_onflight <= 1'b1;
            3'b0x1: dsc2_onflight <= dsc3_onflight;
            3'b010: dsc2_onflight <= 1'b0;
            default:dsc2_onflight <= dsc2_onflight;
        endcase

// for dsc2_interrupt_req
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc2_interrupt_req <= 1'b0;
    else 
        case ({add_dsc2, dsc_move_3_2})
            2'b10:   dsc2_interrupt_req <= interrupt_req;
            2'b01:   dsc2_interrupt_req <= dsc3_interrupt_req;
            default: dsc2_interrupt_req <= dsc2_interrupt_req;
        endcase
// for dsc2_channel_id
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc2_channel_id <= 2'b00;
    else 
        case ({add_dsc2, dsc_move_3_2})
            2'b10: dsc2_channel_id <= channel_id;
            2'b01: dsc2_channel_id <= dsc3_channel_id;
            default: dsc2_channel_id <= dsc2_channel_id;
        endcase

// for dsc2_dsc_id
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc2_dsc_id <= 30'b0;
    else 
        case ({add_dsc2, dsc_move_3_2})
            2'b10: dsc2_dsc_id <= dsc_id;
            2'b01: dsc2_dsc_id <= dsc3_dsc_id;
            default: dsc2_dsc_id <= dsc2_dsc_id;
        endcase

// for dsc2_axi_req_number
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc2_axi_req_number <= 16'd0;
    else
        case ({add_dsc2, dsc_move_3_2})
            2'b10: dsc2_axi_req_number <= (dst_data_4KB_align)? (dst_len_without_first_burst[27:12] + 1) : (dst_len_without_first_burst[27:12] + 2);
            2'b01: dsc2_axi_req_number <= dsc3_axi_req_number;
            default: dsc2_axi_req_number <= dsc2_axi_req_number; 
        endcase 

// for dsc2_axi_req_cnt
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc2_axi_req_cnt <= 16'd0;
    else
        case ({add_dsc2, dsc2_axi_req_issue, dsc_move_3_2})
            3'b100: dsc2_axi_req_cnt <= (dst_data_4KB_align)? (dst_len_without_first_burst[27:12] + 1) : (dst_len_without_first_burst[27:12] + 2);
            3'b010: dsc2_axi_req_cnt <= dsc2_axi_req_cnt - 1;
            3'b001: dsc2_axi_req_cnt <= (dsc3_axi_req_issue)? (dsc3_axi_req_cnt - 1) : dsc3_axi_req_cnt;
            default:dsc2_axi_req_cnt <= dsc2_axi_req_cnt; 
        endcase 

// for dsc2_axi_burst_cnt
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc2_axi_burst_cnt <= 16'd0;
    else
        casex ({add_dsc2, dsc2_axi_burst_issue, dsc_move_3_2})
            3'b1x0: dsc2_axi_burst_cnt <= (dst_data_4KB_align)? (dst_len_without_first_burst[27:12] + 1) : (dst_len_without_first_burst[27:12] + 2);
            3'b010: dsc2_axi_burst_cnt <= (dsc2_axi_burst_cnt == 16'd1)? dsc2_axi_burst_cnt : (dsc2_axi_burst_cnt - 1);
            3'b0x1: dsc2_axi_burst_cnt <= (dsc3_axi_burst_issue)? (dsc3_axi_burst_cnt - 1) : dsc3_axi_burst_cnt;
            default:dsc2_axi_burst_cnt <= dsc2_axi_burst_cnt; 
        endcase 

// for dsc2_dst_addr
always @(posedge clk or negedge rst_n)
    if(!rst_n)
        dsc2_dst_addr <= 64'h0;
    else
        case ({add_dsc2, dsc2_axi_req_issue, dsc_move_3_2})
            3'b100:  dsc2_dst_addr <= {dst_addr[63:7], 7'b0000000};
            3'b010:  dsc2_dst_addr <= (dsc2_axi_req_cnt == 16'd1)? dsc2_dst_addr : {(dsc2_dst_addr[63:12] + 1), 12'h000};        // Each AXI-MM Write transfer is a 4K busrt
            3'b001:  dsc2_dst_addr <= (dsc3_axi_req_issue)? ((dsc3_axi_req_cnt == 16'd1)? dsc3_dst_addr : {(dsc3_dst_addr[63:12] + 1), 12'h000}) : dsc3_dst_addr;
            default: dsc2_dst_addr <= dsc2_dst_addr;
        endcase

// for dsc2_first_awlen
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc2_first_awlen <= 8'd0;
    else
        case ({add_dsc2, dsc_move_3_2})
            2'b10:    dsc2_first_awlen <= (dst_first_4KB_len[6:0] == 7'b0)? ((dst_first_4KB_len >> 7) - 1) : (dst_first_4KB_len >> 7);
            2'b01:    dsc2_first_awlen <= dsc3_first_awlen;
            default:  dsc2_first_awlen <= dsc2_first_awlen;
        endcase

// for dsc2_last_awlen
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc2_last_awlen <= 8'b0;
    else
        case ({add_dsc2, dsc_move_3_2})
            2'b10:   dsc2_last_awlen <= (dst_data_4KB_align)? 8'd31 : ((dst_len_without_first_burst[6:0] != 7'b0000000)? dst_len_without_first_burst[11:7] :(dst_len_without_first_burst[11:7] - 1));
            2'b01:   dsc2_last_awlen <= dsc3_last_awlen;
            default: dsc2_last_awlen <= dsc2_last_awlen;
        endcase

`ifdef ACTION_DATA_WIDTH_512
// TODO
// for dsc2_axi_data_cnt
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            dsc2_axi_data_cnt <= 21'd0;
        else
            casex ({add_dsc2, dsc2_axi_data_issue, dsc_move_3_2})
                3'b1xx: dsc2_axi_data_cnt <= (axi_wdata_len << 1);
                3'b010: dsc2_axi_data_cnt <= dsc2_axi_data_cnt - 1;
                3'b0x1: dsc2_axi_data_cnt <= (dsc3_axi_data_issue)? (dsc3_axi_data_cnt - 1) : dsc3_axi_data_cnt;
                default:dsc2_axi_data_cnt <= dsc2_axi_data_cnt; 
            endcase 
    
    // for dsc2_axi_data_number
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            dsc2_axi_data_number <= 21'd0;
        else
            case ({add_dsc2, dsc_move_3_2})
                2'b10:  dsc2_axi_data_number <= (axi_wdata_len << 1);
                2'b01:  dsc2_axi_data_number <= dsc3_axi_data_number;
                default:dsc2_axi_data_number <= dsc2_axi_data_number; 
            endcase 

    assign dsc2_first_awlen_64B = (dsc2_first_awlen << 1) + 1;
    assign dsc2_last_awlen_64B  = (dsc2_last_awlen << 1) + 1;
    // for dsc2_axi_burst_data_cnt
    always @(*) begin
        if (dsc2_axi_burst_cnt == dsc2_axi_req_number)          // if there is only 1 burst, it will not trun to the 1st else if
            dsc2_axi_burst_data_cnt = dsc2_first_awlen_64B + 1;
        else if (dsc2_axi_burst_cnt == 16'd1)
            dsc2_axi_burst_data_cnt = (dsc2_first_awlen_64B + 1) + ((dsc2_axi_req_number - 2) << 6) + (dsc2_last_awlen_64B + 1);
        else
            dsc2_axi_burst_data_cnt = (dsc2_first_awlen_64B + 1) + ((dsc2_axi_req_number - dsc2_axi_burst_cnt) << 6);
    end
    assign dsc2_axi_data_first_beat_128B = (dsc2_axi_data_cnt == dsc2_axi_data_number || (dsc2_axi_data_cnt == dsc2_axi_data_number - 1)) && dsc2_onflight;
    assign dsc2_axi_data_last_beat_128B = (dsc2_axi_data_cnt == 21'd2 || dsc2_axi_data_cnt == 21'd1) && dsc2_onflight;
`else
    // for dsc2_axi_data_cnt
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            dsc2_axi_data_cnt <= 21'd0;
        else
            casex ({add_dsc2, dsc2_axi_data_issue, dsc_move_3_2})
                3'b1xx: dsc2_axi_data_cnt <= axi_wdata_len;
                3'b010: dsc2_axi_data_cnt <= dsc2_axi_data_cnt - 1;
                3'b0x1: dsc2_axi_data_cnt <= (dsc3_axi_data_issue)? (dsc3_axi_data_cnt - 1) : dsc3_axi_data_cnt;
                default:dsc2_axi_data_cnt <= dsc2_axi_data_cnt; 
            endcase 
    
    // for dsc2_axi_data_number
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            dsc2_axi_data_number <= 21'd0;
        else
            case ({add_dsc2, dsc_move_3_2})
                2'b10:  dsc2_axi_data_number <= axi_wdata_len;
                2'b01:  dsc2_axi_data_number <= dsc3_axi_data_number;
                default:dsc2_axi_data_number <= dsc2_axi_data_number; 
            endcase 

    // for dsc2_axi_burst_data_cnt
    always @(*) begin
        if (dsc2_axi_burst_cnt == dsc2_axi_req_number)          // if there is only 1 burst, it will not trun to the 1st else if
            dsc2_axi_burst_data_cnt = dsc2_first_awlen + 1;
        else if (dsc2_axi_burst_cnt == 16'd1)
            dsc2_axi_burst_data_cnt = (dsc2_first_awlen + 1) + ((dsc2_axi_req_number - 2) << 5) + (dsc2_last_awlen + 1);
        else
            dsc2_axi_burst_data_cnt = (dsc2_first_awlen + 1) + ((dsc2_axi_req_number - dsc2_axi_burst_cnt) << 5);
    end
`endif

assign dsc2_axi_data_first_beat = (dsc2_axi_data_cnt == dsc2_axi_data_number) && dsc2_onflight;
assign dsc2_axi_data_last_beat = (dsc2_axi_data_cnt == 21'd1) && dsc2_onflight;

// for dsc2_axi_wstrb_first
always @(posedge clk or negedge rst_n)
    if (!rst_n)
         dsc2_axi_wstrb_first <= 128'b0;
    else
        case ({add_dsc2, dsc_move_3_2})
            2'b10:   dsc2_axi_wstrb_first <= axi_wstrb_first;
            2'b01:   dsc2_axi_wstrb_first <= dsc3_axi_wstrb_first;
            default: dsc2_axi_wstrb_first <= dsc2_axi_wstrb_first;
        endcase

// for dsc2_axi_data_last_byte
always @(posedge clk or negedge rst_n)
    if (!rst_n)
         dsc2_axi_wstrb_last <= 128'b0;
    else
        case ({add_dsc2, dsc_move_3_2})
            2'b10:   dsc2_axi_wstrb_last <= axi_wstrb_last;
            2'b01:   dsc2_axi_wstrb_last <= dsc3_axi_wstrb_last;
            default: dsc2_axi_wstrb_last <= dsc2_axi_wstrb_last;
        endcase

// for dsc2_axi_resp_cnt
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc2_axi_resp_cnt <= 16'd0;
    else
        casex ({add_dsc2, dsc2_axi_resp_received, dsc_move_3_2})
            3'b100:  dsc2_axi_resp_cnt <= (dst_data_4KB_align)? (dst_len_without_first_burst[27:12] + 1) : (dst_len_without_first_burst[27:12] + 2);
            3'b010:  dsc2_axi_resp_cnt <= dsc2_axi_resp_cnt - 1;
            3'b0x1:  dsc2_axi_resp_cnt <= (dsc3_axi_resp_received)? (dsc3_axi_resp_cnt - 1) : dsc3_axi_resp_cnt;
            default: dsc2_axi_resp_cnt <= dsc2_axi_resp_cnt;
        endcase

// for dsc2_lcl_rd_error
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc2_lcl_rd_error <= 1'b0;
    else if (dsc_move_3_2)
        dsc2_lcl_rd_error <= dsc3_lcl_rd_error;
    else if (dsc2_lcl_rd_error)
        dsc2_lcl_rd_error <= 1'b1;
    else if ((lcl_rd_data_dsc_id == 3'd2) && lcl_rd_data_valid)
        dsc2_lcl_rd_error <= lcl_rd_rsp_code;
    else
        dsc2_lcl_rd_error <= 1'b0;

// for dsc2_lcl_src_addr
always @(posedge clk or negedge rst_n)
    if (!rst_n)
         dsc2_lcl_src_addr <= 64'h0;
    else
        case ({add_dsc2, lcl_rd_data_receive_dsc2, dsc_move_3_2})
            3'b100: dsc2_lcl_src_addr <= src_addr;
            3'b010: dsc2_lcl_src_addr <= dsc2_lcl_src_addr + 64'd128;
            3'b001: dsc2_lcl_src_addr <= dsc3_lcl_src_addr;
            default:;
        endcase

// for dsc2_error_src_addr
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc2_error_src_addr <= 64'h0;
    else if (dsc_move_3_2)
        dsc2_error_src_addr <= dsc3_error_src_addr;
    else if (dsc2_lcl_rd_error)
        dsc2_error_src_addr <= dsc2_error_src_addr;
    else if ((lcl_rd_data_dsc_id == 3'd2) && lcl_rd_data_valid)
        dsc2_error_src_addr <= dsc2_lcl_src_addr;
    else
        dsc2_error_src_addr <= 64'h0;

// for dsc2_axi_wr_error
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc2_axi_wr_error <= 1'b0;
    else if (dsc_move_3_2)
        dsc2_axi_wr_error <= dsc3_axi_wr_error;
    else if (dsc2_axi_wr_error)
        dsc2_axi_wr_error <= 1'b1;
    else if (m_axi_bvalid && m_axi_bready && (axi_wr_resp_id == 3'd2))
        dsc2_axi_wr_error <= m_axi_bresp[0] | m_axi_bresp[1];
    else
        dsc2_axi_wr_error <= 1'b0;

// for dsc2_axi_dst_addr
always @(posedge clk or negedge rst_n)
    if (!rst_n)
         dsc2_axi_dst_addr <= 64'h0;
    else
        case ({add_dsc2, dsc2_axi_resp_received, dsc_move_3_0})
            3'b100: dsc2_axi_dst_addr <= {dst_addr[63:7], 7'b0000000};
            3'b010: dsc2_axi_dst_addr <= dsc2_axi_dst_addr + 64'd4096;
            3'b001: dsc2_axi_dst_addr <= dsc3_axi_dst_addr;
            default:;
        endcase

// for dsc2_error_dst_addr
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc2_error_dst_addr <= 64'h0;
    else if (dsc_move_3_2)
        dsc2_error_dst_addr <= dsc3_error_dst_addr;
    else if (dsc2_axi_wr_error)
        dsc2_error_dst_addr <= dsc2_error_dst_addr;
    else if (m_axi_bvalid && m_axi_bready && (axi_wr_resp_id == 3'd2))
        dsc2_error_dst_addr <= dsc2_axi_dst_addr;
    else
        dsc2_error_dst_addr <= 64'h0;

//*****************************************//
//     registers for Descriptor3           //
//*****************************************//

// for dsc3_onflight
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc3_onflight <= 1'b0;
    else
        case ({add_dsc3, dsc3_clear})
            2'b10: dsc3_onflight <= 1'b1;
            2'b01: dsc3_onflight <= 1'b0;
            default: dsc3_onflight <= dsc3_onflight;
        endcase

// for dsc3_interrupt_req
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc3_interrupt_req <= 1'b0;
    else
        case ({add_dsc3, dsc3_clear})
            2'b10:   dsc3_interrupt_req <= interrupt_req;
            2'b01:   dsc3_interrupt_req <= 1'b0;
            default: dsc3_interrupt_req <= dsc3_interrupt_req;
        endcase

// for dsc3_channel_id
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc3_channel_id <= 2'b00;
    else
        case ({add_dsc3, dsc3_clear})
            2'b10: dsc3_channel_id <= channel_id;
            2'b01: dsc3_channel_id <= 2'b00;
            default: dsc3_channel_id <= dsc3_channel_id;
        endcase

// for dsc3_dsc_id
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc3_dsc_id <= 30'b0;
    else
        case ({add_dsc3, dsc3_clear})
            2'b10: dsc3_dsc_id <= dsc_id;
            2'b01: dsc3_dsc_id <= 30'b0;
            default: dsc3_dsc_id <= dsc3_dsc_id;
        endcase

// for dsc3_axi_req_number
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc3_axi_req_number <= 16'd0;
    else
        case ({add_dsc3, dsc3_clear})
            2'b10: dsc3_axi_req_number <= (dst_data_4KB_align)? (dst_len_without_first_burst[27:12] + 1) : (dst_len_without_first_burst[27:12] + 2);
            2'b01: dsc3_axi_req_number <= 16'd0;
            default: dsc3_axi_req_number <= dsc3_axi_req_number; 
        endcase 

// for dsc3_axi_req_cnt
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc3_axi_req_cnt <= 16'd0;
    else
        case ({add_dsc3, dsc3_axi_req_issue, dsc3_clear})
            3'b100:  dsc3_axi_req_cnt <= (dst_data_4KB_align)? (dst_len_without_first_burst[27:12] + 1) : (dst_len_without_first_burst[27:12] + 2);
            3'b010:  dsc3_axi_req_cnt <= dsc3_axi_req_cnt - 1;
            3'b001:  dsc3_axi_req_cnt <= 16'd0;
            default: dsc3_axi_req_cnt <= dsc3_axi_req_cnt; 
        endcase 

// for dsc3_axi_burst_cnt
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc3_axi_burst_cnt <= 16'd0;
    else
        casex ({add_dsc3, dsc3_axi_burst_issue, dsc3_clear})
            3'b1x0:  dsc3_axi_burst_cnt <= (dst_data_4KB_align)? (dst_len_without_first_burst[27:12] + 1) : (dst_len_without_first_burst[27:12] + 2);
            3'b010:  dsc3_axi_burst_cnt <= (dsc3_axi_burst_cnt == 16'd1)? dsc3_axi_burst_cnt : (dsc3_axi_burst_cnt - 1);
            3'b001:  dsc3_axi_burst_cnt <= 16'd0;
            default: dsc3_axi_burst_cnt <= dsc3_axi_burst_cnt; 
        endcase 

// for dsc3_dst_addr
always @(posedge clk or negedge rst_n)
    if(!rst_n)
        dsc3_dst_addr <= 64'h0;
    else
        case ({add_dsc3, dsc3_axi_req_issue, dsc3_clear})
            3'b100:  dsc3_dst_addr <= {dst_addr[63:7], 7'b0000000};
            3'b010:  dsc3_dst_addr <= (dsc3_axi_req_cnt == 16'd1)? dsc3_dst_addr : {(dsc3_dst_addr[63:12] + 1), 12'h000};        // Each AXI-MM Write transfer is a 4K busrt
            3'b001:  dsc3_dst_addr <= 64'h0;
            default: dsc3_dst_addr <= dsc3_dst_addr;
        endcase

// for dsc3_first_awlen
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc3_first_awlen <= 8'd0;
    else
        case ({add_dsc3, dsc3_clear})
            2'b10: dsc3_first_awlen <= (dst_first_4KB_len[6:0] == 7'b0)? ((dst_first_4KB_len >> 7) - 1) : (dst_first_4KB_len >> 7);
            2'b01: dsc3_first_awlen <= 8'd0;
            default: dsc3_first_awlen <= dsc3_first_awlen;
        endcase

// for dsc3_last_awlen
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc3_last_awlen <= 8'b0;
    else
        case ({add_dsc3, dsc3_clear})
            2'b10:   dsc3_last_awlen <= (dst_data_4KB_align)? 8'd31 : ((dst_len_without_first_burst[6:0] != 7'b0000000)? dst_len_without_first_burst[11:7] :(dst_len_without_first_burst[11:7] - 1));
            2'b01:   dsc3_last_awlen <= 8'b0;
            default: dsc3_last_awlen <= dsc3_last_awlen;
        endcase

`ifdef ACTION_DATA_WIDTH_512
// TODO
    // for dsc3_axi_data_cnt
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            dsc3_axi_data_cnt <= 21'd0;
        else
            casex ({add_dsc3, dsc3_axi_data_issue, dsc3_clear})
                3'b1xx:  dsc3_axi_data_cnt <= (axi_wdata_len << 1);
                3'b010:  dsc3_axi_data_cnt <= dsc3_axi_data_cnt - 1;
                3'b001:  dsc3_axi_data_cnt <= 21'd0;
                default: dsc3_axi_data_cnt <= dsc3_axi_data_cnt; 
            endcase 
    
    // for dsc3_axi_data_number
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            dsc3_axi_data_number <= 21'd0;
        else
            case ({add_dsc3, dsc3_clear})
                2'b10:  dsc3_axi_data_number <= (axi_wdata_len << 1);
                2'b01:  dsc3_axi_data_number <= 21'd0;
                default: dsc3_axi_data_number <= dsc3_axi_data_number; 
            endcase 

    assign dsc3_first_awlen_64B = (dsc3_first_awlen << 1) + 1;
    assign dsc3_last_awlen_64B  = (dsc3_last_awlen << 1) + 1;
    // for dsc3_axi_burst_data_cnt
    always @(*) begin
        if (dsc3_axi_burst_cnt == dsc3_axi_req_number)          // if there is only 1 burst, it will not trun to the 1st else if
            dsc3_axi_burst_data_cnt = dsc3_first_awlen_64B + 1;
        else if (dsc3_axi_burst_cnt == 16'd1)
            dsc3_axi_burst_data_cnt = (dsc3_first_awlen_64B + 1) + ((dsc3_axi_req_number - 2) << 6) + (dsc3_last_awlen_64B + 1);
        else
            dsc3_axi_burst_data_cnt = (dsc3_first_awlen_64B + 1) + ((dsc3_axi_req_number - dsc3_axi_burst_cnt) << 6);
    end
    assign dsc3_axi_data_first_beat_128B = (dsc3_axi_data_cnt == dsc3_axi_data_number || (dsc3_axi_data_cnt == dsc3_axi_data_number - 1)) && dsc3_onflight;
    assign dsc3_axi_data_last_beat_128B = (dsc3_axi_data_cnt == 21'd2 || dsc3_axi_data_cnt == 21'd1) && dsc3_onflight;
`else
    // for dsc3_axi_data_cnt
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            dsc3_axi_data_cnt <= 21'd0;
        else
            casex ({add_dsc3, dsc3_axi_data_issue, dsc3_clear})
                3'b1xx:  dsc3_axi_data_cnt <= axi_wdata_len;
                3'b010:  dsc3_axi_data_cnt <= dsc3_axi_data_cnt - 1;
                3'b001:  dsc3_axi_data_cnt <= 21'd0;
                default: dsc3_axi_data_cnt <= dsc3_axi_data_cnt; 
            endcase 
    
    // for dsc3_axi_data_number
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            dsc3_axi_data_number <= 21'd0;
        else
            case ({add_dsc3, dsc3_clear})
                2'b10:  dsc3_axi_data_number <= axi_wdata_len;
                2'b01:  dsc3_axi_data_number <= 21'd0;
                default: dsc3_axi_data_number <= dsc3_axi_data_number; 
            endcase 

    // for dsc3_axi_burst_data_cnt
    always @(*) begin
        if (dsc3_axi_burst_cnt == dsc3_axi_req_number)          // if there is only 1 burst, it will not trun to the 1st else if
            dsc3_axi_burst_data_cnt = dsc3_first_awlen + 1;
        else if (dsc3_axi_burst_cnt == 16'd1)
            dsc3_axi_burst_data_cnt = (dsc3_first_awlen + 1) + ((dsc3_axi_req_number - 2) << 5) + (dsc3_last_awlen + 1);
        else
            dsc3_axi_burst_data_cnt = (dsc3_first_awlen + 1) + ((dsc3_axi_req_number - dsc3_axi_burst_cnt) << 5);
    end
`endif

assign dsc3_axi_data_first_beat = (dsc3_axi_data_cnt == dsc3_axi_data_number) && dsc3_onflight;
assign dsc3_axi_data_last_beat = (dsc3_axi_data_cnt == 21'd1) && dsc3_onflight;

// for dsc3_axi_wstrb_first
always @(posedge clk or negedge rst_n)
    if (!rst_n)
         dsc3_axi_wstrb_first <= 128'b0;
    else
        case ({add_dsc3, dsc3_clear})
            2'b10:   dsc3_axi_wstrb_first <= axi_wstrb_first;
            2'b01:   dsc3_axi_wstrb_first <= 128'b0;
            default: dsc3_axi_wstrb_first <= dsc3_axi_wstrb_first;
        endcase

// for dsc3_axi_data_last_byte
always @(posedge clk or negedge rst_n)
    if (!rst_n)
         dsc3_axi_wstrb_last <= 128'b0;
    else
        case ({add_dsc3, dsc3_clear})
            2'b10:   dsc3_axi_wstrb_last <= axi_wstrb_last;
            2'b01:   dsc3_axi_wstrb_last <= 128'b0;
            default: dsc3_axi_wstrb_last <= dsc3_axi_wstrb_last;
        endcase

// for dsc3_axi_resp_cnt
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc3_axi_resp_cnt <= 16'd0;
    else
        case ({add_dsc3, dsc3_axi_resp_received, dsc3_clear})
            3'b100:  dsc3_axi_resp_cnt <= (dst_data_4KB_align)? (dst_len_without_first_burst[27:12] + 1) : (dst_len_without_first_burst[27:12] + 2);
            3'b010:  dsc3_axi_resp_cnt <= dsc3_axi_resp_cnt - 1;
            3'b001:  dsc3_axi_resp_cnt <= 16'd0;
            default: dsc3_axi_resp_cnt <= dsc3_axi_resp_cnt;
        endcase

// for dsc3_lcl_rd_error
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc3_lcl_rd_error <= 1'b0;
    else if (dsc3_clear)
        dsc3_lcl_rd_error <= 1'b0;
    else if (dsc3_lcl_rd_error)
        dsc3_lcl_rd_error <= 1'b1;
    else if ((lcl_rd_data_dsc_id == 3'd3) && lcl_rd_data_valid)
        dsc3_lcl_rd_error <= lcl_rd_rsp_code;
    else
        dsc3_lcl_rd_error <= 1'b0;

// for dsc3_lcl_src_addr
always @(posedge clk or negedge rst_n)
    if (!rst_n)
         dsc3_lcl_src_addr <= 64'h0;
    else
        case ({add_dsc3, lcl_rd_data_receive_dsc3, dsc3_clear})
            3'b100: dsc3_lcl_src_addr <= src_addr;
            3'b010: dsc3_lcl_src_addr <= dsc3_lcl_src_addr + 64'd128;
            3'b001: dsc3_lcl_src_addr <= 64'h0;
            default:;
        endcase

// for dsc3_error_src_addr
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc3_error_src_addr <= 64'h0;
    else if (dsc3_clear)
        dsc3_error_src_addr <= 64'h0;
    else if (dsc3_lcl_rd_error)
        dsc3_error_src_addr <= dsc3_error_src_addr;
    else if ((lcl_rd_data_dsc_id == 3'd3) && lcl_rd_data_valid)
        dsc3_error_src_addr <= dsc3_lcl_src_addr;
    else
        dsc3_error_src_addr <= 64'h0;

// for dsc3_axi_wr_error
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc3_axi_wr_error <= 1'b0;
    else if (dsc3_clear)
        dsc3_axi_wr_error <= 1'b0;
    else if (dsc3_axi_wr_error)
        dsc3_axi_wr_error <= 1'b1;
    else if (m_axi_bvalid && m_axi_bready && (axi_wr_resp_id == 3'd3))
        dsc3_axi_wr_error <= m_axi_bresp[0] | m_axi_bresp[1];
    else
        dsc3_axi_wr_error <= 1'b0;

// for dsc3_axi_dst_addr
always @(posedge clk or negedge rst_n)
    if (!rst_n)
         dsc3_axi_dst_addr <= 64'h0;
    else
        case ({add_dsc3, dsc3_axi_resp_received, dsc3_clear})
            3'b100: dsc3_axi_dst_addr <= {dst_addr[63:7], 7'b0000000};
            3'b010: dsc3_axi_dst_addr <= dsc3_axi_dst_addr + 64'd4096;
            3'b001: dsc3_axi_dst_addr <= 64'h0;
            default:;
        endcase

// for dsc3_error_dst_addr
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc3_error_dst_addr <= 64'h0;
    else if (dsc3_clear)
        dsc3_error_dst_addr <= 64'h0;
    else if (dsc3_axi_wr_error)
        dsc3_error_dst_addr <= dsc3_error_dst_addr;
    else if (m_axi_bvalid && m_axi_bready && (axi_wr_resp_id == 3'd3))
        dsc3_error_dst_addr <= dsc3_axi_dst_addr;
    else
        dsc3_error_dst_addr <= 64'h0;    


/////////////////////////////////////////////////////////////////////////////////////
//
//       dsc*_axi_wr_status[3:0] logic
//
/////////////////////////////////////////////////////////////////////////////////////

assign dsc0_axi_req_complete = (dsc0_axi_req_cnt == 16'd0) && dsc0_onflight;            
assign dsc1_axi_req_complete = (dsc1_axi_req_cnt == 16'd0) && dsc1_onflight;            
assign dsc2_axi_req_complete = (dsc2_axi_req_cnt == 16'd0) && dsc2_onflight;            
assign dsc3_axi_req_complete = (dsc3_axi_req_cnt == 16'd0) && dsc3_onflight;            

assign dsc0_axi_data_complete = (dsc0_axi_data_cnt == 21'd0) && dsc0_onflight;          
assign dsc1_axi_data_complete = (dsc1_axi_data_cnt == 21'd0) && dsc1_onflight;          
assign dsc2_axi_data_complete = (dsc2_axi_data_cnt == 21'd0) && dsc2_onflight;          
assign dsc3_axi_data_complete = (dsc3_axi_data_cnt == 21'd0) && dsc3_onflight;          

assign dsc0_axi_resp_complete = (dsc0_axi_resp_cnt == 16'd0) && dsc0_onflight;          
assign dsc1_axi_resp_complete = (dsc1_axi_resp_cnt == 16'd0) && dsc1_onflight;          
assign dsc2_axi_resp_complete = (dsc2_axi_resp_cnt == 16'd0) && dsc2_onflight;          
assign dsc3_axi_resp_complete = (dsc3_axi_resp_cnt == 16'd0) && dsc3_onflight;          

// for dsc0_axi_wr_status[3:0]
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc0_axi_wr_status <= 4'b0000;
    else if (add_dsc0)
        dsc0_axi_wr_status <= 4'b0001;
    else if (dsc0_cmp || dsc_move_1_0 || dsc_move_2_0 || dsc_move_3_0)
        casex ({dsc0_cmp, dsc_move_1_0, dsc_move_2_0, dsc_move_3_0})
            4'bx100: dsc0_axi_wr_status <= {dsc1_axi_resp_complete, dsc1_axi_data_complete, dsc1_axi_req_complete, dsc1_axi_wr_status[0]};
            4'bx010: dsc0_axi_wr_status <= {dsc2_axi_resp_complete, dsc2_axi_data_complete, dsc2_axi_req_complete, dsc2_axi_wr_status[0]};
            4'bx001: dsc0_axi_wr_status <= {dsc3_axi_resp_complete, dsc3_axi_data_complete, dsc3_axi_req_complete, dsc3_axi_wr_status[0]};
            4'b1000: dsc0_axi_wr_status <= 4'b0000;
            default:;
        endcase
    else
        case ({dsc0_axi_wr_status, dsc0_axi_req_complete, dsc0_axi_data_complete, dsc0_axi_resp_complete})
            7'b0001100: dsc0_axi_wr_status <= 4'b0011;                    // Descriptor0 completes the AXI-MM Write Addr/Req transfer
            7'b0011110: dsc0_axi_wr_status <= 4'b0111;                    // Descriptor0 completes the AXI-MM Write Data transfer
            7'b0111111: dsc0_axi_wr_status <= 4'b1111;                    // Descriptor0 completes the AXI-MM Write Resp transfer
            default:    dsc0_axi_wr_status <= dsc0_axi_wr_status;
        endcase

// for dsc1_axi_wr_status[3:0]
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc1_axi_wr_status <= 4'b0000;
    else if (add_dsc1)
        dsc1_axi_wr_status <= 4'b0001;
    else if ((dsc_move_1_0 | dsc1_cmp) || dsc_move_2_1 || dsc_move_3_1)
        casex ({(dsc_move_1_0 | dsc1_cmp), dsc_move_2_1, dsc_move_3_1})
            3'bx10: dsc1_axi_wr_status <= {dsc2_axi_resp_complete, dsc2_axi_data_complete, dsc2_axi_req_complete, dsc2_axi_wr_status[0]};
            3'bx01: dsc1_axi_wr_status <= {dsc3_axi_resp_complete, dsc3_axi_data_complete, dsc3_axi_req_complete, dsc3_axi_wr_status[0]};
            3'b100: dsc1_axi_wr_status <= 4'b0000;
            default:;
        endcase
    else
        case ({dsc1_axi_wr_status, dsc1_axi_req_complete, dsc1_axi_data_complete, dsc1_axi_resp_complete})
            7'b0001100: dsc1_axi_wr_status <= 4'b0011;                    // Descriptor1 completes the AXI-MM Write Addr/Req transfer
            7'b0011110: dsc1_axi_wr_status <= 4'b0111;                    // Descriptor1 completes the AXI-MM Write Data transfer
            7'b0111111: dsc1_axi_wr_status <= 4'b1111;                    // Descriptor1 completes the AXI-MM Write Resp transfer
            default:    dsc1_axi_wr_status <= dsc1_axi_wr_status;
        endcase

// for dsc2_axi_wr_status[3:0]
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc2_axi_wr_status <= 4'b0000;
    else if (add_dsc2)
        dsc2_axi_wr_status <= 4'b0001;
    else if (dsc_move_3_2)
        dsc2_axi_wr_status <= {dsc3_axi_resp_complete, dsc3_axi_data_complete, dsc3_axi_req_complete, dsc3_axi_wr_status[0]};
    else if (dsc2_cmp || dsc_move_2_0 || dsc_move_2_1)
        dsc2_axi_wr_status <= 4'b0000;
    else
        case ({dsc2_axi_wr_status, dsc2_axi_req_complete, dsc2_axi_data_complete, dsc2_axi_resp_complete})
            7'b0001100: dsc2_axi_wr_status <= 4'b0011;                    // Descriptor2 completes the AXI-MM Write Addr/Req transfer
            7'b0011110: dsc2_axi_wr_status <= 4'b0111;                    // Descriptor2 completes the AXI-MM Write Data transfer
            7'b0111111: dsc2_axi_wr_status <= 4'b1111;                    // Descriptor2 completes the AXI-MM Write Resp transfer
            default:    dsc2_axi_wr_status <= dsc2_axi_wr_status;
        endcase

// for dsc3_axi_wr_status[3:0]
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc3_axi_wr_status <= 4'b0000;
    else if (add_dsc3)
        dsc3_axi_wr_status <= 4'b0001;
    else if (dsc3_clear)
        dsc3_axi_wr_status <= 4'b0000;
    else
        case ({dsc3_axi_wr_status, dsc3_axi_req_complete, dsc3_axi_data_complete, dsc3_axi_resp_complete})
            7'b0001100: dsc3_axi_wr_status <= 4'b0011;                    // Descriptor3 completes the AXI-MM Write Addr/Req transfer
            7'b0011110: dsc3_axi_wr_status <= 4'b0111;                    // Descriptor3 completes the AXI-MM Write Data transfer
            7'b0111111: dsc3_axi_wr_status <= 4'b1111;                    // Descriptor3 completes the AXI-MM Write Resp transfer
            default:    dsc3_axi_wr_status <= dsc3_axi_wr_status;
        endcase

// TODO: descriptor reorder between different channel_id descriptors when change the occurpration of AXI-MM Write Addr/Req channel
//

////////////////////////////////////////////////////////////////////////////////////////
//                           
// LCL Rd Data Mux: 
// There are 5 data paths for the lcl read data interface to the axi wr data interface 
//    1) LCL_Rd_IF -> Rd Data Mux -> AXI4-MM Wr IF              
//    2) LCL_Rd_IF -> rdata FIFO_0 -> Rd Data Mux -> AXI4-MM Wr IF              
//    3) LCL_Rd_IF -> rdata FIFO_1 -> Rd Data Mux -> AXI4-MM Wr IF              
//    4) LCL_Rd_IF -> rdata FIFO_2 -> Rd Data Mux -> AXI4-MM Wr IF              
//    5) LCL_Rd_IF -> rdata FIFO_3 -> Rd Data Mux -> AXI4-MM Wr IF              
//                          
////////////////////////////////////////////////////////////////////////////////////////

// lcl_rd_data_dsc_id indicates that current lcl read data belongs to which descriptor
assign lcl_rd_data_dsc_id = (lcl_rd_data_axi_id[4:3] == dsc0_channel_id)? 3'd0 : ((lcl_rd_data_axi_id[4:3] == dsc1_channel_id)? 3'd1 : ((lcl_rd_data_axi_id[4:3] == dsc2_channel_id)? 3'd2 : ((lcl_rd_data_axi_id[4:3] == dsc3_channel_id)? 3'd3 : 3'd7)));

assign lcl_rd_data_receive_dsc0 = lcl_rd_data_valid && lcl_rd_rsp_ready[0] && (lcl_rd_data_dsc_id == 3'd0);
assign lcl_rd_data_receive_dsc1 = lcl_rd_data_valid && lcl_rd_rsp_ready[1] && (lcl_rd_data_dsc_id == 3'd1);
assign lcl_rd_data_receive_dsc2 = lcl_rd_data_valid && lcl_rd_rsp_ready[2] && (lcl_rd_data_dsc_id == 3'd2);
assign lcl_rd_data_receive_dsc3 = lcl_rd_data_valid && lcl_rd_rsp_ready[3] && (lcl_rd_data_dsc_id == 3'd3);
// data_id_match pulled up when the lcl read data id is the same with the current axi_wr_data_id
always @(*) begin
    case (axi_wr_data_id)
        3'd0: current_data_channel_id = dsc0_channel_id;
        3'd1: current_data_channel_id = dsc1_channel_id;
        3'd2: current_data_channel_id = dsc2_channel_id;
        3'd3: current_data_channel_id = dsc3_channel_id;
        default: current_data_channel_id = 3'd7;
    endcase
end

assign data_id_match = ({1'b0, lcl_rd_data_axi_id[4:3]} == current_data_channel_id); 
`ifdef  ACTION_DATA_WIDTH_512
    assign rdata_to_fifo = (~data_id_match) || (rdata_fifo0_ren | rdata_fifo1_ren | rdata_fifo2_ren | rdata_fifo3_ren) || (~m_axi_wready_odd); 
`else
    assign rdata_to_fifo = (~data_id_match) || (rdata_fifo0_ren | rdata_fifo1_ren | rdata_fifo2_ren | rdata_fifo3_ren) || (~m_axi_wready); 
`endif

// if the data_id_match is 0, will put the lcl read data into read data channel fifo
// each fifo is only store data from one specific channel

always @(*) begin
    if (lcl_rd_data_valid && rdata_to_fifo && (lcl_rd_data_axi_id[4:3] == 2'd0)) begin
        rdata_fifo0_din = lcl_rd_data;
        rdata_fifo0_wen = 1'b1;
    end
    else begin
        rdata_fifo0_din = 1024'b0;
        rdata_fifo0_wen = 1'b0;
    end
end

always @(*) begin
    if (lcl_rd_data_valid && rdata_to_fifo && (lcl_rd_data_axi_id[4:3] == 2'd1)) begin
        rdata_fifo1_din = lcl_rd_data;
        rdata_fifo1_wen = 1'b1;
    end
    else begin
        rdata_fifo1_din = 1024'b0;
        rdata_fifo1_wen = 1'b0;
    end
end

always @(*) begin
    if (lcl_rd_data_valid && rdata_to_fifo && (lcl_rd_data_axi_id[4:3] == 2'd2)) begin
        rdata_fifo2_din = lcl_rd_data;
        rdata_fifo2_wen = 1'b1;
    end
    else begin
        rdata_fifo2_din = 1024'b0;
        rdata_fifo2_wen = 1'b0;
    end
end

always @(*) begin
    if (lcl_rd_data_valid && rdata_to_fifo && (lcl_rd_data_axi_id[4:3] == 2'd3)) begin
        rdata_fifo3_din = lcl_rd_data;
        rdata_fifo3_wen = 1'b1;
    end
    else begin
        rdata_fifo3_din = 1024'b0;
        rdata_fifo3_wen = 1'b0;
    end
end

// rdata_mux has no idea about next lcl_rd_data_axi_id, so if one of the fifos is full, lcl_rd_rsp_ready will be pulled down
assign lcl_rd_rsp_ready[0] = ~(rdata_fifo0_full);
assign lcl_rd_rsp_ready[1] = ~(rdata_fifo1_full);
assign lcl_rd_rsp_ready[2] = ~(rdata_fifo2_full);
assign lcl_rd_rsp_ready[3] = ~(rdata_fifo3_full);
assign lcl_rd_rsp_ready_hint[0] = ~(rdata_fifo0_almost_full);
assign lcl_rd_rsp_ready_hint[1] = ~(rdata_fifo1_almost_full);
assign lcl_rd_rsp_ready_hint[2] = ~(rdata_fifo2_almost_full);
assign lcl_rd_rsp_ready_hint[3] = ~(rdata_fifo3_almost_full);

// rdata_fifo* FIFOs are in FWFT mode
// Xilinx Standard FIFO IP
fifo_sync_32_1024i1024o rdata_fifo0 (
                          .clk          ( clk                      ),
                          .srst         ( ~rst_n                   ),
                          .din          ( rdata_fifo0_din          ),
                          .wr_en        ( rdata_fifo0_wen          ),
                          .rd_en        ( rdata_fifo0_ren          ),
                          .valid        ( rdata_fifo0_valid        ),
                          .dout         ( rdata_fifo0_dout         ),
                          .full         ( rdata_fifo0_full         ),
                          .almost_full  ( rdata_fifo0_almost_full  ),
                          .data_count   ( rdata_fifo0_cnt          ),
                          .empty        (                          ),
                          .almost_empty ( rdata_fifo0_almost_empty )
                         );        
assign rdata_fifo0_empty = (rdata_fifo0_cnt == 6'd0);

fifo_sync_32_1024i1024o rdata_fifo1 (
                          .clk          ( clk                      ),
                          .srst         ( ~rst_n                   ),
                          .din          ( rdata_fifo1_din          ),
                          .wr_en        ( rdata_fifo1_wen          ),
                          .rd_en        ( rdata_fifo1_ren          ),
                          .valid        ( rdata_fifo1_valid        ),
                          .dout         ( rdata_fifo1_dout         ),
                          .full         ( rdata_fifo1_full         ),
                          .almost_full  ( rdata_fifo1_almost_full  ),
                          .data_count   ( rdata_fifo1_cnt          ),
                          .empty        (                          ),
                          .almost_empty ( rdata_fifo1_almost_empty )
                         );        
assign rdata_fifo1_empty = (rdata_fifo1_cnt == 6'd0);

fifo_sync_32_1024i1024o rdata_fifo2 (
                          .clk          ( clk                      ),
                          .srst         ( ~rst_n                   ),
                          .din          ( rdata_fifo2_din          ),
                          .wr_en        ( rdata_fifo2_wen          ),
                          .rd_en        ( rdata_fifo2_ren          ),
                          .valid        ( rdata_fifo2_valid        ),
                          .dout         ( rdata_fifo2_dout         ),
                          .full         ( rdata_fifo2_full         ),
                          .almost_full  ( rdata_fifo2_almost_full  ),
                          .data_count   ( rdata_fifo2_cnt          ),
                          .empty        (                          ),
                          .almost_empty ( rdata_fifo2_almost_empty )
                         );        
assign rdata_fifo2_empty = (rdata_fifo2_cnt == 6'd0);

fifo_sync_32_1024i1024o rdata_fifo3 (
                          .clk          ( clk                      ),
                          .srst         ( ~rst_n                   ),
                          .din          ( rdata_fifo3_din          ),
                          .wr_en        ( rdata_fifo3_wen          ),
                          .rd_en        ( rdata_fifo3_ren          ),
                          .valid        ( rdata_fifo3_valid        ),
                          .dout         ( rdata_fifo3_dout         ),
                          .full         ( rdata_fifo3_full         ),
                          .almost_full  ( rdata_fifo3_almost_full  ),
                          .data_count   ( rdata_fifo3_cnt          ),
                          .empty        (                          ),
                          .almost_empty ( rdata_fifo3_almost_empty )
                         );        
assign rdata_fifo3_empty = (rdata_fifo3_cnt == 6'd0);


//************************************************//
//           AXI Write Data Arbiter               //
//************************************************//

// For data Arbiter, it will pull up&down rdata_fifo*_ren and rdata_lcl_ren signals
`ifdef  ACTION_DATA_WIDTH_512
    always @(*) begin 
        case (lcl_rd_data_axi_id[4:3])
            2'd0: rdata_lcl_ren = lcl_rd_data_valid && data_id_match && rdata_fifo0_empty && axi_data_issue_odd;
            2'd1: rdata_lcl_ren = lcl_rd_data_valid && data_id_match && rdata_fifo1_empty && axi_data_issue_odd; 
            2'd2: rdata_lcl_ren = lcl_rd_data_valid && data_id_match && rdata_fifo2_empty && axi_data_issue_odd; 
            2'd3: rdata_lcl_ren = lcl_rd_data_valid && data_id_match && rdata_fifo3_empty && axi_data_issue_odd;
            default: ;
        endcase 
    end
    
    assign rdata_fifo0_ren = (current_data_channel_id == 3'd0) && (~rdata_fifo0_empty) && axi_data_issue_odd;
    assign rdata_fifo1_ren = (current_data_channel_id == 3'd1) && (~rdata_fifo1_empty) && axi_data_issue_odd;
    assign rdata_fifo2_ren = (current_data_channel_id == 3'd2) && (~rdata_fifo2_empty) && axi_data_issue_odd;
    assign rdata_fifo3_ren = (current_data_channel_id == 3'd3) && (~rdata_fifo3_empty) && axi_data_issue_odd;
`else
    always @(*) begin 
        case (lcl_rd_data_axi_id[4:3])
            2'd0: rdata_lcl_ren = lcl_rd_data_valid && data_id_match && rdata_fifo0_empty && m_axi_wready; 
            2'd1: rdata_lcl_ren = lcl_rd_data_valid && data_id_match && rdata_fifo1_empty && m_axi_wready; 
            2'd2: rdata_lcl_ren = lcl_rd_data_valid && data_id_match && rdata_fifo2_empty && m_axi_wready; 
            2'd3: rdata_lcl_ren = lcl_rd_data_valid && data_id_match && rdata_fifo3_empty && m_axi_wready;
            default: ;
        endcase 
    end
    
    assign rdata_fifo0_ren = (current_data_channel_id == 3'd0) && (~rdata_fifo0_empty) && m_axi_wready;
    assign rdata_fifo1_ren = (current_data_channel_id == 3'd1) && (~rdata_fifo1_empty) && m_axi_wready;
    assign rdata_fifo2_ren = (current_data_channel_id == 3'd2) && (~rdata_fifo2_empty) && m_axi_wready;
    assign rdata_fifo3_ren = (current_data_channel_id == 3'd3) && (~rdata_fifo3_empty) && m_axi_wready;
`endif

//************************************************//
//    AXI-MM Write Addr/Req Channel               //
//************************************************//

always @(*) begin
    case (axi_wr_req_id)
        3'b000:  m_axi_awvalid = (dsc0_axi_req_cnt != 16'd0);
        3'b001:  m_axi_awvalid = (dsc1_axi_req_cnt != 16'd0);
        3'b010:  m_axi_awvalid = (dsc2_axi_req_cnt != 16'd0);
        3'b011:  m_axi_awvalid = (dsc3_axi_req_cnt != 16'd0);
        default: m_axi_awvalid = 1'b0;
    endcase
end

always @(*) begin
    case (axi_wr_req_id)
        3'b000:  m_axi_awaddr = dsc0_dst_addr;
        3'b001:  m_axi_awaddr = dsc1_dst_addr;
        3'b010:  m_axi_awaddr = dsc2_dst_addr;
        3'b011:  m_axi_awaddr = dsc3_dst_addr;
        default: m_axi_awaddr = 64'h0;
    endcase
end

always @(*) begin
   case (axi_wr_req_id)
       3'b000:  m_axi_awid = {3'b000, dsc0_channel_id};
       3'b001:  m_axi_awid = {3'b000, dsc1_channel_id};
       3'b010:  m_axi_awid = {3'b000, dsc2_channel_id};
       3'b011:  m_axi_awid = {3'b000, dsc3_channel_id};
       default: m_axi_awid = 5'b0;
   endcase
end

`ifdef ACTION_DATA_WIDTH_512
// TODO: will also support 64B data width
    always @(*) begin
       case (axi_wr_req_id)
           3'b000:  m_axi_awlen_128B = (dsc0_axi_req_cnt == dsc0_axi_req_number)? dsc0_first_awlen : ((dsc0_axi_req_cnt == 16'd1)? dsc0_last_awlen : 8'd31); 
           3'b001:  m_axi_awlen_128B = (dsc1_axi_req_cnt == dsc1_axi_req_number)? dsc1_first_awlen : ((dsc1_axi_req_cnt == 16'd1)? dsc1_last_awlen : 8'd31); 
           3'b010:  m_axi_awlen_128B = (dsc2_axi_req_cnt == dsc2_axi_req_number)? dsc2_first_awlen : ((dsc2_axi_req_cnt == 16'd1)? dsc2_last_awlen : 8'd31); 
           3'b011:  m_axi_awlen_128B = (dsc3_axi_req_cnt == dsc3_axi_req_number)? dsc3_first_awlen : ((dsc3_axi_req_cnt == 16'd1)? dsc3_last_awlen : 8'd31); 
           default: m_axi_awlen_128B = 8'd0;
       endcase
    end
    assign m_axi_awlen = (m_axi_awlen_128B << 1) + 1;
    assign m_axi_awsize = 3'b110;

`else
    always @(*) begin
       case (axi_wr_req_id)
           3'b000:  m_axi_awlen = (dsc0_axi_req_cnt == dsc0_axi_req_number)? dsc0_first_awlen : ((dsc0_axi_req_cnt == 16'd1)? dsc0_last_awlen : 8'd31); 
           3'b001:  m_axi_awlen = (dsc1_axi_req_cnt == dsc1_axi_req_number)? dsc1_first_awlen : ((dsc1_axi_req_cnt == 16'd1)? dsc1_last_awlen : 8'd31); 
           3'b010:  m_axi_awlen = (dsc2_axi_req_cnt == dsc2_axi_req_number)? dsc2_first_awlen : ((dsc2_axi_req_cnt == 16'd1)? dsc2_last_awlen : 8'd31); 
           3'b011:  m_axi_awlen = (dsc3_axi_req_cnt == dsc3_axi_req_number)? dsc3_first_awlen : ((dsc3_axi_req_cnt == 16'd1)? dsc3_last_awlen : 8'd31); 
           default: m_axi_awlen = 8'd0;
       endcase
    end
    assign m_axi_awsize = 3'b111;                            // AXI-MM Write Data width is 128B
`endif

assign m_axi_awburst = 2'b01;
assign m_axi_awprot = 3'h0;
assign m_axi_awqos = 4'h0;
assign m_axi_awregion = 4'h0;
assign m_axi_awlock = 2'b0;
assign m_axi_awcache = 4'h0;
assign m_axi_awuser = {AXI_AWUSER_WIDTH{1'b0}};


//************************************************//
//    AXI-MM Write Data Channel                   //
//************************************************//

always @(*) begin
    case (current_data_channel_id)
        3'd0: wdata_from_fifo = (~rdata_fifo0_empty);
        3'd1: wdata_from_fifo = (~rdata_fifo1_empty);
        3'd2: wdata_from_fifo = (~rdata_fifo2_empty);
        3'd3: wdata_from_fifo = (~rdata_fifo3_empty);
        default: wdata_from_fifo = 1'b0;
    endcase
end

always @(*) begin
    case (current_data_channel_id)
        3'd0: axi_data_valid = (wdata_from_fifo)? rdata_fifo0_valid : ((~rdata_to_fifo)? lcl_rd_data_valid : 1'b0);
        3'd1: axi_data_valid = (wdata_from_fifo)? rdata_fifo1_valid : ((~rdata_to_fifo)? lcl_rd_data_valid : 1'b0);
        3'd2: axi_data_valid = (wdata_from_fifo)? rdata_fifo2_valid : ((~rdata_to_fifo)? lcl_rd_data_valid : 1'b0);
        3'd3: axi_data_valid = (wdata_from_fifo)? rdata_fifo3_valid : ((~rdata_to_fifo)? lcl_rd_data_valid : 1'b0);
        default: axi_data_valid = 1'b0;
    endcase
end


`ifdef ACTION_DATA_WIDTH_512
   // TODO
   // dsc*_axi_data_number is an even value
   // dsc*_axi_data_cnt will alternate as¿?
   // even | odd | even | odd | even | odd | ... ... | even (21'b10) | odd (21'b01, last beat)         
   //
   
    assign axi_wdata_onduty = (axi_wr_data_id != 3'd7);
    assign axi_data_issue_odd = m_axi_wbeat_odd && m_axi_wvalid && m_axi_wready;
    assign m_axi_wready_odd = m_axi_wready && m_axi_wbeat_odd; 

    always @(*) begin
        case (axi_wr_data_id)
            3'd0:    m_axi_wvalid_even = (dsc0_axi_data_cnt != 21'd0) && axi_data_valid;
            3'd1:    m_axi_wvalid_even = (dsc1_axi_data_cnt != 21'd0) && axi_data_valid;
            3'd2:    m_axi_wvalid_even = (dsc2_axi_data_cnt != 21'd0) && axi_data_valid;
            3'd3:    m_axi_wvalid_even = (dsc3_axi_data_cnt != 21'd0) && axi_data_valid;
            default: m_axi_wvalid_even = 1'b0;
        endcase
    end

    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            m_axi_wvalid_odd <= 1'b0;
        else
            m_axi_wvalid_odd <= m_axi_wvalid_even;         

    always @(*) begin
        case (current_data_channel_id)
            3'd0:    m_axi_wdata_128B = (wdata_from_fifo)? rdata_fifo0_dout : ((~rdata_to_fifo)? lcl_rd_data : 1024'b0);
            3'd1:    m_axi_wdata_128B = (wdata_from_fifo)? rdata_fifo1_dout : ((~rdata_to_fifo)? lcl_rd_data : 1024'b0);
            3'd2:    m_axi_wdata_128B = (wdata_from_fifo)? rdata_fifo2_dout : ((~rdata_to_fifo)? lcl_rd_data : 1024'b0);
            3'd3:    m_axi_wdata_128B = (wdata_from_fifo)? rdata_fifo3_dout : ((~rdata_to_fifo)? lcl_rd_data : 1024'b0);
            default: m_axi_wdata_128B = 1024'b0;
        endcase
    end

    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            m_axi_wdata_64B_odd <= 512'b0;
        else
            m_axi_wdata_64B_odd <= m_axi_wdata_128B[1023:512];
        
    always @(*)
        case (axi_wr_data_id)
            3'd0:    m_axi_wstrb_128B = (dsc0_axi_data_first_beat_128B)? dsc0_axi_wstrb_first : ((dsc0_axi_data_last_beat_128B)? dsc0_axi_wstrb_last : 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF);
            3'd1:    m_axi_wstrb_128B = (dsc1_axi_data_first_beat_128B)? dsc1_axi_wstrb_first : ((dsc1_axi_data_last_beat_128B)? dsc1_axi_wstrb_last : 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF);
            3'd2:    m_axi_wstrb_128B = (dsc2_axi_data_first_beat_128B)? dsc2_axi_wstrb_first : ((dsc2_axi_data_last_beat_128B)? dsc2_axi_wstrb_last : 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF);
            3'd3:    m_axi_wstrb_128B = (dsc3_axi_data_first_beat_128B)? dsc3_axi_wstrb_first : ((dsc3_axi_data_last_beat_128B)? dsc3_axi_wstrb_last : 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF);
            default: m_axi_wstrb_128B = 128'h0;
        endcase

    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            m_axi_wstrb_64B_odd <= 64'h0;
        else
            m_axi_wstrb_64B_odd <= m_axi_wstrb_128B[127:64];
        
    always @(*) begin
        case (axi_wr_data_id)
            3'd0:    m_axi_wbeat_even = (dsc0_axi_data_cnt[0] == 1'b0) && dsc0_onflight;
            3'd1:    m_axi_wbeat_even = (dsc1_axi_data_cnt[0] == 1'b0) && dsc1_onflight;
            3'd2:    m_axi_wbeat_even = (dsc2_axi_data_cnt[0] == 1'b0) && dsc2_onflight;
            3'd3:    m_axi_wbeat_even = (dsc3_axi_data_cnt[0] == 1'b0) && dsc3_onflight;
            default: m_axi_wbeat_even = 1'b0;
        endcase
    end

    always @(*) begin
        case (axi_wr_data_id)
            3'd0:    m_axi_wbeat_odd = (dsc0_axi_data_cnt[0] == 1'b1) && dsc0_onflight;
            3'd1:    m_axi_wbeat_odd = (dsc1_axi_data_cnt[0] == 1'b1) && dsc1_onflight;
            3'd2:    m_axi_wbeat_odd = (dsc2_axi_data_cnt[0] == 1'b1) && dsc2_onflight;
            3'd3:    m_axi_wbeat_odd = (dsc3_axi_data_cnt[0] == 1'b1) && dsc3_onflight;
            default: m_axi_wbeat_odd = 1'b0;
        endcase
    end

    assign m_axi_wvalid = (m_axi_wbeat_even)? m_axi_wvalid_even : m_axi_wvalid_odd;
    assign m_axi_wdata = (m_axi_wbeat_even)? m_axi_wdata_128B[511:0] : m_axi_wdata_64B_odd;
    assign m_axi_wstrb = (m_axi_wbeat_even)? m_axi_wstrb_128B[63:0] : m_axi_wstrb_64B_odd;
    
`else 
    always @(*) begin
        case (axi_wr_data_id)
            3'd0: m_axi_wvalid = (dsc0_axi_data_cnt != 21'd0) && axi_data_valid;
            3'd1: m_axi_wvalid = (dsc1_axi_data_cnt != 21'd0) && axi_data_valid;
            3'd2: m_axi_wvalid = (dsc2_axi_data_cnt != 21'd0) && axi_data_valid;
            3'd3: m_axi_wvalid = (dsc3_axi_data_cnt != 21'd0) && axi_data_valid;
            default: m_axi_wvalid = 1'b0;
        endcase
    end

    always @(*) begin
        case (current_data_channel_id)
            3'd0: m_axi_wdata = (wdata_from_fifo)? rdata_fifo0_dout : ((~rdata_to_fifo)? lcl_rd_data : 1024'b0);
            3'd1: m_axi_wdata = (wdata_from_fifo)? rdata_fifo1_dout : ((~rdata_to_fifo)? lcl_rd_data : 1024'b0);
            3'd2: m_axi_wdata = (wdata_from_fifo)? rdata_fifo2_dout : ((~rdata_to_fifo)? lcl_rd_data : 1024'b0);
            3'd3: m_axi_wdata = (wdata_from_fifo)? rdata_fifo3_dout : ((~rdata_to_fifo)? lcl_rd_data : 1024'b0);
            default: m_axi_wdata = 1024'b0;
        endcase
    end

    always @(*) begin
        case (axi_wr_data_id)
            3'd0: m_axi_wstrb = (dsc0_axi_data_first_beat)? dsc0_axi_wstrb_first : ((dsc0_axi_data_last_beat)? dsc0_axi_wstrb_last : 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF);
            3'd1: m_axi_wstrb = (dsc1_axi_data_first_beat)? dsc1_axi_wstrb_first : ((dsc1_axi_data_last_beat)? dsc1_axi_wstrb_last : 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF);
            3'd2: m_axi_wstrb = (dsc2_axi_data_first_beat)? dsc2_axi_wstrb_first : ((dsc2_axi_data_last_beat)? dsc2_axi_wstrb_last : 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF);
            3'd3: m_axi_wstrb = (dsc3_axi_data_first_beat)? dsc3_axi_wstrb_first : ((dsc3_axi_data_last_beat)? dsc3_axi_wstrb_last : 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF);
            default: m_axi_wstrb = 128'h0;
        endcase
    end
`endif

always @(*) begin
    case (axi_wr_data_id)
        3'd0:    m_axi_wlast = ((dsc0_axi_data_number - dsc0_axi_data_cnt + 1) == dsc0_axi_burst_data_cnt) && dsc0_onflight;
        3'd1:    m_axi_wlast = ((dsc1_axi_data_number - dsc1_axi_data_cnt + 1) == dsc1_axi_burst_data_cnt) && dsc1_onflight;
        3'd2:    m_axi_wlast = ((dsc2_axi_data_number - dsc2_axi_data_cnt + 1) == dsc2_axi_burst_data_cnt) && dsc2_onflight;
        3'd3:    m_axi_wlast = ((dsc3_axi_data_number - dsc3_axi_data_cnt + 1) == dsc3_axi_burst_data_cnt) && dsc3_onflight;
        default: m_axi_wlast = 0;
    endcase
end
assign m_axi_wuser = 1'b0;

//************************************************//
//    AXI-MM Write Response Channel               //
//************************************************//

// Multiple descriptors share the same channel id, so the axi_wr_resp_id has a priority from dsc0 to dsc3
always @(*) begin
    casex({dsc0_axi_wr_status[3], dsc0_axi_wr_status[0], dsc1_axi_wr_status[3], dsc1_axi_wr_status[0], dsc2_axi_wr_status[3], dsc2_axi_wr_status[0], dsc3_axi_wr_status[3], dsc3_axi_wr_status[0]})
        // 1 descriptor
        8'b01000000: axi_wr_resp_id = 3'd0;
        // 2 descriptors
        8'b01010000: axi_wr_resp_id = (m_axi_bid[1:0] == dsc0_channel_id)? 3'd0 : 3'd1;
        8'b11010000: axi_wr_resp_id = 3'd1;
        8'b01110000: axi_wr_resp_id = 3'd0;
        // 3 descriptors
        8'b01010100: axi_wr_resp_id = (m_axi_bid[1:0] == dsc0_channel_id)? 3'd0 : ((m_axi_bid[1:0] == dsc1_channel_id)? 3'd1 : 3'd2);
        8'b11010100: axi_wr_resp_id = (m_axi_bid[1:0] == dsc1_channel_id)? 3'd1 : 3'd2;
        8'b01110100: axi_wr_resp_id = (m_axi_bid[1:0] == dsc0_channel_id)? 3'd0 : 3'd2;
        8'b01011100: axi_wr_resp_id = (m_axi_bid[1:0] == dsc0_channel_id)? 3'd0 : 3'd1;
        8'b11110100: axi_wr_resp_id = 3'd2;
        8'b11011100: axi_wr_resp_id = 3'd1;
        8'b01111100: axi_wr_resp_id = 3'd0;
        // 4 descriptors
        8'b01010101: axi_wr_resp_id = (m_axi_bid[1:0] == dsc0_channel_id)? 3'd0 : ((m_axi_bid[1:0] == dsc1_channel_id)? 3'd1 : ((m_axi_bid[1:0] == dsc2_channel_id)? 3'd2 : 3'd3));
        8'b11010101: axi_wr_resp_id = (m_axi_bid[1:0] == dsc1_channel_id)? 3'd1 : ((m_axi_bid[1:0] == dsc2_channel_id)? 3'd2 : 3'd3);
        8'b01110101: axi_wr_resp_id = (m_axi_bid[1:0] == dsc0_channel_id)? 3'd0 : ((m_axi_bid[1:0] == dsc2_channel_id)? 3'd2 : 3'd3);
        8'b01011101: axi_wr_resp_id = (m_axi_bid[1:0] == dsc0_channel_id)? 3'd0 : ((m_axi_bid[1:0] == dsc1_channel_id)? 3'd1 : 3'd3);
        8'b01010111: axi_wr_resp_id = (m_axi_bid[1:0] == dsc0_channel_id)? 3'd0 : ((m_axi_bid[1:0] == dsc1_channel_id)? 3'd1 : 3'd2);
        8'b11110101: axi_wr_resp_id = (m_axi_bid[1:0] == dsc2_channel_id)? 3'd2 : 3'd3;
        8'b11011101: axi_wr_resp_id = (m_axi_bid[1:0] == dsc1_channel_id)? 3'd1 : 3'd3;
        8'b11010111: axi_wr_resp_id = (m_axi_bid[1:0] == dsc1_channel_id)? 3'd1 : 3'd2;
        8'b01111101: axi_wr_resp_id = (m_axi_bid[1:0] == dsc0_channel_id)? 3'd0 : 3'd3;
        8'b01110111: axi_wr_resp_id = (m_axi_bid[1:0] == dsc0_channel_id)? 3'd0 : 3'd2;
        8'b01011111: axi_wr_resp_id = (m_axi_bid[1:0] == dsc0_channel_id)? 3'd0 : 3'd1;
        8'b11111101: axi_wr_resp_id = 3'd3;
        8'b11110111: axi_wr_resp_id = 3'd2;
        8'b11011111: axi_wr_resp_id = 3'd1;
        8'b01111111: axi_wr_resp_id = 3'd0;
        default:     axi_wr_resp_id = 3'd7;
    endcase
end


assign dsc0_axi_resp_received = m_axi_bvalid && m_axi_bready && (axi_wr_resp_id == 3'd0);
assign dsc1_axi_resp_received = m_axi_bvalid && m_axi_bready && (axi_wr_resp_id == 3'd1);
assign dsc2_axi_resp_received = m_axi_bvalid && m_axi_bready && (axi_wr_resp_id == 3'd2);
assign dsc3_axi_resp_received = m_axi_bvalid && m_axi_bready && (axi_wr_resp_id == 3'd3);

// Always ready for  AXI-MM Write Response from the action side
assign m_axi_bready = 1'b1;

//************************************************//
//    Completion Setter                           //
//************************************************//
assign dsc0_sts_error = dsc0_axi_wr_error || dsc0_lcl_rd_error;
assign dsc1_sts_error = dsc1_axi_wr_error || dsc1_lcl_rd_error;
assign dsc2_sts_error = dsc2_axi_wr_error || dsc2_lcl_rd_error;
assign dsc3_sts_error = dsc3_axi_wr_error || dsc3_lcl_rd_error;

assign dsc0_cmp_data = {190'b0,
                        1'b0, dsc0_axi_wr_error,
                        dsc0_error_dst_addr,
                        62'b0,
                        1'b0, dsc0_lcl_rd_error,
                        dsc0_error_src_addr,
                        93'b0,
                        dsc0_interrupt_req,
                        dsc0_channel_id,
                        dsc0_dsc_id,
                        dsc0_axi_resp_complete,
                        dsc0_sts_error};

assign dsc1_cmp_data = {190'b0,
                        1'b0, dsc1_axi_wr_error,
                        dsc1_error_dst_addr,
                        62'b0,
                        1'b0, dsc1_lcl_rd_error,
                        dsc1_error_src_addr,
                        93'b0,
                        dsc1_interrupt_req,
                        dsc1_channel_id,
                        dsc1_dsc_id,
                        dsc1_axi_resp_complete,
                        dsc1_sts_error};

assign dsc2_cmp_data = {190'b0,
                        1'b0, dsc2_axi_wr_error,
                        dsc2_error_dst_addr,
                        62'b0,
                        1'b0, dsc2_lcl_rd_error,
                        dsc2_error_src_addr,
                        93'b0,
                        dsc2_interrupt_req,
                        dsc2_channel_id,
                        dsc2_dsc_id,
                        dsc2_axi_resp_complete,
                        dsc2_sts_error};

assign dsc3_cmp_data = {190'b0,
                        1'b0, dsc3_axi_wr_error,
                        dsc3_error_dst_addr,
                        62'b0,
                        1'b0, dsc3_lcl_rd_error,
                        dsc3_error_src_addr,
                        93'b0,
                        dsc3_interrupt_req,
                        dsc3_channel_id,
                        dsc3_dsc_id,
                        dsc3_axi_resp_complete,
                        dsc3_sts_error};

// for completion bus of channel 0
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        cmp_valid_0 <= 1'b0;
    else if (cmp_valid_0)
        cmp_valid_0 <= (cmp_resp_0)? 1'b0 : cmp_valid_0;
    else 
        case ({dsc0_axi_resp_complete, dsc1_axi_resp_complete, dsc2_axi_resp_complete, dsc3_axi_resp_complete})
            4'b1000: cmp_valid_0 <= (dsc0_channel_id == 2'd0)? (~dsc0_cmp_status) : 1'b0;
            4'b0100: cmp_valid_0 <= (dsc1_channel_id == 2'd0)? (~dsc1_cmp_status) : 1'b0;
            4'b0010: cmp_valid_0 <= (dsc2_channel_id == 2'd0)? (~dsc2_cmp_status) : 1'b0;
            4'b0001: cmp_valid_0 <= (dsc3_channel_id == 2'd0)? (~dsc3_cmp_status) : 1'b0;
            4'b1100: cmp_valid_0 <= (dsc0_channel_id == 2'd0)? (~dsc0_cmp_status) : ((dsc1_channel_id == 2'd0)? (~dsc1_cmp_status) : 1'b0); 
            4'b1010: cmp_valid_0 <= (dsc0_channel_id == 2'd0)? (~dsc0_cmp_status) : ((dsc2_channel_id == 2'd0)? (~dsc2_cmp_status) : 1'b0); 
            4'b1001: cmp_valid_0 <= (dsc0_channel_id == 2'd0)? (~dsc0_cmp_status) : ((dsc3_channel_id == 2'd0)? (~dsc3_cmp_status) : 1'b0); 
            4'b0110: cmp_valid_0 <= (dsc1_channel_id == 2'd0)? (~dsc1_cmp_status) : ((dsc2_channel_id == 2'd0)? (~dsc2_cmp_status) : 1'b0); 
            4'b0101: cmp_valid_0 <= (dsc1_channel_id == 2'd0)? (~dsc1_cmp_status) : ((dsc3_channel_id == 2'd0)? (~dsc3_cmp_status) : 1'b0); 
            4'b0011: cmp_valid_0 <= (dsc2_channel_id == 2'd0)? (~dsc2_cmp_status) : ((dsc3_channel_id == 2'd0)? (~dsc3_cmp_status) : 1'b0); 
            4'b1110: cmp_valid_0 <= (dsc0_channel_id == 2'd0)? (~dsc0_cmp_status) : ((dsc1_channel_id == 2'd0)? (~dsc1_cmp_status) : ((dsc2_channel_id == 2'd0)? (~dsc2_cmp_status) : 1'b0));
            4'b1101: cmp_valid_0 <= (dsc0_channel_id == 2'd0)? (~dsc0_cmp_status) : ((dsc1_channel_id == 2'd0)? (~dsc1_cmp_status) : ((dsc3_channel_id == 2'd0)? (~dsc3_cmp_status) : 1'b0));
            4'b1011: cmp_valid_0 <= (dsc0_channel_id == 2'd0)? (~dsc0_cmp_status) : ((dsc2_channel_id == 2'd0)? (~dsc2_cmp_status) : ((dsc3_channel_id == 2'd0)? (~dsc3_cmp_status) : 1'b0));
            4'b0111: cmp_valid_0 <= (dsc1_channel_id == 2'd0)? (~dsc1_cmp_status) : ((dsc2_channel_id == 2'd0)? (~dsc2_cmp_status) : ((dsc3_channel_id == 2'd0)? (~dsc3_cmp_status) : 1'b0));
            4'b1111: cmp_valid_0 <= (dsc0_channel_id == 2'd0)? (~dsc0_cmp_status) : ((dsc1_channel_id == 2'd0)? (~dsc1_cmp_status) : ((dsc2_channel_id == 2'd0)? (~dsc2_cmp_status) : ((dsc3_channel_id == 2'd0)? (~dsc3_cmp_status) : 1'b0)));
            default: cmp_valid_0 <= 1'b0;
        endcase

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        cmp_data_0 <= 512'b0;
    else 
        case ({dsc0_axi_resp_complete, dsc1_axi_resp_complete, dsc2_axi_resp_complete, dsc3_axi_resp_complete})
            4'b1000: cmp_data_0 <= (dsc0_channel_id == 2'd0)? dsc0_cmp_data : 512'b0;
            4'b0100: cmp_data_0 <= (dsc1_channel_id == 2'd0)? dsc1_cmp_data : 512'b0;
            4'b0010: cmp_data_0 <= (dsc2_channel_id == 2'd0)? dsc2_cmp_data : 512'b0;
            4'b0001: cmp_data_0 <= (dsc3_channel_id == 2'd0)? dsc3_cmp_data : 512'b0;
            4'b1100: cmp_data_0 <= (dsc0_channel_id == 2'd0)? dsc0_cmp_data : ((dsc1_channel_id == 2'd0)? dsc1_cmp_data : 512'b0); 
            4'b1010: cmp_data_0 <= (dsc0_channel_id == 2'd0)? dsc0_cmp_data : ((dsc2_channel_id == 2'd0)? dsc2_cmp_data : 512'b0); 
            4'b1001: cmp_data_0 <= (dsc0_channel_id == 2'd0)? dsc0_cmp_data : ((dsc3_channel_id == 2'd0)? dsc3_cmp_data : 512'b0); 
            4'b0110: cmp_data_0 <= (dsc1_channel_id == 2'd0)? dsc1_cmp_data : ((dsc2_channel_id == 2'd0)? dsc2_cmp_data : 512'b0); 
            4'b0101: cmp_data_0 <= (dsc1_channel_id == 2'd0)? dsc1_cmp_data : ((dsc3_channel_id == 2'd0)? dsc3_cmp_data : 512'b0); 
            4'b0011: cmp_data_0 <= (dsc2_channel_id == 2'd0)? dsc2_cmp_data : ((dsc3_channel_id == 2'd0)? dsc3_cmp_data : 512'b0); 
            4'b1110: cmp_data_0 <= (dsc0_channel_id == 2'd0)? dsc0_cmp_data : ((dsc1_channel_id == 2'd0)? dsc1_cmp_data : ((dsc2_channel_id == 2'd0)? dsc2_cmp_data : 512'b0));
            4'b1101: cmp_data_0 <= (dsc0_channel_id == 2'd0)? dsc0_cmp_data : ((dsc1_channel_id == 2'd0)? dsc1_cmp_data : ((dsc3_channel_id == 2'd0)? dsc3_cmp_data : 512'b0));
            4'b1011: cmp_data_0 <= (dsc0_channel_id == 2'd0)? dsc0_cmp_data : ((dsc2_channel_id == 2'd0)? dsc2_cmp_data : ((dsc3_channel_id == 2'd0)? dsc3_cmp_data : 512'b0));
            4'b0111: cmp_data_0 <= (dsc1_channel_id == 2'd0)? dsc1_cmp_data : ((dsc2_channel_id == 2'd0)? dsc2_cmp_data : ((dsc3_channel_id == 2'd0)? dsc3_cmp_data : 512'b0));
            4'b1111: cmp_data_0 <= (dsc0_channel_id == 2'd0)? dsc0_cmp_data : ((dsc1_channel_id == 2'd0)? dsc1_cmp_data : ((dsc2_channel_id == 2'd0)? dsc2_cmp_data : ((dsc3_channel_id == 2'd0)? dsc3_cmp_data : 512'b0)));
            default: cmp_data_0 <= 512'b0;
        endcase

always @(*) begin
        case ({dsc0_axi_resp_complete, dsc1_axi_resp_complete, dsc2_axi_resp_complete, dsc3_axi_resp_complete})
            4'b1000: cmp0_dsc_id <= (dsc0_channel_id == 2'd0)? 3'd0 : 3'd7;
            4'b0100: cmp0_dsc_id <= (dsc1_channel_id == 2'd0)? 3'd1 : 3'd7;
            4'b0010: cmp0_dsc_id <= (dsc2_channel_id == 2'd0)? 3'd2 : 3'd7;
            4'b0001: cmp0_dsc_id <= (dsc3_channel_id == 2'd0)? 3'd3 : 3'd7;
            4'b1100: cmp0_dsc_id <= (dsc0_channel_id == 2'd0)? 3'd0 : ((dsc1_channel_id == 2'd0)? 3'd1 : 3'd7); 
            4'b1010: cmp0_dsc_id <= (dsc0_channel_id == 2'd0)? 3'd0 : ((dsc2_channel_id == 2'd0)? 3'd2 : 3'd7); 
            4'b1001: cmp0_dsc_id <= (dsc0_channel_id == 2'd0)? 3'd0 : ((dsc3_channel_id == 2'd0)? 3'd3 : 3'd7); 
            4'b0110: cmp0_dsc_id <= (dsc1_channel_id == 2'd0)? 3'd1 : ((dsc2_channel_id == 2'd0)? 3'd2 : 3'd7); 
            4'b0101: cmp0_dsc_id <= (dsc1_channel_id == 2'd0)? 3'd1 : ((dsc3_channel_id == 2'd0)? 3'd3 : 3'd7); 
            4'b0011: cmp0_dsc_id <= (dsc2_channel_id == 2'd0)? 3'd2 : ((dsc3_channel_id == 2'd0)? 3'd3 : 3'd7); 
            4'b1110: cmp0_dsc_id <= (dsc0_channel_id == 2'd0)? 3'd0 : ((dsc1_channel_id == 2'd0)? 3'd1 : ((dsc2_channel_id == 2'd0)? 3'd2 : 3'd7));
            4'b1101: cmp0_dsc_id <= (dsc0_channel_id == 2'd0)? 3'd0 : ((dsc1_channel_id == 2'd0)? 3'd1 : ((dsc3_channel_id == 2'd0)? 3'd3 : 3'd7));
            4'b1011: cmp0_dsc_id <= (dsc0_channel_id == 2'd0)? 3'd0 : ((dsc2_channel_id == 2'd0)? 3'd2 : ((dsc3_channel_id == 2'd0)? 3'd3 : 3'd7));
            4'b0111: cmp0_dsc_id <= (dsc1_channel_id == 2'd0)? 3'd1 : ((dsc2_channel_id == 2'd0)? 3'd2 : ((dsc3_channel_id == 2'd0)? 3'd3 : 3'd7));
            4'b1111: cmp0_dsc_id <= (dsc0_channel_id == 2'd0)? 3'd0 : ((dsc1_channel_id == 2'd0)? 3'd1 : ((dsc2_channel_id == 2'd0)? 3'd2 : ((dsc3_channel_id == 2'd0)? 3'd3 : 3'd7)));
            default: cmp0_dsc_id <= 3'd7;
        endcase
end

// for completion bus of channel 1 
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        cmp_valid_1 <= 1'b0;
    else if (cmp_valid_1)
        cmp_valid_1 <= (cmp_resp_1)? 1'b0 : cmp_valid_1;
    else 
        case ({dsc0_axi_resp_complete, dsc1_axi_resp_complete, dsc2_axi_resp_complete, dsc3_axi_resp_complete})
            4'b1000: cmp_valid_1 <= (dsc0_channel_id == 2'd1)? 1'b1 : 1'b0;
            4'b0100: cmp_valid_1 <= (dsc1_channel_id == 2'd1)? 1'b1 : 1'b0;
            4'b0010: cmp_valid_1 <= (dsc2_channel_id == 2'd1)? 1'b1 : 1'b0;
            4'b0001: cmp_valid_1 <= (dsc3_channel_id == 2'd1)? 1'b1 : 1'b0;
            4'b1100: cmp_valid_1 <= (dsc0_channel_id == 2'd1)? 1'b1 : ((dsc1_channel_id == 2'd1)? 1'b1 : 1'b0); 
            4'b1010: cmp_valid_1 <= (dsc0_channel_id == 2'd1)? 1'b1 : ((dsc2_channel_id == 2'd1)? 1'b1 : 1'b0); 
            4'b1001: cmp_valid_1 <= (dsc0_channel_id == 2'd1)? 1'b1 : ((dsc3_channel_id == 2'd1)? 1'b1 : 1'b0); 
            4'b0110: cmp_valid_1 <= (dsc1_channel_id == 2'd1)? 1'b1 : ((dsc2_channel_id == 2'd1)? 1'b1 : 1'b0); 
            4'b0101: cmp_valid_1 <= (dsc1_channel_id == 2'd1)? 1'b1 : ((dsc3_channel_id == 2'd1)? 1'b1 : 1'b0); 
            4'b0011: cmp_valid_1 <= (dsc2_channel_id == 2'd1)? 1'b1 : ((dsc3_channel_id == 2'd1)? 1'b1 : 1'b0); 
            4'b1110: cmp_valid_1 <= (dsc0_channel_id == 2'd1)? 1'b1 : ((dsc1_channel_id == 2'd1)? 1'b1 : ((dsc2_channel_id == 2'd1)? 1'b1 : 1'b0));
            4'b1101: cmp_valid_1 <= (dsc0_channel_id == 2'd1)? 1'b1 : ((dsc1_channel_id == 2'd1)? 1'b1 : ((dsc3_channel_id == 2'd1)? 1'b1 : 1'b0));
            4'b1011: cmp_valid_1 <= (dsc0_channel_id == 2'd1)? 1'b1 : ((dsc2_channel_id == 2'd1)? 1'b1 : ((dsc3_channel_id == 2'd1)? 1'b1 : 1'b0));
            4'b0111: cmp_valid_1 <= (dsc1_channel_id == 2'd1)? 1'b1 : ((dsc2_channel_id == 2'd1)? 1'b1 : ((dsc3_channel_id == 2'd1)? 1'b1 : 1'b0));
            4'b1111: cmp_valid_1 <= (dsc0_channel_id == 2'd1)? 1'b1 : ((dsc1_channel_id == 2'd1)? 1'b1 : ((dsc2_channel_id == 2'd1)? 1'b1 : ((dsc3_channel_id == 2'd1)? 1'b1 : 1'b0)));
            default: cmp_valid_1 <= 1'b0;
        endcase

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        cmp_data_1 <= 512'b0;
    else 
        case ({dsc0_axi_resp_complete, dsc1_axi_resp_complete, dsc2_axi_resp_complete, dsc3_axi_resp_complete})
            4'b1000: cmp_data_1 <= (dsc0_channel_id == 2'd1)? dsc0_cmp_data : 512'b0;
            4'b0100: cmp_data_1 <= (dsc1_channel_id == 2'd1)? dsc1_cmp_data : 512'b0;
            4'b0010: cmp_data_1 <= (dsc2_channel_id == 2'd1)? dsc2_cmp_data : 512'b0;
            4'b0001: cmp_data_1 <= (dsc3_channel_id == 2'd1)? dsc3_cmp_data : 512'b0;
            4'b1100: cmp_data_1 <= (dsc0_channel_id == 2'd1)? dsc0_cmp_data : ((dsc1_channel_id == 2'd1)? dsc1_cmp_data : 512'b0); 
            4'b1010: cmp_data_1 <= (dsc0_channel_id == 2'd1)? dsc0_cmp_data : ((dsc2_channel_id == 2'd1)? dsc2_cmp_data : 512'b0); 
            4'b1001: cmp_data_1 <= (dsc0_channel_id == 2'd1)? dsc0_cmp_data : ((dsc3_channel_id == 2'd1)? dsc3_cmp_data : 512'b0); 
            4'b0110: cmp_data_1 <= (dsc1_channel_id == 2'd1)? dsc1_cmp_data : ((dsc2_channel_id == 2'd1)? dsc2_cmp_data : 512'b0); 
            4'b0101: cmp_data_1 <= (dsc1_channel_id == 2'd1)? dsc1_cmp_data : ((dsc3_channel_id == 2'd1)? dsc3_cmp_data : 512'b0); 
            4'b0011: cmp_data_1 <= (dsc2_channel_id == 2'd1)? dsc2_cmp_data : ((dsc3_channel_id == 2'd1)? dsc3_cmp_data : 512'b0); 
            4'b1110: cmp_data_1 <= (dsc0_channel_id == 2'd1)? dsc0_cmp_data : ((dsc1_channel_id == 2'd1)? dsc1_cmp_data : ((dsc2_channel_id == 2'd1)? dsc2_cmp_data : 512'b0));
            4'b1101: cmp_data_1 <= (dsc0_channel_id == 2'd1)? dsc0_cmp_data : ((dsc1_channel_id == 2'd1)? dsc1_cmp_data : ((dsc3_channel_id == 2'd1)? dsc3_cmp_data : 512'b0));
            4'b1011: cmp_data_1 <= (dsc0_channel_id == 2'd1)? dsc0_cmp_data : ((dsc2_channel_id == 2'd1)? dsc2_cmp_data : ((dsc3_channel_id == 2'd1)? dsc3_cmp_data : 512'b0));
            4'b0111: cmp_data_1 <= (dsc1_channel_id == 2'd1)? dsc1_cmp_data : ((dsc2_channel_id == 2'd1)? dsc2_cmp_data : ((dsc3_channel_id == 2'd1)? dsc3_cmp_data : 512'b0));
            4'b1111: cmp_data_1 <= (dsc0_channel_id == 2'd1)? dsc0_cmp_data : ((dsc1_channel_id == 2'd1)? dsc1_cmp_data : ((dsc2_channel_id == 2'd1)? dsc2_cmp_data : ((dsc3_channel_id == 2'd1)? dsc3_cmp_data : 512'b0)));
            default: cmp_data_1 <= 512'b0;
        endcase

always @(*) begin
    case ({dsc0_axi_resp_complete, dsc1_axi_resp_complete, dsc2_axi_resp_complete, dsc3_axi_resp_complete})
        4'b1000: cmp1_dsc_id <= (dsc0_channel_id == 2'd1)? 3'd0 : 3'd7;
        4'b0100: cmp1_dsc_id <= (dsc1_channel_id == 2'd1)? 3'd1 : 3'd7;
        4'b0010: cmp1_dsc_id <= (dsc2_channel_id == 2'd1)? 3'd2 : 3'd7;
        4'b0001: cmp1_dsc_id <= (dsc3_channel_id == 2'd1)? 3'd3 : 3'd7;
        4'b1100: cmp1_dsc_id <= (dsc0_channel_id == 2'd1)? 3'd0 : ((dsc1_channel_id == 2'd1)? 3'd1 : 3'd7); 
        4'b1010: cmp1_dsc_id <= (dsc0_channel_id == 2'd1)? 3'd0 : ((dsc2_channel_id == 2'd1)? 3'd2 : 3'd7); 
        4'b1001: cmp1_dsc_id <= (dsc0_channel_id == 2'd1)? 3'd0 : ((dsc3_channel_id == 2'd1)? 3'd3 : 3'd7); 
        4'b0110: cmp1_dsc_id <= (dsc1_channel_id == 2'd1)? 3'd1 : ((dsc2_channel_id == 2'd1)? 3'd2 : 3'd7); 
        4'b0101: cmp1_dsc_id <= (dsc1_channel_id == 2'd1)? 3'd1 : ((dsc3_channel_id == 2'd1)? 3'd3 : 3'd7); 
        4'b0011: cmp1_dsc_id <= (dsc2_channel_id == 2'd1)? 3'd2 : ((dsc3_channel_id == 2'd1)? 3'd3 : 3'd7); 
        4'b1110: cmp1_dsc_id <= (dsc0_channel_id == 2'd1)? 3'd0 : ((dsc1_channel_id == 2'd1)? 3'd1 : ((dsc2_channel_id == 2'd1)? 3'd2 : 3'd7));
        4'b1101: cmp1_dsc_id <= (dsc0_channel_id == 2'd1)? 3'd0 : ((dsc1_channel_id == 2'd1)? 3'd1 : ((dsc3_channel_id == 2'd1)? 3'd3 : 3'd7));
        4'b1011: cmp1_dsc_id <= (dsc0_channel_id == 2'd1)? 3'd0 : ((dsc2_channel_id == 2'd1)? 3'd2 : ((dsc3_channel_id == 2'd1)? 3'd3 : 3'd7));
        4'b0111: cmp1_dsc_id <= (dsc1_channel_id == 2'd1)? 3'd1 : ((dsc2_channel_id == 2'd1)? 3'd2 : ((dsc3_channel_id == 2'd1)? 3'd3 : 3'd7));
        4'b1111: cmp1_dsc_id <= (dsc0_channel_id == 2'd1)? 3'd0 : ((dsc1_channel_id == 2'd1)? 3'd1 : ((dsc2_channel_id == 2'd1)? 3'd2 : ((dsc3_channel_id == 2'd1)? 3'd3 : 3'd7)));
        default: cmp1_dsc_id <= 3'd7;
    endcase
end

// for completion bus of channel 2 
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        cmp_valid_2 <= 1'b0;
    else if (cmp_valid_2)
        cmp_valid_2 <= (cmp_resp_2)? 1'b0 : cmp_valid_2;
    else 
        case ({dsc0_axi_resp_complete, dsc1_axi_resp_complete, dsc2_axi_resp_complete, dsc3_axi_resp_complete})
            4'b1000: cmp_valid_2 <= (dsc0_channel_id == 2'd2)? 1'b1 : 1'b0;
            4'b0100: cmp_valid_2 <= (dsc1_channel_id == 2'd2)? 1'b1 : 1'b0;
            4'b0010: cmp_valid_2 <= (dsc2_channel_id == 2'd2)? 1'b1 : 1'b0;
            4'b0001: cmp_valid_2 <= (dsc3_channel_id == 2'd2)? 1'b1 : 1'b0;
            4'b1100: cmp_valid_2 <= (dsc0_channel_id == 2'd2)? 1'b1 : ((dsc1_channel_id == 2'd2)? 1'b1 : 1'b0); 
            4'b1010: cmp_valid_2 <= (dsc0_channel_id == 2'd2)? 1'b1 : ((dsc2_channel_id == 2'd2)? 1'b1 : 1'b0); 
            4'b1001: cmp_valid_2 <= (dsc0_channel_id == 2'd2)? 1'b1 : ((dsc3_channel_id == 2'd2)? 1'b1 : 1'b0); 
            4'b0110: cmp_valid_2 <= (dsc1_channel_id == 2'd2)? 1'b1 : ((dsc2_channel_id == 2'd2)? 1'b1 : 1'b0); 
            4'b0101: cmp_valid_2 <= (dsc1_channel_id == 2'd2)? 1'b1 : ((dsc3_channel_id == 2'd2)? 1'b1 : 1'b0); 
            4'b0011: cmp_valid_2 <= (dsc2_channel_id == 2'd2)? 1'b1 : ((dsc3_channel_id == 2'd2)? 1'b1 : 1'b0); 
            4'b1110: cmp_valid_2 <= (dsc0_channel_id == 2'd2)? 1'b1 : ((dsc1_channel_id == 2'd2)? 1'b1 : ((dsc2_channel_id == 2'd2)? 1'b1 : 1'b0));
            4'b1101: cmp_valid_2 <= (dsc0_channel_id == 2'd2)? 1'b1 : ((dsc1_channel_id == 2'd2)? 1'b1 : ((dsc3_channel_id == 2'd2)? 1'b1 : 1'b0));
            4'b1011: cmp_valid_2 <= (dsc0_channel_id == 2'd2)? 1'b1 : ((dsc2_channel_id == 2'd2)? 1'b1 : ((dsc3_channel_id == 2'd2)? 1'b1 : 1'b0));
            4'b0111: cmp_valid_2 <= (dsc1_channel_id == 2'd2)? 1'b1 : ((dsc2_channel_id == 2'd2)? 1'b1 : ((dsc3_channel_id == 2'd2)? 1'b1 : 1'b0));
            4'b1111: cmp_valid_2 <= (dsc0_channel_id == 2'd2)? 1'b1 : ((dsc1_channel_id == 2'd2)? 1'b1 : ((dsc2_channel_id == 2'd2)? 1'b1 : ((dsc3_channel_id == 2'd2)? 1'b1 : 1'b0)));
            default: cmp_valid_2 <= 1'b0;
        endcase

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        cmp_data_2 <= 512'b0;
    else 
        case ({dsc0_axi_resp_complete, dsc1_axi_resp_complete, dsc2_axi_resp_complete, dsc3_axi_resp_complete})
            4'b1000: cmp_data_2 <= (dsc0_channel_id == 2'd2)? dsc0_cmp_data : 512'b0;
            4'b0100: cmp_data_2 <= (dsc1_channel_id == 2'd2)? dsc1_cmp_data : 512'b0;
            4'b0010: cmp_data_2 <= (dsc2_channel_id == 2'd2)? dsc2_cmp_data : 512'b0;
            4'b0001: cmp_data_2 <= (dsc3_channel_id == 2'd2)? dsc3_cmp_data : 512'b0;
            4'b1100: cmp_data_2 <= (dsc0_channel_id == 2'd2)? dsc0_cmp_data : ((dsc1_channel_id == 2'd2)? dsc1_cmp_data : 512'b0); 
            4'b1010: cmp_data_2 <= (dsc0_channel_id == 2'd2)? dsc0_cmp_data : ((dsc2_channel_id == 2'd2)? dsc2_cmp_data : 512'b0); 
            4'b1001: cmp_data_2 <= (dsc0_channel_id == 2'd2)? dsc0_cmp_data : ((dsc3_channel_id == 2'd2)? dsc3_cmp_data : 512'b0); 
            4'b0110: cmp_data_2 <= (dsc1_channel_id == 2'd2)? dsc1_cmp_data : ((dsc2_channel_id == 2'd2)? dsc2_cmp_data : 512'b0); 
            4'b0101: cmp_data_2 <= (dsc1_channel_id == 2'd2)? dsc1_cmp_data : ((dsc3_channel_id == 2'd2)? dsc3_cmp_data : 512'b0); 
            4'b0011: cmp_data_2 <= (dsc2_channel_id == 2'd2)? dsc2_cmp_data : ((dsc3_channel_id == 2'd2)? dsc3_cmp_data : 512'b0); 
            4'b1110: cmp_data_2 <= (dsc0_channel_id == 2'd2)? dsc0_cmp_data : ((dsc1_channel_id == 2'd2)? dsc1_cmp_data : ((dsc2_channel_id == 2'd2)? dsc2_cmp_data : 512'b0));
            4'b1101: cmp_data_2 <= (dsc0_channel_id == 2'd2)? dsc0_cmp_data : ((dsc1_channel_id == 2'd2)? dsc1_cmp_data : ((dsc3_channel_id == 2'd2)? dsc3_cmp_data : 512'b0));
            4'b1011: cmp_data_2 <= (dsc0_channel_id == 2'd2)? dsc0_cmp_data : ((dsc2_channel_id == 2'd2)? dsc2_cmp_data : ((dsc3_channel_id == 2'd2)? dsc3_cmp_data : 512'b0));
            4'b0111: cmp_data_2 <= (dsc1_channel_id == 2'd2)? dsc1_cmp_data : ((dsc2_channel_id == 2'd2)? dsc2_cmp_data : ((dsc3_channel_id == 2'd2)? dsc3_cmp_data : 512'b0));
            4'b1111: cmp_data_2 <= (dsc0_channel_id == 2'd2)? dsc0_cmp_data : ((dsc1_channel_id == 2'd2)? dsc1_cmp_data : ((dsc2_channel_id == 2'd2)? dsc2_cmp_data : ((dsc3_channel_id == 2'd2)? dsc3_cmp_data : 512'b0)));
            default: cmp_data_2 <= 512'b0;
        endcase

always @(*) begin
   case ({dsc0_axi_resp_complete, dsc1_axi_resp_complete, dsc2_axi_resp_complete, dsc3_axi_resp_complete})
       4'b1000: cmp2_dsc_id <= (dsc0_channel_id == 2'd2)? 3'd0 : 3'd7;
       4'b0100: cmp2_dsc_id <= (dsc1_channel_id == 2'd2)? 3'd1 : 3'd7;
       4'b0010: cmp2_dsc_id <= (dsc2_channel_id == 2'd2)? 3'd2 : 3'd7;
       4'b0001: cmp2_dsc_id <= (dsc3_channel_id == 2'd2)? 3'd3 : 3'd7;
       4'b1100: cmp2_dsc_id <= (dsc0_channel_id == 2'd2)? 3'd0 : ((dsc1_channel_id == 2'd2)? 3'd1 : 3'd7); 
       4'b1010: cmp2_dsc_id <= (dsc0_channel_id == 2'd2)? 3'd0 : ((dsc2_channel_id == 2'd2)? 3'd2 : 3'd7); 
       4'b1001: cmp2_dsc_id <= (dsc0_channel_id == 2'd2)? 3'd0 : ((dsc3_channel_id == 2'd2)? 3'd3 : 3'd7); 
       4'b0110: cmp2_dsc_id <= (dsc1_channel_id == 2'd2)? 3'd1 : ((dsc2_channel_id == 2'd2)? 3'd2 : 3'd7); 
       4'b0101: cmp2_dsc_id <= (dsc1_channel_id == 2'd2)? 3'd1 : ((dsc3_channel_id == 2'd2)? 3'd3 : 3'd7); 
       4'b0011: cmp2_dsc_id <= (dsc2_channel_id == 2'd2)? 3'd2 : ((dsc3_channel_id == 2'd2)? 3'd3 : 3'd7); 
       4'b1110: cmp2_dsc_id <= (dsc0_channel_id == 2'd2)? 3'd0 : ((dsc1_channel_id == 2'd2)? 3'd1 : ((dsc2_channel_id == 2'd2)? 3'd2 : 3'd7));
       4'b1101: cmp2_dsc_id <= (dsc0_channel_id == 2'd2)? 3'd0 : ((dsc1_channel_id == 2'd2)? 3'd1 : ((dsc3_channel_id == 2'd2)? 3'd3 : 3'd7));
       4'b1011: cmp2_dsc_id <= (dsc0_channel_id == 2'd2)? 3'd0 : ((dsc2_channel_id == 2'd2)? 3'd2 : ((dsc3_channel_id == 2'd2)? 3'd3 : 3'd7));
       4'b0111: cmp2_dsc_id <= (dsc1_channel_id == 2'd2)? 3'd1 : ((dsc2_channel_id == 2'd2)? 3'd2 : ((dsc3_channel_id == 2'd2)? 3'd3 : 3'd7));
       4'b1111: cmp2_dsc_id <= (dsc0_channel_id == 2'd2)? 3'd0 : ((dsc1_channel_id == 2'd2)? 3'd1 : ((dsc2_channel_id == 2'd2)? 3'd2 : ((dsc3_channel_id == 2'd2)? 3'd3 : 3'd7)));
       default: cmp2_dsc_id <= 3'd7;
   endcase
end

// for completion bus of channel 3 
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        cmp_valid_3 <= 1'b0;
    else if (cmp_valid_3)
        cmp_valid_3 <= (cmp_resp_3)? 1'b0 : cmp_valid_3;
    else 
        case ({dsc0_axi_resp_complete, dsc1_axi_resp_complete, dsc2_axi_resp_complete, dsc3_axi_resp_complete})
            4'b1000: cmp_valid_3 <= (dsc0_channel_id == 2'd3)? 1'b1 : 1'b0;
            4'b0100: cmp_valid_3 <= (dsc1_channel_id == 2'd3)? 1'b1 : 1'b0;
            4'b0010: cmp_valid_3 <= (dsc2_channel_id == 2'd3)? 1'b1 : 1'b0;
            4'b0001: cmp_valid_3 <= (dsc3_channel_id == 2'd3)? 1'b1 : 1'b0;
            4'b1100: cmp_valid_3 <= (dsc0_channel_id == 2'd3)? 1'b1 : ((dsc1_channel_id == 2'd3)? 1'b1 : 1'b0); 
            4'b1010: cmp_valid_3 <= (dsc0_channel_id == 2'd3)? 1'b1 : ((dsc2_channel_id == 2'd3)? 1'b1 : 1'b0); 
            4'b1001: cmp_valid_3 <= (dsc0_channel_id == 2'd3)? 1'b1 : ((dsc3_channel_id == 2'd3)? 1'b1 : 1'b0); 
            4'b0110: cmp_valid_3 <= (dsc1_channel_id == 2'd3)? 1'b1 : ((dsc2_channel_id == 2'd3)? 1'b1 : 1'b0); 
            4'b0101: cmp_valid_3 <= (dsc1_channel_id == 2'd3)? 1'b1 : ((dsc3_channel_id == 2'd3)? 1'b1 : 1'b0); 
            4'b0011: cmp_valid_3 <= (dsc2_channel_id == 2'd3)? 1'b1 : ((dsc3_channel_id == 2'd3)? 1'b1 : 1'b0); 
            4'b1110: cmp_valid_3 <= (dsc0_channel_id == 2'd3)? 1'b1 : ((dsc1_channel_id == 2'd3)? 1'b1 : ((dsc2_channel_id == 2'd3)? 1'b1 : 1'b0));
            4'b1101: cmp_valid_3 <= (dsc0_channel_id == 2'd3)? 1'b1 : ((dsc1_channel_id == 2'd3)? 1'b1 : ((dsc3_channel_id == 2'd3)? 1'b1 : 1'b0));
            4'b1011: cmp_valid_3 <= (dsc0_channel_id == 2'd3)? 1'b1 : ((dsc2_channel_id == 2'd3)? 1'b1 : ((dsc3_channel_id == 2'd3)? 1'b1 : 1'b0));
            4'b0111: cmp_valid_3 <= (dsc1_channel_id == 2'd3)? 1'b1 : ((dsc2_channel_id == 2'd3)? 1'b1 : ((dsc3_channel_id == 2'd3)? 1'b1 : 1'b0));
            4'b1111: cmp_valid_3 <= (dsc0_channel_id == 2'd3)? 1'b1 : ((dsc1_channel_id == 2'd3)? 1'b1 : ((dsc2_channel_id == 2'd3)? 1'b1 : ((dsc3_channel_id == 2'd3)? 1'b1 : 1'b0)));
            default: cmp_valid_3 <= 1'b0;
        endcase

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        cmp_data_3 <= 512'b0;
    else 
        case ({dsc0_axi_resp_complete, dsc1_axi_resp_complete, dsc2_axi_resp_complete, dsc3_axi_resp_complete})
            4'b1000: cmp_data_3 <= (dsc0_channel_id == 2'd3)? dsc0_cmp_data : 512'b0;
            4'b0100: cmp_data_3 <= (dsc1_channel_id == 2'd3)? dsc1_cmp_data : 512'b0;
            4'b0010: cmp_data_3 <= (dsc2_channel_id == 2'd3)? dsc2_cmp_data : 512'b0;
            4'b0001: cmp_data_3 <= (dsc3_channel_id == 2'd3)? dsc3_cmp_data : 512'b0;
            4'b1100: cmp_data_3 <= (dsc0_channel_id == 2'd3)? dsc0_cmp_data : ((dsc1_channel_id == 2'd3)? dsc1_cmp_data : 512'b0); 
            4'b1010: cmp_data_3 <= (dsc0_channel_id == 2'd3)? dsc0_cmp_data : ((dsc2_channel_id == 2'd3)? dsc2_cmp_data : 512'b0); 
            4'b1001: cmp_data_3 <= (dsc0_channel_id == 2'd3)? dsc0_cmp_data : ((dsc3_channel_id == 2'd3)? dsc3_cmp_data : 512'b0); 
            4'b0110: cmp_data_3 <= (dsc1_channel_id == 2'd3)? dsc1_cmp_data : ((dsc2_channel_id == 2'd3)? dsc2_cmp_data : 512'b0); 
            4'b0101: cmp_data_3 <= (dsc1_channel_id == 2'd3)? dsc1_cmp_data : ((dsc3_channel_id == 2'd3)? dsc3_cmp_data : 512'b0); 
            4'b0011: cmp_data_3 <= (dsc2_channel_id == 2'd3)? dsc2_cmp_data : ((dsc3_channel_id == 2'd3)? dsc3_cmp_data : 512'b0); 
            4'b1110: cmp_data_3 <= (dsc0_channel_id == 2'd3)? dsc0_cmp_data : ((dsc1_channel_id == 2'd3)? dsc1_cmp_data : ((dsc2_channel_id == 2'd3)? dsc2_cmp_data : 512'b0));
            4'b1101: cmp_data_3 <= (dsc0_channel_id == 2'd3)? dsc0_cmp_data : ((dsc1_channel_id == 2'd3)? dsc1_cmp_data : ((dsc3_channel_id == 2'd3)? dsc3_cmp_data : 512'b0));
            4'b1011: cmp_data_3 <= (dsc0_channel_id == 2'd3)? dsc0_cmp_data : ((dsc2_channel_id == 2'd3)? dsc2_cmp_data : ((dsc3_channel_id == 2'd3)? dsc3_cmp_data : 512'b0));
            4'b0111: cmp_data_3 <= (dsc1_channel_id == 2'd3)? dsc1_cmp_data : ((dsc2_channel_id == 2'd3)? dsc2_cmp_data : ((dsc3_channel_id == 2'd3)? dsc3_cmp_data : 512'b0));
            4'b1111: cmp_data_3 <= (dsc0_channel_id == 2'd3)? dsc0_cmp_data : ((dsc1_channel_id == 2'd3)? dsc1_cmp_data : ((dsc2_channel_id == 2'd3)? dsc2_cmp_data : ((dsc3_channel_id == 2'd3)? dsc3_cmp_data : 512'b0)));
            default: cmp_data_3 <= 512'b0;
        endcase

always @(*) begin
    case ({dsc0_axi_resp_complete, dsc1_axi_resp_complete, dsc2_axi_resp_complete, dsc3_axi_resp_complete})
        4'b1000: cmp3_dsc_id <= (dsc0_channel_id == 2'd3)? 3'd0 : 3'd7;
        4'b0100: cmp3_dsc_id <= (dsc1_channel_id == 2'd3)? 3'd1 : 3'd7;
        4'b0010: cmp3_dsc_id <= (dsc2_channel_id == 2'd3)? 3'd2 : 3'd7;
        4'b0001: cmp3_dsc_id <= (dsc3_channel_id == 2'd3)? 3'd3 : 3'd7;
        4'b1100: cmp3_dsc_id <= (dsc0_channel_id == 2'd3)? 3'd0 : ((dsc1_channel_id == 2'd3)? 3'd1 : 3'd7); 
        4'b1010: cmp3_dsc_id <= (dsc0_channel_id == 2'd3)? 3'd0 : ((dsc2_channel_id == 2'd3)? 3'd2 : 3'd7); 
        4'b1001: cmp3_dsc_id <= (dsc0_channel_id == 2'd3)? 3'd0 : ((dsc3_channel_id == 2'd3)? 3'd3 : 3'd7); 
        4'b0110: cmp3_dsc_id <= (dsc1_channel_id == 2'd3)? 3'd1 : ((dsc2_channel_id == 2'd3)? 3'd2 : 3'd7); 
        4'b0101: cmp3_dsc_id <= (dsc1_channel_id == 2'd3)? 3'd1 : ((dsc3_channel_id == 2'd3)? 3'd3 : 3'd7); 
        4'b0011: cmp3_dsc_id <= (dsc2_channel_id == 2'd3)? 3'd2 : ((dsc3_channel_id == 2'd3)? 3'd3 : 3'd7); 
        4'b1110: cmp3_dsc_id <= (dsc0_channel_id == 2'd3)? 3'd0 : ((dsc1_channel_id == 2'd3)? 3'd1 : ((dsc2_channel_id == 2'd3)? 3'd2 : 3'd7));
        4'b1101: cmp3_dsc_id <= (dsc0_channel_id == 2'd3)? 3'd0 : ((dsc1_channel_id == 2'd3)? 3'd1 : ((dsc3_channel_id == 2'd3)? 3'd3 : 3'd7));
        4'b1011: cmp3_dsc_id <= (dsc0_channel_id == 2'd3)? 3'd0 : ((dsc2_channel_id == 2'd3)? 3'd2 : ((dsc3_channel_id == 2'd3)? 3'd3 : 3'd7));
        4'b0111: cmp3_dsc_id <= (dsc1_channel_id == 2'd3)? 3'd1 : ((dsc2_channel_id == 2'd3)? 3'd2 : ((dsc3_channel_id == 2'd3)? 3'd3 : 3'd7));
        4'b1111: cmp3_dsc_id <= (dsc0_channel_id == 2'd3)? 3'd0 : ((dsc1_channel_id == 2'd3)? 3'd1 : ((dsc2_channel_id == 2'd3)? 3'd2 : ((dsc3_channel_id == 2'd3)? 3'd3 : 3'd7)));
        default: cmp3_dsc_id <= 3'd7;
    endcase
end

//  dsc*_cmp: identify the descriptor has completed and the dsc*_onflight will be pulled down
assign dsc0_cmp = ((cmp_valid_0 && cmp_resp_0 && (cmp0_dsc_id == 2'd0))) || ((cmp_valid_1 && cmp_resp_1 && (cmp1_dsc_id == 2'd0))) || ((cmp_valid_2 && cmp_resp_2 && (cmp2_dsc_id == 2'd0))) || ((cmp_valid_3 && cmp_resp_3 && (cmp3_dsc_id == 2'd0)));
assign dsc1_cmp = ((cmp_valid_0 && cmp_resp_0 && (cmp0_dsc_id == 2'd1))) || ((cmp_valid_1 && cmp_resp_1 && (cmp1_dsc_id == 2'd1))) || ((cmp_valid_2 && cmp_resp_2 && (cmp2_dsc_id == 2'd1))) || ((cmp_valid_3 && cmp_resp_3 && (cmp3_dsc_id == 2'd1)));
assign dsc2_cmp = ((cmp_valid_0 && cmp_resp_0 && (cmp0_dsc_id == 2'd2))) || ((cmp_valid_1 && cmp_resp_1 && (cmp1_dsc_id == 2'd2))) || ((cmp_valid_2 && cmp_resp_2 && (cmp2_dsc_id == 2'd2))) || ((cmp_valid_3 && cmp_resp_3 && (cmp3_dsc_id == 2'd2)));
assign dsc3_cmp = ((cmp_valid_0 && cmp_resp_0 && (cmp0_dsc_id == 2'd3))) || ((cmp_valid_1 && cmp_resp_1 && (cmp1_dsc_id == 2'd3))) || ((cmp_valid_2 && cmp_resp_2 && (cmp2_dsc_id == 2'd3))) || ((cmp_valid_3 && cmp_resp_3 && (cmp3_dsc_id == 2'd3)));

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc0_cmp_status <= 1'b0;
    else if (add_dsc0 || dsc_move_1_0 || dsc_move_2_0 || dsc_move_3_0)
        case ({add_dsc0, dsc_move_1_0, dsc_move_2_0, dsc_move_3_0})
            4'b1000: dsc0_cmp_status <= 1'b0;
            4'b0100: dsc0_cmp_status <= dsc1_cmp_status;
            4'b0010: dsc0_cmp_status <= dsc2_cmp_status;
            4'b0001: dsc0_cmp_status <= dsc3_cmp_status;
            default:;
        endcase
    else if (dsc0_cmp)
        dsc0_cmp_status <= 1'b1;
    else
        dsc0_cmp_status <= dsc0_cmp_status;

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc1_cmp_status <= 1'b0;
    else if (add_dsc1 || dsc_move_2_1 || dsc_move_3_1)
        case ({add_dsc1, dsc_move_2_1, dsc_move_3_1})
            3'b100: dsc1_cmp_status <= 1'b0;
            3'b010: dsc1_cmp_status <= dsc2_cmp_status;
            3'b001: dsc1_cmp_status <= dsc3_cmp_status;
            default:;
        endcase
    else if (dsc1_cmp)
        dsc1_cmp_status <= 1'b1;
    else
        dsc1_cmp_status <= dsc1_cmp_status;

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc2_cmp_status <= 1'b0;
    else if (add_dsc2 || dsc_move_3_2)
        case ({add_dsc2, dsc_move_3_2})
            2'b10: dsc2_cmp_status <= 1'b0;
            2'b01: dsc2_cmp_status <= dsc3_cmp_status;
            default:;
        endcase
    else if (dsc2_cmp)
        dsc2_cmp_status <= 1'b1;
    else
        dsc2_cmp_status <= dsc2_cmp_status;

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc3_cmp_status <= 1'b0;
    else if (add_dsc3 || dsc3_clear)
        dsc3_cmp_status <= 1'b0;
    else if (dsc3_cmp)
        dsc3_cmp_status <= 1'b1;
    else
        dsc3_cmp_status <= dsc3_cmp_status;

endmodule
