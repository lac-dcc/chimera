// This program was cloned from: https://github.com/OpenCAPI/ThymesisFlow
// License: Apache License 2.0

// *!***************************************************************************
// *! Copyright 2019 International Business Machines
// *!
// *! Licensed under the Apache License, Version 2.0 (the "License");
// *! you may not use this file except in compliance with the License.
// *! You may obtain a copy of the License at
// *! http://www.apache.org/licenses/LICENSE-2.0 
// *!
// *! The patent license granted to you in Section 3 of the License, as applied
// *! to the "Work," hereby includes implementations of the Work in physical form.  
// *!
// *! Unless required by applicable law or agreed to in writing, the reference design
// *! distributed under the License is distributed on an "AS IS" BASIS,
// *! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// *! See the License for the specific language governing permissions and
// *! limitations under the License.
// *! 
// *! The background Specification upon which this is based is managed by and available from
// *! the OpenCAPI Consortium.  More information can be found at https://opencapi.org. 
// *!***************************************************************************
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2016 09:12:01 AM
// Design Name: 
// Module Name: tlx_rcv_mac
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ocx_tlx_rcv_mac
    #(
    parameter cmd_addr_width = 6,
    parameter resp_addr_width = 7,
    parameter cmd_data_addr_width = 7,
    parameter resp_data_addr_width = 8
    )
    (
    //Parser Inputs
    input fp_rcv_cmd_valid,
    input [167:0] fp_rcv_cmd_info,
    input fp_rcv_cmd_data_v,
    input [511:0] fp_rcv_cmd_data_bus,
    input fp_rcv_resp_valid,
    input [55:0] fp_rcv_resp_info,
    input fp_rcv_resp_data_v,
    input [511:0] fp_rcv_resp_data_bus,
    input data_hold_vc0,
    input data_hold_vc1,
    input [7:0] bad_data_indicator,
    input good_crc,    
    input bookend_flit_v,
    input [3:0] run_length,
    input [1:0] data_arb_vc_v,
    input [1:0] data_arb_flit_cnt, 
    input control_parsing_start,
    input control_parsing_end,
    input ctl_flit_start,      
    input cfg_data_v,  
    input cfg_data_cnt_v,
    input [31:0] cfg_data_bus,
    input cmd_credit_enable,
    input bdi_cfg_hint,
    //Credit return sideband
    output rcv_xmt_credit_vc0_v,
    output rcv_xmt_credit_vc1_v,
    output rcv_xmt_credit_dcp0_v,
    output rcv_xmt_credit_dcp1_v,
    output rcv_xmt_tl_crd_cfg_dcp1_valid,
    //TLX to AFU Outputs
    output tlx_afu_resp_valid,
    output [7:0] tlx_afu_resp_opcode,
    output [15:0] tlx_afu_resp_tag,
    output [3:0] tlx_afu_resp_code,
    output [5:0] tlx_afu_resp_pg_size,
    output [1:0] tlx_afu_resp_dl,
    output [1:0] tlx_afu_resp_dp,
    output [23:0] tlx_afu_resp_host_tag,
    output [17:0] tlx_afu_resp_addr_tag,
    output [3:0] tlx_afu_resp_cache_state,
    //TLX resp Data Flow
    output tlx_afu_resp_data_valid,
    output [511:0] tlx_afu_resp_data_bus,
    input afu_tlx_resp_rd_req,
    input [2:0] afu_tlx_resp_rd_cnt,
    input afu_tlx_resp_credit,
    input [6:0] afu_tlx_resp_initial_credit,
    output tlx_afu_resp_data_bdi,
    //TLX CMD Outputs
    output tlx_afu_cmd_valid,
    output [7:0] tlx_afu_cmd_opcode,
    output [1:0] tlx_afu_cmd_dl,
    output tlx_afu_cmd_end,
    output [63:0] tlx_afu_cmd_pa,
    output [3:0] tlx_afu_cmd_flag,
    output tlx_afu_cmd_os,
    output [2:0] tlx_afu_cmd_pl,
    output [63:0] tlx_afu_cmd_be,
    //output tlx_afu_cmd_t,
    output [15:0] tlx_afu_cmd_tag,
    //TLX CMD data flow
    output tlx_afu_cmd_data_valid,
    output [511:0] tlx_afu_cmd_data_bus,
    output tlx_afu_cmd_data_bdi,
    input afu_tlx_cmd_rd_req,
    input [2:0] afu_tlx_cmd_rd_cnt,
    input afu_tlx_cmd_credit,
    input [6:0] afu_tlx_cmd_initial_credit, 

    //CFG AFU
    input cfg_tlx_credit_return,
    input [3:0] cfg_tlx_initial_credit,
    output tlx_cfg_valid,     
    output [7:0] tlx_cfg_opcode,
    output [63:0] tlx_cfg_pa,
    output tlx_cfg_t,
    output [2:0] tlx_cfg_pl,
    output [15:0] tlx_cfg_capptag,
    output tlx_afu_cfg_data_bdi,
    output [31:0] tlx_cfg_data_bus,          
    //CRC FLUSH
    input  crc_flush_done,
    input  crc_flush_inprog,       
    //
    input crc_error,
    input tlx_clk,
    input reset_n
    );  
