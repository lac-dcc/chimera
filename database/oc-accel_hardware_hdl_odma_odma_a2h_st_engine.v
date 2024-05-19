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
// *! Module      : odma_a2h_st_engine
// *! Author      : Liu Yang Fan(shliuyf@cn.ibm.com)
// *! Description : Action to Host AXI stream engine 
// *!               Receive action data from AXI stream interface
// *!               Write host memory through local bus
// *!***************************************************************************

`include "odma_defines.v"

module odma_a2h_st_engine #(
    parameter AXIS_ID_WIDTH     = 5,
    parameter AXIS_DATA_WIDTH   = 1024,
    parameter AXIS_USER_WIDTH   = 8
)
(
    input                             clk,
    input                             rst_n,
    //----- dsc engine interface -----
    input                             dsc_valid,          //descriptor valid
    input  [255 : 0]                  dsc_data,           //descriptor data
    output                            dsc_ready,          //descriptor ready
    //----- AXI4 read data interface -----
    input                             axis_tvalid,        //AXI stream valid
    output                            axis_tready,        //AXI stream ready
    input  [AXIS_DATA_WIDTH-1 : 0 ]   axis_tdata,         //AXI stream data
    input  [AXIS_DATA_WIDTH/8-1 : 0 ] axis_tkeep,         //AXI stream keep
    input                             axis_tlast,         //AXI stream last
    input  [AXIS_ID_WIDTH-1 : 0 ]     axis_tid,           //AXI stream ID
    input  [AXIS_USER_WIDTH-1 : 0 ]   axis_tuser,         //AXI stream user
    //----- local write interface -----
    output                            lcl_wr_valid,       //local write valid
    output [63 : 0]                   lcl_wr_ea,          //local write address
    output [AXIS_ID_WIDTH-1 : 0]      lcl_wr_axi_id,      //local write AXI ID
    output [127 : 0]                  lcl_wr_be,          //local write byte enable
    output                            lcl_wr_first,       //local write first beat
    output                            lcl_wr_last,        //local write last beat
    output [1023 : 0]                 lcl_wr_data,        //local write data
    input                             lcl_wr_ready,       //local write ready
    //----- local write context interface -----
    output                            lcl_wr_ctx_valid,   //local context write valid
    output [8 : 0]                    lcl_wr_ctx,         //local context write data
    //----- local write rsp interface -----
    input                             lcl_wr_rsp_valid,   //local write response valid
    input  [AXIS_ID_WIDTH-1 : 0]      lcl_wr_rsp_axi_id,  //local write response AXI id
    input                             lcl_wr_rsp_code,    //local write response code
    output                            lcl_wr_rsp_ready,   //local write response ready
    //----- cmp engine interface -----
    output                            dsc_ch0_cmp_valid,  //channel0 descriptor complete valid
    output [511 : 0]                  dsc_ch0_cmp_data,   //channel0 descriptor complete data
    input                             dsc_ch0_cmp_ready,  //channel0 descriptor complete ready
    output                            dsc_ch1_cmp_valid,  //channel1 descriptor complete valid
    output [511 : 0]                  dsc_ch1_cmp_data,   //channel1 descriptor complete data
    input                             dsc_ch1_cmp_ready,  //channel1 descriptor complete ready
    output                            dsc_ch2_cmp_valid,  //channel2 descriptor complete valid
    output [511 : 0]                  dsc_ch2_cmp_data,   //channel2 descriptor complete data
    input                             dsc_ch2_cmp_ready,  //channel2 descriptor complete ready
    output                            dsc_ch3_cmp_valid,  //channel3 descriptor complete valid
    output [511 : 0]                  dsc_ch3_cmp_data,   //channel3 descriptor complete data
    input                             dsc_ch3_cmp_ready   //channel3 descriptor complete ready
);
//------------------------------------------------------------------------------
// Internal signals
//------------------------------------------------------------------------------
//--- Descriptor FIFO ---
wire    [255 : 0]                               dsc_fifo_din;               //descriptor FIFO data in
wire                                            dsc_fifo_wr_en;             //descriptor FIFO write enable
wire                                            dsc_fifo_rd_en;             //descriptor FIFO read enable
wire                                            dsc_fifo_valid;             //descriptor FIFO data out valid
wire    [255 : 0]                               dsc_fifo_dout;              //descriptor FIFO data out
wire                                            dsc_fifo_full;              //descriptor FIFO full
wire                                            dsc_fifo_empty;             //descriptor FIFO empty
wire                                            dsc_intr;                   //descriptor interrupt flag
wire    [63 : 0]                                dsc_dst_addr;               //descriptor destination address
wire    [27 : 0]                                dsc_length;                 //descriptor dma transfer length
wire    [ 1 : 0]                                dsc_channel_id;             //descriptor channel ID
wire    [29 : 0]                                dsc_descriptor_id;          //descriptor ID
wire    [122: 0]                                dsc_info_data;              //descriptor information
//--- Channel Descriptor Read FIFO ---
wire    [122 : 0]                               dsc_ch0_rd_fifo_din;        //channel 0 descriptor read FIFO data in
wire                                            dsc_ch0_rd_fifo_wr_en;      //channel 0 descriptor read FIFO write enable
wire                                            dsc_ch0_rd_fifo_rd_en;      //channel 0 descriptor read FIFO read enable
wire                                            dsc_ch0_rd_fifo_valid;      //channel 0 descriptor read FIFO data out valid
wire    [122 : 0]                               dsc_ch0_rd_fifo_dout;       //channel 0 descriptor read FIFO data out
wire                                            dsc_ch0_rd_fifo_full;       //channel 0 descriptor read FIFO full
wire                                            dsc_ch0_rd_fifo_empty;      //channel 0 descriptor read FIFO empty
wire    [122 : 0]                               dsc_ch1_rd_fifo_din;        //channel 1 descriptor read FIFO data in
wire                                            dsc_ch1_rd_fifo_wr_en;      //channel 1 descriptor read FIFO write enable
wire                                            dsc_ch1_rd_fifo_rd_en;      //channel 1 descriptor read FIFO read enable
wire                                            dsc_ch1_rd_fifo_valid;      //channel 1 descriptor read FIFO data out valid
wire    [122 : 0]                               dsc_ch1_rd_fifo_dout;       //channel 1 descriptor read FIFO data out
wire                                            dsc_ch1_rd_fifo_full;       //channel 1 descriptor read FIFO full
wire                                            dsc_ch1_rd_fifo_empty;      //channel 1 descriptor read FIFO empty
wire    [122 : 0]                               dsc_ch2_rd_fifo_din;        //channel 2 descriptor read FIFO data in
wire                                            dsc_ch2_rd_fifo_wr_en;      //channel 2 descriptor read FIFO write enable
wire                                            dsc_ch2_rd_fifo_rd_en;      //channel 2 descriptor read FIFO read enable
wire                                            dsc_ch2_rd_fifo_valid;      //channel 2 descriptor read FIFO data out valid
wire    [122 : 0]                               dsc_ch2_rd_fifo_dout;       //channel 2 descriptor read FIFO data out
wire                                            dsc_ch2_rd_fifo_full;       //channel 2 descriptor read FIFO full
wire                                            dsc_ch2_rd_fifo_empty;      //channel 2 descriptor read FIFO empty
wire    [122 : 0]                               dsc_ch3_rd_fifo_din;        //channel 3 descriptor read FIFO data in
wire                                            dsc_ch3_rd_fifo_wr_en;      //channel 3 descriptor read FIFO write enable
wire                                            dsc_ch3_rd_fifo_rd_en;      //channel 3 descriptor read FIFO read enable
wire                                            dsc_ch3_rd_fifo_valid;      //channel 3 descriptor read FIFO data out valid
wire    [122 : 0]                               dsc_ch3_rd_fifo_dout;       //channel 3 descriptor read FIFO data out
wire                                            dsc_ch3_rd_fifo_full;       //channel 3 descriptor read FIFO full
wire                                            dsc_ch3_rd_fifo_empty;      //channel 3 descriptor read FIFO empty
//--- AXI stream data ---
wire    [AXIS_DATA_WIDTH-1 : 0]                 rdata_fifo_din;             //AXI stream data FIFO in
wire                                            rdata_fifo_wr_en;           //AXI stream data FIFO write enable
wire                                            rdata_fifo_rd_en;           //AXI stream data FIFO read enable
wire                                            rdata_fifo_valid;           //AXI stream data FIFO out valid
wire    [AXIS_DATA_WIDTH-1 : 0]                 rdata_fifo_dout;            //AXI stream data FIFO out
wire                                            rdata_fifo_full;            //AXI stream data FIFO full
wire                                            rdata_fifo_empty;           //AXI stream data FIFO empty
wire    [AXIS_ID_WIDTH + AXIS_DATA_WIDTH/8 : 0] rtag_fifo_din;              //AXI stream data tag FIFO in
wire    [AXIS_ID_WIDTH + AXIS_DATA_WIDTH/8 : 0] rtag_fifo_dout;             //AXI stream data tag FIFO out
wire    [AXIS_ID_WIDTH-1 : 0 ]                  rtag_fifo_tid;              //AXI stream data tag FIFO out tid
wire    [AXIS_DATA_WIDTH/8-1 :0 ]               rtag_fifo_tkeep;            //AXI stream data tag FIFO out tkeep
wire                                            rtag_fifo_tlast;            //AXI stream data tag FIFO out tlast
//--- Local write data ---
wire                                            lcl_wr_done;                //local write done
wire                                            lcl_wr_data_ch0_valid;      //channel 0 local write data valid
wire                                            lcl_wr_data_ch1_valid;      //channel 1 local write data valid
wire                                            lcl_wr_data_ch2_valid;      //channel 2 local write data valid
wire                                            lcl_wr_data_ch3_valid;      //channel 3 local write data valid
wire    [ 3  : 0]                               lcl_wr_ctrl;                //lcl write control
reg     [27  : 0]                               sel_dsc_length;             //Selected descriptor length
reg     [63  : 0]                               sel_dsc_addr;               //Selected descriptor addr
reg                                             dsc_wr_first;               //Descriptor lcl write first beat
reg     [27  : 0]                               dsc_length_left;            //Descriptor length left
reg     [31  : 0]                               dsc_length_sum;             //Descriptor write length sum
wire    [31  : 0]                               dsc_length_sum_nxt;         //Descriptor write length sum next
reg     [63  : 0]                               dsc_cur_addr;               //Descriptor lcl write addr
//--- Channel Descriptor Write FIFO ---
wire    [127 : 0]                               dsc_ch0_wr_fifo_din;        //channel 0 descriptor write FIFO data in
wire                                            dsc_ch0_wr_fifo_wr_en;      //channel 0 descriptor write FIFO write enable
wire                                            dsc_ch0_wr_fifo_rd_en;      //channel 0 descriptor write FIFO read enable
wire                                            dsc_ch0_wr_fifo_valid;      //channel 0 descriptor write FIFO data out valid
wire    [127 : 0]                               dsc_ch0_wr_fifo_dout;       //channel 0 descriptor write FIFO data out
wire                                            dsc_ch0_wr_fifo_full;       //channel 0 descriptor write FIFO full
wire                                            dsc_ch0_wr_fifo_empty;      //channel 0 descriptor write FIFO empty
wire    [127 : 0]                               dsc_ch1_wr_fifo_din;        //channel 1 descriptor write FIFO data in
wire                                            dsc_ch1_wr_fifo_wr_en;      //channel 1 descriptor write FIFO write enable
wire                                            dsc_ch1_wr_fifo_rd_en;      //channel 1 descriptor write FIFO read enable
wire                                            dsc_ch1_wr_fifo_valid;      //channel 1 descriptor write FIFO data out valid
wire    [127 : 0]                               dsc_ch1_wr_fifo_dout;       //channel 1 descriptor write FIFO data out
wire                                            dsc_ch1_wr_fifo_full;       //channel 1 descriptor write FIFO full
wire                                            dsc_ch1_wr_fifo_empty;      //channel 1 descriptor write FIFO empty
wire    [127 : 0]                               dsc_ch2_wr_fifo_din;        //channel 2 descriptor write FIFO data in
wire                                            dsc_ch2_wr_fifo_wr_en;      //channel 2 descriptor write FIFO write enable
wire                                            dsc_ch2_wr_fifo_rd_en;      //channel 2 descriptor write FIFO read enable
wire                                            dsc_ch2_wr_fifo_valid;      //channel 2 descriptor write FIFO data out valid
wire    [127 : 0]                               dsc_ch2_wr_fifo_dout;       //channel 2 descriptor write FIFO data out
wire                                            dsc_ch2_wr_fifo_full;       //channel 2 descriptor write FIFO full
wire                                            dsc_ch2_wr_fifo_empty;      //channel 2 descriptor write FIFO empty
wire    [127 : 0]                               dsc_ch3_wr_fifo_din;        //channel 3 descriptor write FIFO data in
wire                                            dsc_ch3_wr_fifo_wr_en;      //channel 3 descriptor write FIFO write enable
wire                                            dsc_ch3_wr_fifo_rd_en;      //channel 3 descriptor write FIFO read enable
wire                                            dsc_ch3_wr_fifo_valid;      //channel 3 descriptor write FIFO data out valid
wire    [127 : 0]                               dsc_ch3_wr_fifo_dout;       //channel 3 descriptor write FIFO data out
wire                                            dsc_ch3_wr_fifo_full;       //channel 3 descriptor write FIFO full
wire                                            dsc_ch3_wr_fifo_empty;      //channel 3 descriptor write FIFO empty
//--- Channel Write Resp Registers ---
wire                                            dsc_ch0_rsp_fifo_din;       //channel 0 descriptor write rsp FIFO data in
wire                                            dsc_ch0_rsp_fifo_wr_en;     //channel 0 descriptor write rsp FIFO write enable
wire                                            dsc_ch0_rsp_fifo_rd_en;     //channel 0 descriptor write rsp FIFO read enable
wire                                            dsc_ch0_rsp_fifo_valid;     //channel 0 descriptor write rsp FIFO data out valid
wire                                            dsc_ch0_rsp_fifo_dout;      //channel 0 descriptor write rsp FIFO data out
wire                                            dsc_ch0_rsp_fifo_full;      //channel 0 descriptor write rsp FIFO full
wire                                            dsc_ch0_rsp_fifo_empty;     //channel 0 descriptor write rsp FIFO empty
wire                                            dsc_ch1_rsp_fifo_din;       //channel 1 descriptor write rsp FIFO data in
wire                                            dsc_ch1_rsp_fifo_wr_en;     //channel 1 descriptor write rsp FIFO write enable
wire                                            dsc_ch1_rsp_fifo_rd_en;     //channel 1 descriptor write rsp FIFO read enable
wire                                            dsc_ch1_rsp_fifo_valid;     //channel 1 descriptor write rsp FIFO data out valid
wire                                            dsc_ch1_rsp_fifo_dout;      //channel 1 descriptor write rsp FIFO data out
wire                                            dsc_ch1_rsp_fifo_full;      //channel 1 descriptor write rsp FIFO full
wire                                            dsc_ch1_rsp_fifo_empty;     //channel 1 descriptor write rsp FIFO empty
wire                                            dsc_ch2_rsp_fifo_din;       //channel 2 descriptor write rsp FIFO data in
wire                                            dsc_ch2_rsp_fifo_wr_en;     //channel 2 descriptor write rsp FIFO write enable
wire                                            dsc_ch2_rsp_fifo_rd_en;     //channel 2 descriptor write rsp FIFO read enable
wire                                            dsc_ch2_rsp_fifo_valid;     //channel 2 descriptor write rsp FIFO data out valid
wire                                            dsc_ch2_rsp_fifo_dout;      //channel 2 descriptor write rsp FIFO data out
wire                                            dsc_ch2_rsp_fifo_full;      //channel 2 descriptor write rsp FIFO full
wire                                            dsc_ch2_rsp_fifo_empty;     //channel 2 descriptor write rsp FIFO empty
wire                                            dsc_ch3_rsp_fifo_din;       //channel 3 descriptor write rsp FIFO data in
wire                                            dsc_ch3_rsp_fifo_wr_en;     //channel 3 descriptor write rsp FIFO write enable
wire                                            dsc_ch3_rsp_fifo_rd_en;     //channel 3 descriptor write rsp FIFO read enable
wire                                            dsc_ch3_rsp_fifo_valid;     //channel 3 descriptor write rsp FIFO data out valid
wire                                            dsc_ch3_rsp_fifo_dout;      //channel 3 descriptor write rsp FIFO data out
wire                                            dsc_ch3_rsp_fifo_full;      //channel 3 descriptor write rsp FIFO full
wire                                            dsc_ch3_rsp_fifo_empty;     //channel 3 descriptor write rsp FIFO empty
//------------------------------------------------------------------------------
// Descriptor FIFO
//------------------------------------------------------------------------------
//---Descriptor FIFO(256b width x 8 depth)
// Xilinx IP: FWFT fifo
fifo_sync_256x8 dsc_fifo (
  .clk          (clk           ),
  .srst         (~rst_n        ),
  .din          (dsc_fifo_din  ),
  .wr_en        (dsc_fifo_wr_en),
  .rd_en        (dsc_fifo_rd_en),
  .valid        (dsc_fifo_valid),
  .dout         (dsc_fifo_dout ),
  .full         (dsc_fifo_full ),
  .empty        (dsc_fifo_empty)
);

// FIFO write
// write fifo when dsc valid
assign dsc_fifo_wr_en = dsc_valid;
assign dsc_fifo_din   = dsc_data;
assign dsc_ready      = ~dsc_fifo_full;

// decode dsc based on channel id, write into channel fifos
assign dsc_channel_id    = dsc_fifo_valid ? dsc_fifo_dout[223:222] : 2'b0;
assign dsc_descriptor_id = dsc_fifo_valid ? dsc_fifo_dout[221:192] : 30'b0;
assign dsc_dst_addr      = dsc_fifo_valid ? dsc_fifo_dout[191:128] : 64'b0;
assign dsc_length        = dsc_fifo_valid ? dsc_fifo_dout[ 59: 32] : 28'b0;
assign dsc_intr          = dsc_fifo_valid ? dsc_fifo_dout[1] : 1'b0;
assign dsc_info_data = {dsc_length, dsc_intr, dsc_descriptor_id, dsc_dst_addr};

assign dsc_ch0_rd_fifo_wr_en = dsc_fifo_valid & (dsc_channel_id==2'b00) & ~dsc_ch0_rd_fifo_full; 
assign dsc_ch1_rd_fifo_wr_en = dsc_fifo_valid & (dsc_channel_id==2'b01) & ~dsc_ch1_rd_fifo_full; 
assign dsc_ch2_rd_fifo_wr_en = dsc_fifo_valid & (dsc_channel_id==2'b10) & ~dsc_ch2_rd_fifo_full; 
assign dsc_ch3_rd_fifo_wr_en = dsc_fifo_valid & (dsc_channel_id==2'b11) & ~dsc_ch3_rd_fifo_full; 

assign dsc_ch0_rd_fifo_din = dsc_info_data;
assign dsc_ch1_rd_fifo_din = dsc_info_data;
assign dsc_ch2_rd_fifo_din = dsc_info_data;
assign dsc_ch3_rd_fifo_din = dsc_info_data;

assign dsc_fifo_rd_en = ~dsc_fifo_empty & (dsc_ch0_rd_fifo_wr_en | dsc_ch1_rd_fifo_wr_en | dsc_ch2_rd_fifo_wr_en | dsc_ch3_rd_fifo_wr_en);

//---Channel 0 receive stream data descriptor FIFO(123b width x 4 depth)
// 28b length + 1b intr + 30b id + 64b addr
// Xilinx IP: FWFT fifo
fifo_sync_123x4 dsc_ch0_rd_fifo (
  .clk          (clk                  ),
  .srst         (~rst_n               ),
  .din          (dsc_ch0_rd_fifo_din  ),
  .wr_en        (dsc_ch0_rd_fifo_wr_en),
  .rd_en        (dsc_ch0_rd_fifo_rd_en),
  .valid        (dsc_ch0_rd_fifo_valid),
  .dout         (dsc_ch0_rd_fifo_dout ),
  .full         (dsc_ch0_rd_fifo_full ),
  .empty        (dsc_ch0_rd_fifo_empty)
);

//---Channel 1 receive stream data descriptor FIFO(123b width x 4 depth)
// Xilinx IP: FWFT fifo
fifo_sync_123x4 dsc_ch1_rd_fifo (
  .clk          (clk                  ),
  .srst         (~rst_n               ),
  .din          (dsc_ch1_rd_fifo_din  ),
  .wr_en        (dsc_ch1_rd_fifo_wr_en),
  .rd_en        (dsc_ch1_rd_fifo_rd_en),
  .valid        (dsc_ch1_rd_fifo_valid),
  .dout         (dsc_ch1_rd_fifo_dout ),
  .full         (dsc_ch1_rd_fifo_full ),
  .empty        (dsc_ch1_rd_fifo_empty)
);

//---Channel 2 receive stream data descriptor FIFO(123b width x 4 depth)
// Xilinx IP: FWFT fifo
fifo_sync_123x4 dsc_ch2_rd_fifo (
  .clk          (clk                  ),
  .srst         (~rst_n               ),
  .din          (dsc_ch2_rd_fifo_din  ),
  .wr_en        (dsc_ch2_rd_fifo_wr_en),
  .rd_en        (dsc_ch2_rd_fifo_rd_en),
  .valid        (dsc_ch2_rd_fifo_valid),
  .dout         (dsc_ch2_rd_fifo_dout ),
  .full         (dsc_ch2_rd_fifo_full ),
  .empty        (dsc_ch2_rd_fifo_empty)
);

//---Channel 3 receive stream data descriptor FIFO(123b width x 4 depth)
// Xilinx IP: FWFT fifo
fifo_sync_123x4 dsc_ch3_rd_fifo (
  .clk          (clk                  ),
  .srst         (~rst_n               ),
  .din          (dsc_ch3_rd_fifo_din  ),
  .wr_en        (dsc_ch3_rd_fifo_wr_en),
  .rd_en        (dsc_ch3_rd_fifo_rd_en),
  .valid        (dsc_ch3_rd_fifo_valid),
  .dout         (dsc_ch3_rd_fifo_dout ),
  .full         (dsc_ch3_rd_fifo_full ),
  .empty        (dsc_ch3_rd_fifo_empty)
);

//------------------------------------------------------------------------------
// AXI-Stream data
//------------------------------------------------------------------------------
// Stream data write into FIFO
assign rdata_fifo_wr_en = axis_tvalid & ~rdata_fifo_full;
assign rdata_fifo_din   = axis_tdata;
assign rtag_fifo_din    = {axis_tkeep, axis_tid, axis_tlast};

assign axis_tready = ~rdata_fifo_full;

assign rtag_fifo_tkeep = rtag_fifo_dout[AXIS_ID_WIDTH + AXIS_DATA_WIDTH/8 : AXIS_ID_WIDTH + 1];
assign rtag_fifo_tid   = rtag_fifo_dout[AXIS_ID_WIDTH : 1];
assign rtag_fifo_tlast = rtag_fifo_dout[0];

`ifdef ACTION_DATA_WIDTH_512
// *****************************
// begin 512 bit AXI data width
// *****************************
reg  [AXIS_DATA_WIDTH-1 : 0 ] axi_rdata_ch0_data;               //channel 0 first beat AXI read data
reg                           axi_rdata_ch0_valid;              //channel 0 first beat AXI read data valid
wire                          axi_rdata_ch0_wr;                 //channel 0 first beat AXI read data update
reg  [AXIS_DATA_WIDTH-1 : 0 ] axi_rdata_ch1_data;               //channel 1 first beat AXI read data
reg                           axi_rdata_ch1_valid;              //channel 1 first beat AXI read data valid
wire                          axi_rdata_ch1_wr;                 //channel 1 first beat AXI read data update
reg  [AXIS_DATA_WIDTH-1 : 0 ] axi_rdata_ch2_data;               //channel 2 first beat AXI read data
reg                           axi_rdata_ch2_valid;              //channel 2 first beat AXI read data valid
wire                          axi_rdata_ch2_wr;                 //channel 2 first beat AXI read data update
reg  [AXIS_DATA_WIDTH-1 : 0 ] axi_rdata_ch3_data;               //channel 3 first beat AXI read data
reg                           axi_rdata_ch3_valid;              //channel 3 first beat AXI read data valid
wire                          axi_rdata_ch3_wr;                 //channel 3 first beat AXI read data update
wire                          axi_rdata_wr;                     //any channel first beat AXI read data update
wire                          axi_rdata_fifo_ch0_valid;         //AXI read data fifo head data is channel 0
wire                          axi_rdata_fifo_ch1_valid;         //AXI read data fifo head data is channel 1
wire                          axi_rdata_fifo_ch2_valid;         //AXI read data fifo head data is channel 2
wire                          axi_rdata_fifo_ch3_valid;         //AXI read data fifo head data is channel 3
wire                          lcl_ch0_wr_done;                  //channel 0 local write done
wire                          lcl_ch1_wr_done;                  //channel 1 local write done
wire                          lcl_ch2_wr_done;                  //channel 2 local write done
wire                          lcl_ch3_wr_done;                  //channel 3 local write done
wire                          lcl_wr_ch0_dsc_lower_half;        //channel 0 last write beat data is first 512b on lcl write data bus
wire                          lcl_wr_ch1_dsc_lower_half;        //channel 1 last write beat data is first 512b on lcl write data bus
wire                          lcl_wr_ch2_dsc_lower_half;        //channel 2 last write beat data is first 512b on lcl write data bus
wire                          lcl_wr_ch3_dsc_lower_half;        //channel 3 last write beat data is first 512b on lcl write data bus
wire                          lcl_wr_dsc_lower_half;            //any channel last write beat data is first 512b on lcl write data bus

