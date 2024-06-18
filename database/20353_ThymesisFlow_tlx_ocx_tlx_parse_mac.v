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
// Create Date: 06/16/2016 09:12:02 AM
// Design Name: 
// Module Name: tlx_parse_mac
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
// TODO does the data arb need a bookend valid from parser?
//////////////////////////////////////////////////////////////////////////////////


module ocx_tlx_parse_mac(
    output fp_rcv_cmd_valid,
    output [167:0] fp_rcv_cmd_info,
    output fp_rcv_cmd_data_v,
    output [511:0] fp_rcv_cmd_data_bus,
    output fp_rcv_resp_valid,
    output [55:0] fp_rcv_resp_info,
    output fp_rcv_resp_data_v,
    output data_hold_vc0,
    output data_hold_vc1,
    output [7:0] bad_data_indicator,
    output good_crc,
    output crc_flush_done,
    output crc_flush_inprog,
    output crc_error,
    output bookend_flit_v,
    output [3:0] run_length,
    output [1:0] data_arb_vc_v,
    output [1:0] data_arb_flit_cnt,
    output control_parsing_start,
    output control_parsing_end,
    output [511:0] fp_rcv_resp_data_bus,
    output rcv_xmt_credit_tlx_v,
    output [3:0] rcv_xmt_credit_vcx0,
    output [3:0] rcv_xmt_credit_vcx3,
    output [5:0] rcv_xmt_credit_dcpx0,
    output [5:0] rcv_xmt_credit_dcpx3,
    output ctl_flit_start,
    output template0_slot0_v,
    output [27:0] template0_slot0,
    output parser_inprog,    
    output [5:0] ctl_template,
    output [167:0] pars_ctl_info,
    output pars_ctl_valid,
//  output [55:0] credit_return_out,
//  output credit_return_v_out,
    output cfg_data_v,
    output cfg_data_cnt_v,
    output [31:0] cfg_data_bus,
    output cmd_credit_enable,
    output bdi_cfg_hint,
    input [511:0] dlx_tlx_flit,
    input dlx_tlx_flit_valid,
    input dlx_tlx_flit_crc_err,
    input reset_n,
    input tlx_clk
    );   
    wire [55:0] credit_return;
    wire credit_return_v;
    wire [167:0] pars_ctl_info_wire;
    wire pars_ctl_valid_wire;
    wire ctl_flit_parsed;
    wire [1:0] data_arb_vc_v_wire;
    wire [1:0] data_arb_flit_cnt_wire;
    wire [511:0] pars_data_flit;
    wire pars_data_valid;  
    wire crc_error_int;
    wire data_arb_cfg_hint;
    wire [3:0] data_arb_cfg_offset;
    wire ctl_flit_parse_end;
