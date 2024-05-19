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

`include "odma_defines.v"

module odma_a2h_mm_engine #(
    parameter AXI_ID_WIDTH      = 5,
    parameter AXI_ADDR_WIDTH    = 64,
    parameter AXI_DATA_WIDTH    = 1024,
    parameter AXI_AWUSER_WIDTH  = 9,
    parameter AXI_ARUSER_WIDTH  = 9,
    parameter AXI_WUSER_WIDTH   = 9,
    parameter AXI_RUSER_WIDTH   = 9,
    parameter AXI_BUSER_WIDTH   = 9
)
(
    input                           clk,
    input                           rst_n,
    //----- dsc engine interface -----
    input                           dsc_valid,          //descriptor valid
    input  [255 : 0]                dsc_data,           //descriptor data
    output                          dsc_ready,          //descriptor ready
    //----- AXI4 read addr interface -----
    output [AXI_ADDR_WIDTH-1 : 0]   axi_araddr,         //AXI read address
    output [1 : 0]                  axi_arburst,        //AXI burst type
    output [3 : 0]                  axi_arcache,        //AXI memory type
    output [AXI_ID_WIDTH-1 : 0]     axi_arid,           //AXI read address ID
    output [7 : 0]                  axi_arlen,          //AXI burst length
    output [1 : 0]                  axi_arlock,         //AXI lock type
    output [2 : 0]                  axi_arprot,         //AXI protection type
    output [3 : 0]                  axi_arqos,          //AXI quality of service
    input                           axi_arready,        //AXI read address ready
    output [3 : 0]                  axi_arregion,       //AXI region identifier
    output [2 : 0]                  axi_arsize,         //AXI burst size
    output [AXI_ARUSER_WIDTH-1 : 0] axi_aruser,         //AXI user signal
    output                          axi_arvalid,        //AXI read address valid
    //----- AXI4 read data interface -----
    input  [AXI_DATA_WIDTH-1 : 0 ]  axi_rdata,          //AXI read data
    input  [AXI_ID_WIDTH-1 : 0 ]    axi_rid,            //AXI read ID
    input                           axi_rlast,          //AXI read last
    output                          axi_rready,         //AXI read ready
    input  [1 : 0 ]                 axi_rresp,          //AXI read response
    input  [AXI_RUSER_WIDTH-1 : 0 ] axi_ruser,          //AXI user signal
    input                           axi_rvalid,         //AXI read valid
    //----- local write interface -----
    output                          lcl_wr_valid,       //local write valid
    output [63 : 0]                 lcl_wr_ea,          //local write address
    output [AXI_ID_WIDTH-1 : 0]     lcl_wr_axi_id,      //local write AXI ID
    output reg [127 : 0]            lcl_wr_be,          //local write byte enable
    output                          lcl_wr_first,       //local write first beat
    output                          lcl_wr_last,        //local write last beat
    output [1023 : 0]               lcl_wr_data,        //local write data
    input                           lcl_wr_ready,       //local write ready
    //----- local write context interface -----
    output                          lcl_wr_ctx_valid,   //local context write valid
    output [8 : 0]                  lcl_wr_ctx,         //local context write data
    //----- local write rsp interface -----
    input                           lcl_wr_rsp_valid,   //local write response valid
    input  [AXI_ID_WIDTH-1 : 0]     lcl_wr_rsp_axi_id,  //local write response AXI id
    input                           lcl_wr_rsp_code,    //local write response code
    output                          lcl_wr_rsp_ready,   //local write response ready
    //----- cmp engine interface -----
    output                          dsc_ch0_cmp_valid,  //channel0 descriptor complete valid
    output [511 : 0]                dsc_ch0_cmp_data,   //channel0 descriptor complete data
    input                           dsc_ch0_cmp_ready,  //channel0 descriptor complete ready
    output                          dsc_ch1_cmp_valid,  //channel1 descriptor complete valid
    output [511 : 0]                dsc_ch1_cmp_data,   //channel1 descriptor complete data
    input                           dsc_ch1_cmp_ready,  //channel1 descriptor complete ready
    output                          dsc_ch2_cmp_valid,  //channel2 descriptor complete valid
    output [511 : 0]                dsc_ch2_cmp_data,   //channel2 descriptor complete data
    input                           dsc_ch2_cmp_ready,  //channel2 descriptor complete ready
    output                          dsc_ch3_cmp_valid,  //channel3 descriptor complete valid
    output [511 : 0]                dsc_ch3_cmp_data,   //channel3 descriptor complete data
    input                           dsc_ch3_cmp_ready   //channel3 descriptor complete ready
);
//------------------------------------------------------------------------------
// Internal signals
//------------------------------------------------------------------------------
parameter   AXI_DATA_BYTE_WIDTH = `BIT2BYTE_LOG(AXI_DATA_WIDTH);
parameter   AXI_DATA_BYTE = AXI_DATA_WIDTH >> 3;

//--- Read FSM ---
parameter   READ_IDLE   =   3'b000,
            READ_FIFO   =   3'b001,     //read descriptor fifo
            WRITE_REG   =   3'b010,     //write in-flight descriptor reg
            READ_CMD    =   3'b100;     //issue axi read cmd