// first 512-bit AXI data (not rlast data) write into register
// rlast data will send to local bus if it is the first beat
// clear register when second 512-bit AXI data write done on
// local bus with the first 512-bit data
always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    axi_rdata_ch0_valid <= 1'b0;
    axi_rdata_ch0_data  <= 512'b0;
  end
  else if(axi_rdata_ch0_wr) begin
    axi_rdata_ch0_valid <= 1'b1;
    axi_rdata_ch0_data  <= rdata_fifo_dout;
  end
  else if(axi_rdata_ch0_valid & lcl_ch0_wr_done) begin
    axi_rdata_ch0_valid <= 1'b0;
    axi_rdata_ch0_data  <= 512'b0;
  end
  else begin
    axi_rdata_ch0_valid <= axi_rdata_ch0_valid;
    axi_rdata_ch0_data  <= axi_rdata_ch0_data;
  end
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    axi_rdata_ch1_valid <= 1'b0;
    axi_rdata_ch1_data  <= 512'b0;
  end
  else if(axi_rdata_ch1_wr) begin
    axi_rdata_ch1_valid <= 1'b1;
    axi_rdata_ch1_data  <= rdata_fifo_dout;
  end
  else if(axi_rdata_ch1_valid & lcl_ch1_wr_done) begin
    axi_rdata_ch1_valid <= 1'b0;
    axi_rdata_ch1_data  <= 512'b0;
  end
  else begin
    axi_rdata_ch1_valid <= axi_rdata_ch1_valid;
    axi_rdata_ch1_data  <= axi_rdata_ch1_data;
  end
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    axi_rdata_ch2_valid <= 1'b0;
    axi_rdata_ch2_data  <= 512'b0;
  end
  else if(axi_rdata_ch2_wr) begin
    axi_rdata_ch2_valid <= 1'b1;
    axi_rdata_ch2_data  <= rdata_fifo_dout;
  end
  else if(axi_rdata_ch2_valid & lcl_ch2_wr_done) begin
    axi_rdata_ch2_valid <= 1'b0;
    axi_rdata_ch2_data  <= 512'b0;
  end
  else begin
    axi_rdata_ch2_valid <= axi_rdata_ch2_valid;
    axi_rdata_ch2_data  <= axi_rdata_ch2_data;
  end
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    axi_rdata_ch3_valid <= 1'b0;
    axi_rdata_ch3_data  <= 512'b0;
  end
  else if(axi_rdata_ch3_wr) begin
    axi_rdata_ch3_valid <= 1'b1;
    axi_rdata_ch3_data  <= rdata_fifo_dout;
  end
  else if(axi_rdata_ch3_valid & lcl_ch3_wr_done) begin
    axi_rdata_ch3_valid <= 1'b0;
    axi_rdata_ch3_data  <= 512'b0;
  end
  else begin
    axi_rdata_ch3_valid <= axi_rdata_ch3_valid;
    axi_rdata_ch3_data  <= axi_rdata_ch3_data;
  end
