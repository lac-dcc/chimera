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
// Create Date: 06/23/2016 01:46:39 PM
// Design Name: 
// Module Name: tlx_ctl_fsm
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
// Todo: 
//////////////////////////////////////////////////////////////////////////////////


module ocx_tlx_ctl_fsm(
    input tlx_clk,
    input reset_n,
    input [55:0] credit_return,
    input credit_return_v,
    input [167:0] pars_ctl_info,
    input pars_ctl_valid,
    input ctl_flit_parsed,
    input ctl_flit_parse_end,
    output [55:0] ctl_vc0_bus,
    output [167:0] ctl_vc1_bus,
    output ctl_vc0_v,
    output ctl_vc1_v,
    output [3:0] rcv_xmt_credit_vcx0,
    output [3:0] rcv_xmt_credit_vcx3,
    output [5:0] rcv_xmt_credit_dcpx0,
    output [5:0] rcv_xmt_credit_dcpx3,
    output rcv_xmt_credit_tlx_v,
    output data_arb_cfg_hint,
    output bdi_cfg_hint,
    output [3:0] data_arb_cfg_offset,
    output cmd_credit_enable,
    output [1:0] data_arb_vc_v,
    output [1:0] data_bdi_vc_V,
    output data_hold_vc0,
    output data_hold_vc1,
    output control_parsing_end,
    output control_parsing_start,
    output [1:0] data_bdi_flit_cnt,
    output [1:0] data_arb_flit_cnt
    );
//Signal Declarations
wire [55:0] credit_return_din;
reg  [55:0] credit_return_dout;
wire credit_return_v_din;
reg  credit_return_v_dout;
wire [167:0] pars_ctl_info_din;
reg  [167:0] pars_ctl_info_dout;
wire pars_ctl_valid_din;
reg  pars_ctl_valid_dout;
wire ctl_flit_parsed_din;
reg  ctl_flit_parsed_dout;
wire ctl_flit_parse_end_din;
reg  ctl_flit_parse_end_dout;
wire [1:0] data_arb_flit_cnt_din;
reg  [1:0] data_arb_flit_cnt_dout;
wire [1:0] data_arb_vc_v_din;
reg  [1:0] data_arb_vc_v_dout;
wire cfg_hint_din;
reg  cfg_hint_dout;
wire ctl_vc0_valid;
wire ctl_vc1_valid;
wire data_vc0_valid;
wire data_vc1_valid;
always @(posedge tlx_clk) 
    begin
        if(!reset_n)
        begin
        credit_return_dout <= 56'b0;
        credit_return_v_dout <= 1'b0;
        pars_ctl_valid_dout <= 1'b0;
        pars_ctl_info_dout <= 168'b0;
        ctl_flit_parsed_dout <= 1'b0;
        ctl_flit_parse_end_dout <= 1'b0;
        data_arb_vc_v_dout <= 2'b0;
        data_arb_flit_cnt_dout <= 2'b0;
        cfg_hint_dout <= 1'b0;
        end
        else
        begin
        credit_return_dout <= credit_return_din;
        credit_return_v_dout <= credit_return_v_din;
        pars_ctl_valid_dout <= pars_ctl_valid_din;
        pars_ctl_info_dout <= pars_ctl_info_din;
        ctl_flit_parsed_dout <= ctl_flit_parsed_din;
        ctl_flit_parse_end_dout <= ctl_flit_parse_end_din;
        data_arb_vc_v_dout <= data_arb_vc_v_din;
        data_arb_flit_cnt_dout <= data_arb_flit_cnt_din;
        cfg_hint_dout <= cfg_hint_din;
        end
    end   
    
//Credit Return
assign credit_return_din[55:0] = credit_return_v ? credit_return[55:0] : credit_return_dout;
assign credit_return_v_din = credit_return_v;

//Command FIFO Routing
assign pars_ctl_info_din[167:0] = pars_ctl_info[167:0];
assign pars_ctl_valid_din = pars_ctl_valid;
assign ctl_vc0_valid = ~(~pars_ctl_info_dout[1] & ~pars_ctl_info_dout[2] & ~pars_ctl_info_dout[3] & ~pars_ctl_info_dout[4]) //Not credit return opcode "01" or NOP "00"
                    & (~pars_ctl_info_dout[7] & ~pars_ctl_info_dout[6] & ~pars_ctl_info_dout[5]) & pars_ctl_valid_dout; //VC0 = decimal 2-31
assign ctl_vc0_v = ctl_vc0_valid;  
assign ctl_vc0_bus[55:0] = pars_ctl_info_dout[55:0];                  
                    