reg     [2 : 0]                 rd_fsm_cur_state;                   //read FSM current state
reg     [2 : 0]                 rd_fsm_nxt_state;                   //read FSM next state
wire                            rd_fsm_state_read_fifo;             //read FSM state read fifo
wire                            rd_fsm_state_write_reg;             //read FSM state write reg
wire                            rd_fsm_state_read_cmd;              //read FSM state read cmd
//--- Descriptor FIFO ---
wire    [255 : 0]               dsc_fifo_din;                       //descriptor FIFO data in
wire                            dsc_fifo_wr_en;                     //descriptor FIFO write enable
wire                            dsc_fifo_rd_en;                     //descriptor FIFO read enable
wire                            dsc_fifo_valid;                     //descriptor FIFO data out valid
wire    [255 : 0]               dsc_fifo_dout;                      //descriptor FIFO data out
wire                            dsc_fifo_full;                      //descriptor FIFO full
wire                            dsc_fifo_empty;                     //descriptor FIFO empty
wire                            dsc_fifo_rd_ready;                  //descriptor FIFO ready to read
wire                            dsc_intr;                           //descriptor interrupt flag
wire    [63 : 0]                dsc_src_addr;                       //descriptor source address
wire    [63 : 0]                dsc_src_align_addr;                 //descriptor aligned source address
wire    [63 : 0]                dsc_dst_addr;                       //descriptor destination address
wire    [63 : 0]                dsc_dst_align_addr;                 //descriptor aligned destination address
wire    [27 : 0]                dsc_length;                         //descriptor dma transfer length
wire    [27 : 0]                dsc_src_align_length;               //descriptor dma transfer source aligned length
wire    [27 : 0]                dsc_dst_align_length;               //descriptor dma transfer dest aligned length
wire    [63 : 0]                dsc_dst_end_addr;                   //descriptor dest end addr
wire    [63 : 0]                dsc_dst_end_align_addr;             //descriptor aligned end addr
wire    [ 1 : 0]                dsc_channel_id;                     //descriptor channel ID
reg     [ 1 : 0]                dsc_channel_id_l;                   //descriptor channel ID latch
wire    [29 : 0]                dsc_descriptor_id;                  //descriptor ID
//---------In-flight descriptor register set ---------
//----- Descriptor 0 register set -----
reg                             dsc_flight_reg0_valid;              //descriptor 0 valid
reg                             dsc_flight_reg0_intr;               //descriptor 0 interrupt flag
reg                             dsc_flight_reg0_complete;           //descriptor 0 dma transfer done
reg                             dsc_flight_reg0_commit;             //descriptor 0 commit to complete engine done
reg     [ 1 : 0]                dsc_flight_reg0_ch_id;              //descriptor 0 channel ID
reg     [29 : 0]                dsc_flight_reg0_dsc_id;             //descriptor 0 ID
reg     [ 6 : 0]                dsc_flight_reg0_dst_first_be_addr;  //descriptor 0 dest first beat unaligned byte addr
reg     [ 6 : 0]                dsc_flight_reg0_dst_last_be_addr;   //descriptor 0 dest last beat unaligned byte addr 
reg     [63 : 0]                dsc_flight_reg0_src_addr;           //descriptor 0 source AXI read addr
reg     [63 : 0]                dsc_flight_reg0_dst_addr;           //descriptor 0 destination local write addr
reg     [27 : 0]                dsc_flight_reg0_src_length;         //descriptor 0 source read length left
reg     [27 : 0]                dsc_flight_reg0_dst_length;         //descriptor 0 destination write length left
reg     [27 : 0]                dsc_flight_reg0_rsp_length;         //descriptor 0 local write resp length left
reg     [ 1 : 0]                dsc_flight_reg0_src_err;            //descriptor 0 source AXI read error
reg                             dsc_flight_reg0_rsp_err;            //descriptor 0 local write resp error
reg     [63 : 0]                dsc_flight_reg0_src_err_addr;       //descriptor 0 first source AXI read error addr
reg     [63 : 0]                dsc_flight_reg0_rsp_err_addr;       //descriptor 0 first local write resp error addr
//----- Descriptor 0 ctrl signals -----
wire                            dsc_flight_reg0_clear;              //descriptor 0 register set clear
wire                            dsc_flight_reg0_write;              //descriptor 0 register set write
wire                            dsc_flight_reg0_src_match;          //descriptor 0 register set match for source info update
reg                             dsc_flight_reg0_src_update;         //descriptor 0 register set source info update
wire                            dsc_flight_reg0_src_err_update;     //descriptor 0 register set source error info update
reg                             dsc_flight_reg0_src_err_happen;     //descriptor 0 source AXI read error happened
wire                            dsc_flight_reg0_dst_use;            //descriptor 0 register set dest info to use for lcl write cmd
wire                            dsc_flight_reg0_dst_match;          //descriptor 0 register set match for dest info update
reg                             dsc_flight_reg0_dst_update;         //descriptor 0 register set dest info update
wire                            dsc_flight_reg0_dst_first_beat;     //descriptor 0 dest write first beat
wire                            dsc_flight_reg0_dst_last_beat;      //descriptor 0 dest write last beat
wire    [127: 0]                dsc_flight_reg0_dst_first_beat_be;  //descriptor 0 dest write first beat byte enable
wire    [127: 0]                dsc_flight_reg0_dst_last_beat_be;   //descriptor 0 dest write last beat byte enable
wire                            dsc_flight_reg0_rsp_err_update;     //descriptor 0 register set lcl write resp error info update
wire                            dsc_flight_reg0_rsp_match;          //descriptor 0 register set match for write resp info update
reg                             dsc_flight_reg0_rsp_update;         //descriptor 0 register set write resp info update
wire                            dsc_flight_reg0_commit_ready;       //descriptor 0 ready to commit to complete engine
wire                            dsc_flight_reg0_sts_err;            //descriptor 0 status error
wire    [511: 0]                dsc_flight_reg0_commit_data;        //descriptor 0 data commit to complete engine
wire                            dsc_flight_reg0_commit_update;      //descriptor 0 commit bit to write into register commit       
//----- Descriptor 1 register set -----
reg                             dsc_flight_reg1_valid;              //descriptor 1 valid                                                       
reg                             dsc_flight_reg1_intr;               //descriptor 1 interrupt flag
reg                             dsc_flight_reg1_complete;           //descriptor 1 dma transfer done                                
reg                             dsc_flight_reg1_commit;             //descriptor 1 commit to complete engine done                   
reg     [ 1 : 0]                dsc_flight_reg1_ch_id;              //descriptor 1 channel ID                                       
reg     [29 : 0]                dsc_flight_reg1_dsc_id;             //descriptor 1 ID                                               
reg     [ 6 : 0]                dsc_flight_reg1_dst_first_be_addr;  //descriptor 1 dest first beat unaligned byte addr
reg     [ 6 : 0]                dsc_flight_reg1_dst_last_be_addr;   //descriptor 1 dest last beat unaligned byte addr 
reg     [63 : 0]                dsc_flight_reg1_src_addr;           //descriptor 1 source AXI read addr                             
reg     [63 : 0]                dsc_flight_reg1_dst_addr;           //descriptor 1 destination local write addr                     
reg     [27 : 0]                dsc_flight_reg1_src_length;         //descriptor 1 source read length left                          
reg     [27 : 0]                dsc_flight_reg1_dst_length;         //descriptor 1 destination write length left                    
reg     [27 : 0]                dsc_flight_reg1_rsp_length;         //descriptor 1 local write resp length left                     
reg     [ 1 : 0]                dsc_flight_reg1_src_err;            //descriptor 1 source AXI read error                            
reg                             dsc_flight_reg1_rsp_err;            //descriptor 1 local write resp error
reg     [63 : 0]                dsc_flight_reg1_src_err_addr;       //descriptor 1 first source AXI read error addr
reg     [63 : 0]                dsc_flight_reg1_rsp_err_addr;       //descriptor 1 first local write resp error addr
//----- Descriptor 1 ctrl signals -----                                                                                            
wire                            dsc_flight_reg1_clear;              //descriptor 1 register set clear
wire                            dsc_flight_reg1_write;              //descriptor 1 register set write
wire                            dsc_flight_reg1_src_match;          //descriptor 1 register set match for source info update
reg                             dsc_flight_reg1_src_update;         //descriptor 1 register set source info update
wire                            dsc_flight_reg1_src_err_update;     //descriptor 1 register set source error info update
reg                             dsc_flight_reg1_src_err_happen;     //descriptor 1 source AXI read error happened
wire                            dsc_flight_reg1_dst_use;            //descriptor 1 register set dest info to use for lcl write cmd
wire                            dsc_flight_reg1_dst_match;          //descriptor 1 register set match for dest info update
reg                             dsc_flight_reg1_dst_update;         //descriptor 1 register set dest info update
wire                            dsc_flight_reg1_dst_first_beat;     //descriptor 1 dest write first beat
wire                            dsc_flight_reg1_dst_last_beat;      //descriptor 1 dest write last beat
wire    [127: 0]                dsc_flight_reg1_dst_first_beat_be;  //descriptor 1 dest write first beat byte enable
wire    [127: 0]                dsc_flight_reg1_dst_last_beat_be;   //descriptor 1 dest write last beat byte enable
wire                            dsc_flight_reg1_rsp_err_update;     //descriptor 1 register set lcl write resp error info update
wire                            dsc_flight_reg1_rsp_match;          //descriptor 1 register set match for write resp info update
reg                             dsc_flight_reg1_rsp_update;         //descriptor 1 register set write resp info update
wire                            dsc_flight_reg1_commit_ready;       //descriptor 1 ready to commit to complete engine
wire                            dsc_flight_reg1_sts_err;            //descriptor 1 status error
wire    [511: 0]                dsc_flight_reg1_commit_data;        //descriptor 1 data commit to complete engine
wire                            dsc_flight_reg1_commit_update;      //descriptor 1 commit bit to write into register commit       
//----- Descriptor 2 register set -----
reg                             dsc_flight_reg2_valid;              //descriptor 2 valid
reg                             dsc_flight_reg2_intr;               //descriptor 2 interrupt flag
reg                             dsc_flight_reg2_complete;           //descriptor 2 dma transfer done
reg                             dsc_flight_reg2_commit;             //descriptor 2 commit to complete engine done
reg     [ 1 : 0]                dsc_flight_reg2_ch_id;              //descriptor 2 channel ID
reg     [29 : 0]                dsc_flight_reg2_dsc_id;             //descriptor 2 ID 
reg     [ 6 : 0]                dsc_flight_reg2_dst_first_be_addr;  //descriptor 2 dest first beat unaligned byte addr
reg     [ 6 : 0]                dsc_flight_reg2_dst_last_be_addr;   //descriptor 2 dest last beat unaligned byte addr 
reg     [63 : 0]                dsc_flight_reg2_src_addr;           //descriptor 2 source AXI read addr
reg     [63 : 0]                dsc_flight_reg2_dst_addr;           //descriptor 2 destination local write addr
reg     [27 : 0]                dsc_flight_reg2_src_length;         //descriptor 2 source read length left
reg     [27 : 0]                dsc_flight_reg2_dst_length;         //descriptor 2 destination write length left
reg     [27 : 0]                dsc_flight_reg2_rsp_length;         //descriptor 2 local write resp length left
reg     [ 1 : 0]                dsc_flight_reg2_src_err;            //descriptor 2 source AXI read error
reg                             dsc_flight_reg2_rsp_err;            //descriptor 2 local write resp error
reg     [63 : 0]                dsc_flight_reg2_src_err_addr;       //descriptor 2 first source AXI read error addr
reg     [63 : 0]                dsc_flight_reg2_rsp_err_addr;       //descriptor 2 first local write resp error addr
//----- Descriptor 2 ctrl signals -----                                                                                            
wire                            dsc_flight_reg2_clear;              //descriptor 2 register set clear
wire                            dsc_flight_reg2_write;              //descriptor 2 register set write
wire                            dsc_flight_reg2_src_match;          //descriptor 2 register set match for source info update
reg                             dsc_flight_reg2_src_update;         //descriptor 2 register set source info update
wire                            dsc_flight_reg2_src_err_update;     //descriptor 2 register set source error info update
reg                             dsc_flight_reg2_src_err_happen;     //descriptor 2 source AXI read error happened
wire                            dsc_flight_reg2_dst_use;            //descriptor 2 register set dest info to use for lcl write cmd
wire                            dsc_flight_reg2_dst_match;          //descriptor 2 register set match for dest info update
reg                             dsc_flight_reg2_dst_update;         //descriptor 2 register set dest info update
wire                            dsc_flight_reg2_dst_first_beat;     //descriptor 2 dest write first beat
wire                            dsc_flight_reg2_dst_last_beat;      //descriptor 2 dest write last beat
wire    [127: 0]                dsc_flight_reg2_dst_first_beat_be;  //descriptor 2 dest write first beat byte enable
wire    [127: 0]                dsc_flight_reg2_dst_last_beat_be;   //descriptor 2 dest write last beat byte enable
wire                            dsc_flight_reg2_rsp_err_update;     //descriptor 2 register set lcl write resp error info update
wire                            dsc_flight_reg2_rsp_match;          //descriptor 2 register set match for write resp info update
reg                             dsc_flight_reg2_rsp_update;         //descriptor 2 register set write resp info update
wire                            dsc_flight_reg2_commit_ready;       //descriptor 2 ready to commit to complete engine
wire                            dsc_flight_reg2_sts_err;            //descriptor 2 status error
wire    [511: 0]                dsc_flight_reg2_commit_data;        //descriptor 2 data commit to complete engine
wire                            dsc_flight_reg2_commit_update;      //descriptor 2 commit bit to write into register commit       
//----- Descriptor 3 register set -----
reg                             dsc_flight_reg3_valid;              //descriptor 3 valid
reg                             dsc_flight_reg3_intr;               //descriptor 3 interrupt flag
reg                             dsc_flight_reg3_complete;           //descriptor 3 dma transfer done
reg                             dsc_flight_reg3_commit;             //descriptor 3 commit to complete engine done
reg     [ 1 : 0]                dsc_flight_reg3_ch_id;              //descriptor 3 channel ID
reg     [29 : 0]                dsc_flight_reg3_dsc_id;             //descriptor 3 ID 
reg     [ 6 : 0]                dsc_flight_reg3_dst_first_be_addr;  //descriptor 3 dest first beat unaligned byte addr
reg     [ 6 : 0]                dsc_flight_reg3_dst_last_be_addr;   //descriptor 3 dest last beat unaligned byte addr 
reg     [63 : 0]                dsc_flight_reg3_src_addr;           //descriptor 3 source AXI read addr
reg     [63 : 0]                dsc_flight_reg3_dst_addr;           //descriptor 3 destination local write addr
reg     [27 : 0]                dsc_flight_reg3_src_length;         //descriptor 3 source read length left
reg     [27 : 0]                dsc_flight_reg3_dst_length;         //descriptor 3 destination write length left
reg     [27 : 0]                dsc_flight_reg3_rsp_length;         //descriptor 3 local write resp length left
reg     [ 1 : 0]                dsc_flight_reg3_src_err;            //descriptor 3 source AXI read error
reg                             dsc_flight_reg3_rsp_err;            //descriptor 3 local write resp error
reg     [63 : 0]                dsc_flight_reg3_src_err_addr;       //descriptor 3 first source AXI read error addr
reg     [63 : 0]                dsc_flight_reg3_rsp_err_addr;       //descriptor 3 first local write resp error addr
//----- Descriptor 3 ctrl signals -----                                                                                            
wire                            dsc_flight_reg3_clear;              //descriptor 3 register set clear
wire                            dsc_flight_reg3_write;              //descriptor 3 register set write
wire                            dsc_flight_reg3_src_match;          //descriptor 3 register set match for source info update
reg                             dsc_flight_reg3_src_update;         //descriptor 3 register set source info update
wire                            dsc_flight_reg3_src_err_update;     //descriptor 3 register set source error info update
reg                             dsc_flight_reg3_src_err_happen;     //descriptor 3 source AXI read error happened
wire                            dsc_flight_reg3_dst_use;            //descriptor 3 register set dest info to use for lcl write cmd
wire                            dsc_flight_reg3_dst_match;          //descriptor 3 register set match for dest info update
reg                             dsc_flight_reg3_dst_update;         //descriptor 3 register set dest info update
wire                            dsc_flight_reg3_dst_first_beat;     //descriptor 3 dest write first beat
wire                            dsc_flight_reg3_dst_last_beat;      //descriptor 3 dest write last beat
wire    [127: 0]                dsc_flight_reg3_dst_first_beat_be;  //descriptor 3 dest write first beat byte enable
wire    [127: 0]                dsc_flight_reg3_dst_last_beat_be;   //descriptor 3 dest write last beat byte enable
wire                            dsc_flight_reg3_rsp_err_update;     //descriptor 3 register set lcl write resp error info update
wire                            dsc_flight_reg3_rsp_match;          //descriptor 3 register set match for write resp info update
reg                             dsc_flight_reg3_rsp_update;         //descriptor 3 register set write resp info update
wire                            dsc_flight_reg3_commit_ready;       //descriptor 3 ready to commit to complete engine
wire                            dsc_flight_reg3_sts_err;            //descriptor 3 status error
wire    [511: 0]                dsc_flight_reg3_commit_data;        //descriptor 3 data commit to complete engine
wire                            dsc_flight_reg3_commit_update;      //descriptor 3 commit bit to write into register commit       
//----- Descriptor register sets ctrl signals -----                                                                                            
wire                            dsc_flight_reg_avail;               //descriptor register sets available
wire    [ 3 : 0]                dsc_flight_reg_src_match;           //descriptor register sets match for source info update
wire    [ 3 : 0]                dsc_flight_reg_dst_match;           //descriptor register sets match for dest info update
wire    [ 3 : 0]                dsc_flight_reg_rsp_match;           //descriptor register sets match for lcl write resp info update
reg                             dsc_flight_rlast;                   //descriptor last AXI read data
//--- AXI read command ---
wire    [63 : 0]                dsc_src_end_addr;                   //AXI read end addr
wire    [63 : 0]                dsc_src_end_align_addr;             //AXI read end aligned addr
reg     [63 : 0]                dsc_src_end_align_addr_l;           //AXI read end aligned addr latch
wire    [63 : 0]                dsc_src_nxt_4k_addr;                //AXI read next 4K boundary addr
reg     [63 : 0]                dsc_src_cur_axi_start_addr;         //current AXI read start addr
wire    [63 : 0]                dsc_src_cur_axi_end_addr;           //current AXI read end addr
wire    [ 7 : 0]                dsc_src_cur_axi_length;             //current AXI read length
wire                            dsc_src_last_cmd;                   //descriptor last AXI read cmd
wire                            dsc_src_last_cmd_done;              //descriptor last AXI read cmd issue done
//--- AXI read data ---
wire    [AXI_DATA_WIDTH-1 : 0]  rdata_fifo_din;                     //AXI read data FIFO in
wire                            rdata_fifo_wr_en;                   //AXI read data FIFO write enable
wire                            rdata_fifo_rd_en;                   //AXI read data FIFO read enable
wire                            rdata_fifo_valid;                   //AXI read data FIFO out valid
wire    [AXI_DATA_WIDTH-1 : 0]  rdata_fifo_dout;                    //AXI read data FIFO out
wire                            rdata_fifo_full;                    //AXI read data FIFO full
wire                            rdata_fifo_empty;                   //AXI read data FIFO empty
wire    [7 : 0]                 rtag_fifo_din;                      //AXI read data tag FIFO in
wire    [7 : 0]                 rtag_fifo_dout;                     //AXI read data tag FIFO out
wire    [AXI_ID_WIDTH-1 : 0 ]   rtag_fifo_axi_rid;                  //AXI read data tag FIFO out AXI rid
wire    [1 : 0 ]                rtag_fifo_axi_rresp;                //AXI read data tag FIFO out AXI rresp
wire                            rtag_fifo_dsc_rlast;                //AXI read data tag FIFO out descriptor last read
//--- Local write command ---
wire                            lcl_wr_done;                        //local write done
wire                            lcl_wr_data_valid;                  //local write data valid
wire    [11 : 0]                lcl_wr_be_ctrl;                     //local write byte enable control
//--- Descriptor completion ---
wire                            dsc_cmp_reg0_ch0_valid;             //descriptor 0 is channel 0, completion valid 
wire                            dsc_cmp_reg0_ch1_valid;             //descriptor 0 is channel 1, completion valid
wire                            dsc_cmp_reg0_ch2_valid;             //descriptor 0 is channel 2, completion valid
wire                            dsc_cmp_reg0_ch3_valid;             //descriptor 0 is channel 3, completion valid
wire                            dsc_cmp_reg1_ch0_valid;             //descriptor 1 is channel 0, completion valid
wire                            dsc_cmp_reg1_ch1_valid;             //descriptor 1 is channel 1, completion valid
wire                            dsc_cmp_reg1_ch2_valid;             //descriptor 1 is channel 2, completion valid
wire                            dsc_cmp_reg1_ch3_valid;             //descriptor 1 is channel 3, completion valid
wire                            dsc_cmp_reg2_ch0_valid;             //descriptor 2 is channel 0, completion valid
wire                            dsc_cmp_reg2_ch1_valid;             //descriptor 2 is channel 1, completion valid
wire                            dsc_cmp_reg2_ch2_valid;             //descriptor 2 is channel 2, completion valid
wire                            dsc_cmp_reg2_ch3_valid;             //descriptor 2 is channel 3, completion valid
wire                            dsc_cmp_reg3_ch0_valid;             //descriptor 3 is channel 0, completion valid
wire                            dsc_cmp_reg3_ch1_valid;             //descriptor 3 is channel 1, completion valid
wire                            dsc_cmp_reg3_ch2_valid;             //descriptor 3 is channel 2, completion valid
wire                            dsc_cmp_reg3_ch3_valid;             //descriptor 3 is channel 3, completion valid
//------------------------------------------------------------------------------
// Read FSM
//------------------------------------------------------------------------------
always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    rd_fsm_cur_state <= READ_IDLE;
  else
    rd_fsm_cur_state <= rd_fsm_nxt_state;
end

// if has new dsc and available in-flight reg, read fifo
// then write dsc info into in-flight reg
// calc axi read addr and length, send all axi cmds for the dsc
// start to handle new dsc if any
always@(*) begin
  case(rd_fsm_cur_state)
    READ_IDLE:
      if(dsc_fifo_rd_ready)
        rd_fsm_nxt_state = READ_FIFO;
      else
        rd_fsm_nxt_state = READ_IDLE;
    READ_FIFO:
      rd_fsm_nxt_state = WRITE_REG;
    WRITE_REG:
      rd_fsm_nxt_state = READ_CMD;
    READ_CMD:
      if(dsc_src_last_cmd_done & dsc_fifo_rd_ready)
          rd_fsm_nxt_state = READ_FIFO;
      else if(dsc_src_last_cmd_done & ~dsc_fifo_rd_ready)
          rd_fsm_nxt_state = READ_IDLE;
      else
          rd_fsm_nxt_state = READ_CMD;
    default:
      rd_fsm_nxt_state = READ_IDLE;
  endcase
end

assign rd_fsm_state_read_fifo = rd_fsm_cur_state[0];
assign rd_fsm_state_write_reg = rd_fsm_cur_state[1];
assign rd_fsm_state_read_cmd  = rd_fsm_cur_state[2];

