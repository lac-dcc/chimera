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
// Create Date: 08/11/2016 02:03:15 PM
// Design Name: 
// Module Name: tlx_resp_fifo_mac
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


module ocx_tlx_resp_fifo_mac
    #(parameter resp_addr_width = 7)
    (
    input tlx_clk,
    input reset_n,
    input  crc_flush_done,
    input  crc_flush_inprog,
    input  crc_error,    
    output tlx_afu_valid,
    output [7:0] tlx_afu_resp_opcode,
    output [15:0] tlx_afu_resp_tag,
    output [3:0] tlx_afu_resp_code,
    output [5:0] tlx_afu_resp_pg_size,
    output [1:0] tlx_afu_resp_dl,
    output [1:0] tlx_afu_resp_dp,
    output [23:0] tlx_afu_resp_host_tag,
    output [17:0] tlx_afu_resp_addr_tag,
    output [3:0] tlx_afu_resp_cache_state,
    input bookend_flit_v,
    input [1:0] data_arb_flit_cnt,
    input control_parsing_start,
    input control_parsing_end,     
    input resp_fifo_wr_ena,
    input [6:0] afu_tlx_resp_initial_credit,
    input afu_tlx_resp_credit,
    output rcv_xmt_credit_v,
    input [55:0] fp_rcv_info,
    input fp_rcv_valid,
    input data_hold_vc0
    );    
//DATA_WIDTH must match REGFILE WIDTH  
wire [55:0] resp_rd_data;  
wire [55:0] resp_wr_data;
wire [resp_addr_width-1:0] resp_wr_addr;
wire [resp_addr_width-1:0] resp_rd_addr;
// reg  [resp_addr_width:0] credit_init_cnt_reg = 2**resp_addr_width;
reg  [resp_addr_width:0] credit_init_cnt_reg;
reg  resp_rd_ena_reg;
reg  resp_rd_ena_s1_reg;
wire resp_rd_ena;
wire resp_wr_ena;
always @(posedge tlx_clk)
begin
    if(!reset_n)
    begin
//  credit_init_cnt_reg <= 2**resp_addr_width;
    credit_init_cnt_reg <= {1'b1, {resp_addr_width{1'b0}} };
    resp_rd_ena_reg <= 1'b0;
    resp_rd_ena_s1_reg <= 1'b0;
    end
    else
    begin
//  if(credit_init_cnt_reg != 0)
    if(credit_init_cnt_reg != {resp_addr_width+1{1'b0}})
        begin
//      credit_init_cnt_reg <= credit_init_cnt_reg - 1; 
        credit_init_cnt_reg <= credit_init_cnt_reg - {{resp_addr_width{1'b0}}, 1'b1};
        end
    resp_rd_ena_reg <= resp_rd_ena;
    resp_rd_ena_s1_reg <= resp_rd_ena_reg;
    end    
end

//Unused signals
wire unused_intentionally;
// assign unused_intentionally = (| {resp_rd_ena_s1_reg} );
assign unused_intentionally = resp_rd_ena_s1_reg;
//

ocx_tlx_vc0_fifo_ctl #(.DATA_WIDTH(56), .addr_width(resp_addr_width)) RESP_INFO_CTL(
        .tlx_clk(tlx_clk),
        .reset_n(reset_n),
        .crc_flush_inprog(crc_flush_inprog),
        .crc_flush_done(crc_flush_done), 
        .crc_error(crc_error),
        .wr_ena(resp_wr_ena),
        .wr_addr(resp_wr_addr),
        .wr_data(resp_wr_data),
        .rd_ena(resp_rd_ena),
        .rd_addr(resp_rd_addr),
        .afu_tlx_initial_credit(afu_tlx_resp_initial_credit),
        .afu_tlx_credit_return(afu_tlx_resp_credit),
        .bookend_flit_v(bookend_flit_v),
        .data_fifo_wr_ena(resp_fifo_wr_ena),
        .fp_rcv_valid(fp_rcv_valid),
        .fp_rcv_info(fp_rcv_info), 
        .data_arb_flit_cnt(data_arb_flit_cnt),
        .control_parsing_start(control_parsing_start),
        .control_parsing_end(control_parsing_end),        
        .data_hold_vc(data_hold_vc0)
    );
    
/*ocx_leaf_inferd_regfile #(
     .REGFILE_DEPTH    (2**resp_addr_width),        //positive integer
     .REGFILE_WIDTH    (56),        //positive integer
     .ADDR_WIDTH        (resp_addr_width)         //positive integer
     ) RESP_INFO_FIFO (
     .clka(tlx_clk),
     .rsta_n(reset_n),
     .ena(resp_wr_ena),
     .addra(resp_wr_addr),
     .dina(resp_wr_data),   
     .clkb(tlx_clk),
     .rstb_n(reset_n),
     .enb(resp_rd_ena),
     .addrb(resp_rd_addr),
     .doutb(resp_rd_data)        
     );*/
     
//dram_syn_test #( 
bram_syn_test #( 
      .ADDRESSWIDTH(resp_addr_width),
      .BITWIDTH(56),
      .DEPTH((2**resp_addr_width))
      ) RESP_INFO_FIFO (
      .a(resp_wr_addr),
      .dpra(resp_rd_addr),
      .clk(tlx_clk),
      .din(resp_wr_data),
      .we(resp_wr_ena),
      .reset_n(reset_n),
      .qdpo_ce(resp_rd_ena),
      .qdpo(resp_rd_data)
      );      
//assign credit_init_cnt_din = (!reset_n) ? 2**resp_addr_width : (credit_init_cnt_reg != 0) ? credit_init_cnt_reg - 1 : credit_init_cnt_reg;     
assign rcv_xmt_credit_v = (!reset_n) ? 1'b0 : 
                          (credit_init_cnt_reg != {resp_addr_width+1{1'b0}}) ? 1'b1 : resp_rd_ena;
                          
//Assign Response Outputs, AFU is responsible for grabbing only valid fields for each specific opcode    
assign tlx_afu_valid = resp_rd_ena_reg; 
assign tlx_afu_resp_opcode = resp_rd_data[7:0];
assign tlx_afu_resp_tag = resp_rd_data[23:8];  
assign tlx_afu_resp_code = resp_rd_data[55:52]; 
assign tlx_afu_resp_pg_size = resp_rd_data[33:28]; 
assign tlx_afu_resp_addr_tag = resp_rd_data[51:34]; 
assign tlx_afu_resp_dp = resp_rd_data[25:24]; 
assign tlx_afu_resp_dl = resp_rd_data[27:26]; 
assign tlx_afu_resp_host_tag = resp_rd_data[51:28]; 
assign tlx_afu_resp_cache_state = resp_rd_data[55:52];     
endmodule
