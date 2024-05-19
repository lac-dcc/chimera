// This program was cloned from: https://github.com/OpenCAPI/oc-accel
// License: Apache License 2.0

// *!***************************************************************************
// *! Copyright 2019 International Business Machines
// *!
// *! Licensed under the Apache License, Version 2.0 (the "License");
// *! you may not use this file except in compliance with the License.
// *! You may obtain a copy of the License at
// *!
// *!     http://www.apache.org/licenses/LICENSE-2.0
// *!
// *! Unless required by applicable law or agreed to in writing, software
// *! distributed under the License is distributed on an "AS IS" BASIS,
// *! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// *! See the License for the specific language governing permissions and
// *! limitations under the License.
// *!
// *! Module      : odma_h2a_st_engine
// *! Author      : Collin QIAN (qianqc@cn.ibm.com)
// *! Description : Host to action AXI stream engine 
// *!               Receive host memory data from lcl interface
// *!               Write action data through AXI stream interface
// *!***************************************************************************

`include "odma_defines.v"

module odma_h2a_st_engine #(
                   parameter    AXIS_ID_WIDTH     = 5,
                   parameter    AXIS_DATA_WIDTH   = 1024,
                   parameter    AXIS_USER_WIDTH   = 8
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
                   output       [AXIS_ID_WIDTH - 1:0]             lcl_rd_axi_id     ,
                   output                                         lcl_rd_first      ,
                   output                                         lcl_rd_last       ,
                   output       [0127:0]                          lcl_rd_be         ,
                   output       [0008:0]                          lcl_rd_ctx        ,
                   output                                         lcl_rd_ctx_valid  ,
                   input                                          lcl_rd_ready      ,
                   //---------- Read Data/Resp Channel -------------------------//
                   input                                          lcl_rd_data_valid ,
                   input        [1023:0]                          lcl_rd_data       ,
                   input        [AXIS_ID_WIDTH - 1:0]             lcl_rd_data_axi_id,
                   input                                          lcl_rd_data_last  ,
                   input                                          lcl_rd_rsp_code   ,
                   output       [0003:0]                          lcl_rd_rsp_ready  ,
                   output       [0003:0]                          lcl_rd_rsp_ready_hint,
                   //---------- AXI4-ST Write Interface -----------------------//
                   output                                         m_axis_tvalid     ,
                   input                                          m_axis_tready     ,
                   output       [AXIS_DATA_WIDTH - 1:0]           m_axis_tdata      ,
                   output       [AXIS_DATA_WIDTH/8 - 1:0]         m_axis_tkeep      ,
                   output                                         m_axis_tlast      ,
                   output       [AXIS_ID_WIDTH - 1:0]             m_axis_tid        ,
                   output       [AXIS_USER_WIDTH - 1:0]           m_axis_tuser       
);

reg    [0255:0]    dsc_data_0;
reg    [0255:0]    dsc_data_1;
reg    [0001:0]    dsc_data_status;

reg    [0021:0]    lcl_rd_req_cnt;
reg    [0021:0]    lcl_rd_req_number;
reg                parser_ready;
reg    [0005:0]    rd_axi_id_reg;
reg    [0063:0]    lcl_src_addr;
wire   [0063:0]    src_addr;


wire               lcl_rd_issue;
wire   [0002:0]    engine_id;
reg    [0255:0]    descriptor;
wire               is_dsc_valid;
wire               interrupt_req;
wire   [0001:0]    channel_id;
wire   [0029:0]    dsc_id;
wire   [0027:0]    dsc_len;
wire   [0020:0]    lcl_req_len;
wire   [0020:0]    axis_wdata_len;
wire               st_eop;

// Descriptor signals
reg                dsc_onflight;
reg                dsc_interrupt_req;
reg    [0001:0]    dsc_channel_id;
reg    [0029:0]    dsc_id_reg;
reg                dsc_st_eop;
`ifdef ACTION_DATA_WIDTH_512
    reg    [0021:0]    dsc_axis_data_number;
    reg    [0021:0]    dsc_axis_data_cnt;