//------------------------------------------------------------------------------
// Descriptor FIFO
//------------------------------------------------------------------------------
// FIFO write
// write fifo when dsc valid
assign dsc_fifo_wr_en = dsc_valid;
assign dsc_fifo_din   = dsc_data;
assign dsc_ready      = ~dsc_fifo_full;

// FIFO read
// fifo ready to read when not fifo empty & in-flight register set available
// standard fifo: data is valid next cycle after read enable
assign dsc_fifo_rd_ready = ~dsc_fifo_empty & dsc_flight_reg_avail;
assign dsc_fifo_rd_en = rd_fsm_state_read_fifo;
assign dsc_intr     = dsc_fifo_valid ? dsc_fifo_dout[1] : 1'b0;
assign dsc_src_addr = dsc_fifo_valid ? dsc_fifo_dout[127: 64] : 64'b0;
assign dsc_dst_addr = dsc_fifo_valid ? dsc_fifo_dout[191:128] : 64'b0;
assign dsc_length   = dsc_fifo_valid ? dsc_fifo_dout[ 59: 32] : 28'b0;
assign dsc_channel_id    = dsc_fifo_valid ? dsc_fifo_dout[223:222] : 2'b0;
assign dsc_descriptor_id = dsc_fifo_valid ? dsc_fifo_dout[221:192] : 30'b0;
assign dsc_src_end_addr = dsc_src_addr + dsc_length;
assign dsc_dst_end_addr = dsc_dst_addr + dsc_length;

