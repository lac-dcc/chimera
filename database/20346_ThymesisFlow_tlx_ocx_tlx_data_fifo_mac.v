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
// Create Date: 10/04/2016 10:08:57 AM
// Design Name: 
// Module Name: ocx_tlx_data_fifo_mac
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


module ocx_tlx_data_fifo_mac
    #(
    parameter cmd_addr_width = 7, 
    parameter resp_addr_width = 8
    )
    (
    //Resp I/O
    input fp_rcv_resp_data_v,
    input [511:0] fp_rcv_resp_data_bus,
    output tlx_afu_resp_data_valid,
    output [511:0] tlx_afu_resp_data_bus,
    output rcv_xmt_credit_dcp0_v,
    input afu_tlx_resp_rd_req,
    input [2:0] afu_tlx_resp_rd_cnt,
    //CMD I/O
    input fp_rcv_cmd_data_v,
    input [511:0] fp_rcv_cmd_data_bus,
    output tlx_afu_cmd_data_valid,
    output [511:0] tlx_afu_cmd_data_bus,
    output rcv_xmt_credit_dcp1_v,
    input afu_tlx_cmd_rd_req,
    input [2:0] afu_tlx_cmd_rd_cnt,    
    //BDI
    input [1:0] data_arb_vc_v,
    input [1:0] data_arb_flit_cnt,
    input [3:0] run_length,
    input [7:0] bad_data_indicator,
    input bdi_cfg_hint,
    output tlx_afu_cmd_data_bdi,
    output tlx_afu_cfg_data_bdi,
    output tlx_afu_resp_data_bdi,  
    input bookend_flit_v, 
    input cfg_rd_enable,
    //CMD/RESP hold release
    output cmd_fifo_wr_ena,
    output resp_fifo_wr_ena,
    //CRC FLUSH
    input  crc_flush_done,
    input  crc_flush_inprog,     
    //Shared I/O
    input ctl_flit_start,
    input good_crc,
    input tlx_clk,
    input crc_error,
    input reset_n
    );


wire cmd_fifo_wr_ena_wire;
wire resp_fifo_wr_ena_wire;
 
wire [cmd_addr_width-1:0] cmd_fifo_wr_addr;
wire [cmd_addr_width-1:0] cmd_fifo_wr_addr_clone;
wire [511:0] cmd_fifo_wr_data;
wire [cmd_addr_width-1:0] cmd_fifo_rd_addr;   
    
wire [resp_addr_width-1:0] resp_fifo_wr_addr;
wire [resp_addr_width-1:0] resp_fifo_wr_addr_clone;
wire [511:0] resp_fifo_wr_data;
wire [resp_addr_width-1:0] resp_fifo_rd_addr;
wire cmd_fifo_rd_ena;
wire resp_fifo_rd_ena;
reg cmd_fifo_rd_ena_reg;
reg resp_fifo_rd_ena_reg;
reg cmd_fifo_rd_ena_s1_reg;
reg resp_fifo_rd_ena_s1_reg;
always @(posedge tlx_clk)
begin
    if(!reset_n)
    begin
    cmd_fifo_rd_ena_reg <= 1'b0;
    resp_fifo_rd_ena_reg <= 1'b0;
    cmd_fifo_rd_ena_s1_reg <= 1'b0;
    resp_fifo_rd_ena_s1_reg <= 1'b0;
    end
    else
    begin
    cmd_fifo_rd_ena_reg <= cmd_fifo_rd_ena;
    resp_fifo_rd_ena_reg <= resp_fifo_rd_ena;
    cmd_fifo_rd_ena_s1_reg <= cmd_fifo_rd_ena_reg;
    resp_fifo_rd_ena_s1_reg <= resp_fifo_rd_ena_reg;
    end    
end 
//Cmd Fifo control and instantiation      
ocx_tlx_dcp_fifo_ctl #(.addr_width(cmd_addr_width))
    CMD_DATA_CTL (
    .fp_rcv_data_v(fp_rcv_cmd_data_v),
    .fp_rcv_data_bus(fp_rcv_cmd_data_bus),
    .afu_tlx_rd_req(afu_tlx_cmd_rd_req),
    .afu_tlx_rd_cnt(afu_tlx_cmd_rd_cnt),
    .fifo_wr_ena(cmd_fifo_wr_ena_wire),
    .fifo_wr_addr(cmd_fifo_wr_addr),
    .fifo_wr_addr_clone(cmd_fifo_wr_addr_clone),
    .fifo_wr_data(cmd_fifo_wr_data),
    .fifo_rd_ena(cmd_fifo_rd_ena),
    .fifo_rd_addr(cmd_fifo_rd_addr),
    .rcv_xmt_credit_return_v(rcv_xmt_credit_dcp1_v),
    .good_crc(good_crc),
    .crc_flush_inprog(crc_flush_inprog),
    .crc_flush_done(crc_flush_done),
    .crc_error(crc_error),
    .tlx_clk(tlx_clk),
    .reset_n(reset_n)
    );
    
    
assign cmd_fifo_wr_ena  = cmd_fifo_wr_ena_wire;
assign resp_fifo_wr_ena = resp_fifo_wr_ena_wire;

//Unused signals
wire unused_intentionally;
assign unused_intentionally = (| {cmd_fifo_rd_ena_s1_reg, resp_fifo_rd_ena_s1_reg} );
//