`else
    reg    [0020:0]    dsc_axis_data_number;
    reg    [0020:0]    dsc_axis_data_cnt;
`endif
wire               dsc_axis_data_first_beat;
wire               dsc_axis_data_last_beat;
reg                dsc_lcl_rd_error;
reg    [0063:0]    dsc_lcl_src_addr;
reg    [0063:0]    dsc_error_src_addr;
wire               dsc_axis_data_complete;

// LCL Read Data FIFO signals
reg    [1023:0]    rdata_fifo_din;
reg                rdata_fifo_wen;
wire               rdata_fifo_ren;
wire               rdata_fifo_valid;
wire   [1023:0]    rdata_fifo_dout;
wire               rdata_fifo_full;
wire               rdata_fifo_almost_full;
wire   [0005:0]    rdata_fifo_cnt;
wire               rdata_fifo_empty;
wire               rdata_fifo_almost_empty;

wire               dsc_sts_error;
wire   [0511:0]    dsc_cmp_data;
reg                dsc_cmp;
wire               axis_data_issue;
wire               lcl_rd_data_receive;

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

always@(posedge clk)
    casex ({dsc_valid, parser_ready, dsc_data_status})
        4'b1x00: dsc_data_0 <= dsc_data;
        4'b1110: dsc_data_0 <= dsc_data;
        4'b0101: dsc_data_0 <= 256'b0;
        4'b1101: dsc_data_0 <= dsc_data;
        4'bx010: dsc_data_0 <= dsc_data_1;
        4'b0111: dsc_data_0 <= dsc_data_1;
        default: dsc_data_0 <= dsc_data_0;
    endcase

always@(posedge clk)
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
assign engine_id = `H2AST_ENGINE_ID;
assign interrupt_req = descriptor[1];
assign st_eop = descriptor[4];

assign lcl_req_len = (dsc_len >> 7);
assign axis_wdata_len = (dsc_len >> 7);

// For Stream mode, ODMA only supports 128B aligned data transfer
// One descriptor will  transfer within one data packet for AXI4-Stream interface

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
        lcl_src_addr <= 64'b0;
    else if (is_dsc_valid)
        lcl_src_addr <= src_addr;
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
assign lcl_rd_be = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;

// parser_ready signal back to dsc_buffer
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        parser_ready <= 1;
    else if (is_dsc_valid)
        parser_ready <= 0;
    else if (dsc_cmp)
        parser_ready <= 1;
    else
        parser_ready <= parser_ready;


///////////////////////////////////////////////////////////////////////////////////////////////
//
//
//    Descriptor Registers
//
//
///////////////////////////////////////////////////////////////////////////////////////////////

// for dsc_onflight
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc_onflight <= 1'b0;
    else if (is_dsc_valid)
        dsc_onflight <= 1'b1;
    else if (dsc_cmp)
        dsc_onflight <= 1'b0;
    else
        dsc_onflight <= dsc_onflight;

// for dsc_interrupt_req
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc_interrupt_req <= 1'b0;
    else if (is_dsc_valid)
        dsc_interrupt_req <= interrupt_req;
    else if (dsc_cmp)
        dsc_interrupt_req <= 1'b0;
    else
        dsc_interrupt_req <= dsc_interrupt_req;

// for dsc_channel_id
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc_channel_id <= 2'b00;
    else if (is_dsc_valid)
        dsc_channel_id <= channel_id;
    else if (dsc_cmp)
        dsc_channel_id <= 2'b00;
    else
        dsc_channel_id <= dsc_channel_id;

// for dsc_id_reg
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc_id_reg <= 30'b0;
    else if (is_dsc_valid)
        dsc_id_reg <= dsc_id;
    else if (dsc_cmp)
        dsc_id_reg <= 30'b0;
    else
        dsc_id_reg <= dsc_id_reg;

// for dsc_st_eop
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc_st_eop <= 1'b0;
    else if (is_dsc_valid)
        dsc_st_eop <= st_eop;
    else if (dsc_cmp)
        dsc_st_eop <= 1'b0;
    else
        dsc_st_eop <= dsc_st_eop;

`ifdef ACTION_DATA_WIDTH_512
    // for dsc_axis_data_number
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            dsc_axis_data_number <= 22'd0;
        else if (is_dsc_valid)
            dsc_axis_data_number <= (axis_wdata_len << 1);
        else if (dsc_cmp)
            dsc_axis_data_number <= 21'd0;
        else
            dsc_axis_data_number <= dsc_axis_data_number;

    // for dsc_axis_data_cnt
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            dsc_axis_data_cnt <= 22'd0;
        else if (is_dsc_valid)
            dsc_axis_data_cnt <= (axis_wdata_len << 1);
        else if (axis_data_issue)
            dsc_axis_data_cnt <= dsc_axis_data_cnt - 1;
        else
            dsc_axis_data_cnt <= dsc_axis_data_cnt;