end

assign axi_rdata_fifo_ch0_valid = rdata_fifo_valid & (rtag_fifo_tid==5'd0);
assign axi_rdata_fifo_ch1_valid = rdata_fifo_valid & (rtag_fifo_tid==5'd1);
assign axi_rdata_fifo_ch2_valid = rdata_fifo_valid & (rtag_fifo_tid==5'd2);
assign axi_rdata_fifo_ch3_valid = rdata_fifo_valid & (rtag_fifo_tid==5'd3);

assign axi_rdata_ch0_wr = axi_rdata_fifo_ch0_valid & ~rtag_fifo_tlast & ~axi_rdata_ch0_valid;
assign axi_rdata_ch1_wr = axi_rdata_fifo_ch1_valid & ~rtag_fifo_tlast & ~axi_rdata_ch1_valid;
assign axi_rdata_ch2_wr = axi_rdata_fifo_ch2_valid & ~rtag_fifo_tlast & ~axi_rdata_ch2_valid;
assign axi_rdata_ch3_wr = axi_rdata_fifo_ch3_valid & ~rtag_fifo_tlast & ~axi_rdata_ch3_valid;
assign axi_rdata_wr = axi_rdata_ch0_wr | axi_rdata_ch1_wr | axi_rdata_ch2_wr | axi_rdata_ch3_wr;

// read fifo when first beat data write into register or second beat data
// write done on local bus
assign rdata_fifo_rd_en = ~rdata_fifo_empty & (axi_rdata_wr | lcl_wr_done);

//---AXI stream data FIFO(512b width x 8 depth)
// Xilinx IP: FWFT fifo
fifo_sync_512x8 rdata_fifo (
  .clk          (clk             ),
  .srst         (~rst_n          ),
  .din          (rdata_fifo_din  ),
  .wr_en        (rdata_fifo_wr_en),
  .rd_en        (rdata_fifo_rd_en),
  .valid        (rdata_fifo_valid),
  .dout         (rdata_fifo_dout ),
  .full         (rdata_fifo_full ),
  .empty        (rdata_fifo_empty)
);

//---AXI stream data tag FIFO(70b width x 8 depth)
// 64b tkeep + 5b tid + 1b tlast
// Xilinx IP: FWFT fifo
fifo_sync_70x8 rtag_fifo (
  .clk          (clk             ),
  .srst         (~rst_n          ),
  .din          (rtag_fifo_din   ),
  .wr_en        (rdata_fifo_wr_en),
  .rd_en        (rdata_fifo_rd_en),
  .valid        (                ),
  .dout         (rtag_fifo_dout  ),
  .full         (                ),
  .empty        (                )
);

//--------------------------
// Local write command
//--------------------------
// ready to issue write cmd when two beat data for the same id are valid or end of packet
assign lcl_wr_data_ch0_valid = axi_rdata_fifo_ch0_valid & (axi_rdata_ch0_valid | rtag_fifo_tlast) & dsc_ch0_rd_fifo_valid;
assign lcl_wr_data_ch1_valid = axi_rdata_fifo_ch1_valid & (axi_rdata_ch1_valid | rtag_fifo_tlast) & dsc_ch1_rd_fifo_valid;
assign lcl_wr_data_ch2_valid = axi_rdata_fifo_ch2_valid & (axi_rdata_ch2_valid | rtag_fifo_tlast) & dsc_ch2_rd_fifo_valid;
assign lcl_wr_data_ch3_valid = axi_rdata_fifo_ch3_valid & (axi_rdata_ch3_valid | rtag_fifo_tlast) & dsc_ch3_rd_fifo_valid;

assign lcl_ch0_wr_done = lcl_wr_data_ch0_valid & lcl_wr_done;
assign lcl_ch1_wr_done = lcl_wr_data_ch1_valid & lcl_wr_done;
assign lcl_ch2_wr_done = lcl_wr_data_ch2_valid & lcl_wr_done;
assign lcl_ch3_wr_done = lcl_wr_data_ch3_valid & lcl_wr_done;

// check last beat data is the lower 512b half
assign lcl_wr_ch0_dsc_lower_half = axi_rdata_fifo_ch0_valid & rtag_fifo_tlast & ~axi_rdata_ch0_valid;
assign lcl_wr_ch1_dsc_lower_half = axi_rdata_fifo_ch1_valid & rtag_fifo_tlast & ~axi_rdata_ch1_valid;
assign lcl_wr_ch2_dsc_lower_half = axi_rdata_fifo_ch2_valid & rtag_fifo_tlast & ~axi_rdata_ch2_valid;
assign lcl_wr_ch3_dsc_lower_half = axi_rdata_fifo_ch3_valid & rtag_fifo_tlast & ~axi_rdata_ch3_valid;

assign lcl_wr_dsc_lower_half = lcl_wr_ch0_dsc_lower_half | lcl_wr_ch1_dsc_lower_half | lcl_wr_ch2_dsc_lower_half | lcl_wr_ch3_dsc_lower_half;

// generate lcl write data and be
assign lcl_wr_data = lcl_wr_dsc_lower_half ? {512'b0, rdata_fifo_dout}
                       : (lcl_wr_data_ch0_valid ? {rdata_fifo_dout, axi_rdata_ch0_data}
                         : (lcl_wr_data_ch1_valid ? {rdata_fifo_dout, axi_rdata_ch1_data}
                           : (lcl_wr_data_ch2_valid ? {rdata_fifo_dout, axi_rdata_ch2_data}
                             : (lcl_wr_data_ch3_valid ? {rdata_fifo_dout, axi_rdata_ch3_data} : 1024'b0))));

assign lcl_wr_be   = lcl_wr_dsc_lower_half ? {64'b0, rtag_fifo_tkeep} : {64'hFFFFFFFF_FFFFFFFF, rtag_fifo_tkeep}; 
// *****************************
// end 512 bit AXI data width
// *****************************
`else
// *****************************
// begin 1024 bit AXI data width
// *****************************
//---AXI stream data FIFO(1024b width x 8 depth)
// Xilinx IP: FWFT fifo(FIFO IP max data width is 1024)
fifo_sync_1024x8 rdata_fifo (
  .clk          (clk             ),
  .srst         (~rst_n          ),
  .din          (rdata_fifo_din  ),
  .wr_en        (rdata_fifo_wr_en),
  .rd_en        (rdata_fifo_rd_en),
  .valid        (rdata_fifo_valid),
  .dout         (rdata_fifo_dout ),
  .full         (rdata_fifo_full ),
  .empty        (rdata_fifo_empty)
);

//---AXI stream data tag FIFO(134b width x 8 depth)
// 128b tkeep + 5b tid + 1b tlast
// Xilinx IP: FWFT fifo
fifo_sync_134x8 rtag_fifo (
  .clk          (clk             ),
  .srst         (~rst_n          ),
  .din          (rtag_fifo_din   ),
  .wr_en        (rdata_fifo_wr_en),
  .rd_en        (rdata_fifo_rd_en),
  .valid        (                ),
  .dout         (rtag_fifo_dout  ),
  .full         (                ),
  .empty        (                )
);

assign rdata_fifo_rd_en = ~rdata_fifo_empty & lcl_wr_done;

//--------------------------
// Local write command
//--------------------------
assign lcl_wr_data_ch0_valid = rdata_fifo_valid & (rtag_fifo_tid == 5'd0) & dsc_ch0_rd_fifo_valid;
assign lcl_wr_data_ch1_valid = rdata_fifo_valid & (rtag_fifo_tid == 5'd1) & dsc_ch1_rd_fifo_valid;
assign lcl_wr_data_ch2_valid = rdata_fifo_valid & (rtag_fifo_tid == 5'd2) & dsc_ch2_rd_fifo_valid;
assign lcl_wr_data_ch3_valid = rdata_fifo_valid & (rtag_fifo_tid == 5'd3) & dsc_ch3_rd_fifo_valid;

assign lcl_wr_data = rdata_fifo_dout;
assign lcl_wr_be   = rtag_fifo_tkeep;
// *****************************
// end 1024 bit AXI data width
// *****************************
`endif

// select different channel dsc length and addr
assign lcl_wr_ctrl = {lcl_wr_data_ch3_valid, lcl_wr_data_ch2_valid, lcl_wr_data_ch1_valid, lcl_wr_data_ch0_valid};

always@(*) begin
  case(lcl_wr_ctrl)
    4'b0001: begin
      sel_dsc_length = dsc_ch0_rd_fifo_dout[122:95];
      sel_dsc_addr   = dsc_ch0_rd_fifo_dout[63:0];
    end
    4'b0010: begin
      sel_dsc_length = dsc_ch1_rd_fifo_dout[122:95];
      sel_dsc_addr   = dsc_ch1_rd_fifo_dout[63:0];
    end
    4'b0100: begin
      sel_dsc_length = dsc_ch2_rd_fifo_dout[122:95];
      sel_dsc_addr   = dsc_ch2_rd_fifo_dout[63:0];
    end
    4'b1000: begin
      sel_dsc_length = dsc_ch3_rd_fifo_dout[122:95];
      sel_dsc_addr   = dsc_ch3_rd_fifo_dout[63:0];
    end
    default: begin
      sel_dsc_length = 28'b0;
      sel_dsc_addr   = 64'b0;
    end
  endcase
end

// generate dsc lcl write first beat flag
always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    dsc_wr_first <= 1'b1;
  else if(lcl_wr_last & lcl_wr_done)
    dsc_wr_first <= 1'b1;
  else if(dsc_wr_first & lcl_wr_done)
    dsc_wr_first <= 1'b0;
  else
    dsc_wr_first <= dsc_wr_first;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    dsc_cur_addr    <= 64'b0;
    dsc_length_left <= 28'b0;
    dsc_length_sum  <= 32'b0;
  end
  else if(dsc_wr_first & lcl_wr_done) begin
    dsc_cur_addr    <= sel_dsc_addr + 8'd128;
    dsc_length_left <= sel_dsc_length - 8'd128;
    dsc_length_sum  <= 32'd128;
  end
  else if(lcl_wr_done) begin
    dsc_cur_addr    <= dsc_cur_addr + 8'd128;
    dsc_length_left <= dsc_length_left - 8'd128;
    dsc_length_sum  <= dsc_length_sum_nxt;
  end
  else begin
    dsc_cur_addr    <= dsc_cur_addr;
    dsc_length_left <= dsc_length_left;
    dsc_length_sum  <= dsc_length_sum;
  end
end

assign dsc_length_sum_nxt = dsc_length_sum + 8'd128;

// Generate local write signals
// Last beat when a descriptor is filled completely or closed due to an end of packet on the interface
assign lcl_wr_valid  = (lcl_wr_data_ch0_valid & ~dsc_ch0_wr_fifo_full) | (lcl_wr_data_ch1_valid & ~dsc_ch1_wr_fifo_full) 
                     | (lcl_wr_data_ch2_valid & ~dsc_ch2_wr_fifo_full) | (lcl_wr_data_ch3_valid & ~dsc_ch3_wr_fifo_full);
assign lcl_wr_ea     = dsc_wr_first ? sel_dsc_addr : dsc_cur_addr;
assign lcl_wr_axi_id = {rtag_fifo_tid[1:0], `A2HST_ENGINE_ID};
assign lcl_wr_first  = lcl_wr_valid & dsc_wr_first;
assign lcl_wr_last   = lcl_wr_valid & (rtag_fifo_tlast | (dsc_wr_first & (sel_dsc_length == 28'd128)) | dsc_length_left == 28'd128);

// lcl ctx write cmd (not used for now)
assign lcl_wr_ctx_valid = 1'b0;
assign lcl_wr_ctx       = 9'b0;

// read dsc read fifo, write into dsc write fifo when last beat write done
assign dsc_ch0_rd_fifo_rd_en = lcl_wr_data_ch0_valid & lcl_wr_last & lcl_wr_ready;
assign dsc_ch1_rd_fifo_rd_en = lcl_wr_data_ch1_valid & lcl_wr_last & lcl_wr_ready;
assign dsc_ch2_rd_fifo_rd_en = lcl_wr_data_ch2_valid & lcl_wr_last & lcl_wr_ready;
assign dsc_ch3_rd_fifo_rd_en = lcl_wr_data_ch3_valid & lcl_wr_last & lcl_wr_ready;

assign dsc_ch0_wr_fifo_wr_en = dsc_ch0_rd_fifo_rd_en;
assign dsc_ch1_wr_fifo_wr_en = dsc_ch1_rd_fifo_rd_en;
assign dsc_ch2_wr_fifo_wr_en = dsc_ch2_rd_fifo_rd_en;
assign dsc_ch3_wr_fifo_wr_en = dsc_ch3_rd_fifo_rd_en;

assign dsc_ch0_wr_fifo_din = {rtag_fifo_tlast, dsc_length_sum_nxt, dsc_ch0_rd_fifo_dout[94:0]};
assign dsc_ch1_wr_fifo_din = {rtag_fifo_tlast, dsc_length_sum_nxt, dsc_ch1_rd_fifo_dout[94:0]};
assign dsc_ch2_wr_fifo_din = {rtag_fifo_tlast, dsc_length_sum_nxt, dsc_ch2_rd_fifo_dout[94:0]};
assign dsc_ch3_wr_fifo_din = {rtag_fifo_tlast, dsc_length_sum_nxt, dsc_ch3_rd_fifo_dout[94:0]};

assign lcl_wr_done = lcl_wr_valid & lcl_wr_ready;

//---Channel 0 lcl write data done descriptor FIFO(128b width x 4 depth)
// 1b eop + 32b length + 1b intr + 30b id + 64b addr
// Xilinx IP: FWFT fifo
fifo_sync_128x4 dsc_ch0_wr_fifo (
  .clk          (clk                  ),
  .srst         (~rst_n               ),
  .din          (dsc_ch0_wr_fifo_din  ),
  .wr_en        (dsc_ch0_wr_fifo_wr_en),
  .rd_en        (dsc_ch0_wr_fifo_rd_en),
  .valid        (dsc_ch0_wr_fifo_valid),
  .dout         (dsc_ch0_wr_fifo_dout ),
  .full         (dsc_ch0_wr_fifo_full ),
  .empty        (dsc_ch0_wr_fifo_empty)
);

//---Channel 1 lcl write data done descriptor FIFO(128b width x 4 depth)
// Xilinx IP: FWFT fifo
fifo_sync_128x4 dsc_ch1_wr_fifo (
  .clk          (clk                  ),
  .srst         (~rst_n               ),
  .din          (dsc_ch1_wr_fifo_din  ),
  .wr_en        (dsc_ch1_wr_fifo_wr_en),
  .rd_en        (dsc_ch1_wr_fifo_rd_en),
  .valid        (dsc_ch1_wr_fifo_valid),
  .dout         (dsc_ch1_wr_fifo_dout ),
  .full         (dsc_ch1_wr_fifo_full ),
  .empty        (dsc_ch1_wr_fifo_empty)
);
//---Channel 2 lcl write data done descriptor FIFO(128b width x 4 depth)
// Xilinx IP: FWFT fifo
fifo_sync_128x4 dsc_ch2_wr_fifo (
  .clk          (clk                  ),
  .srst         (~rst_n               ),
  .din          (dsc_ch2_wr_fifo_din  ),
  .wr_en        (dsc_ch2_wr_fifo_wr_en),
  .rd_en        (dsc_ch2_wr_fifo_rd_en),
  .valid        (dsc_ch2_wr_fifo_valid),
  .dout         (dsc_ch2_wr_fifo_dout ),
  .full         (dsc_ch2_wr_fifo_full ),
  .empty        (dsc_ch2_wr_fifo_empty)
);
//---Channel 3 lcl write data done descriptor FIFO(128b width x 4 depth)
// Xilinx IP: FWFT fifo
fifo_sync_128x4 dsc_ch3_wr_fifo (
  .clk          (clk                  ),
  .srst         (~rst_n               ),
  .din          (dsc_ch3_wr_fifo_din  ),
  .wr_en        (dsc_ch3_wr_fifo_wr_en),
  .rd_en        (dsc_ch3_wr_fifo_rd_en),
  .valid        (dsc_ch3_wr_fifo_valid),
  .dout         (dsc_ch3_wr_fifo_dout ),
  .full         (dsc_ch3_wr_fifo_full ),
  .empty        (dsc_ch3_wr_fifo_empty)
);

//------------------------------------------------------------------------------
// Local write response
//------------------------------------------------------------------------------
// always ready to receive write resp for now
assign lcl_wr_rsp_ready = 1'b1;

//---Channel 0 lcl write rsp descriptor FIFO(1b width x 4 depth)
// 1b rsp error
// Xilinx IP: FWFT fifo
fifo_sync_1x4 dsc_ch0_rsp_fifo (
  .clk          (clk                   ),
  .srst         (~rst_n                ),
  .din          (dsc_ch0_rsp_fifo_din  ),
  .wr_en        (dsc_ch0_rsp_fifo_wr_en),
  .rd_en        (dsc_ch0_rsp_fifo_rd_en),
  .valid        (dsc_ch0_rsp_fifo_valid),
  .dout         (dsc_ch0_rsp_fifo_dout ),
  .full         (dsc_ch0_rsp_fifo_full ),
  .empty        (dsc_ch0_rsp_fifo_empty)
);

//---Channel 1 lcl write rsp descriptor FIFO(1b width x 4 depth)
// Xilinx IP: FWFT fifo
fifo_sync_1x4 dsc_ch1_rsp_fifo (
  .clk          (clk                   ),
  .srst         (~rst_n                ),
  .din          (dsc_ch1_rsp_fifo_din  ),
  .wr_en        (dsc_ch1_rsp_fifo_wr_en),
  .rd_en        (dsc_ch1_rsp_fifo_rd_en),
  .valid        (dsc_ch1_rsp_fifo_valid),
  .dout         (dsc_ch1_rsp_fifo_dout ),
  .full         (dsc_ch1_rsp_fifo_full ),
  .empty        (dsc_ch1_rsp_fifo_empty)
);

//---Channel 2 lcl write rsp descriptor FIFO(1b width x 4 depth)
// Xilinx IP: FWFT fifo
fifo_sync_1x4 dsc_ch2_rsp_fifo (
  .clk          (clk                   ),
  .srst         (~rst_n                ),
  .din          (dsc_ch2_rsp_fifo_din  ),
  .wr_en        (dsc_ch2_rsp_fifo_wr_en),
  .rd_en        (dsc_ch2_rsp_fifo_rd_en),
  .valid        (dsc_ch2_rsp_fifo_valid),
  .dout         (dsc_ch2_rsp_fifo_dout ),
  .full         (dsc_ch2_rsp_fifo_full ),
  .empty        (dsc_ch2_rsp_fifo_empty)
);

//---Channel 3 lcl write rsp descriptor FIFO(1b width x 4 depth)
// Xilinx IP: FWFT fifo
fifo_sync_1x4 dsc_ch3_rsp_fifo (
  .clk          (clk                   ),
  .srst         (~rst_n                ),
  .din          (dsc_ch3_rsp_fifo_din  ),
  .wr_en        (dsc_ch3_rsp_fifo_wr_en),
  .rd_en        (dsc_ch3_rsp_fifo_rd_en),
  .valid        (dsc_ch3_rsp_fifo_valid),
  .dout         (dsc_ch3_rsp_fifo_dout ),
  .full         (dsc_ch3_rsp_fifo_full ),
  .empty        (dsc_ch3_rsp_fifo_empty)
);

assign dsc_ch0_rsp_fifo_wr_en = lcl_wr_rsp_valid & (lcl_wr_rsp_axi_id[4:3] == 2'b00) & ~dsc_ch0_rsp_fifo_full;
assign dsc_ch1_rsp_fifo_wr_en = lcl_wr_rsp_valid & (lcl_wr_rsp_axi_id[4:3] == 2'b01) & ~dsc_ch0_rsp_fifo_full;
assign dsc_ch2_rsp_fifo_wr_en = lcl_wr_rsp_valid & (lcl_wr_rsp_axi_id[4:3] == 2'b10) & ~dsc_ch0_rsp_fifo_full;
assign dsc_ch3_rsp_fifo_wr_en = lcl_wr_rsp_valid & (lcl_wr_rsp_axi_id[4:3] == 2'b11) & ~dsc_ch0_rsp_fifo_full;

assign dsc_ch0_rsp_fifo_din = lcl_wr_rsp_code;
assign dsc_ch1_rsp_fifo_din = lcl_wr_rsp_code;
assign dsc_ch2_rsp_fifo_din = lcl_wr_rsp_code;
assign dsc_ch3_rsp_fifo_din = lcl_wr_rsp_code;

//------------------------------------------------------------------------------
// Commit to complete engine
//------------------------------------------------------------------------------
// commit when dsc wr and rsp fifo valid
assign dsc_ch0_cmp_valid = dsc_ch0_wr_fifo_valid & dsc_ch0_rsp_fifo_valid;
assign dsc_ch1_cmp_valid = dsc_ch1_wr_fifo_valid & dsc_ch1_rsp_fifo_valid;
assign dsc_ch2_cmp_valid = dsc_ch2_wr_fifo_valid & dsc_ch2_rsp_fifo_valid;
assign dsc_ch3_cmp_valid = dsc_ch3_wr_fifo_valid & dsc_ch3_rsp_fifo_valid;

assign dsc_ch0_cmp_data = {dsc_ch0_wr_fifo_dout[126:95],
                           16'h52b4, 15'b0, dsc_ch0_wr_fifo_dout[127],
                           126'b0,
                           1'b0, dsc_ch0_rsp_fifo_dout,
                           dsc_ch0_wr_fifo_dout[63:0],
                           221'b0,
                           dsc_ch0_wr_fifo_dout[94],
                           2'b00,
                           dsc_ch0_wr_fifo_dout[93:64],
                           1'b1,
                           dsc_ch0_rsp_fifo_dout};

assign dsc_ch1_cmp_data = {dsc_ch1_wr_fifo_dout[126:95],
                           16'h52b4, 15'b0, dsc_ch1_wr_fifo_dout[127],
                           126'b0,
                           1'b0, dsc_ch1_rsp_fifo_dout,
                           dsc_ch1_wr_fifo_dout[63:0],
                           221'b0,
                           dsc_ch1_wr_fifo_dout[94],
                           2'b00,
                           dsc_ch1_wr_fifo_dout[93:64],
                           1'b1,
                           dsc_ch1_rsp_fifo_dout};

assign dsc_ch2_cmp_data = {dsc_ch2_wr_fifo_dout[126:95],
                           16'h52b4, 15'b0, dsc_ch2_wr_fifo_dout[127],
                           126'b0,
                           1'b0, dsc_ch2_rsp_fifo_dout,
                           dsc_ch2_wr_fifo_dout[63:0],
                           221'b0,
                           dsc_ch2_wr_fifo_dout[94],
                           2'b00,
                           dsc_ch2_wr_fifo_dout[93:64],
                           1'b1,
                           dsc_ch2_rsp_fifo_dout};

assign dsc_ch3_cmp_data = {dsc_ch3_wr_fifo_dout[126:95],
                           16'h52b4, 15'b0, dsc_ch3_wr_fifo_dout[127],
                           126'b0,
                           1'b0, dsc_ch3_rsp_fifo_dout,
                           dsc_ch3_wr_fifo_dout[63:0],
                           221'b0,
                           dsc_ch3_wr_fifo_dout[94],
                           2'b00,
                           dsc_ch3_wr_fifo_dout[93:64],
                           1'b1,
                           dsc_ch3_rsp_fifo_dout};

// read dsc wr and rsp fifo when commit done
assign dsc_ch0_wr_fifo_rd_en = dsc_ch0_cmp_valid & dsc_ch0_cmp_ready;
assign dsc_ch1_wr_fifo_rd_en = dsc_ch1_cmp_valid & dsc_ch1_cmp_ready;
assign dsc_ch2_wr_fifo_rd_en = dsc_ch2_cmp_valid & dsc_ch2_cmp_ready;
assign dsc_ch3_wr_fifo_rd_en = dsc_ch3_cmp_valid & dsc_ch3_cmp_ready;

assign dsc_ch0_rsp_fifo_rd_en = dsc_ch0_cmp_valid & dsc_ch0_cmp_ready;
assign dsc_ch1_rsp_fifo_rd_en = dsc_ch1_cmp_valid & dsc_ch1_cmp_ready;
assign dsc_ch2_rsp_fifo_rd_en = dsc_ch2_cmp_valid & dsc_ch2_cmp_ready;
assign dsc_ch3_rsp_fifo_rd_en = dsc_ch3_cmp_valid & dsc_ch3_cmp_ready;

endmodule