//  assign credit_return_out[55:0] = credit_return;
//  assign credit_return_v_out = credit_return_v;

    wire bookend_flit_v_wire;
    wire [3:0] run_length_wire;
    wire control_parsing_start_wire;
    wire control_parsing_end_wire;




    assign crc_error = crc_error_int;
    assign ctl_flit_start = ctl_flit_parsed;
    assign pars_ctl_info = pars_ctl_info_wire;
    assign pars_ctl_valid = pars_ctl_valid_wire;
    ocx_tlx_flit_parser flit_parser(
        .tlx_clk            (tlx_clk),                  //Input
        .reset_n            (reset_n),                  //Input                 
        .dlx_tlx_flit       (dlx_tlx_flit),             //Input
        .dlx_tlx_flit_valid (dlx_tlx_flit_valid),       //Input
        .dlx_tlx_flit_crc_err (dlx_tlx_flit_crc_err),       //Input
        .pars_ctl_info      (pars_ctl_info_wire),            //Output
        .pars_ctl_valid     (pars_ctl_valid_wire),           //Output
        .pars_data_flit     (pars_data_flit),           //Output
        .pars_data_valid    (pars_data_valid),          //Output              
        .bad_data_indicator (bad_data_indicator),            //Output
        .crc_error          (crc_error_int),        //Output
        .bookend_flit_v     (bookend_flit_v_wire),           //Output
        .run_length         (run_length_wire),           //Output
        .parser_inprog      (parser_inprog),
        .template0_slot0    (template0_slot0),
        .template0_slot0_v  (template0_slot0_v),
        .ctl_flit_parsed    (ctl_flit_parsed),   
        .ctl_flit_parse_end (ctl_flit_parse_end),  
        .ctl_template       (ctl_template),   
        .credit_return      (credit_return),       //Output
        .credit_return_v    (credit_return_v)    //Output
        );      
    assign bookend_flit_v         = bookend_flit_v_wire;
    assign run_length             = run_length_wire;
    assign control_parsing_start  = control_parsing_start_wire;
    assign control_parsing_end    = control_parsing_end_wire;

    ocx_tlx_data_arb data_arb(
        .tlx_clk            (tlx_clk),                  //Input
        .reset_n            (reset_n),                  //Input 
        .dcp0_data_v        (fp_rcv_resp_data_v),              //Output
        .dcp1_data_v        (fp_rcv_cmd_data_v),              //Output
        .dcp0_data          (fp_rcv_resp_data_bus),                //Output
        .dcp1_data          (fp_rcv_cmd_data_bus),                //Output
        .good_crc           (good_crc),                //Output
        .crc_flush_inprog   (crc_flush_inprog),
        .crc_flush_done     (crc_flush_done),
        .control_parsing_start  (control_parsing_start_wire),
        .control_parsing_end(control_parsing_end_wire),
        .data_arb_vc_v      (data_arb_vc_v_wire),          //Input
        .data_arb_flit_cnt  (data_arb_flit_cnt_wire),          //Input
        .pars_data_flit     (pars_data_flit),           //Input
        .pars_data_valid    (pars_data_valid),          //Input              
        .bookend_flit_v     (bookend_flit_v_wire),           //Input
        .run_length         (run_length_wire),           //Input
        .data_arb_cfg_hint  (data_arb_cfg_hint),
        .data_arb_cfg_offset(data_arb_cfg_offset),
        .cfg_data_v         (cfg_data_v),
        .cfg_data_cnt_v     (cfg_data_cnt_v),
        .cfg_data_bus       (cfg_data_bus),
        .crc_error          (crc_error_int)
        );
    ocx_tlx_ctl_fsm control_fsm(
        .tlx_clk                (tlx_clk),              //Input
        .reset_n                (reset_n),                  //Input 
        .credit_return          (credit_return),   //Input
        .credit_return_v        (credit_return_v), //Input
        .pars_ctl_info          (pars_ctl_info_wire),        //Input
        .pars_ctl_valid         (pars_ctl_valid_wire),       //Input
        .data_hold_vc0          (data_hold_vc0),  //Output
        .data_hold_vc1          (data_hold_vc1),  //Output
        .data_arb_vc_v          (data_arb_vc_v_wire),          //Output
        .data_arb_flit_cnt      (data_arb_flit_cnt_wire),          //Output
        .data_bdi_vc_V          (data_arb_vc_v),          //Output
        .data_bdi_flit_cnt      (data_arb_flit_cnt),          //Output 
        .data_arb_cfg_hint      (data_arb_cfg_hint),
        .data_arb_cfg_offset    (data_arb_cfg_offset),
        .bdi_cfg_hint           (bdi_cfg_hint),  
        .cmd_credit_enable      (cmd_credit_enable),     
        .ctl_flit_parsed        (ctl_flit_parsed), 
        .ctl_flit_parse_end     (ctl_flit_parse_end),
        .control_parsing_start  (control_parsing_start_wire),
        .control_parsing_end    (control_parsing_end_wire),
        .ctl_vc0_bus            (fp_rcv_resp_info),          //Output
        .ctl_vc1_bus            (fp_rcv_cmd_info),          //Output
        .ctl_vc0_v              (fp_rcv_resp_valid),            //Output
        .ctl_vc1_v              (fp_rcv_cmd_valid),            //Output
        .rcv_xmt_credit_vcx0    (rcv_xmt_credit_vcx0),  //Output
        .rcv_xmt_credit_vcx3    (rcv_xmt_credit_vcx3),  //Output
        .rcv_xmt_credit_dcpx0   (rcv_xmt_credit_dcpx0), //Output
        .rcv_xmt_credit_dcpx3   (rcv_xmt_credit_dcpx3), //Output
        .rcv_xmt_credit_tlx_v   (rcv_xmt_credit_tlx_v)  //Output
        );
endmodule