`else
    // for dsc_axis_data_number
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            dsc_axis_data_number <= 21'd0;
        else if (is_dsc_valid)
            dsc_axis_data_number <= axis_wdata_len;
        else if (dsc_cmp)
            dsc_axis_data_number <= 21'd0;
        else
            dsc_axis_data_number <= dsc_axis_data_number;

    // for dsc_axis_data_cnt
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            dsc_axis_data_cnt <= 21'd0;
        else if (is_dsc_valid)
            dsc_axis_data_cnt <= axis_wdata_len;
        else if (axis_data_issue)
            dsc_axis_data_cnt <= dsc_axis_data_cnt - 1;
        else
            dsc_axis_data_cnt <= dsc_axis_data_cnt;
`endif

assign dsc_axis_data_first_beat = (dsc_axis_data_cnt == dsc_axis_data_number) && dsc_onflight;
assign dsc_axis_data_last_beat = (dsc_axis_data_cnt == 21'd1) && dsc_onflight;

// for dsc_lcl_rd_error
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc_lcl_rd_error <= 1'b0;
    else if (dsc_lcl_rd_error)
        dsc_lcl_rd_error <= 1'b1;
    else if (lcl_rd_data_valid)
        dsc_lcl_rd_error <= lcl_rd_rsp_code;
    else
        dsc_lcl_rd_error <= 1'b0;

// for dsc_lcl_src_addr
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc_lcl_src_addr <= 64'h0;
    else if (is_dsc_valid)
        dsc_lcl_src_addr <= src_addr;
    else if (lcl_rd_data_receive)
        dsc_lcl_src_addr <= dsc_lcl_src_addr + 64'd128;
    else if (dsc_cmp)
        dsc_lcl_src_addr <= 64'h0;
    else
        dsc_lcl_src_addr <= dsc_lcl_src_addr;

// for dsc_error_src_addr
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        dsc_error_src_addr <= 64'h0;
    else if (dsc_lcl_rd_error)
        dsc_error_src_addr <= dsc_error_src_addr;
    else if (lcl_rd_data_valid)
        dsc_error_src_addr <= dsc_lcl_src_addr;
    else
        dsc_error_src_addr <= 64'h0;

assign dsc_axis_data_complete = (dsc_axis_data_cnt == 21'd0) && dsc_onflight;

////////////////////////////////////////////////////////////////////////////////////////////////
//
//                                                                
//   +----------------+              +------------------+               
//   |                | ---------->  |                  |
//   |  lcl_rd_data   |              |    rdata_fifo    |               
//   |                | ---------->  |                  |
//   +----------------+              +------------------+
//                                    
////////////////////////////////////////////////////////////////////////////////////////////////

assign lcl_rd_data_receive = lcl_rd_data_valid && lcl_rd_rsp_ready;
always @(*) begin
    if (lcl_rd_data_valid) begin
        rdata_fifo_din = lcl_rd_data;
        rdata_fifo_wen = 1'b1;
    end
    else begin
        rdata_fifo_din = 1024'b0;
        rdata_fifo_wen = 1'b0;
    end
end

assign lcl_rd_rsp_ready = ~(rdata_fifo_full);
assign lcl_rd_rsp_ready_hint = ~(rdata_fifo_almost_full);

// rdata_fifo* FIFOs are in FWFT mode
// Xilinx Standard FIFO IP
fifo_sync_32_1024i1024o rdata_fifo (
                          .clk          ( clk                      ),
                          .srst         ( ~rst_n                   ),
                          .din          ( rdata_fifo_din          ),
                          .wr_en        ( rdata_fifo_wen          ),
                          .rd_en        ( rdata_fifo_ren          ),
                          .valid        ( rdata_fifo_valid        ),
                          .dout         ( rdata_fifo_dout         ),
                          .full         ( rdata_fifo_full         ),
                          .almost_full  ( rdata_fifo_almost_full  ),
                          .data_count   ( rdata_fifo_cnt          ),
                          .empty        (                         ),
                          .almost_empty ( rdata_fifo_almost_empty )
                         );        
assign rdata_fifo_empty = (rdata_fifo_cnt == 6'd0);

////////////////////////////////////////////////////////////////////////////////////////////////
//
//                                                                
//   +----------------+              +------------------+               
//   |                | ---------->  |                  |
//   |  rdata_fifo    |              |    AXI4-ST IF    |               
//   |                | ---------->  |                  |
//   +----------------+              +------------------+
//                                    
////////////////////////////////////////////////////////////////////////////////////////////////


assign m_axis_tid = {3'b000, dsc_channel_id};
assign m_axis_tlast = dsc_st_eop & dsc_axis_data_last_beat;
assign m_axis_tuser = 8'b0;

`ifdef ACTION_DATA_WIDTH_512
    // TODO
    // dsc_axis_data_number is an even number
    //     128B
    //      | 
    //   -------  
    //   |     |
    //  64B | 64B
    // even | odd | even | odd | even | odd
    //
    wire             m_axis_tvalid_128B;
    reg              m_axis_tvalid_64B_odd;
    wire [1023:0]    m_axis_tdata_128B;
    reg  [0511:0]    m_axis_tdata_64B_odd;
    wire             m_axis_wbeat_even;
    
    assign rdata_fifo_ren = (~rdata_fifo_empty) && m_axis_tvalid && m_axis_tready && (~m_axis_wbeat_even);

    //always @(posedge clk or negedge rst_n)
    //    if (!rst_n)
    //        m_axis_tvalid_128B <= 1'b0;
    //    else
    //        m_axis_tvalid_128B <= (dsc_axis_data_cnt != 22'd0) && rdata_fifo_valid;
    assign m_axis_tvalid_128B = (dsc_axis_data_cnt != 22'd0) && rdata_fifo_valid;


    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            m_axis_tvalid_64B_odd <= 1'b0;
        else if (m_axis_wbeat_even)
            m_axis_tvalid_64B_odd <= m_axis_tvalid_128B;
        else
            m_axis_tvalid_64B_odd <= m_axis_tvalid_64B_odd;

    //always @(posedge clk)
    //    m_axis_tdata_128B <= rdata_fifo_dout;
    assign m_axis_tdata_128B = rdata_fifo_dout;

    always @(posedge clk)
        if (m_axis_wbeat_even)
            m_axis_tdata_64B_odd <= m_axis_tdata_128B[1023:512];
        else
            m_axis_tdata_64B_odd <= m_axis_tdata_64B_odd;

    assign m_axis_wbeat_even = (dsc_axis_data_cnt[0] == 1'b0) && dsc_onflight;
    assign m_axis_tvalid = (m_axis_wbeat_even)? m_axis_tvalid_128B : m_axis_tvalid_64B_odd;
    assign m_axis_tdata = (m_axis_wbeat_even)? m_axis_tdata_128B[511:0] : m_axis_tdata_64B_odd;
    assign m_axis_tkeep = 64'hFFFF_FFFF_FFFF_FFFF;
`else
    assign rdata_fifo_ren = (~rdata_fifo_empty) && m_axis_tvalid && m_axis_tready;

    assign m_axis_tvalid = rdata_fifo_valid;
    assign m_axis_tdata = rdata_fifo_dout;
    assign m_axis_tkeep = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
`endif

assign axis_data_issue = m_axis_tvalid && m_axis_tready;

////////////////////////////////////////////////////////////////////////////////////////////////
//
//  Completion Logic
//
////////////////////////////////////////////////////////////////////////////////////////////////

assign dsc_sts_error = dsc_lcl_rd_error;
assign dsc_cmp_data = {190'b0,
                       2'b0,
                       64'b0,
                       62'b0,
                       1'b0, dsc_lcl_rd_error,
                       dsc_error_src_addr,
                       93'b0,
                       dsc_interrupt_req,
                       dsc_channel_id,
                       dsc_id_reg,
                       dsc_axis_data_complete,
                       dsc_sts_error};

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        cmp_valid_0 <= 1'b0;
    else if (cmp_valid_0)
        cmp_valid_0 <= (cmp_resp_0)? 1'b0 : cmp_valid_0;
    else if (dsc_axis_data_complete && (dsc_channel_id == 2'b00))
        cmp_valid_0 <= 1'b1;
    else
        cmp_valid_0 <= cmp_valid_0;

always @(posedge clk)
    if ( dsc_axis_data_complete && (dsc_channel_id == 2'b00))
        cmp_data_0 <= dsc_cmp_data;
    else
        cmp_data_0 <= 512'b0;

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        cmp_valid_1 <= 1'b0;
    else if (cmp_valid_1)
        cmp_valid_1 <= (cmp_resp_1)? 1'b0 : cmp_valid_1;
    else if (dsc_axis_data_complete && (dsc_channel_id == 2'b01))
        cmp_valid_1 <= 1'b1;
    else
        cmp_valid_1 <= cmp_valid_1;

always @(posedge clk)
    if ( dsc_axis_data_complete && (dsc_channel_id == 2'b01))
        cmp_data_1 <= dsc_cmp_data;
    else
        cmp_data_1 <= 512'b0;

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        cmp_valid_2 <= 1'b0;
    else if (cmp_valid_2)
        cmp_valid_2 <= (cmp_resp_2)? 1'b0 : cmp_valid_2;
    else if (dsc_axis_data_complete && (dsc_channel_id == 2'b10))
        cmp_valid_2 <= 1'b1;
    else
        cmp_valid_2 <= cmp_valid_2;

always @(posedge clk)
    if ( dsc_axis_data_complete && (dsc_channel_id == 2'b10))
        cmp_data_2 <= dsc_cmp_data;
    else
        cmp_data_2 <= 512'b0;

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        cmp_valid_3 <= 1'b0;
    else if (cmp_valid_3)
        cmp_valid_3 <= (cmp_resp_3)? 1'b0 : cmp_valid_3;
    else if (dsc_axis_data_complete && (dsc_channel_id == 2'b11))
        cmp_valid_3 <= 1'b1;
    else
        cmp_valid_3 <= cmp_valid_3;

always @(posedge clk)
    if ( dsc_axis_data_complete && (dsc_channel_id == 2'b11))
        cmp_data_3 <= dsc_cmp_data;
    else
        cmp_data_3 <= 512'b0;

always @(*) begin
    case (dsc_channel_id)
        2'b00: dsc_cmp = cmp_valid_0 & cmp_resp_0;
        2'b01: dsc_cmp = cmp_valid_1 & cmp_resp_1;
        2'b10: dsc_cmp = cmp_valid_2 & cmp_resp_2;
        2'b11: dsc_cmp = cmp_valid_3 & cmp_resp_3;
    endcase
end

endmodule
