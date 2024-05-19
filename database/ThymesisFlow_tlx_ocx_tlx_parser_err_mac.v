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
// Create Date: 02/27/2017 02:42:25 PM
// Design Name: 
// Module Name: ocx_tlx_parser_err_mac
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


module ocx_tlx_parser_err_mac(
    //Bad opcode and template combination
    input [5:0] ctl_template,
    input [167:0] pars_ctl_info,//can be used as inprog            
    input pars_ctl_valid,           
    //Bad template x"00" format & control rate limit violation
    input template0_slot0_v,
    input [27:0] template0_slot0,
    input parser_inprog,    
    //Reserved opcode used & return credit command found outside slot 0
    //use pars_info
    //Mismatch between run length and cmd/resp data lengths
    input control_parsing_start,
    input control_parsing_end,
    input [3:0] run_length,
    output [31:0] rcv_xmt_debug_info,
    output rcv_xmt_debug_valid,
    output rcv_xmt_debug_fatal,
    //Unsupported template
    //use ctl_template
    input tlx_clk,
    input reset_n
    );
wire [5:0] ctl_template_din;
reg  [5:0] ctl_template_dout;
wire [5:0] ctl_template_s1_din;
reg  [5:0] ctl_template_s1_dout;
wire [167:0] pars_ctl_info_din;  
reg  [167:0] pars_ctl_info_dout;
wire [167:0] pars_ctl_info_s1_din;  
reg  [167:0] pars_ctl_info_s1_dout;
wire pars_ctl_valid_din;
reg  pars_ctl_valid_dout;   
wire control_parsing_start_din;
reg  control_parsing_start_dout; 
wire control_parsing_end_din;
reg  control_parsing_end_dout;  
wire [3:0] run_length_din;
reg  [3:0] run_length_dout;
wire template0_slot0_v_din;
reg  template0_slot0_v_dout;
wire [27:0] template0_slot0_din;
reg  [27:0] template0_slot0_dout;
wire [27:0] template0_slot0_s1_din;
reg  [27:0] template0_slot0_s1_dout;
wire parser_inprog_din;
reg  parser_inprog_dout;
wire rcv_err_valid_din;
reg  rcv_err_valid_dout;
wire [31:0] rcv_err_info_din;
reg  [31:0] rcv_err_info_dout;
reg  err_resv_opcode_reg; 
reg  err_resv_template_reg;
reg  err_comb_bad_reg;
reg  err_bad_template0_reg;
reg  err_ctl_flit_overrun_reg;
reg  err_invalid_run_length_reg;
reg  err_invalid_credit_reg;
wire parser_inprog_s1_din;
reg  parser_inprog_s1_dout;
always @(posedge tlx_clk)
    begin
        if (!reset_n)
        begin
            ctl_template_dout <= 6'b0;
            ctl_template_s1_dout <= 6'b0;
            pars_ctl_info_dout <= 168'b0;
            pars_ctl_valid_dout <= 1'b0;
            control_parsing_start_dout <= 1'b0;
            control_parsing_end_dout <= 1'b0;
            run_length_dout <= 4'b0;
            err_resv_opcode_reg <= 1'b0;
            template0_slot0_v_dout <= 1'b0;
            template0_slot0_dout <= 28'b0;
            template0_slot0_s1_dout <= 28'b0;
            parser_inprog_dout <= 1'b0;
            err_bad_template0_reg <= 1'b0;
            err_ctl_flit_overrun_reg <= 1'b0;
            err_resv_template_reg <= 1'b0;
            err_comb_bad_reg <= 1'b0;
            err_invalid_run_length_reg <= 1'b0;
            err_invalid_credit_reg <= 1'b0;
            rcv_err_valid_dout <= 1'b0;
            pars_ctl_info_s1_dout <= 168'b0;
            rcv_err_info_dout <= 32'b0;
            parser_inprog_s1_dout <= 1'b0;
        end
        else
        begin
            ctl_template_dout <= ctl_template_din;
            ctl_template_s1_dout <= ctl_template_s1_din;
            pars_ctl_info_dout <= pars_ctl_info_din;
            pars_ctl_valid_dout <= pars_ctl_valid_din;
            control_parsing_start_dout <= control_parsing_start_din;
            control_parsing_end_dout <= control_parsing_end_din;
            run_length_dout <= run_length_din; 
            template0_slot0_v_dout <= template0_slot0_v_din;
            template0_slot0_dout <= template0_slot0_din;
            template0_slot0_s1_dout <= template0_slot0_s1_din;
            parser_inprog_dout <= parser_inprog_din;
            rcv_err_valid_dout <= rcv_err_valid_din;
            pars_ctl_info_s1_dout <= pars_ctl_info_s1_din;
            rcv_err_info_dout <= rcv_err_info_din;
            parser_inprog_s1_dout <= parser_inprog_s1_din;
            //Reserved opcode, comparing against valid opcode for OpenCAPI 3.0
            if(pars_ctl_valid_dout)
            begin
             case (pars_ctl_info_dout[7:0])
                 8'h00: err_resv_opcode_reg <= 1'b0;
                 8'h01: err_resv_opcode_reg <= 1'b0;
                 8'h02: err_resv_opcode_reg <= 1'b0;
                 8'h04: err_resv_opcode_reg <= 1'b0;
                 8'h05: err_resv_opcode_reg <= 1'b0;
                 8'h08: err_resv_opcode_reg <= 1'b0;
                 8'h09: err_resv_opcode_reg <= 1'b0;
                 8'h0c: err_resv_opcode_reg <= 1'b0;
                 8'h0d: err_resv_opcode_reg <= 1'b0;
                 8'h0e: err_resv_opcode_reg <= 1'b0;
                 8'h10: err_resv_opcode_reg <= 1'b0;
                 8'h18: err_resv_opcode_reg <= 1'b0;
                 8'h1a: err_resv_opcode_reg <= 1'b0;
                 8'h20: err_resv_opcode_reg <= 1'b0;
                 8'h28: err_resv_opcode_reg <= 1'b0;
                 8'h81: err_resv_opcode_reg <= 1'b0;
                 8'h82: err_resv_opcode_reg <= 1'b0;
                 8'h83: err_resv_opcode_reg <= 1'b0;
                 8'h86: err_resv_opcode_reg <= 1'b0;
                 8'he0: err_resv_opcode_reg <= 1'b0;
                 8'he1: err_resv_opcode_reg <= 1'b0;
                 default: err_resv_opcode_reg <= 1'b1;
              endcase 
             end
             else
             begin
                err_resv_opcode_reg <= 1'b0;
             end
             //Unsupported template
            case (ctl_template_dout)
                  6'b000001: err_resv_template_reg <= 1'b0;
                  6'b000010: err_resv_template_reg <= 1'b0;
                  6'b000011: err_resv_template_reg <= 1'b0;
                  6'b000000: err_resv_template_reg <= 1'b0;
                  default: err_resv_template_reg <= 1'b1;
            endcase    
                        //Bad opcode/template combination
            if (pars_ctl_valid_dout)
            begin
                case(ctl_template_dout)
                    6'b000001: err_comb_bad_reg <= (pars_ctl_info_dout[7:0] == 8'h82);
                    6'b000010: err_comb_bad_reg <= (pars_ctl_info_dout[7:0] == 8'h82) | (pars_ctl_info_dout[7:0] == 8'h20) | (pars_ctl_info_dout[7:0] == 8'h28) | (pars_ctl_info_dout[7:0] == 8'h81) |
                                                   (pars_ctl_info_dout[7:0] == 8'h83) | (pars_ctl_info_dout[7:0] == 8'h86) | (pars_ctl_info_dout[7:0] == 8'he0) | (pars_ctl_info_dout[7:0] == 8'he1);
                    default: err_comb_bad_reg <= 1'b0;
                endcase
            end
            //Bad template x"00"
            if (template0_slot0_v_dout)
                begin
                err_bad_template0_reg <= (template0_slot0_dout[7:0] >= 8'h02); 
                end
            else
                begin
                err_bad_template0_reg <= 1'b0;
                end
            //Control flit overrun  
            err_ctl_flit_overrun_reg <= parser_inprog_dout & ~pars_ctl_valid_dout & pars_ctl_valid;
            //Invalid Run Length
            if(run_length_dout > 4'b1000)
                begin
                err_invalid_run_length_reg <= 1'b1;
                end
            else
                begin
                err_invalid_run_length_reg <= 1'b0;
                end
            //Return credit outside slot0
            if(parser_inprog_s1_dout)
                begin
                err_invalid_credit_reg <= (pars_ctl_info_dout[7:0] == 8'h01);
                end
            else   
                begin
                err_invalid_credit_reg <= 1'b0;                    
                end
        end                            
    end

//Unused signals
wire unused_intentionally;
assign unused_intentionally = (| {pars_ctl_info_s1_dout[167:8], control_parsing_start_dout, control_parsing_end_dout} );
//
assign ctl_template_din = ctl_template;
assign ctl_template_s1_din = ctl_template_dout;
assign pars_ctl_info_din = pars_ctl_info;
assign pars_ctl_info_s1_din = pars_ctl_info_dout;
assign pars_ctl_valid_din = pars_ctl_valid;
assign control_parsing_start_din = control_parsing_start;
assign control_parsing_end_din = control_parsing_end;
assign run_length_din = run_length;  
assign template0_slot0_v_din = template0_slot0_v;
assign template0_slot0_din = template0_slot0;
assign template0_slot0_s1_din = template0_slot0_dout;
assign parser_inprog_din = parser_inprog; 
assign parser_inprog_s1_din = parser_inprog_dout; 
assign rcv_err_valid_din = err_invalid_credit_reg | err_invalid_run_length_reg | err_ctl_flit_overrun_reg | err_bad_template0_reg | err_comb_bad_reg | err_resv_template_reg | err_resv_opcode_reg; 
assign rcv_err_info_din[31:4] = err_bad_template0_reg ? template0_slot0_s1_dout : {14'b0,ctl_template_s1_dout[5:0], pars_ctl_info_s1_dout[7:0]} ;    
assign rcv_err_info_din[3:0] = err_comb_bad_reg ? 4'h1:
                               err_bad_template0_reg ? 4'h2 :
                               err_resv_template_reg ? 4'h3 :
                               err_ctl_flit_overrun_reg ? 4'h4 :
                               err_resv_opcode_reg ? 4'h5 :
                               err_invalid_credit_reg ? 4'h6 : 
                               err_invalid_run_length_reg ? 4'h7 : 4'h0; 
assign rcv_xmt_debug_info = rcv_err_info_dout;
assign rcv_xmt_debug_valid = rcv_err_valid_dout;
assign rcv_xmt_debug_fatal = rcv_err_valid_dout;


endmodule
