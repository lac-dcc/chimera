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
// Create Date: 06/16/2016 09:14:25 AM
// Design Name: 
// Module Name: tlx_rcv_top 
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: TLX RX Top Level, VC0=Responses, VC1=Commands
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:add link up logic(only used for initial credits)?
// 
//////////////////////////////////////////////////////////////////////////////////


module ocx_tlx_rcv_top
    #(
    parameter cmd_addr_width = 6,
    parameter resp_addr_width = 7,
    parameter cmd_data_addr_width = 7,
    parameter resp_data_addr_width = 8
    )
    (
    output tlx_afu_resp_valid,
    output [7:0] tlx_afu_resp_opcode,
    output [15:0] tlx_afu_resp_afutag,
    output [3:0] tlx_afu_resp_code,
    output [5:0] tlx_afu_resp_pg_size,
    output [1:0] tlx_afu_resp_dl,
    output [1:0] tlx_afu_resp_dp,
    output [23:0] tlx_afu_resp_host_tag,
    output [17:0] tlx_afu_resp_addr_tag,
    output [3:0] tlx_afu_resp_cache_state,
    output tlx_afu_resp_data_valid,
    output [511:0] tlx_afu_resp_data_bus,
    output tlx_afu_resp_data_bdi,
    output [3:0] rcv_xmt_tlx_credit_vc0,
    output [3:0] rcv_xmt_tlx_credit_vc3,
    output [5:0] rcv_xmt_tlx_credit_dcp0,
    output [5:0] rcv_xmt_tlx_credit_dcp3,
    output rcv_xmt_tlx_credit_valid,
    output rcv_xmt_tl_credit_vc0_valid,
    output rcv_xmt_tl_credit_vc1_valid,
    output rcv_xmt_tl_credit_dcp0_valid,
    output rcv_xmt_tl_credit_dcp1_valid,
    output rcv_xmt_tl_crd_cfg_dcp1_valid,
    output [31:0] rcv_xmt_debug_info,
    output rcv_xmt_debug_valid,
    output rcv_xmt_debug_fatal,
    input  afu_tlx_resp_rd_req,
    input  [2:0] afu_tlx_resp_rd_cnt,
    input  afu_tlx_resp_credit,
    input  [6:0] afu_tlx_resp_initial_credit,
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
    output [15:0] tlx_afu_cmd_capptag,
    output tlx_afu_cmd_data_valid,
    output [511:0] tlx_afu_cmd_data_bus,
    output tlx_afu_cmd_data_bdi,
    //CFG AFU
    input cfg_tlx_credit_return,
    input [3:0] cfg_tlx_initial_credit,
    output tlx_cfg_valid,     
    output [7:0] tlx_cfg_opcode,
    output [63:0] tlx_cfg_pa,
    output tlx_cfg_t,
    output [2:0] tlx_cfg_pl,
    output [15:0] tlx_cfg_capptag,
    output tlx_cfg_data_bdi,
    output [31:0] tlx_cfg_data_bus,     
    output tlx_afu_ready,
    output tlx_cfg_in_rcv_tmpl_capability_0,
    output tlx_cfg_in_rcv_tmpl_capability_1,
    output tlx_cfg_in_rcv_tmpl_capability_2,
    output tlx_cfg_in_rcv_tmpl_capability_3,
    output [3:0] tlx_cfg_in_rcv_rate_capability_0,
    output [3:0] tlx_cfg_in_rcv_rate_capability_1,
    output [3:0] tlx_cfg_in_rcv_rate_capability_2,
    output [3:0] tlx_cfg_in_rcv_rate_capability_3,
    input  afu_tlx_cmd_rd_req,
    input  [2:0] afu_tlx_cmd_rd_cnt,
    input  afu_tlx_cmd_credit,
    input  [6:0] afu_tlx_cmd_initial_credit,
    input  [511:0] dlx_tlx_flit,
    input  dlx_tlx_flit_valid,
    input  dlx_tlx_flit_crc_err,
    input  dlx_tlx_link_up,
    input  tlx_clk,
    input  reset_n
    );