assign ctl_vc1_valid = (pars_ctl_info_dout[5] | pars_ctl_info_dout[7] | pars_ctl_info_dout[6]) & pars_ctl_valid_dout; //VC1 = decimal 32 - 255                   
assign ctl_vc1_v = ctl_vc1_valid;
assign ctl_vc1_bus[167:0] = pars_ctl_info_dout[167:0];
//Data Arbiter Outputs
assign data_vc0_valid = ~(~pars_ctl_info[1] & ~pars_ctl_info[2] & ~pars_ctl_info[3] & ~pars_ctl_info[4]) //Not credit return opcode "01" or NOP "00"
                       & (~pars_ctl_info[7] & ~pars_ctl_info[6] & ~pars_ctl_info[5]) & pars_ctl_valid; //VC0 = decimal 2-31
assign data_vc1_valid = (pars_ctl_info[5] | pars_ctl_info[7] | pars_ctl_info[6]) & pars_ctl_valid; //VC1 = decimal 32 - 255                    
assign data_arb_vc_v_din[0] = data_vc0_valid & ((pars_ctl_info[7:0] == 8'h04) | (pars_ctl_info[7:0] == 8'h06));
assign data_arb_vc_v_din[1] = data_vc1_valid & ((pars_ctl_info[7:0] == 8'h81) |
                                           (pars_ctl_info[7:0] == 8'h82) |
                                           (pars_ctl_info[7:0] == 8'h86) |
                                           (pars_ctl_info[7:0] == 8'hE1));
assign cfg_hint_din = data_vc1_valid & pars_ctl_info[7:0] == 8'hE1;                                           
assign data_arb_cfg_hint = cfg_hint_din;    
assign data_arb_cfg_offset[3:0] = pars_ctl_info[33:30];                                      
assign data_arb_vc_v[1:0] = data_arb_vc_v_din[1:0];  
assign data_bdi_vc_V[1:0] = data_arb_vc_v_dout[1:0]; 
assign bdi_cfg_hint = cfg_hint_dout;             
//hold commands with data until valid data is received  
assign cmd_credit_enable = ctl_vc1_valid & ((pars_ctl_info_dout[7:0] != 8'hE1) | (pars_ctl_info_dout[7:0] != 8'hE0));                                          
assign data_hold_vc0 = ctl_vc0_valid & ((pars_ctl_info_dout[7:0] == 8'h04) | (pars_ctl_info_dout[7:0] == 8'h06));                                           
assign data_hold_vc1 = ctl_vc1_valid & ((pars_ctl_info_dout[7:0] == 8'h81) |
                       (pars_ctl_info_dout[7:0] == 8'h82) |
                       (pars_ctl_info_dout[7:0] == 8'h86) |
                       (pars_ctl_info_dout[7:0] == 8'hE1));                                           
assign data_arb_flit_cnt_din[1:0] = (data_vc0_valid && (pars_ctl_info[7:0] == 8'h04 || pars_ctl_info[7:0] == 8'h06)) ? pars_ctl_info[27:26] : //vc0 commands with dLength
                                (data_vc1_valid && pars_ctl_info[7:0] == 8'h81) ? pars_ctl_info[111:110] : //vc1 commands with dLength
                                (data_vc1_valid && (pars_ctl_info[7:0] == 8'h82 || pars_ctl_info[7:0] == 8'h86 || pars_ctl_info[7:0] == 8'hE1)) ? 2'b01 : //vc1 commands with pLength or BE 64B
                                2'b00;
assign data_arb_flit_cnt = data_arb_flit_cnt_din;
assign data_bdi_flit_cnt = data_arb_flit_cnt_dout;                                
assign ctl_flit_parsed_din = ctl_flit_parsed ? 1'b1 :
                             ctl_flit_parsed_dout && (ctl_vc0_valid || ctl_vc1_valid) ? 1'b0 : ctl_flit_parsed_dout; 
assign ctl_flit_parse_end_din = ctl_flit_parse_end;                                               
assign control_parsing_start = ctl_flit_parsed_dout & (ctl_vc0_valid | ctl_vc1_valid); //first valid cmd or response has been parsed blocks null/credit flits
assign control_parsing_end = ctl_flit_parse_end_dout;
//Assign Outputs                                 
assign rcv_xmt_credit_vcx0 = credit_return_dout[11:8];    
assign rcv_xmt_credit_vcx3 = credit_return_dout[23:20]; 
assign rcv_xmt_credit_dcpx0 = credit_return_dout[37:32];   
assign rcv_xmt_credit_dcpx3 = credit_return_dout[55:50];   
assign rcv_xmt_credit_tlx_v = credit_return_v_dout;
endmodule