wire cmd_fifo_wr_ena;
wire resp_fifo_wr_ena;
wire cfg_rd_enable;
wire cmd_cfg_data_wr_v;
        
wire rcv_xmt_tl_crd_cfg_dcp1_valid_cmd;
wire rcv_xmt_tl_crd_cfg_dcp1_valid_cfg;
        
//parameter cmd_addr_width = 6;
//parameter resp_addr_width = 7;     
//parameter cmd_data_addr_width = 7;
//parameter resp_data_addr_width = 8;   

assign cmd_cfg_data_wr_v = cmd_fifo_wr_ena | cfg_data_cnt_v;

assign rcv_xmt_tl_crd_cfg_dcp1_valid = rcv_xmt_tl_crd_cfg_dcp1_valid_cmd | rcv_xmt_tl_crd_cfg_dcp1_valid_cfg;

//TLX Command Fifo and control logic    
ocx_tlx_cmd_fifo_mac #(.cmd_addr_width(cmd_addr_width)) 
    CMD_FIFO_MAC(
    .tlx_clk(tlx_clk),
    .reset_n(reset_n),
    .crc_flush_inprog(crc_flush_inprog),
    .crc_flush_done(crc_flush_done), 
    .crc_error(crc_error),
    .tlx_afu_valid(tlx_afu_cmd_valid),
    .tlx_afu_opcode(tlx_afu_cmd_opcode),
    .tlx_afu_dl(tlx_afu_cmd_dl),
    .tlx_afu_endian(tlx_afu_cmd_end),
    .tlx_afu_pa(tlx_afu_cmd_pa),
    .tlx_afu_flag(tlx_afu_cmd_flag),
    .tlx_afu_os(tlx_afu_cmd_os),
    //.tlx_afu_t(tlx_afu_cmd_t),
    .tlx_afu_tag(tlx_afu_cmd_tag),
    .tlx_afu_pl(tlx_afu_cmd_pl),
    .tlx_afu_be(tlx_afu_cmd_be),
    .tlx_cfg_valid(tlx_cfg_valid),
    .tlx_cfg_opcode(tlx_cfg_opcode),
    .tlx_cfg_pa(tlx_cfg_pa),
    .tlx_cfg_pl(tlx_cfg_pl),
    .tlx_cfg_t(tlx_cfg_t),
    .tlx_cfg_capptag(tlx_cfg_capptag),
    .bookend_flit_v(bookend_flit_v),
    .cmd_fifo_wr_ena(cmd_cfg_data_wr_v),
    .afu_tlx_cmd_initial_credit(afu_tlx_cmd_initial_credit),
    .rcv_xmt_credit_v(rcv_xmt_credit_vc1_v),
    .afu_tlx_cmd_credit(afu_tlx_cmd_credit),
    .cfg_tlx_credit_return(cfg_tlx_credit_return),
    .cfg_tlx_initial_credit(cfg_tlx_initial_credit),
    .rcv_xmt_tl_crd_cfg_dcp1_valid(rcv_xmt_tl_crd_cfg_dcp1_valid_cmd),
    .cfg_rd_enable(cfg_rd_enable),
    .cmd_credit_enable(cmd_credit_enable),
    .fp_rcv_info(fp_rcv_cmd_info),
    .fp_rcv_valid(fp_rcv_cmd_valid),
    .data_arb_flit_cnt(data_arb_flit_cnt),
    .control_parsing_start(control_parsing_start),
    .control_parsing_end(control_parsing_end),        
    .data_hold_vc1(data_hold_vc1)
);
//TLX Resp Fifo and control logic     
ocx_tlx_resp_fifo_mac #(.resp_addr_width(resp_addr_width))
    RESP_FIFO_MAC(
    .tlx_clk(tlx_clk),
    .reset_n(reset_n),
    .crc_flush_inprog(crc_flush_inprog),
    .crc_flush_done(crc_flush_done), 
    .crc_error(crc_error),    
    .tlx_afu_valid(tlx_afu_resp_valid),
    .tlx_afu_resp_opcode(tlx_afu_resp_opcode),
    .tlx_afu_resp_tag(tlx_afu_resp_tag),
    .tlx_afu_resp_code(tlx_afu_resp_code),
    .tlx_afu_resp_pg_size(tlx_afu_resp_pg_size),
    .tlx_afu_resp_dl(tlx_afu_resp_dl),
    .tlx_afu_resp_dp(tlx_afu_resp_dp),
    .tlx_afu_resp_host_tag(tlx_afu_resp_host_tag),
    .tlx_afu_resp_addr_tag(tlx_afu_resp_addr_tag),
    .bookend_flit_v(bookend_flit_v),
    .resp_fifo_wr_ena(resp_fifo_wr_ena),
    .tlx_afu_resp_cache_state(tlx_afu_resp_cache_state),
    .afu_tlx_resp_initial_credit(afu_tlx_resp_initial_credit),
    .rcv_xmt_credit_v(rcv_xmt_credit_vc0_v),
    .afu_tlx_resp_credit(afu_tlx_resp_credit),
    .fp_rcv_info(fp_rcv_resp_info),
    .fp_rcv_valid(fp_rcv_resp_valid),
    .data_arb_flit_cnt(data_arb_flit_cnt),
    .control_parsing_start(control_parsing_start), 
    .control_parsing_end(control_parsing_end),   
    .data_hold_vc0(data_hold_vc0)
);
//TLX Command Data Fifo and control logic 
ocx_tlx_data_fifo_mac #(
    .cmd_addr_width(cmd_data_addr_width),
    .resp_addr_width(resp_data_addr_width)
    ) DATA_FIFO_MAC(
    .bookend_flit_v(bookend_flit_v),
    .fp_rcv_cmd_data_v(fp_rcv_cmd_data_v),
    .fp_rcv_cmd_data_bus(fp_rcv_cmd_data_bus),
    .tlx_afu_cmd_data_valid(tlx_afu_cmd_data_valid),
    .tlx_afu_cmd_data_bus(tlx_afu_cmd_data_bus),
    .afu_tlx_cmd_rd_req(afu_tlx_cmd_rd_req),
    .afu_tlx_cmd_rd_cnt(afu_tlx_cmd_rd_cnt),
    .rcv_xmt_credit_dcp1_v(rcv_xmt_credit_dcp1_v),
    .fp_rcv_resp_data_v(fp_rcv_resp_data_v),
    .fp_rcv_resp_data_bus(fp_rcv_resp_data_bus),
    .tlx_afu_resp_data_valid(tlx_afu_resp_data_valid),
    .tlx_afu_resp_data_bus(tlx_afu_resp_data_bus),
    .afu_tlx_resp_rd_req(afu_tlx_resp_rd_req),
    .afu_tlx_resp_rd_cnt(afu_tlx_resp_rd_cnt),
    .rcv_xmt_credit_dcp0_v(rcv_xmt_credit_dcp0_v),
    .tlx_afu_cmd_data_bdi(tlx_afu_cmd_data_bdi),
    .tlx_afu_cfg_data_bdi(tlx_afu_cfg_data_bdi),
    .tlx_afu_resp_data_bdi(tlx_afu_resp_data_bdi),
    .bad_data_indicator(bad_data_indicator),
    .data_arb_vc_v              (data_arb_vc_v),          
    .data_arb_flit_cnt          (data_arb_flit_cnt),          
    .run_length                 (run_length),    
    .ctl_flit_start(ctl_flit_start),
    .bdi_cfg_hint(bdi_cfg_hint),
    .good_crc(good_crc),
    .crc_flush_inprog(crc_flush_inprog),
    .crc_flush_done(crc_flush_done),    
    .resp_fifo_wr_ena(resp_fifo_wr_ena),
    .cmd_fifo_wr_ena(cmd_fifo_wr_ena),
    .cfg_rd_enable(cfg_rd_enable),
    .tlx_clk(tlx_clk),
    .crc_error(crc_error),
    .reset_n(reset_n)
); 
ocx_tlx_cfg_mac #(
   .addr_width(cmd_addr_width)
   ) CFG_MAC(
   .tlx_clk(tlx_clk),
   .reset_n(reset_n),
   .crc_error(crc_error), 
   .cfg_data_v(cfg_data_v),
   .cfg_data_bus(cfg_data_bus),
   .cfg_rd_ena(cfg_rd_enable),
   .rcv_xmt_tl_crd_cfg_dcp1_valid(rcv_xmt_tl_crd_cfg_dcp1_valid_cfg),
   .tlx_cfg_data_bus(tlx_cfg_data_bus),
   .good_crc(good_crc),
   .crc_flush_inprog(crc_flush_inprog),
   .crc_flush_done(crc_flush_done)
   );  
        
endmodule