dram_syn_test #( 
//bram_syn_test #( 
        .ADDRESSWIDTH(cmd_addr_width),
        .BITWIDTH(256),
        .DEPTH((2**cmd_addr_width))
        ) CMD_DATA_FIFO_255_0 (
        .a(cmd_fifo_wr_addr),
        .dpra(cmd_fifo_rd_addr),
        .clk(tlx_clk),
        .din(cmd_fifo_wr_data[255:0]),
        .we(cmd_fifo_wr_ena_wire),
        .reset_n(reset_n),
        .qdpo_ce(cmd_fifo_rd_ena),
        .qdpo(tlx_afu_cmd_data_bus[255:0])
        );
        
dram_syn_test #( 
//bram_syn_test #( 
        .ADDRESSWIDTH(cmd_addr_width),
        .BITWIDTH(256),
        .DEPTH((2**cmd_addr_width))
        ) CMD_DATA_FIFO_511_256 (
        .a(cmd_fifo_wr_addr_clone),
        .dpra(cmd_fifo_rd_addr),
        .clk(tlx_clk),
        .din(cmd_fifo_wr_data[511:256]),
        .we(cmd_fifo_wr_ena_wire),
        .reset_n(reset_n),
        .qdpo_ce(cmd_fifo_rd_ena),
        .qdpo(tlx_afu_cmd_data_bus[511:256])
        );        
                
 assign tlx_afu_cmd_data_valid = cmd_fifo_rd_ena_reg;//cmd_fifo_rd_ena_s1_reg;
 
//Response Fifo control and instantiation    
 ocx_tlx_dcp_fifo_ctl #(.addr_width(resp_addr_width))
      RESP_DATA_CTL(
     .fp_rcv_data_v(fp_rcv_resp_data_v),
     .fp_rcv_data_bus(fp_rcv_resp_data_bus),
     .afu_tlx_rd_req(afu_tlx_resp_rd_req),
     .afu_tlx_rd_cnt(afu_tlx_resp_rd_cnt),
     .fifo_wr_ena(resp_fifo_wr_ena_wire),
     .fifo_wr_addr(resp_fifo_wr_addr),
     .fifo_wr_addr_clone(resp_fifo_wr_addr_clone),
     .fifo_wr_data(resp_fifo_wr_data),
     .fifo_rd_ena(resp_fifo_rd_ena),
     .fifo_rd_addr(resp_fifo_rd_addr),
     .rcv_xmt_credit_return_v(rcv_xmt_credit_dcp0_v),
     .good_crc(good_crc),
     .crc_flush_inprog(crc_flush_inprog),
     .crc_flush_done(crc_flush_done),     
     .crc_error(crc_error),
     .tlx_clk(tlx_clk),
     .reset_n(reset_n)
     ); 
     
//dram_syn_test #( 
bram_syn_test #( 
              .ADDRESSWIDTH(resp_addr_width),
              .BITWIDTH(256),
              .DEPTH((2**resp_addr_width))
              ) RESP_DATA_FIFO_255_0 (
              .a(resp_fifo_wr_addr),
              .dpra(resp_fifo_rd_addr),
              .clk(tlx_clk),
              .din(resp_fifo_wr_data[255:0]),
              .we(resp_fifo_wr_ena_wire),
              .reset_n(reset_n),
              .qdpo_ce(resp_fifo_rd_ena),
              .qdpo(tlx_afu_resp_data_bus[255:0])
              ); 
//dram_syn_test #( 
bram_syn_test #( 
            .ADDRESSWIDTH(resp_addr_width),
            .BITWIDTH(256),
            .DEPTH((2**resp_addr_width))
            ) RESP_DATA_FIFO_511_256 (
            .a(resp_fifo_wr_addr_clone),
            .dpra(resp_fifo_rd_addr),
            .clk(tlx_clk),
            .din(resp_fifo_wr_data[511:256]),
            .we(resp_fifo_wr_ena_wire),
            .reset_n(reset_n),
            .qdpo_ce(resp_fifo_rd_ena),
            .qdpo(tlx_afu_resp_data_bus[511:256])
            );   
              
                     
 assign tlx_afu_resp_data_valid = resp_fifo_rd_ena_reg;//resp_fifo_rd_ena_s1_reg;
 
 //BDI Control Logic and Registers
 ocx_tlx_bdi_mac #(
     .cmd_addr_width(cmd_addr_width),
     .resp_addr_width(resp_addr_width)
     ) BDI_MAC(
     .tlx_clk(tlx_clk),
     .reset_n(reset_n),
     .crc_error(crc_error),
     .resp_data_fifo_rd_ptr(resp_fifo_rd_addr),
     .cmd_data_fifo_rd_ptr(cmd_fifo_rd_addr),   
     .resp_data_fifo_rd_ena(resp_fifo_rd_ena),
     .cmd_data_fifo_rd_ena(cmd_fifo_rd_ena),
     .cfg_rd_enable(cfg_rd_enable),  
     .bad_data_indicator(bad_data_indicator),
     .ctl_flit_start(ctl_flit_start),
     .bookend_flit_v(bookend_flit_v),
     .data_arb_vc_v              (data_arb_vc_v),          
     .data_arb_flit_cnt          (data_arb_flit_cnt),          
     .run_length                 (run_length),  
     .bdi_cfg_hint(bdi_cfg_hint),   
     .tlx_afu_cmd_data_bdi(tlx_afu_cmd_data_bdi),
     .tlx_afu_cfg_data_bdi(tlx_afu_cfg_data_bdi),
     .tlx_afu_resp_data_bdi(tlx_afu_resp_data_bdi)
 ); 
 

       
endmodule