// generate aligned addr and length
assign dsc_src_align_addr     = {dsc_src_addr[63 : AXI_DATA_BYTE_WIDTH], {AXI_DATA_BYTE_WIDTH{1'b0}}};
assign dsc_src_end_align_addr = (dsc_src_end_addr[AXI_DATA_BYTE_WIDTH-1 :0] == {AXI_DATA_BYTE_WIDTH{1'b0}}) ? dsc_src_end_addr
                                 : {dsc_src_end_addr[63 : AXI_DATA_BYTE_WIDTH] + 1'b1, {AXI_DATA_BYTE_WIDTH{1'b0}}};
assign dsc_src_align_length   = dsc_src_end_align_addr - dsc_src_align_addr;
assign dsc_dst_align_addr     = {dsc_dst_addr[63 : 7], 7'b0};
assign dsc_dst_end_align_addr = (dsc_dst_end_addr[6 :0] == 7'b0) ? dsc_dst_end_addr
                                 : {dsc_dst_end_addr[63 : 7] + 1'b1, 7'b0};
assign dsc_dst_align_length   = dsc_dst_end_align_addr - dsc_dst_align_addr;


//---Descriptor FIFO(256b width x 8 depth)
// Xilinx IP: standard fifo
fifo_sync_std_256x8 dsc_fifo (
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

//------------------------------------------------------------------------------
// AXI read command
//------------------------------------------------------------------------------
// AXI read addr: start from dsc src addr, update when one cmd sent
always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    dsc_src_cur_axi_start_addr <= 64'b0;
  else if(rd_fsm_state_write_reg)
    dsc_src_cur_axi_start_addr <= dsc_src_align_addr;
  else if(rd_fsm_state_read_cmd & axi_arready)
    dsc_src_cur_axi_start_addr <= dsc_src_cur_axi_end_addr;
  else
    dsc_src_cur_axi_start_addr <= dsc_src_cur_axi_start_addr;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    dsc_channel_id_l         <= 2'b0;
    dsc_src_end_align_addr_l <= 64'b0;
  end
  else if(rd_fsm_state_write_reg) begin
    dsc_channel_id_l         <= dsc_channel_id;
    dsc_src_end_align_addr_l <= dsc_src_end_align_addr;
  end
  else begin
    dsc_channel_id_l         <= dsc_channel_id_l;
    dsc_src_end_align_addr_l <= dsc_src_end_align_addr_l;
  end
end

// Check dsc src end addr cross 4KB boundary
// generate axi length and next axi cmd addr
assign dsc_src_nxt_4k_addr = {dsc_src_cur_axi_start_addr[63:12] + 1'b1, 12'b0};
assign dsc_src_last_cmd = (dsc_src_end_align_addr_l < dsc_src_nxt_4k_addr) | (dsc_src_end_align_addr_l == dsc_src_nxt_4k_addr);
assign dsc_src_cur_axi_end_addr = dsc_src_last_cmd ? dsc_src_end_align_addr_l : dsc_src_nxt_4k_addr; 
assign dsc_src_cur_axi_length = ((dsc_src_cur_axi_end_addr - dsc_src_cur_axi_start_addr) >> AXI_DATA_BYTE_WIDTH) - 1'b1;
assign dsc_src_last_cmd_done = dsc_src_last_cmd & axi_arready;

// AXI read address channel signals
assign axi_arvalid  = rd_fsm_state_read_cmd;
assign axi_araddr   = dsc_src_cur_axi_start_addr;
assign axi_arlen    = dsc_src_cur_axi_length;
assign axi_arsize   = AXI_DATA_BYTE_WIDTH;
assign axi_arburst  = 2'b01;
assign axi_arid     = dsc_channel_id_l;
assign axi_aruser   = {AXI_ARUSER_WIDTH{1'b0}};
assign axi_arregion = 4'b0;
assign axi_arqos    = 4'b0;
assign axi_arprot   = 3'b0;
assign axi_arlock   = 2'b0;
assign axi_arcache  = 4'b0;

//------------------------------------------------------------------------------
// Descriptor in-flight flip-flop sets
//------------------------------------------------------------------------------
// shift-in register sets
// little set number is the older dsc, set3->set2->set1->set0
// any register set can be cleared when commit to cmp engine
// only one register set cleared at one clock cycle
// when register set cleared, perform shift operation
// avoid clear at the same cycle of write operation
// always write into the available register set with biggest set number
always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    dsc_flight_reg0_valid               <= 1'b0;
    dsc_flight_reg0_intr                <= 1'b0;
    dsc_flight_reg0_ch_id               <= 2'b0;
    dsc_flight_reg0_dsc_id              <= 30'b0;
    dsc_flight_reg0_dst_first_be_addr   <= 7'b0;
    dsc_flight_reg0_dst_last_be_addr    <= 7'b0;
    dsc_flight_reg0_rsp_length          <= 28'b0;
  end
  else if(dsc_flight_reg0_write) begin
    dsc_flight_reg0_valid               <= 1'b1;
    dsc_flight_reg0_intr                <= dsc_intr;
    dsc_flight_reg0_ch_id               <= dsc_channel_id;
    dsc_flight_reg0_dsc_id              <= dsc_descriptor_id;
    dsc_flight_reg0_dst_first_be_addr   <= dsc_dst_addr[6:0];
    dsc_flight_reg0_dst_last_be_addr    <= dsc_dst_end_addr[6:0];
    dsc_flight_reg0_rsp_length          <= dsc_dst_align_length;
  end
  else if(dsc_flight_reg0_clear) begin
    dsc_flight_reg0_valid               <= dsc_flight_reg1_valid;       
    dsc_flight_reg0_intr                <= dsc_flight_reg1_intr;
    dsc_flight_reg0_ch_id               <= dsc_flight_reg1_ch_id;       
    dsc_flight_reg0_dsc_id              <= dsc_flight_reg1_dsc_id;      
    dsc_flight_reg0_dst_first_be_addr   <= dsc_flight_reg1_dst_first_be_addr;
    dsc_flight_reg0_dst_last_be_addr    <= dsc_flight_reg1_dst_last_be_addr;
    dsc_flight_reg0_rsp_length          <= dsc_flight_reg1_rsp_length;  
  end
  else begin
    dsc_flight_reg0_valid               <= dsc_flight_reg0_valid;       
    dsc_flight_reg0_intr                <= dsc_flight_reg0_intr;
    dsc_flight_reg0_ch_id               <= dsc_flight_reg0_ch_id;       
    dsc_flight_reg0_dsc_id              <= dsc_flight_reg0_dsc_id;      
    dsc_flight_reg0_dst_first_be_addr   <= dsc_flight_reg0_dst_first_be_addr;
    dsc_flight_reg0_dst_last_be_addr    <= dsc_flight_reg0_dst_last_be_addr;
    dsc_flight_reg0_rsp_length          <= dsc_flight_reg0_rsp_length;  
  end
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    dsc_flight_reg1_valid               <= 1'b0;
    dsc_flight_reg1_intr                <= 1'b0;
    dsc_flight_reg1_ch_id               <= 2'b0;
    dsc_flight_reg1_dsc_id              <= 30'b0;
    dsc_flight_reg1_dst_first_be_addr   <= 7'b0;
    dsc_flight_reg1_dst_last_be_addr    <= 7'b0;
    dsc_flight_reg1_rsp_length          <= 28'b0;
  end
  else if(dsc_flight_reg1_write) begin
    dsc_flight_reg1_valid               <= 1'b1;
    dsc_flight_reg1_intr                <= dsc_intr;
    dsc_flight_reg1_ch_id               <= dsc_channel_id;
    dsc_flight_reg1_dsc_id              <= dsc_descriptor_id;
    dsc_flight_reg1_dst_first_be_addr   <= dsc_dst_addr[6:0];
    dsc_flight_reg1_dst_last_be_addr    <= dsc_dst_end_addr[6:0];
    dsc_flight_reg1_rsp_length          <= dsc_dst_align_length;
  end
  else if(dsc_flight_reg1_clear | dsc_flight_reg0_clear) begin
    dsc_flight_reg1_valid               <= dsc_flight_reg2_valid;       
    dsc_flight_reg1_intr                <= dsc_flight_reg2_intr;
    dsc_flight_reg1_ch_id               <= dsc_flight_reg2_ch_id;       
    dsc_flight_reg1_dsc_id              <= dsc_flight_reg2_dsc_id;      
    dsc_flight_reg1_dst_first_be_addr   <= dsc_flight_reg2_dst_first_be_addr;
    dsc_flight_reg1_dst_last_be_addr    <= dsc_flight_reg2_dst_last_be_addr;
    dsc_flight_reg1_rsp_length          <= dsc_flight_reg2_rsp_length;  
  end
  else begin
    dsc_flight_reg1_valid               <= dsc_flight_reg1_valid;       
    dsc_flight_reg1_intr                <= dsc_flight_reg1_intr;
    dsc_flight_reg1_ch_id               <= dsc_flight_reg1_ch_id;       
    dsc_flight_reg1_dsc_id              <= dsc_flight_reg1_dsc_id;      
    dsc_flight_reg1_dst_first_be_addr   <= dsc_flight_reg1_dst_first_be_addr;
    dsc_flight_reg1_dst_last_be_addr    <= dsc_flight_reg1_dst_last_be_addr;
    dsc_flight_reg1_rsp_length          <= dsc_flight_reg1_rsp_length;  
  end
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    dsc_flight_reg2_valid               <= 1'b0;
    dsc_flight_reg2_intr                <= 1'b0;
    dsc_flight_reg2_ch_id               <= 2'b0;
    dsc_flight_reg2_dsc_id              <= 30'b0;
    dsc_flight_reg2_dst_first_be_addr   <= 7'b0;
    dsc_flight_reg2_dst_last_be_addr    <= 7'b0;
    dsc_flight_reg2_rsp_length          <= 28'b0;
  end
  else if(dsc_flight_reg2_write) begin
    dsc_flight_reg2_valid               <= 1'b1;
    dsc_flight_reg2_intr                <= dsc_intr;
    dsc_flight_reg2_ch_id               <= dsc_channel_id;
    dsc_flight_reg2_dsc_id              <= dsc_descriptor_id;
    dsc_flight_reg2_dst_first_be_addr   <= dsc_dst_addr[6:0];
    dsc_flight_reg2_dst_last_be_addr    <= dsc_dst_end_addr[6:0];
    dsc_flight_reg2_rsp_length          <= dsc_dst_align_length;
  end
  else if(dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear) begin
    dsc_flight_reg2_valid               <= dsc_flight_reg3_valid;       
    dsc_flight_reg2_intr                <= dsc_flight_reg3_intr;
    dsc_flight_reg2_ch_id               <= dsc_flight_reg3_ch_id;       
    dsc_flight_reg2_dsc_id              <= dsc_flight_reg3_dsc_id;      
    dsc_flight_reg2_dst_first_be_addr   <= dsc_flight_reg3_dst_first_be_addr;
    dsc_flight_reg2_dst_last_be_addr    <= dsc_flight_reg3_dst_last_be_addr;
    dsc_flight_reg2_rsp_length          <= dsc_flight_reg3_rsp_length;  
  end
  else begin
    dsc_flight_reg2_valid               <= dsc_flight_reg2_valid;       
    dsc_flight_reg2_intr                <= dsc_flight_reg2_intr;
    dsc_flight_reg2_ch_id               <= dsc_flight_reg2_ch_id;       
    dsc_flight_reg2_dsc_id              <= dsc_flight_reg2_dsc_id;      
    dsc_flight_reg2_dst_first_be_addr   <= dsc_flight_reg2_dst_first_be_addr;
    dsc_flight_reg2_dst_last_be_addr    <= dsc_flight_reg2_dst_last_be_addr;
    dsc_flight_reg2_rsp_length          <= dsc_flight_reg2_rsp_length;  
  end
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    dsc_flight_reg3_valid               <= 1'b0;
    dsc_flight_reg3_intr                <= 1'b0;
    dsc_flight_reg3_ch_id               <= 2'b0;
    dsc_flight_reg3_dsc_id              <= 30'b0;
    dsc_flight_reg3_dst_first_be_addr   <= 7'b0;
    dsc_flight_reg3_dst_last_be_addr    <= 7'b0;
    dsc_flight_reg3_rsp_length          <= 28'b0;
  end
  else if(dsc_flight_reg3_write) begin
    dsc_flight_reg3_valid               <= 1'b1;
    dsc_flight_reg3_intr                <= dsc_intr;
    dsc_flight_reg3_ch_id               <= dsc_channel_id;
    dsc_flight_reg3_dsc_id              <= dsc_descriptor_id;
    dsc_flight_reg3_dst_first_be_addr   <= dsc_dst_addr[6:0];
    dsc_flight_reg3_dst_last_be_addr    <= dsc_dst_end_addr[6:0];
    dsc_flight_reg3_rsp_length          <= dsc_dst_align_length;
  end
  else if(dsc_flight_reg3_clear | dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear) begin
    dsc_flight_reg3_valid               <= 1'b0;
    dsc_flight_reg3_intr                <= 1'b0;
    dsc_flight_reg3_ch_id               <= 2'b0;
    dsc_flight_reg3_dsc_id              <= 30'b0;
    dsc_flight_reg3_dst_first_be_addr   <= 7'b0;
    dsc_flight_reg3_dst_last_be_addr    <= 7'b0;
    dsc_flight_reg3_rsp_length          <= 28'b0;
  end
  else begin
    dsc_flight_reg3_valid               <= dsc_flight_reg3_valid;       
    dsc_flight_reg3_intr                <= dsc_flight_reg3_intr;
    dsc_flight_reg3_ch_id               <= dsc_flight_reg3_ch_id;       
    dsc_flight_reg3_dsc_id              <= dsc_flight_reg3_dsc_id;      
    dsc_flight_reg3_dst_first_be_addr   <= dsc_flight_reg3_dst_first_be_addr;
    dsc_flight_reg3_dst_last_be_addr    <= dsc_flight_reg3_dst_last_be_addr;
    dsc_flight_reg3_rsp_length          <= dsc_flight_reg3_rsp_length;  
  end
end

assign dsc_flight_reg0_write = rd_fsm_state_write_reg & ~dsc_flight_reg0_valid;
assign dsc_flight_reg1_write = rd_fsm_state_write_reg & dsc_flight_reg0_valid & ~dsc_flight_reg1_valid;
assign dsc_flight_reg2_write = rd_fsm_state_write_reg & dsc_flight_reg0_valid & dsc_flight_reg1_valid & ~dsc_flight_reg2_valid;
assign dsc_flight_reg3_write = rd_fsm_state_write_reg & dsc_flight_reg0_valid & dsc_flight_reg1_valid & dsc_flight_reg2_valid & ~dsc_flight_reg3_valid;
assign dsc_flight_reg_avail = ~(dsc_flight_reg0_valid & dsc_flight_reg1_valid & dsc_flight_reg2_valid & dsc_flight_reg3_valid);

//------------------------------------------------------------------------------
// AXI read data
//------------------------------------------------------------------------------
// Update in-flight registers when AXI read data received
// little register set number is the one needs to be updated
assign dsc_flight_reg0_src_match = rdata_fifo_wr_en & dsc_flight_reg0_valid & (dsc_flight_reg0_src_length != 28'b0) & (axi_rid[1:0] == dsc_flight_reg0_ch_id);
assign dsc_flight_reg1_src_match = rdata_fifo_wr_en & dsc_flight_reg1_valid & (dsc_flight_reg1_src_length != 28'b0) & (axi_rid[1:0] == dsc_flight_reg1_ch_id);
assign dsc_flight_reg2_src_match = rdata_fifo_wr_en & dsc_flight_reg2_valid & (dsc_flight_reg2_src_length != 28'b0) & (axi_rid[1:0] == dsc_flight_reg2_ch_id);
assign dsc_flight_reg3_src_match = rdata_fifo_wr_en & dsc_flight_reg3_valid & (dsc_flight_reg3_src_length != 28'b0) & (axi_rid[1:0] == dsc_flight_reg3_ch_id);
assign dsc_flight_reg_src_match  = {dsc_flight_reg0_src_match, dsc_flight_reg1_src_match, dsc_flight_reg2_src_match, dsc_flight_reg3_src_match};

always@(*) begin
  casez(dsc_flight_reg_src_match)
    4'b1???: begin
      dsc_flight_reg0_src_update = 1'b1;
      dsc_flight_reg1_src_update = 1'b0;
      dsc_flight_reg2_src_update = 1'b0;
      dsc_flight_reg3_src_update = 1'b0;
      dsc_flight_rlast = axi_rlast & ((dsc_flight_reg0_src_length - AXI_DATA_BYTE)==28'b0);
    end
    4'b01??: begin
      dsc_flight_reg0_src_update = 1'b0;
      dsc_flight_reg1_src_update = 1'b1;
      dsc_flight_reg2_src_update = 1'b0;
      dsc_flight_reg3_src_update = 1'b0;
      dsc_flight_rlast = axi_rlast & ((dsc_flight_reg1_src_length - AXI_DATA_BYTE)==28'b0);
    end
    4'b001?: begin
      dsc_flight_reg0_src_update = 1'b0;
      dsc_flight_reg1_src_update = 1'b0;
      dsc_flight_reg2_src_update = 1'b1;
      dsc_flight_reg3_src_update = 1'b0;
      dsc_flight_rlast = axi_rlast & ((dsc_flight_reg2_src_length - AXI_DATA_BYTE)==28'b0);
    end
    4'b0001: begin
      dsc_flight_reg0_src_update = 1'b0;
      dsc_flight_reg1_src_update = 1'b0;
      dsc_flight_reg2_src_update = 1'b0;
      dsc_flight_reg3_src_update = 1'b1;
      dsc_flight_rlast = axi_rlast & ((dsc_flight_reg3_src_length - AXI_DATA_BYTE)==28'b0);
    end
    default: begin
      dsc_flight_reg0_src_update = 1'b0;
      dsc_flight_reg1_src_update = 1'b0;
      dsc_flight_reg2_src_update = 1'b0;
      dsc_flight_reg3_src_update = 1'b0;
      dsc_flight_rlast = 1'b0;
    end
  endcase
end

// when clear and update happened at same cycle
// need to write the shift-in updating value
always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    dsc_flight_reg0_src_addr     <= 64'b0;
    dsc_flight_reg0_src_length   <= 28'b0;
  end
  else if(dsc_flight_reg0_write) begin
    dsc_flight_reg0_src_addr     <= dsc_src_align_addr;
    dsc_flight_reg0_src_length   <= dsc_src_align_length;
  end
  else if(dsc_flight_reg0_clear & ~dsc_flight_reg1_src_update) begin
    dsc_flight_reg0_src_addr     <= dsc_flight_reg1_src_addr;    
    dsc_flight_reg0_src_length   <= dsc_flight_reg1_src_length;  
  end
  else if(dsc_flight_reg0_clear & dsc_flight_reg1_src_update) begin
    dsc_flight_reg0_src_addr     <= dsc_flight_reg1_src_addr + AXI_DATA_BYTE;    
    dsc_flight_reg0_src_length   <= dsc_flight_reg1_src_length - AXI_DATA_BYTE;  
  end
  else if(dsc_flight_reg0_src_update) begin
    dsc_flight_reg0_src_addr     <= dsc_flight_reg0_src_addr + AXI_DATA_BYTE;    
    dsc_flight_reg0_src_length   <= dsc_flight_reg0_src_length - AXI_DATA_BYTE;  
  end
  else begin
    dsc_flight_reg0_src_addr     <= dsc_flight_reg0_src_addr;    
    dsc_flight_reg0_src_length   <= dsc_flight_reg0_src_length;  
  end
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    dsc_flight_reg1_src_addr     <= 64'b0;
    dsc_flight_reg1_src_length   <= 28'b0;
  end
  else if(dsc_flight_reg1_write) begin
    dsc_flight_reg1_src_addr     <= dsc_src_align_addr;
    dsc_flight_reg1_src_length   <= dsc_src_align_length;
  end
  else if((dsc_flight_reg1_clear | dsc_flight_reg0_clear) & ~dsc_flight_reg2_src_update) begin
    dsc_flight_reg1_src_addr     <= dsc_flight_reg2_src_addr;    
    dsc_flight_reg1_src_length   <= dsc_flight_reg2_src_length;  
  end
  else if((dsc_flight_reg1_clear | dsc_flight_reg0_clear) & dsc_flight_reg2_src_update) begin
    dsc_flight_reg1_src_addr     <= dsc_flight_reg2_src_addr + AXI_DATA_BYTE;    
    dsc_flight_reg1_src_length   <= dsc_flight_reg2_src_length - AXI_DATA_BYTE;  
  end
  else if(dsc_flight_reg1_src_update & ~dsc_flight_reg0_clear) begin
    dsc_flight_reg1_src_addr     <= dsc_flight_reg1_src_addr + AXI_DATA_BYTE;    
    dsc_flight_reg1_src_length   <= dsc_flight_reg1_src_length - AXI_DATA_BYTE;  
  end
  else begin
    dsc_flight_reg1_src_addr     <= dsc_flight_reg1_src_addr;    
    dsc_flight_reg1_src_length   <= dsc_flight_reg1_src_length;  
  end
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    dsc_flight_reg2_src_addr     <= 64'b0;
    dsc_flight_reg2_src_length   <= 28'b0;
  end
  else if(dsc_flight_reg2_write) begin
    dsc_flight_reg2_src_addr     <= dsc_src_align_addr;
    dsc_flight_reg2_src_length   <= dsc_src_align_length;
  end
  else if((dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear) & ~dsc_flight_reg3_src_update) begin
    dsc_flight_reg2_src_addr     <= dsc_flight_reg3_src_addr;    
    dsc_flight_reg2_src_length   <= dsc_flight_reg3_src_length;  
  end
  else if((dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear) & dsc_flight_reg3_src_update) begin
    dsc_flight_reg2_src_addr     <= dsc_flight_reg3_src_addr + AXI_DATA_BYTE;    
    dsc_flight_reg2_src_length   <= dsc_flight_reg3_src_length - AXI_DATA_BYTE;  
  end
  else if(dsc_flight_reg2_src_update & ~(dsc_flight_reg1_clear | dsc_flight_reg0_clear)) begin
    dsc_flight_reg2_src_addr     <= dsc_flight_reg2_src_addr + AXI_DATA_BYTE;    
    dsc_flight_reg2_src_length   <= dsc_flight_reg2_src_length - AXI_DATA_BYTE;  
  end
  else begin
    dsc_flight_reg2_src_addr     <= dsc_flight_reg2_src_addr;    
    dsc_flight_reg2_src_length   <= dsc_flight_reg2_src_length;  
  end
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    dsc_flight_reg3_src_addr     <= 64'b0;
    dsc_flight_reg3_src_length   <= 28'b0;
  end
  else if(dsc_flight_reg3_write) begin
    dsc_flight_reg3_src_addr     <= dsc_src_align_addr;
    dsc_flight_reg3_src_length   <= dsc_src_align_length;
  end
  else if(dsc_flight_reg3_clear | dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear) begin
    dsc_flight_reg3_src_addr     <= 64'b0;
    dsc_flight_reg3_src_length   <= 28'b0;
  end
  else if(dsc_flight_reg3_src_update & ~(dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear)) begin
    dsc_flight_reg3_src_addr     <= dsc_flight_reg3_src_addr + AXI_DATA_BYTE;    
    dsc_flight_reg3_src_length   <= dsc_flight_reg3_src_length - AXI_DATA_BYTE;  
  end
  else begin
    dsc_flight_reg3_src_addr     <= dsc_flight_reg3_src_addr;    
    dsc_flight_reg3_src_length   <= dsc_flight_reg3_src_length;  
  end
end

// Update src error registers when first AXI read data error received
assign dsc_flight_reg0_src_err_update = dsc_flight_reg0_src_match & ~dsc_flight_reg0_src_err_happen & (axi_rresp!=2'b0);
assign dsc_flight_reg1_src_err_update = dsc_flight_reg1_src_match & ~dsc_flight_reg1_src_err_happen & (axi_rresp!=2'b0);
assign dsc_flight_reg2_src_err_update = dsc_flight_reg2_src_match & ~dsc_flight_reg2_src_err_happen & (axi_rresp!=2'b0);
assign dsc_flight_reg3_src_err_update = dsc_flight_reg3_src_match & ~dsc_flight_reg3_src_err_happen & (axi_rresp!=2'b0);

// when clear and update happened at same cycle
// need to write the shift-in updating value
always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    dsc_flight_reg0_src_err_happen <= 1'b0;
    dsc_flight_reg0_src_err        <= 2'b0;
    dsc_flight_reg0_src_err_addr   <= 64'b0;
  end
  else if(dsc_flight_reg0_clear & ~dsc_flight_reg1_src_err_update) begin
    dsc_flight_reg0_src_err_happen <= dsc_flight_reg1_src_err_happen;
    dsc_flight_reg0_src_err        <= dsc_flight_reg1_src_err;    
    dsc_flight_reg0_src_err_addr   <= dsc_flight_reg1_src_err_addr;
  end
  else if(dsc_flight_reg0_clear & dsc_flight_reg1_src_err_update) begin
    dsc_flight_reg0_src_err_happen <= 1'b1;
    dsc_flight_reg0_src_err        <= axi_rresp;    
    dsc_flight_reg0_src_err_addr   <= dsc_flight_reg1_src_addr;
  end
  else if(dsc_flight_reg0_src_err_update) begin
    dsc_flight_reg0_src_err_happen <= 1'b1;
    dsc_flight_reg0_src_err        <= axi_rresp;    
    dsc_flight_reg0_src_err_addr   <= dsc_flight_reg0_src_addr;
  end
  else begin
    dsc_flight_reg0_src_err_happen <= dsc_flight_reg0_src_err_happen;
    dsc_flight_reg0_src_err        <= dsc_flight_reg0_src_err;    
    dsc_flight_reg0_src_err_addr   <= dsc_flight_reg0_src_err_addr;
  end
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    dsc_flight_reg1_src_err_happen <= 1'b0;
    dsc_flight_reg1_src_err        <= 2'b0;
    dsc_flight_reg1_src_err_addr   <= 64'b0;
  end
  else if((dsc_flight_reg1_clear | dsc_flight_reg0_clear) & ~dsc_flight_reg2_src_err_update) begin
    dsc_flight_reg1_src_err_happen <= dsc_flight_reg2_src_err_happen;
    dsc_flight_reg1_src_err        <= dsc_flight_reg2_src_err;    
    dsc_flight_reg1_src_err_addr   <= dsc_flight_reg2_src_err_addr;
  end
  else if((dsc_flight_reg1_clear | dsc_flight_reg0_clear) & dsc_flight_reg2_src_err_update) begin
    dsc_flight_reg1_src_err_happen <= 1'b1;
    dsc_flight_reg1_src_err        <= axi_rresp;    
    dsc_flight_reg1_src_err_addr   <= dsc_flight_reg2_src_addr;
  end
  else if(dsc_flight_reg1_src_err_update & ~dsc_flight_reg0_clear) begin
    dsc_flight_reg1_src_err_happen <= 1'b1;
    dsc_flight_reg1_src_err        <= axi_rresp;    
    dsc_flight_reg1_src_err_addr   <= dsc_flight_reg1_src_addr;
  end
  else begin
    dsc_flight_reg1_src_err_happen <= dsc_flight_reg1_src_err_happen;
    dsc_flight_reg1_src_err        <= dsc_flight_reg1_src_err;    
    dsc_flight_reg1_src_err_addr   <= dsc_flight_reg1_src_err_addr;
  end
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    dsc_flight_reg2_src_err_happen <= 1'b0;
    dsc_flight_reg2_src_err        <= 2'b0;
    dsc_flight_reg2_src_err_addr   <= 64'b0;
  end
  else if((dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear) & ~dsc_flight_reg3_src_err_update) begin
    dsc_flight_reg2_src_err_happen <= dsc_flight_reg3_src_err_happen;
    dsc_flight_reg2_src_err        <= dsc_flight_reg3_src_err;    
    dsc_flight_reg2_src_err_addr   <= dsc_flight_reg3_src_err_addr;
  end
  else if((dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear) & dsc_flight_reg3_src_err_update) begin
    dsc_flight_reg2_src_err_happen <= 1'b1;
    dsc_flight_reg2_src_err        <= axi_rresp;    
    dsc_flight_reg2_src_err_addr   <= dsc_flight_reg3_src_addr;
  end
  else if(dsc_flight_reg2_src_err_update & ~(dsc_flight_reg1_clear | dsc_flight_reg0_clear)) begin
    dsc_flight_reg2_src_err_happen <= 1'b1;
    dsc_flight_reg2_src_err        <= axi_rresp;    
    dsc_flight_reg2_src_err_addr   <= dsc_flight_reg2_src_addr;
  end
  else begin
    dsc_flight_reg2_src_err_happen <= dsc_flight_reg2_src_err_happen;
    dsc_flight_reg2_src_err        <= dsc_flight_reg2_src_err;    
    dsc_flight_reg2_src_err_addr   <= dsc_flight_reg2_src_err_addr;
  end
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    dsc_flight_reg3_src_err_happen <= 1'b0;
    dsc_flight_reg3_src_err        <= 2'b0;
    dsc_flight_reg3_src_err_addr   <= 64'b0;
  end
  else if(dsc_flight_reg3_clear | dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear) begin
    dsc_flight_reg3_src_err_happen <= 1'b0;
    dsc_flight_reg3_src_err        <= 2'b0;
    dsc_flight_reg3_src_err_addr   <= 64'b0;
  end
  else if(dsc_flight_reg3_src_err_update & ~(dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear)) begin
    dsc_flight_reg3_src_err_happen <= 1'b1;
    dsc_flight_reg3_src_err        <= axi_rresp;    
    dsc_flight_reg3_src_err_addr   <= dsc_flight_reg3_src_addr;
  end
  else begin
    dsc_flight_reg3_src_err_happen <= dsc_flight_reg3_src_err_happen;
    dsc_flight_reg3_src_err        <= dsc_flight_reg3_src_err;    
    dsc_flight_reg3_src_err_addr   <= dsc_flight_reg3_src_err_addr;
  end
end

// AXI read data write into FIFO
assign rdata_fifo_din   = axi_rdata;
assign rtag_fifo_din    = {axi_rid, axi_rresp, dsc_flight_rlast};
assign rdata_fifo_wr_en = axi_rvalid & ~rdata_fifo_full;
assign axi_rready = ~rdata_fifo_full;

assign rtag_fifo_axi_rid   = rtag_fifo_dout[7:3];
assign rtag_fifo_axi_rresp = rtag_fifo_dout[2:1];
assign rtag_fifo_dsc_rlast = rtag_fifo_dout[0];

`ifdef ACTION_DATA_WIDTH_512
// *****************************
// begin 512 bit AXI data width
// *****************************
reg  [AXI_DATA_WIDTH-1 : 0 ]  axi_rdata_ch0_data;               //channel 0 first beat AXI read data
reg                           axi_rdata_ch0_valid;              //channel 0 first beat AXI read data valid
wire                          axi_rdata_ch0_wr;                 //channel 0 first beat AXI read data update
reg  [AXI_DATA_WIDTH-1 : 0 ]  axi_rdata_ch1_data;               //channel 1 first beat AXI read data
reg                           axi_rdata_ch1_valid;              //channel 1 first beat AXI read data valid
wire                          axi_rdata_ch1_wr;                 //channel 1 first beat AXI read data update
reg  [AXI_DATA_WIDTH-1 : 0 ]  axi_rdata_ch2_data;               //channel 2 first beat AXI read data
reg                           axi_rdata_ch2_valid;              //channel 2 first beat AXI read data valid
wire                          axi_rdata_ch2_wr;                 //channel 2 first beat AXI read data update
reg  [AXI_DATA_WIDTH-1 : 0 ]  axi_rdata_ch3_data;               //channel 3 first beat AXI read data
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
wire                          lcl_wr_data_ch0_valid;            //channel 0 local write data(two beats) valid
wire                          lcl_wr_data_ch1_valid;            //channel 1 local write data(two beats) valid
wire                          lcl_wr_data_ch2_valid;            //channel 2 local write data(two beats) valid
wire                          lcl_wr_data_ch3_valid;            //channel 3 local write data(two beats) valid
wire                          lcl_wr_ch0_dsc_lower_half;        //channel 0 last write beat data is first 512b on lcl write data bus
wire                          lcl_wr_ch1_dsc_lower_half;        //channel 1 last write beat data is first 512b on lcl write data bus
wire                          lcl_wr_ch2_dsc_lower_half;        //channel 2 last write beat data is first 512b on lcl write data bus
wire                          lcl_wr_ch3_dsc_lower_half;        //channel 3 last write beat data is first 512b on lcl write data bus
wire                          lcl_wr_dsc_lower_half;            //any channel last write beat data is first 512b on lcl write data bus
wire                          lcl_reg0_first_beat_upper_half;   //descriptor 0 write first beat start addr is upper 512b half
wire                          lcl_reg1_first_beat_upper_half;   //descriptor 1 write first beat start addr is upper 512b half
wire                          lcl_reg2_first_beat_upper_half;   //descriptor 2 write first beat start addr is upper 512b half
wire                          lcl_reg3_first_beat_upper_half;   //descriptor 3 write first beat start addr is upper 512b half
wire                          lcl_first_beat_upper_half;        //lcl write first beat start addr is upper 512b half
wire [3   : 0]                lcl_wr_data_ctrl;                 //lcl write data control
reg  [1023: 0]                lcl_normal_wr_data;               //lcl normal write data
reg  [1023: 0]                lcl_first_wr_data;                //lcl first beat write data

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

assign axi_rdata_fifo_ch0_valid = rdata_fifo_valid & (rtag_fifo_axi_rid==5'd0);
assign axi_rdata_fifo_ch1_valid = rdata_fifo_valid & (rtag_fifo_axi_rid==5'd1);
assign axi_rdata_fifo_ch2_valid = rdata_fifo_valid & (rtag_fifo_axi_rid==5'd2);
assign axi_rdata_fifo_ch3_valid = rdata_fifo_valid & (rtag_fifo_axi_rid==5'd3);

assign axi_rdata_ch0_wr = axi_rdata_fifo_ch0_valid & ~rtag_fifo_dsc_rlast & (~axi_rdata_ch0_valid | (lcl_first_beat_upper_half & lcl_wr_done));
assign axi_rdata_ch1_wr = axi_rdata_fifo_ch1_valid & ~rtag_fifo_dsc_rlast & (~axi_rdata_ch1_valid | (lcl_first_beat_upper_half & lcl_wr_done));
assign axi_rdata_ch2_wr = axi_rdata_fifo_ch2_valid & ~rtag_fifo_dsc_rlast & (~axi_rdata_ch2_valid | (lcl_first_beat_upper_half & lcl_wr_done));
assign axi_rdata_ch3_wr = axi_rdata_fifo_ch3_valid & ~rtag_fifo_dsc_rlast & (~axi_rdata_ch3_valid | (lcl_first_beat_upper_half & lcl_wr_done));
assign axi_rdata_wr = axi_rdata_ch0_wr | axi_rdata_ch1_wr | axi_rdata_ch2_wr | axi_rdata_ch3_wr;

// read fifo when first beat data write into register or
// write data done on local bus when not first 512b beat is upper half and second
// 512b beat is lower half of the next lcl 1024b beat
assign rdata_fifo_rd_en = ~rdata_fifo_empty & (axi_rdata_wr | (lcl_wr_done & (~lcl_first_beat_upper_half | lcl_wr_dsc_lower_half)));

//---AXI read data FIFO(512b width x 8 depth)
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

//---AXI read data tag FIFO(8b width x 8 depth)
// 5b id + 2b resp + 1b dsc last
// Xilinx IP: FWFT fifo
fifo_sync_8x8 rtag_fifo (
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
// ready to issue write cmd when two beat data for the same id are valid
// or is dsc last beat data
assign lcl_wr_data_ch0_valid = axi_rdata_fifo_ch0_valid & (axi_rdata_ch0_valid | rtag_fifo_dsc_rlast);
assign lcl_wr_data_ch1_valid = axi_rdata_fifo_ch1_valid & (axi_rdata_ch1_valid | rtag_fifo_dsc_rlast);
assign lcl_wr_data_ch2_valid = axi_rdata_fifo_ch2_valid & (axi_rdata_ch2_valid | rtag_fifo_dsc_rlast);
assign lcl_wr_data_ch3_valid = axi_rdata_fifo_ch3_valid & (axi_rdata_ch3_valid | rtag_fifo_dsc_rlast);
assign lcl_wr_data_valid = lcl_wr_data_ch0_valid | lcl_wr_data_ch1_valid | lcl_wr_data_ch2_valid | lcl_wr_data_ch3_valid;

assign lcl_ch0_wr_done = lcl_wr_data_ch0_valid & lcl_wr_ready;
assign lcl_ch1_wr_done = lcl_wr_data_ch1_valid & lcl_wr_ready;
assign lcl_ch2_wr_done = lcl_wr_data_ch2_valid & lcl_wr_ready;
assign lcl_ch3_wr_done = lcl_wr_data_ch3_valid & lcl_wr_ready;

// check last beat data is the lower 512b half
assign lcl_wr_ch0_dsc_lower_half = axi_rdata_fifo_ch0_valid & rtag_fifo_dsc_rlast & ~axi_rdata_ch0_valid;
assign lcl_wr_ch1_dsc_lower_half = axi_rdata_fifo_ch1_valid & rtag_fifo_dsc_rlast & ~axi_rdata_ch1_valid;
assign lcl_wr_ch2_dsc_lower_half = axi_rdata_fifo_ch2_valid & rtag_fifo_dsc_rlast & ~axi_rdata_ch2_valid;
assign lcl_wr_ch3_dsc_lower_half = axi_rdata_fifo_ch3_valid & rtag_fifo_dsc_rlast & ~axi_rdata_ch3_valid;

assign lcl_wr_dsc_lower_half = lcl_wr_ch0_dsc_lower_half | lcl_wr_ch1_dsc_lower_half | lcl_wr_ch2_dsc_lower_half | lcl_wr_ch3_dsc_lower_half;

// check descriptor first write beat start addr is upper 512b half
assign lcl_reg0_first_beat_upper_half = dsc_flight_reg0_dst_first_beat & dsc_flight_reg0_dst_first_be_addr[6];
assign lcl_reg1_first_beat_upper_half = dsc_flight_reg1_dst_first_beat & dsc_flight_reg1_dst_first_be_addr[6];
assign lcl_reg2_first_beat_upper_half = dsc_flight_reg2_dst_first_beat & dsc_flight_reg2_dst_first_be_addr[6];
assign lcl_reg3_first_beat_upper_half = dsc_flight_reg3_dst_first_beat & dsc_flight_reg3_dst_first_be_addr[6];

assign lcl_first_beat_upper_half = dsc_flight_reg0_dst_use ? lcl_reg0_first_beat_upper_half
                                   : (dsc_flight_reg1_dst_use ? lcl_reg1_first_beat_upper_half
                                     : (dsc_flight_reg2_dst_use ? lcl_reg2_first_beat_upper_half
                                       : (dsc_flight_reg3_dst_use ? lcl_reg3_first_beat_upper_half : 1'b0)));

// generate lcl write data
assign lcl_wr_data_ctrl = {lcl_wr_data_ch0_valid, lcl_wr_data_ch1_valid, lcl_wr_data_ch2_valid, lcl_wr_data_ch3_valid};

always@(*) begin
  case(lcl_wr_data_ctrl)
    4'b1000: begin
      lcl_normal_wr_data = {rdata_fifo_dout, axi_rdata_ch0_data};
      lcl_first_wr_data  = {axi_rdata_ch0_data, 512'b0};
    end
    4'b0100: begin
      lcl_normal_wr_data = {rdata_fifo_dout, axi_rdata_ch1_data};
      lcl_first_wr_data  = {axi_rdata_ch1_data, 512'b0};
    end
    4'b0010: begin
      lcl_normal_wr_data = {rdata_fifo_dout, axi_rdata_ch2_data};
      lcl_first_wr_data  = {axi_rdata_ch2_data, 512'b0};
    end
    4'b0001: begin
      lcl_normal_wr_data = {rdata_fifo_dout, axi_rdata_ch3_data};
      lcl_first_wr_data  = {axi_rdata_ch3_data, 512'b0};
    end
    default: begin
      lcl_normal_wr_data = 1024'b0;
      lcl_first_wr_data  = 1024'b0;
    end
  endcase
end

assign lcl_wr_data = (lcl_wr_dsc_lower_half & ~lcl_first_beat_upper_half) ? {512'b0, rdata_fifo_dout}
                       : ((lcl_wr_dsc_lower_half & lcl_first_beat_upper_half) ? {rdata_fifo_dout, 512'b0}
                         : ((~lcl_wr_dsc_lower_half & lcl_first_beat_upper_half) ? lcl_first_wr_data : lcl_normal_wr_data));
// *****************************
// end 512 bit AXI data width
// *****************************
`else 
// *****************************
// begin 1024 bit AXI data width
// *****************************
// read fifo when data write done on local bus
assign rdata_fifo_rd_en = ~rdata_fifo_empty & lcl_wr_done;

//---AXI read data FIFO(1024b width x 8 depth)
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

//---AXI read data tag FIFO(8b width x 8 depth)
// 5b id + 2b resp + 1b dsc last
// Xilinx IP: FWFT fifo
fifo_sync_8x8 rtag_fifo (
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

// generate lcl write data for 1024b
assign lcl_wr_data_valid = rdata_fifo_valid;
assign lcl_wr_data       = rdata_fifo_valid ? rdata_fifo_dout[AXI_DATA_WIDTH-1 : 0] : 1024'b0;
// *****************************
// end 1024 bit AXI data width
// *****************************
`endif

//------------------------------------------------------------------------------
// Local write command
//------------------------------------------------------------------------------
// check first and last beat data of dsc
assign dsc_flight_reg0_dst_first_beat = (dsc_flight_reg0_dst_length == dsc_flight_reg0_rsp_length);
assign dsc_flight_reg1_dst_first_beat = (dsc_flight_reg1_dst_length == dsc_flight_reg1_rsp_length);
assign dsc_flight_reg2_dst_first_beat = (dsc_flight_reg2_dst_length == dsc_flight_reg2_rsp_length);
assign dsc_flight_reg3_dst_first_beat = (dsc_flight_reg3_dst_length == dsc_flight_reg3_rsp_length);

assign dsc_flight_reg0_dst_last_beat = (dsc_flight_reg0_dst_length == 28'd128);
assign dsc_flight_reg1_dst_last_beat = (dsc_flight_reg1_dst_length == 28'd128);
assign dsc_flight_reg2_dst_last_beat = (dsc_flight_reg2_dst_length == 28'd128);
assign dsc_flight_reg3_dst_last_beat = (dsc_flight_reg3_dst_length == 28'd128);

// find the in-flight registers when lcl write data ready
// (if lcl_wr_ready is not '1', the register set might shift, 
// but still can keep correct register matched till the cycle cmd issued)
assign dsc_flight_reg0_dst_use = lcl_wr_data_valid & dsc_flight_reg0_valid & (dsc_flight_reg0_dst_length != 28'b0) & (rtag_fifo_axi_rid[1:0] == dsc_flight_reg0_ch_id);
assign dsc_flight_reg1_dst_use = lcl_wr_data_valid & dsc_flight_reg1_valid & (dsc_flight_reg1_dst_length != 28'b0) & (rtag_fifo_axi_rid[1:0] == dsc_flight_reg1_ch_id);
assign dsc_flight_reg2_dst_use = lcl_wr_data_valid & dsc_flight_reg2_valid & (dsc_flight_reg2_dst_length != 28'b0) & (rtag_fifo_axi_rid[1:0] == dsc_flight_reg2_ch_id);
assign dsc_flight_reg3_dst_use = lcl_wr_data_valid & dsc_flight_reg3_valid & (dsc_flight_reg3_dst_length != 28'b0) & (rtag_fifo_axi_rid[1:0] == dsc_flight_reg3_ch_id);

// generate lcl write byte enable based on descriptor first or last beat
// 1.first beat wr_be is based on dest unaligned byte start addr
// 2.last beat wr_be is based on dest unaligned byte end addr
// 3.only one beat (first and last beat) wr_be is based on both dest unaligned byte start and end addr
assign lcl_wr_be_ctrl = {dsc_flight_reg0_dst_use, dsc_flight_reg0_dst_first_beat, dsc_flight_reg0_dst_last_beat,
                         dsc_flight_reg1_dst_use, dsc_flight_reg1_dst_first_beat, dsc_flight_reg1_dst_last_beat,
                         dsc_flight_reg2_dst_use, dsc_flight_reg2_dst_first_beat, dsc_flight_reg2_dst_last_beat,
                         dsc_flight_reg3_dst_use, dsc_flight_reg3_dst_first_beat, dsc_flight_reg3_dst_last_beat};

assign dsc_flight_reg0_dst_first_beat_be = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF << dsc_flight_reg0_dst_first_be_addr;
assign dsc_flight_reg1_dst_first_beat_be = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF << dsc_flight_reg1_dst_first_be_addr;
assign dsc_flight_reg2_dst_first_beat_be = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF << dsc_flight_reg2_dst_first_be_addr;
assign dsc_flight_reg3_dst_first_beat_be = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF << dsc_flight_reg3_dst_first_be_addr;
assign dsc_flight_reg0_dst_last_beat_be  = (dsc_flight_reg0_dst_last_be_addr==7'b0) ? 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF 
                                           : ~(128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF << dsc_flight_reg0_dst_last_be_addr);
assign dsc_flight_reg1_dst_last_beat_be  = (dsc_flight_reg1_dst_last_be_addr==7'b0) ? 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF
                                           : ~(128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF << dsc_flight_reg1_dst_last_be_addr);
assign dsc_flight_reg2_dst_last_beat_be  = (dsc_flight_reg2_dst_last_be_addr==7'b0) ? 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF
                                           : ~(128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF << dsc_flight_reg2_dst_last_be_addr);
assign dsc_flight_reg3_dst_last_beat_be  = (dsc_flight_reg3_dst_last_be_addr==7'b0) ? 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF
                                           : ~(128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF << dsc_flight_reg3_dst_last_be_addr);

always@(*) begin
  casez(lcl_wr_be_ctrl)
    12'b111_???_???_???: lcl_wr_be = dsc_flight_reg0_dst_first_beat_be & dsc_flight_reg0_dst_last_beat_be;
    12'b110_???_???_???: lcl_wr_be = dsc_flight_reg0_dst_first_beat_be;
    12'b101_???_???_???: lcl_wr_be = dsc_flight_reg0_dst_last_beat_be;
    12'b0??_111_???_???: lcl_wr_be = dsc_flight_reg1_dst_first_beat_be & dsc_flight_reg1_dst_last_beat_be;
    12'b0??_110_???_???: lcl_wr_be = dsc_flight_reg1_dst_first_beat_be;
    12'b0??_101_???_???: lcl_wr_be = dsc_flight_reg1_dst_last_beat_be;
    12'b0??_0??_111_???: lcl_wr_be = dsc_flight_reg2_dst_first_beat_be & dsc_flight_reg2_dst_last_beat_be;
    12'b0??_0??_110_???: lcl_wr_be = dsc_flight_reg2_dst_first_beat_be;
    12'b0??_0??_101_???: lcl_wr_be = dsc_flight_reg2_dst_last_beat_be;
    12'b0??_0??_0??_111: lcl_wr_be = dsc_flight_reg3_dst_first_beat_be & dsc_flight_reg3_dst_last_beat_be;
    12'b0??_0??_0??_110: lcl_wr_be = dsc_flight_reg3_dst_first_beat_be;
    12'b0??_0??_0??_101: lcl_wr_be = dsc_flight_reg3_dst_last_beat_be;
    default:             lcl_wr_be = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
  endcase
end

// generate lcl write cmd
assign lcl_wr_valid  = lcl_wr_data_valid;

assign lcl_wr_ea     = dsc_flight_reg0_dst_use ? dsc_flight_reg0_dst_addr
                       : (dsc_flight_reg1_dst_use ? dsc_flight_reg1_dst_addr
                         : (dsc_flight_reg2_dst_use ? dsc_flight_reg2_dst_addr
                           : (dsc_flight_reg3_dst_use ? dsc_flight_reg3_dst_addr : 64'b0)));

assign lcl_wr_first  = dsc_flight_reg0_dst_use ? dsc_flight_reg0_dst_first_beat
                       : (dsc_flight_reg1_dst_use ? dsc_flight_reg1_dst_first_beat
                         : (dsc_flight_reg2_dst_use ? dsc_flight_reg2_dst_first_beat
                           : (dsc_flight_reg3_dst_use ? dsc_flight_reg3_dst_first_beat : 1'b0)));

assign lcl_wr_last   = dsc_flight_reg0_dst_use ? dsc_flight_reg0_dst_last_beat
                       : (dsc_flight_reg1_dst_use ? dsc_flight_reg1_dst_last_beat
                         : (dsc_flight_reg2_dst_use ? dsc_flight_reg2_dst_last_beat
                           : (dsc_flight_reg3_dst_use ? dsc_flight_reg3_dst_last_beat : 1'b0)));

assign lcl_wr_axi_id = {rtag_fifo_axi_rid[1:0], `A2HMM_ENGINE_ID};

assign lcl_wr_done   = lcl_wr_data_valid & lcl_wr_ready;

// lcl ctx write cmd (not used for now)
assign lcl_wr_ctx_valid = 1'b0;
assign lcl_wr_ctx       = 9'b0;

// update in-flight registers at the cycle lcl write cmd issued
assign dsc_flight_reg0_dst_match = dsc_flight_reg0_dst_use & lcl_wr_ready;
assign dsc_flight_reg1_dst_match = dsc_flight_reg1_dst_use & lcl_wr_ready;
assign dsc_flight_reg2_dst_match = dsc_flight_reg2_dst_use & lcl_wr_ready;
assign dsc_flight_reg3_dst_match = dsc_flight_reg3_dst_use & lcl_wr_ready;
assign dsc_flight_reg_dst_match  = {dsc_flight_reg0_dst_match, dsc_flight_reg1_dst_match, dsc_flight_reg2_dst_match, dsc_flight_reg3_dst_match};

always@(*) begin
  casez(dsc_flight_reg_dst_match)
    4'b1???: begin
      dsc_flight_reg0_dst_update = 1'b1;
      dsc_flight_reg1_dst_update = 1'b0;
      dsc_flight_reg2_dst_update = 1'b0;
      dsc_flight_reg3_dst_update = 1'b0;
    end
    4'b01??: begin
      dsc_flight_reg0_dst_update = 1'b0;
      dsc_flight_reg1_dst_update = 1'b1;
      dsc_flight_reg2_dst_update = 1'b0;
      dsc_flight_reg3_dst_update = 1'b0;
    end
    4'b001?: begin
      dsc_flight_reg0_dst_update = 1'b0;
      dsc_flight_reg1_dst_update = 1'b0;
      dsc_flight_reg2_dst_update = 1'b1;
      dsc_flight_reg3_dst_update = 1'b0;
    end
    4'b0001: begin
      dsc_flight_reg0_dst_update = 1'b0;
      dsc_flight_reg1_dst_update = 1'b0;
      dsc_flight_reg2_dst_update = 1'b0;
      dsc_flight_reg3_dst_update = 1'b1;
    end
    default: begin
      dsc_flight_reg0_dst_update = 1'b0;
      dsc_flight_reg1_dst_update = 1'b0;
      dsc_flight_reg2_dst_update = 1'b0;
      dsc_flight_reg3_dst_update = 1'b0;
    end
  endcase
end

// when clear and update happened at same cycle
// need to write the shift-in updating value
always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    dsc_flight_reg0_dst_addr     <= 64'b0;
    dsc_flight_reg0_dst_length   <= 28'b0;
  end
  else if(dsc_flight_reg0_write) begin
    dsc_flight_reg0_dst_addr     <= dsc_dst_align_addr;
    dsc_flight_reg0_dst_length   <= dsc_dst_align_length;
  end
  else if(dsc_flight_reg0_clear & ~dsc_flight_reg1_dst_update) begin
    dsc_flight_reg0_dst_addr     <= dsc_flight_reg1_dst_addr;    
    dsc_flight_reg0_dst_length   <= dsc_flight_reg1_dst_length;  
  end
  else if(dsc_flight_reg0_clear & dsc_flight_reg1_dst_update) begin
    dsc_flight_reg0_dst_addr     <= dsc_flight_reg1_dst_addr + 64'd128;    
    dsc_flight_reg0_dst_length   <= dsc_flight_reg1_dst_length - 28'd128;  
  end
  else if(dsc_flight_reg0_dst_update) begin
    dsc_flight_reg0_dst_addr     <= dsc_flight_reg0_dst_addr + 64'd128;    
    dsc_flight_reg0_dst_length   <= dsc_flight_reg0_dst_length - 28'd128;  
  end
  else begin
    dsc_flight_reg0_dst_addr     <= dsc_flight_reg0_dst_addr;    
    dsc_flight_reg0_dst_length   <= dsc_flight_reg0_dst_length;  
  end
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    dsc_flight_reg1_dst_addr     <= 64'b0;
    dsc_flight_reg1_dst_length   <= 28'b0;
  end
  else if(dsc_flight_reg1_write) begin
    dsc_flight_reg1_dst_addr     <= dsc_dst_align_addr;
    dsc_flight_reg1_dst_length   <= dsc_dst_align_length;
  end
  else if((dsc_flight_reg1_clear | dsc_flight_reg0_clear) & ~dsc_flight_reg2_dst_update) begin
    dsc_flight_reg1_dst_addr     <= dsc_flight_reg2_dst_addr;    
    dsc_flight_reg1_dst_length   <= dsc_flight_reg2_dst_length;  
  end
  else if((dsc_flight_reg1_clear | dsc_flight_reg0_clear) & dsc_flight_reg2_dst_update) begin
    dsc_flight_reg1_dst_addr     <= dsc_flight_reg2_dst_addr + 64'd128;    
    dsc_flight_reg1_dst_length   <= dsc_flight_reg2_dst_length - 28'd128;  
  end
  else if(dsc_flight_reg1_dst_update & ~dsc_flight_reg0_clear) begin
    dsc_flight_reg1_dst_addr     <= dsc_flight_reg1_dst_addr + 64'd128;    
    dsc_flight_reg1_dst_length   <= dsc_flight_reg1_dst_length - 28'd128;  
  end
  else begin
    dsc_flight_reg1_dst_addr     <= dsc_flight_reg1_dst_addr;    
    dsc_flight_reg1_dst_length   <= dsc_flight_reg1_dst_length;  
  end
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    dsc_flight_reg2_dst_addr     <= 64'b0;
    dsc_flight_reg2_dst_length   <= 28'b0;
  end
  else if(dsc_flight_reg2_write) begin
    dsc_flight_reg2_dst_addr     <= dsc_dst_align_addr;
    dsc_flight_reg2_dst_length   <= dsc_dst_align_length;
  end
  else if((dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear) & ~dsc_flight_reg3_dst_update) begin
    dsc_flight_reg2_dst_addr     <= dsc_flight_reg3_dst_addr;    
    dsc_flight_reg2_dst_length   <= dsc_flight_reg3_dst_length;  
  end
  else if((dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear) & dsc_flight_reg3_dst_update) begin
    dsc_flight_reg2_dst_addr     <= dsc_flight_reg3_dst_addr + 64'd128;    
    dsc_flight_reg2_dst_length   <= dsc_flight_reg3_dst_length - 28'd128;  
  end
  else if(dsc_flight_reg2_dst_update & ~(dsc_flight_reg1_clear | dsc_flight_reg0_clear)) begin
    dsc_flight_reg2_dst_addr     <= dsc_flight_reg2_dst_addr + 64'd128;    
    dsc_flight_reg2_dst_length   <= dsc_flight_reg2_dst_length - 28'd128;  
  end
  else begin
    dsc_flight_reg2_dst_addr     <= dsc_flight_reg2_dst_addr;    
    dsc_flight_reg2_dst_length   <= dsc_flight_reg2_dst_length;  
  end
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    dsc_flight_reg3_dst_addr     <= 64'b0;
    dsc_flight_reg3_dst_length   <= 28'b0;
  end
  else if(dsc_flight_reg3_write) begin
    dsc_flight_reg3_dst_addr     <= dsc_dst_align_addr;
    dsc_flight_reg3_dst_length   <= dsc_dst_align_length;
  end
  else if(dsc_flight_reg3_clear | dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear) begin
    dsc_flight_reg3_dst_addr     <= 64'b0;
    dsc_flight_reg3_dst_length   <= 28'b0;
  end
  else if(dsc_flight_reg3_dst_update & ~(dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear)) begin
    dsc_flight_reg3_dst_addr     <= dsc_flight_reg3_dst_addr + 64'd128;    
    dsc_flight_reg3_dst_length   <= dsc_flight_reg3_dst_length - 28'd128;  
  end
  else begin
    dsc_flight_reg3_dst_addr     <= dsc_flight_reg3_dst_addr;    
    dsc_flight_reg3_dst_length   <= dsc_flight_reg3_dst_length;  
  end
end

//------------------------------------------------------------------------------
// Local write response
//------------------------------------------------------------------------------
// always ready to receive write resp for now
assign lcl_wr_rsp_ready = 1'b1;

// Update in-flight registers when lcl write response received
assign dsc_flight_reg0_rsp_match = lcl_wr_rsp_valid & lcl_wr_rsp_ready & ~dsc_flight_reg0_complete & (lcl_wr_rsp_axi_id[4:3] == dsc_flight_reg0_ch_id);
assign dsc_flight_reg1_rsp_match = lcl_wr_rsp_valid & lcl_wr_rsp_ready & ~dsc_flight_reg1_complete & (lcl_wr_rsp_axi_id[4:3] == dsc_flight_reg1_ch_id);
assign dsc_flight_reg2_rsp_match = lcl_wr_rsp_valid & lcl_wr_rsp_ready & ~dsc_flight_reg2_complete & (lcl_wr_rsp_axi_id[4:3] == dsc_flight_reg2_ch_id);
assign dsc_flight_reg3_rsp_match = lcl_wr_rsp_valid & lcl_wr_rsp_ready & ~dsc_flight_reg3_complete & (lcl_wr_rsp_axi_id[4:3] == dsc_flight_reg3_ch_id);
assign dsc_flight_reg_rsp_match  = {dsc_flight_reg0_rsp_match, dsc_flight_reg1_rsp_match, dsc_flight_reg2_rsp_match, dsc_flight_reg3_rsp_match};

always@(*) begin
  casez(dsc_flight_reg_rsp_match)
    4'b1???: begin
      dsc_flight_reg0_rsp_update = 1'b1;
      dsc_flight_reg1_rsp_update = 1'b0;
      dsc_flight_reg2_rsp_update = 1'b0;
      dsc_flight_reg3_rsp_update = 1'b0;
    end
    4'b01??: begin
      dsc_flight_reg0_rsp_update = 1'b0;
      dsc_flight_reg1_rsp_update = 1'b1;
      dsc_flight_reg2_rsp_update = 1'b0;
      dsc_flight_reg3_rsp_update = 1'b0;
    end
    4'b001?: begin
      dsc_flight_reg0_rsp_update = 1'b0;
      dsc_flight_reg1_rsp_update = 1'b0;
      dsc_flight_reg2_rsp_update = 1'b1;
      dsc_flight_reg3_rsp_update = 1'b0;
    end
    4'b0001: begin
      dsc_flight_reg0_rsp_update = 1'b0;
      dsc_flight_reg1_rsp_update = 1'b0;
      dsc_flight_reg2_rsp_update = 1'b0;
      dsc_flight_reg3_rsp_update = 1'b1;
    end
    default: begin
      dsc_flight_reg0_rsp_update = 1'b0;
      dsc_flight_reg1_rsp_update = 1'b0;
      dsc_flight_reg2_rsp_update = 1'b0;
      dsc_flight_reg3_rsp_update = 1'b0;
    end
  endcase
end

// one descriptor lcl write cmds have one resp
// when clear and update happened at same cycle
// need to write the shift-in updating value
always@(posedge clk or negedge rst_n) begin
  if(~rst_n) 
    dsc_flight_reg0_complete <= 1'b0;
  else if(dsc_flight_reg0_write) 
    dsc_flight_reg0_complete <= 1'b0;
  else if(dsc_flight_reg0_clear & ~dsc_flight_reg1_rsp_update) 
    dsc_flight_reg0_complete <= dsc_flight_reg1_complete;    
  else if(dsc_flight_reg0_clear & dsc_flight_reg1_rsp_update) 
    dsc_flight_reg0_complete <= 1'b1;    
  else if(dsc_flight_reg0_rsp_update) 
    dsc_flight_reg0_complete <= 1'b1;    
  else 
    dsc_flight_reg0_complete <= dsc_flight_reg0_complete;    
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) 
    dsc_flight_reg1_complete <= 1'b0;
  else if(dsc_flight_reg1_write) 
    dsc_flight_reg1_complete <= 1'b0;
  else if((dsc_flight_reg1_clear | dsc_flight_reg0_clear) & ~dsc_flight_reg2_rsp_update) 
    dsc_flight_reg1_complete <= dsc_flight_reg2_complete;    
  else if((dsc_flight_reg1_clear | dsc_flight_reg0_clear) & dsc_flight_reg2_rsp_update) 
    dsc_flight_reg1_complete <= 1'b1;    
  else if(dsc_flight_reg1_rsp_update & ~dsc_flight_reg0_clear) 
    dsc_flight_reg1_complete <= 1'b1;    
  else 
    dsc_flight_reg1_complete <= dsc_flight_reg1_complete;    
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) 
    dsc_flight_reg2_complete <= 1'b0;
  else if(dsc_flight_reg2_write) 
    dsc_flight_reg2_complete <= 1'b0;
  else if((dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear) & ~dsc_flight_reg3_rsp_update) 
    dsc_flight_reg2_complete <= dsc_flight_reg3_complete;    
  else if((dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear) & dsc_flight_reg3_rsp_update) 
    dsc_flight_reg2_complete <= 1'b1;    
  else if(dsc_flight_reg2_rsp_update & ~(dsc_flight_reg1_clear | dsc_flight_reg0_clear)) 
    dsc_flight_reg2_complete <= 1'b1;    
  else 
    dsc_flight_reg2_complete <= dsc_flight_reg2_complete;    
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) 
    dsc_flight_reg3_complete <= 1'b0;
  else if(dsc_flight_reg3_write) 
    dsc_flight_reg3_complete <= 1'b0;
  else if(dsc_flight_reg3_clear | dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear) 
    dsc_flight_reg3_complete <= 1'b0;
  else if(dsc_flight_reg3_rsp_update & ~(dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear)) 
    dsc_flight_reg3_complete <= 1'b1;    
  else 
    dsc_flight_reg3_complete <= dsc_flight_reg3_complete;    
end

// Update rsp error registers when error resp received
assign dsc_flight_reg0_rsp_err_update = dsc_flight_reg0_rsp_match & lcl_wr_rsp_code;
assign dsc_flight_reg1_rsp_err_update = dsc_flight_reg1_rsp_match & lcl_wr_rsp_code;
assign dsc_flight_reg2_rsp_err_update = dsc_flight_reg2_rsp_match & lcl_wr_rsp_code;
assign dsc_flight_reg3_rsp_err_update = dsc_flight_reg3_rsp_match & lcl_wr_rsp_code;

// when clear and update happened at same cycle
// need to write the shift-in updating value
always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    dsc_flight_reg0_rsp_err        <= 1'b0;
    dsc_flight_reg0_rsp_err_addr   <= 64'b0;
  end
  else if(dsc_flight_reg0_clear & ~dsc_flight_reg1_rsp_err_update) begin
    dsc_flight_reg0_rsp_err        <= dsc_flight_reg1_rsp_err;    
    dsc_flight_reg0_rsp_err_addr   <= dsc_flight_reg1_rsp_err_addr;
  end
  else if(dsc_flight_reg0_clear & dsc_flight_reg1_rsp_err_update) begin
    dsc_flight_reg0_rsp_err        <= lcl_wr_rsp_code;    
    dsc_flight_reg0_rsp_err_addr   <= dsc_flight_reg1_dst_addr;
  end
  else if(dsc_flight_reg0_rsp_err_update) begin
    dsc_flight_reg0_rsp_err        <= lcl_wr_rsp_code;    
    dsc_flight_reg0_rsp_err_addr   <= dsc_flight_reg0_dst_addr;
  end
  else begin
    dsc_flight_reg0_rsp_err        <= dsc_flight_reg0_rsp_err;    
    dsc_flight_reg0_rsp_err_addr   <= dsc_flight_reg0_rsp_err_addr;
  end
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    dsc_flight_reg1_rsp_err        <= 1'b0;
    dsc_flight_reg1_rsp_err_addr   <= 64'b0;
  end
  else if((dsc_flight_reg1_clear | dsc_flight_reg0_clear) & ~dsc_flight_reg2_rsp_err_update) begin
    dsc_flight_reg1_rsp_err        <= dsc_flight_reg2_rsp_err;    
    dsc_flight_reg1_rsp_err_addr   <= dsc_flight_reg2_rsp_err_addr;
  end
  else if((dsc_flight_reg1_clear | dsc_flight_reg0_clear) & dsc_flight_reg2_rsp_err_update) begin
    dsc_flight_reg1_rsp_err        <= lcl_wr_rsp_code;    
    dsc_flight_reg1_rsp_err_addr   <= dsc_flight_reg2_dst_addr;
  end
  else if(dsc_flight_reg1_rsp_err_update & ~dsc_flight_reg0_clear) begin
    dsc_flight_reg1_rsp_err        <= lcl_wr_rsp_code;    
    dsc_flight_reg1_rsp_err_addr   <= dsc_flight_reg1_dst_addr;
  end
  else begin
    dsc_flight_reg1_rsp_err        <= dsc_flight_reg1_rsp_err;    
    dsc_flight_reg1_rsp_err_addr   <= dsc_flight_reg1_rsp_err_addr;
  end
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    dsc_flight_reg2_rsp_err        <= 1'b0;
    dsc_flight_reg2_rsp_err_addr   <= 64'b0;
  end
  else if((dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear) & ~dsc_flight_reg3_rsp_err_update) begin
    dsc_flight_reg2_rsp_err        <= dsc_flight_reg3_rsp_err;    
    dsc_flight_reg2_rsp_err_addr   <= dsc_flight_reg3_rsp_err_addr;
  end
  else if((dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear) & dsc_flight_reg3_rsp_err_update) begin
    dsc_flight_reg2_rsp_err        <= lcl_wr_rsp_code;    
    dsc_flight_reg2_rsp_err_addr   <= dsc_flight_reg3_dst_addr;
  end
  else if(dsc_flight_reg2_rsp_err_update & ~(dsc_flight_reg1_clear | dsc_flight_reg0_clear)) begin
    dsc_flight_reg2_rsp_err        <= lcl_wr_rsp_code;    
    dsc_flight_reg2_rsp_err_addr   <= dsc_flight_reg2_dst_addr;
  end
  else begin
    dsc_flight_reg2_rsp_err        <= dsc_flight_reg2_rsp_err;    
    dsc_flight_reg2_rsp_err_addr   <= dsc_flight_reg2_rsp_err_addr;
  end
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    dsc_flight_reg3_rsp_err        <= 1'b0;
    dsc_flight_reg3_rsp_err_addr   <= 64'b0;
  end
  else if(dsc_flight_reg3_clear | dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear) begin
    dsc_flight_reg3_rsp_err        <= 1'b0;
    dsc_flight_reg3_rsp_err_addr   <= 64'b0;
  end
  else if(dsc_flight_reg3_rsp_err_update & ~(dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear)) begin
    dsc_flight_reg3_rsp_err        <= lcl_wr_rsp_code;    
    dsc_flight_reg3_rsp_err_addr   <= dsc_flight_reg3_dst_addr;
  end
  else begin
    dsc_flight_reg3_rsp_err        <= dsc_flight_reg3_rsp_err;    
    dsc_flight_reg3_rsp_err_addr   <= dsc_flight_reg3_rsp_err_addr;
  end
end

//------------------------------------------------------------------------------
// Descriptor completion
//------------------------------------------------------------------------------
assign dsc_flight_reg0_commit_ready = dsc_flight_reg0_complete & ~dsc_flight_reg0_commit;
assign dsc_flight_reg1_commit_ready = dsc_flight_reg1_complete & ~dsc_flight_reg1_commit;
assign dsc_flight_reg2_commit_ready = dsc_flight_reg2_complete & ~dsc_flight_reg2_commit;
assign dsc_flight_reg3_commit_ready = dsc_flight_reg3_complete & ~dsc_flight_reg3_commit;

assign dsc_flight_reg0_sts_err = dsc_flight_reg0_complete & ((dsc_flight_reg0_src_err != 2'b0) | dsc_flight_reg0_rsp_err);
assign dsc_flight_reg1_sts_err = dsc_flight_reg1_complete & ((dsc_flight_reg1_src_err != 2'b0) | dsc_flight_reg1_rsp_err);
assign dsc_flight_reg2_sts_err = dsc_flight_reg2_complete & ((dsc_flight_reg2_src_err != 2'b0) | dsc_flight_reg2_rsp_err);
assign dsc_flight_reg3_sts_err = dsc_flight_reg3_complete & ((dsc_flight_reg3_src_err != 2'b0) | dsc_flight_reg3_rsp_err);

// Completion data format:
// 511:322 Reserved
// 321:320 Destination error code
// 319:256 Destination error address
// 255:194 Reserved
// 193:192 Source error code
// 191:128 Source error address
// 127: 34 Reserved
//  33: 32 Channel ID
//  31:  2 Descriptor ID
//       1 Completed
//       0 Status error 
assign dsc_flight_reg0_commit_data = {190'b0, 
                                      1'b0, dsc_flight_reg0_rsp_err,
                                      dsc_flight_reg0_rsp_err_addr, 
                                      62'b0,
                                      dsc_flight_reg0_src_err,
                                      dsc_flight_reg0_src_err_addr,
                                      93'b0,
                                      dsc_flight_reg0_intr,
                                      dsc_flight_reg0_ch_id,
                                      dsc_flight_reg0_dsc_id,
                                      dsc_flight_reg0_complete,
                                      dsc_flight_reg0_sts_err};

assign dsc_flight_reg1_commit_data = {190'b0, 
                                      1'b0, dsc_flight_reg1_rsp_err,
                                      dsc_flight_reg1_rsp_err_addr, 
                                      62'b0,
                                      dsc_flight_reg1_src_err,
                                      dsc_flight_reg1_src_err_addr,
                                      93'b0,
                                      dsc_flight_reg1_intr,
                                      dsc_flight_reg1_ch_id,
                                      dsc_flight_reg1_dsc_id,
                                      dsc_flight_reg1_complete,
                                      dsc_flight_reg1_sts_err};
assign dsc_flight_reg2_commit_data = {190'b0, 
                                      1'b0, dsc_flight_reg2_rsp_err,
                                      dsc_flight_reg2_rsp_err_addr, 
                                      62'b0,
                                      dsc_flight_reg2_src_err,
                                      dsc_flight_reg2_src_err_addr,
                                      93'b0,
                                      dsc_flight_reg2_intr,
                                      dsc_flight_reg2_ch_id,
                                      dsc_flight_reg2_dsc_id,
                                      dsc_flight_reg2_complete,
                                      dsc_flight_reg2_sts_err};
assign dsc_flight_reg3_commit_data = {190'b0, 
                                      1'b0, dsc_flight_reg3_rsp_err,
                                      dsc_flight_reg3_rsp_err_addr, 
                                      62'b0,
                                      dsc_flight_reg3_src_err,
                                      dsc_flight_reg3_src_err_addr,
                                      93'b0,
                                      dsc_flight_reg3_intr,
                                      dsc_flight_reg3_ch_id,
                                      dsc_flight_reg3_dsc_id,
                                      dsc_flight_reg3_complete,
                                      dsc_flight_reg3_sts_err};

// generate commit mapping between register set num and channel id
assign dsc_cmp_reg0_ch0_valid = dsc_flight_reg0_commit_ready & (dsc_flight_reg0_ch_id == 2'b00);
assign dsc_cmp_reg0_ch1_valid = dsc_flight_reg0_commit_ready & (dsc_flight_reg0_ch_id == 2'b01);
assign dsc_cmp_reg0_ch2_valid = dsc_flight_reg0_commit_ready & (dsc_flight_reg0_ch_id == 2'b10);
assign dsc_cmp_reg0_ch3_valid = dsc_flight_reg0_commit_ready & (dsc_flight_reg0_ch_id == 2'b11);
assign dsc_cmp_reg1_ch0_valid = dsc_flight_reg1_commit_ready & (dsc_flight_reg1_ch_id == 2'b00);
assign dsc_cmp_reg1_ch1_valid = dsc_flight_reg1_commit_ready & (dsc_flight_reg1_ch_id == 2'b01);
assign dsc_cmp_reg1_ch2_valid = dsc_flight_reg1_commit_ready & (dsc_flight_reg1_ch_id == 2'b10);
assign dsc_cmp_reg1_ch3_valid = dsc_flight_reg1_commit_ready & (dsc_flight_reg1_ch_id == 2'b11);
assign dsc_cmp_reg2_ch0_valid = dsc_flight_reg2_commit_ready & (dsc_flight_reg2_ch_id == 2'b00);
assign dsc_cmp_reg2_ch1_valid = dsc_flight_reg2_commit_ready & (dsc_flight_reg2_ch_id == 2'b01);
assign dsc_cmp_reg2_ch2_valid = dsc_flight_reg2_commit_ready & (dsc_flight_reg2_ch_id == 2'b10);
assign dsc_cmp_reg2_ch3_valid = dsc_flight_reg2_commit_ready & (dsc_flight_reg2_ch_id == 2'b11);
assign dsc_cmp_reg3_ch0_valid = dsc_flight_reg3_commit_ready & (dsc_flight_reg3_ch_id == 2'b00);
assign dsc_cmp_reg3_ch1_valid = dsc_flight_reg3_commit_ready & (dsc_flight_reg3_ch_id == 2'b01);
assign dsc_cmp_reg3_ch2_valid = dsc_flight_reg3_commit_ready & (dsc_flight_reg3_ch_id == 2'b10);
assign dsc_cmp_reg3_ch3_valid = dsc_flight_reg3_commit_ready & (dsc_flight_reg3_ch_id == 2'b11);

// commit the oldest dsc(smallest register set num) of the channel
assign dsc_ch0_cmp_valid = dsc_cmp_reg0_ch0_valid | dsc_cmp_reg1_ch0_valid | dsc_cmp_reg2_ch0_valid | dsc_cmp_reg3_ch0_valid;
assign dsc_ch0_cmp_data  = dsc_cmp_reg0_ch0_valid ? dsc_flight_reg0_commit_data
                             : (dsc_cmp_reg1_ch0_valid ? dsc_flight_reg1_commit_data
                               : (dsc_cmp_reg2_ch0_valid ? dsc_flight_reg2_commit_data
                                 : (dsc_cmp_reg3_ch0_valid ? dsc_flight_reg3_commit_data : 512'b0)));

assign dsc_ch1_cmp_valid = dsc_cmp_reg0_ch1_valid | dsc_cmp_reg1_ch1_valid | dsc_cmp_reg2_ch1_valid | dsc_cmp_reg3_ch1_valid;
assign dsc_ch1_cmp_data  = dsc_cmp_reg0_ch1_valid ? dsc_flight_reg0_commit_data
                             : (dsc_cmp_reg1_ch1_valid ? dsc_flight_reg1_commit_data
                               : (dsc_cmp_reg2_ch1_valid ? dsc_flight_reg2_commit_data
                                 : (dsc_cmp_reg3_ch1_valid ? dsc_flight_reg3_commit_data : 512'b0)));

assign dsc_ch2_cmp_valid = dsc_cmp_reg0_ch2_valid | dsc_cmp_reg1_ch2_valid | dsc_cmp_reg2_ch2_valid | dsc_cmp_reg3_ch2_valid;
assign dsc_ch2_cmp_data  = dsc_cmp_reg0_ch2_valid ? dsc_flight_reg0_commit_data
                             : (dsc_cmp_reg1_ch2_valid ? dsc_flight_reg1_commit_data
                               : (dsc_cmp_reg2_ch2_valid ? dsc_flight_reg2_commit_data
                                 : (dsc_cmp_reg3_ch2_valid ? dsc_flight_reg3_commit_data : 512'b0)));

assign dsc_ch3_cmp_valid = dsc_cmp_reg0_ch3_valid | dsc_cmp_reg1_ch3_valid | dsc_cmp_reg2_ch3_valid | dsc_cmp_reg3_ch3_valid;
assign dsc_ch3_cmp_data  = dsc_cmp_reg0_ch3_valid ? dsc_flight_reg0_commit_data
                            : (dsc_cmp_reg1_ch3_valid ? dsc_flight_reg1_commit_data
                               : (dsc_cmp_reg2_ch3_valid ? dsc_flight_reg2_commit_data
                                 : (dsc_cmp_reg3_ch3_valid ? dsc_flight_reg3_commit_data : 512'b0)));

// Update in-flight registers commit bit commit done
assign dsc_flight_reg0_commit_update = (dsc_cmp_reg0_ch0_valid & dsc_ch0_cmp_ready)
                                     | (dsc_cmp_reg0_ch1_valid & dsc_ch1_cmp_ready)
                                     | (dsc_cmp_reg0_ch2_valid & dsc_ch2_cmp_ready)
                                     | (dsc_cmp_reg0_ch3_valid & dsc_ch3_cmp_ready);
assign dsc_flight_reg1_commit_update = (~dsc_cmp_reg0_ch0_valid & dsc_cmp_reg1_ch0_valid & dsc_ch0_cmp_ready)
                                     | (~dsc_cmp_reg0_ch1_valid & dsc_cmp_reg1_ch1_valid & dsc_ch1_cmp_ready)
                                     | (~dsc_cmp_reg0_ch2_valid & dsc_cmp_reg1_ch2_valid & dsc_ch2_cmp_ready)
                                     | (~dsc_cmp_reg0_ch3_valid & dsc_cmp_reg1_ch3_valid & dsc_ch3_cmp_ready);
assign dsc_flight_reg2_commit_update = (~dsc_cmp_reg0_ch0_valid & ~dsc_cmp_reg1_ch0_valid & dsc_cmp_reg2_ch0_valid & dsc_ch0_cmp_ready)
                                     | (~dsc_cmp_reg0_ch1_valid & ~dsc_cmp_reg1_ch1_valid & dsc_cmp_reg2_ch1_valid & dsc_ch1_cmp_ready)
                                     | (~dsc_cmp_reg0_ch2_valid & ~dsc_cmp_reg1_ch2_valid & dsc_cmp_reg2_ch2_valid & dsc_ch2_cmp_ready)
                                     | (~dsc_cmp_reg0_ch3_valid & ~dsc_cmp_reg1_ch3_valid & dsc_cmp_reg2_ch3_valid & dsc_ch3_cmp_ready);
assign dsc_flight_reg3_commit_update = (~dsc_cmp_reg0_ch0_valid & ~dsc_cmp_reg1_ch0_valid & ~dsc_cmp_reg2_ch0_valid & dsc_cmp_reg3_ch0_valid & dsc_ch0_cmp_ready)
                                     | (~dsc_cmp_reg0_ch1_valid & ~dsc_cmp_reg1_ch1_valid & ~dsc_cmp_reg2_ch1_valid & dsc_cmp_reg3_ch1_valid & dsc_ch1_cmp_ready)
                                     | (~dsc_cmp_reg0_ch2_valid & ~dsc_cmp_reg1_ch2_valid & ~dsc_cmp_reg2_ch2_valid & dsc_cmp_reg3_ch2_valid & dsc_ch2_cmp_ready)
                                     | (~dsc_cmp_reg0_ch3_valid & ~dsc_cmp_reg1_ch3_valid & ~dsc_cmp_reg2_ch3_valid & dsc_cmp_reg3_ch3_valid & dsc_ch3_cmp_ready);

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    dsc_flight_reg0_commit <= 1'b0;
  else if(dsc_flight_reg0_clear & ~dsc_flight_reg1_commit_update)
    dsc_flight_reg0_commit <= dsc_flight_reg1_commit;    
  else if((dsc_flight_reg0_clear & dsc_flight_reg1_commit_update) | dsc_flight_reg0_commit_update)
    dsc_flight_reg0_commit <= 1'b1;    
  else
    dsc_flight_reg0_commit <= dsc_flight_reg0_commit;    
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    dsc_flight_reg1_commit <= 1'b0;
  else if((dsc_flight_reg1_clear | dsc_flight_reg0_clear) & ~dsc_flight_reg2_commit_update)
    dsc_flight_reg1_commit <= dsc_flight_reg2_commit;    
  else if(((dsc_flight_reg1_clear | dsc_flight_reg0_clear) & dsc_flight_reg2_commit_update)
         | (dsc_flight_reg1_commit_update & ~dsc_flight_reg0_clear))
    dsc_flight_reg1_commit <= 1'b1;    
  else
    dsc_flight_reg1_commit <= dsc_flight_reg1_commit;    
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    dsc_flight_reg2_commit <= 1'b0;
  else if((dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear) & ~dsc_flight_reg3_commit_update)
    dsc_flight_reg2_commit <= dsc_flight_reg3_commit;    
  else if(((dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear) & dsc_flight_reg3_commit_update)
         | (dsc_flight_reg2_commit_update & ~(dsc_flight_reg1_clear | dsc_flight_reg0_clear)))
    dsc_flight_reg2_commit <= 1'b1;    
  else
    dsc_flight_reg2_commit <= dsc_flight_reg2_commit;    
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    dsc_flight_reg3_commit <= 1'b0;
  else if(dsc_flight_reg3_clear | dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear)
    dsc_flight_reg3_commit <= 1'b0;    
  else if(dsc_flight_reg3_commit_update & ~(dsc_flight_reg2_clear | dsc_flight_reg1_clear | dsc_flight_reg0_clear))
    dsc_flight_reg3_commit <= 1'b1;    
  else
    dsc_flight_reg3_commit <= dsc_flight_reg3_commit;    
end

// Clear in-flight register set
assign dsc_flight_reg0_clear = dsc_flight_reg0_commit & ~rd_fsm_state_write_reg;
assign dsc_flight_reg1_clear = dsc_flight_reg1_commit & ~dsc_flight_reg0_commit & ~rd_fsm_state_write_reg;
assign dsc_flight_reg2_clear = dsc_flight_reg2_commit & ~dsc_flight_reg1_commit & ~dsc_flight_reg0_commit & ~rd_fsm_state_write_reg;
assign dsc_flight_reg3_clear = dsc_flight_reg3_commit & ~dsc_flight_reg2_commit & ~dsc_flight_reg1_commit & ~dsc_flight_reg0_commit & ~rd_fsm_state_write_reg;

endmodule