wire fp_rcv_cmd_valid;
wire [167:0] fp_rcv_cmd_info;
wire fp_rcv_cmd_data_v;
wire [511:0] fp_rcv_cmd_data_bus;
wire fp_rcv_resp_valid;
wire [55:0] fp_rcv_resp_info;
wire fp_rcv_resp_data_v;
wire [511:0] fp_rcv_resp_data_bus;
wire [7:0] bad_data_indicator;
wire bookend_flit_v;
wire good_crc;
wire [1:0] data_arb_vc_v;
wire [1:0] data_arb_flit_cnt;
wire [3:0] run_length;
wire control_parsing_start;
wire control_parsing_end;
wire ctl_flit_start;
// wire [55:0] credit_return_out;
// wire credit_return_v_out;
wire pars_ctl_valid;
wire [167:0] pars_ctl_info;
wire [27:0] template0_slot0;
wire [5:0] ctl_template;
wire cfg_data_v;
wire [31:0] cfg_data_bus;
wire cmd_credit_enable;
wire bdi_cfg_hint;
wire data_hold_vc0;
wire data_hold_vc1;
wire crc_flush_inprog;
wire crc_flush_done;
wire crc_error;
wire cfg_data_cnt_v;
wire parser_inprog;
wire template0_slot0_v;
//Assign Receive Capability Outputs
assign tlx_cfg_in_rcv_tmpl_capability_0 = 1'b1;
assign tlx_cfg_in_rcv_tmpl_capability_1 = 1'b1;
assign tlx_cfg_in_rcv_tmpl_capability_2 = 1'b1;
assign tlx_cfg_in_rcv_tmpl_capability_3 = 1'b1;
//Minimum rate limit for templates
assign tlx_cfg_in_rcv_rate_capability_0 = 4'b0000; 
assign tlx_cfg_in_rcv_rate_capability_1 = 4'b0011;
assign tlx_cfg_in_rcv_rate_capability_2 = 4'b0111;
assign tlx_cfg_in_rcv_rate_capability_3 = 4'b0010;
assign tlx_afu_ready = dlx_tlx_link_up;//NJO TODO Add error cases to pull ready down
    ocx_tlx_parse_mac TLX_Parser(
        .fp_rcv_cmd_valid           (fp_rcv_cmd_valid),
        .fp_rcv_cmd_info            (fp_rcv_cmd_info),
        .fp_rcv_cmd_data_v          (fp_rcv_cmd_data_v),
        .fp_rcv_cmd_data_bus        (fp_rcv_cmd_data_bus),
        .fp_rcv_resp_valid          (fp_rcv_resp_valid),
        .fp_rcv_resp_info           (fp_rcv_resp_info),
        .fp_rcv_resp_data_v         (fp_rcv_resp_data_v),
        .fp_rcv_resp_data_bus       (fp_rcv_resp_data_bus),
        .rcv_xmt_credit_tlx_v       (rcv_xmt_tlx_credit_valid),
        .rcv_xmt_credit_vcx0        (rcv_xmt_tlx_credit_vc0),
        .rcv_xmt_credit_vcx3        (rcv_xmt_tlx_credit_vc3),
        .rcv_xmt_credit_dcpx0       (rcv_xmt_tlx_credit_dcp0),
        .rcv_xmt_credit_dcpx3       (rcv_xmt_tlx_credit_dcp3),
        .data_arb_vc_v              (data_arb_vc_v),          
        .data_arb_flit_cnt          (data_arb_flit_cnt),          
        .run_length                 (run_length),          
        .dlx_tlx_flit               (dlx_tlx_flit),
        .dlx_tlx_flit_valid         (dlx_tlx_flit_valid),
        .dlx_tlx_flit_crc_err       (dlx_tlx_flit_crc_err),
        .data_hold_vc0              (data_hold_vc0),
        .data_hold_vc1              (data_hold_vc1),
        .control_parsing_start      (control_parsing_start),
        .control_parsing_end        (control_parsing_end),
        .ctl_flit_start             (ctl_flit_start),
        .bad_data_indicator         (bad_data_indicator),            
        .bookend_flit_v             (bookend_flit_v),
        .good_crc                   (good_crc),
        .crc_flush_inprog           (crc_flush_inprog),
        .crc_flush_done             (crc_flush_done),        
        .parser_inprog              (parser_inprog),
        .template0_slot0            (template0_slot0),
        .template0_slot0_v          (template0_slot0_v),
        .ctl_template               (ctl_template),  
        .pars_ctl_info      (pars_ctl_info),            //Output
        .pars_ctl_valid     (pars_ctl_valid),           //Output   
//      .credit_return_out(credit_return_out),
//      .credit_return_v_out(credit_return_v_out),           
        .crc_error                  (crc_error),
        .bdi_cfg_hint(bdi_cfg_hint),
        .cfg_data_v                 (cfg_data_v),
        .cfg_data_cnt_v             (cfg_data_cnt_v),
        .cfg_data_bus               (cfg_data_bus),
        .cmd_credit_enable          (cmd_credit_enable),
        .reset_n                    (reset_n),
        .tlx_clk                    (tlx_clk) 
        );


    ocx_tlx_rcv_mac #(
        .cmd_addr_width             (cmd_addr_width),
        .resp_addr_width            (resp_addr_width),
        .cmd_data_addr_width        (cmd_data_addr_width),
        .resp_data_addr_width       (resp_data_addr_width)
    ) TLX_RCV_FIFO(
        //Bad data indicator
        .bad_data_indicator         (bad_data_indicator),
        .bookend_flit_v             (bookend_flit_v),
        .data_arb_vc_v              (data_arb_vc_v),          
        .data_arb_flit_cnt          (data_arb_flit_cnt),          
        .run_length                 (run_length),
        .control_parsing_start      (control_parsing_start),
        .control_parsing_end        (control_parsing_end),        
        //Parser Inputs
        .fp_rcv_cmd_valid(fp_rcv_cmd_valid),
        .fp_rcv_cmd_info(fp_rcv_cmd_info),
        .fp_rcv_cmd_data_v(fp_rcv_cmd_data_v),
        .fp_rcv_cmd_data_bus(fp_rcv_cmd_data_bus),
        .fp_rcv_resp_valid(fp_rcv_resp_valid),
        .fp_rcv_resp_info(fp_rcv_resp_info),
        .fp_rcv_resp_data_v(fp_rcv_resp_data_v),
        .fp_rcv_resp_data_bus(fp_rcv_resp_data_bus),
        .cfg_data_cnt_v(cfg_data_cnt_v),
        .cfg_data_v(cfg_data_v),
        .cfg_data_bus(cfg_data_bus),
        .cmd_credit_enable(cmd_credit_enable),
        .bdi_cfg_hint(bdi_cfg_hint),
        //Credit return sideband
        .rcv_xmt_credit_vc0_v (rcv_xmt_tl_credit_vc0_valid),
        .rcv_xmt_credit_vc1_v (rcv_xmt_tl_credit_vc1_valid),
        .rcv_xmt_credit_dcp0_v(rcv_xmt_tl_credit_dcp0_valid),
        .rcv_xmt_credit_dcp1_v(rcv_xmt_tl_credit_dcp1_valid),
        .rcv_xmt_tl_crd_cfg_dcp1_valid(rcv_xmt_tl_crd_cfg_dcp1_valid),
        //TLX to AFU Outputs
        .tlx_afu_resp_valid(tlx_afu_resp_valid),
        .tlx_afu_resp_opcode(tlx_afu_resp_opcode),
        .tlx_afu_resp_tag(tlx_afu_resp_afutag),
        .tlx_afu_resp_code(tlx_afu_resp_code),
        .tlx_afu_resp_pg_size(tlx_afu_resp_pg_size),
        .tlx_afu_resp_dl(tlx_afu_resp_dl),
        .tlx_afu_resp_dp(tlx_afu_resp_dp),
        .tlx_afu_resp_host_tag(tlx_afu_resp_host_tag),
        .tlx_afu_resp_addr_tag(tlx_afu_resp_addr_tag),
        .tlx_afu_resp_cache_state(tlx_afu_resp_cache_state),
        //TLX resp Data Flow
        .tlx_afu_resp_data_valid(tlx_afu_resp_data_valid),
        .tlx_afu_resp_data_bus(tlx_afu_resp_data_bus),
        .tlx_afu_resp_data_bdi(tlx_afu_resp_data_bdi),
        .afu_tlx_resp_rd_req(afu_tlx_resp_rd_req),
        .afu_tlx_resp_rd_cnt(afu_tlx_resp_rd_cnt),
        .afu_tlx_resp_credit(afu_tlx_resp_credit),
        .afu_tlx_resp_initial_credit(afu_tlx_resp_initial_credit),
        //TLX CMD Outputs
        .tlx_afu_cmd_valid(tlx_afu_cmd_valid),
        .tlx_afu_cmd_opcode(tlx_afu_cmd_opcode),
        .tlx_afu_cmd_dl(tlx_afu_cmd_dl),
        .tlx_afu_cmd_end(tlx_afu_cmd_end),
        .tlx_afu_cmd_pa(tlx_afu_cmd_pa),
        .tlx_afu_cmd_flag(tlx_afu_cmd_flag),
        .tlx_afu_cmd_os(tlx_afu_cmd_os),
        //.tlx_afu_cmd_t(tlx_afu_cmd_t),
        .tlx_afu_cmd_tag(tlx_afu_cmd_capptag),
        .tlx_afu_cmd_pl(tlx_afu_cmd_pl),
        .tlx_afu_cmd_be(tlx_afu_cmd_be),
        //TLX CMD data flow
        .tlx_afu_cmd_data_bdi(tlx_afu_cmd_data_bdi),            
        .tlx_afu_cmd_data_valid(tlx_afu_cmd_data_valid),
        .tlx_afu_cmd_data_bus(tlx_afu_cmd_data_bus),
        .afu_tlx_cmd_rd_req(afu_tlx_cmd_rd_req),
        .afu_tlx_cmd_rd_cnt(afu_tlx_cmd_rd_cnt),
        .afu_tlx_cmd_credit(afu_tlx_cmd_credit),
        .afu_tlx_cmd_initial_credit(afu_tlx_cmd_initial_credit),
        .cfg_tlx_credit_return(cfg_tlx_credit_return),
        .cfg_tlx_initial_credit(cfg_tlx_initial_credit), 
        .tlx_cfg_valid(tlx_cfg_valid),
        .tlx_cfg_opcode(tlx_cfg_opcode),
        .tlx_cfg_pa(tlx_cfg_pa),
        .tlx_cfg_t(tlx_cfg_t),
        .tlx_cfg_capptag(tlx_cfg_capptag),
        .tlx_cfg_pl(tlx_cfg_pl), 
        .tlx_afu_cfg_data_bdi(tlx_cfg_data_bdi), 
        .tlx_cfg_data_bus(tlx_cfg_data_bus),             
        .data_hold_vc0(data_hold_vc0),
        .data_hold_vc1(data_hold_vc1),
        .ctl_flit_start(ctl_flit_start),
        .good_crc(good_crc),
        .crc_flush_inprog(crc_flush_inprog),
        .crc_flush_done(crc_flush_done),         
        .tlx_clk(tlx_clk),
        .crc_error(crc_error),
        .reset_n(reset_n)
         );
         
    ocx_tlx_parser_err_mac TLX_PAR_ERR(
        //Bad opcode and template combination
        .ctl_template       (ctl_template),
        .pars_ctl_info      (pars_ctl_info),//can be used as inprog            
        .pars_ctl_valid     (pars_ctl_valid),           
        //Bad template x"00" format & control rate limit violation
        //Reserved opcode used & return credit command found outside slot 0
        //use pars_info
        //Mismatch between run length and cmd/resp data lengths
        .control_parsing_start(control_parsing_start),
        .control_parsing_end(control_parsing_end),
        .parser_inprog      (parser_inprog),
        .template0_slot0 (template0_slot0),
        .template0_slot0_v  (template0_slot0_v),
        .run_length(run_length),
        //Unsupported template
        //use ctl_template
        .rcv_xmt_debug_info(rcv_xmt_debug_info),
        .rcv_xmt_debug_valid(rcv_xmt_debug_valid),
        .rcv_xmt_debug_fatal(rcv_xmt_debug_fatal),
        .tlx_clk(tlx_clk),
        //.crc_error(crc_error),
        .reset_n(reset_n) 
        );     
        
          
//!! Bugspray include : ocx_tlx_parser_bs.bil         
endmodule
