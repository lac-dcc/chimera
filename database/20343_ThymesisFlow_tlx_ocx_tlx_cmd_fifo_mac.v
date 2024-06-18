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
// Module Name: tlx_cmd_fifo_mac
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Tie AFU ports to FIFO data
// 
//////////////////////////////////////////////////////////////////////////////////


module ocx_tlx_cmd_fifo_mac
    #(parameter cmd_addr_width = 6)
    (
    input tlx_clk,
    input reset_n,
    input  crc_flush_done,
    input  crc_flush_inprog,
    input  crc_error,    
    output tlx_afu_valid,
    output [7:0] tlx_afu_opcode,
    output [15:0] tlx_afu_tag,
    output [1:0] tlx_afu_dl,
    output [2:0] tlx_afu_pl,
    output [63:0] tlx_afu_be,
    output tlx_afu_endian,
    output [63:0] tlx_afu_pa,
    output [3:0] tlx_afu_flag,
    output tlx_afu_os,
    //output tlx_afu_t,
    output tlx_cfg_valid,     
    output [7:0] tlx_cfg_opcode,
    output [63:0] tlx_cfg_pa,
    output rcv_xmt_tl_crd_cfg_dcp1_valid,
    output tlx_cfg_t,
    output [2:0] tlx_cfg_pl,
    output [15:0] tlx_cfg_capptag,   
    input [6:0] afu_tlx_cmd_initial_credit,
    input afu_tlx_cmd_credit,
    input [3:0] cfg_tlx_initial_credit,
    input cfg_tlx_credit_return,
    input cmd_credit_enable,  
    output rcv_xmt_credit_v,
    output cfg_rd_enable,
    input bookend_flit_v,
    input [1:0] data_arb_flit_cnt,
    input control_parsing_start,
    input control_parsing_end,    
    input cmd_fifo_wr_ena,
    input [167:0] fp_rcv_info,
    input fp_rcv_valid,
    input data_hold_vc1
    );
//INFO_WIDTH must match REGFILE WIDTH  
wire [167:0] cmd_rd_data;
wire [167:0] cmd_wr_data;
wire [cmd_addr_width-1:0] cmd_wr_addr;
wire [cmd_addr_width-1:0] cmd_rd_addr;
// reg  [cmd_addr_width:0] credit_init_cnt_reg = 2**cmd_addr_width;
reg  [cmd_addr_width:0] credit_init_cnt_reg ;
reg  cmd_rd_ena_reg;
reg  cmd_rd_ena_s1_reg;
wire cmd_rd_ena;
wire cmd_wr_ena;
wire credit_ncmd_return;
wire credit_ncfg_return;
assign cfg_rd_enable = cmd_rd_ena_reg & (cmd_rd_data[7:0] == 8'hE1);
always @(posedge tlx_clk)
begin
    if(!reset_n)
    begin
//  credit_init_cnt_reg <= 2**cmd_addr_width;
    credit_init_cnt_reg <= {1'b1, {cmd_addr_width{1'b0}} };
    cmd_rd_ena_reg <= 1'b0;
    cmd_rd_ena_s1_reg <= 1'b0;
    end
    else
    begin
    if(credit_init_cnt_reg != {cmd_addr_width+1{1'b0}})
        begin
        credit_init_cnt_reg <= credit_init_cnt_reg - {{cmd_addr_width{1'b0}}, 1'b1};
        end
    cmd_rd_ena_reg <= cmd_rd_ena;
    cmd_rd_ena_s1_reg <= cmd_rd_ena_reg;
    end
end

//Unused signals
wire unused_intentionally;
assign unused_intentionally = (| {cmd_rd_data[27:12], cmd_rd_ena_s1_reg} );
//

ocx_tlx_vc1_fifo_ctl #(.DATA_WIDTH(168), .addr_width(cmd_addr_width)) CMD_INFO_CTL(    
    .tlx_clk(tlx_clk),
    .reset_n(reset_n),
    .crc_flush_inprog(crc_flush_inprog),
    .crc_flush_done(crc_flush_done), 
    .crc_error(crc_error),
    .wr_ena(cmd_wr_ena),
    .wr_addr(cmd_wr_addr),
    .wr_data(cmd_wr_data),
    .rd_ena(cmd_rd_ena),
    .rd_addr(cmd_rd_addr), 
    .afu_tlx_initial_credit(afu_tlx_cmd_initial_credit),
    .afu_tlx_credit_return(afu_tlx_cmd_credit),
    .cfg_tlx_initial_credit(cfg_tlx_initial_credit),
    .cfg_tlx_credit_return(cfg_tlx_credit_return),
    .cmd_credit_enable(cmd_credit_enable),
    .credit_ncmd_return(credit_ncmd_return),
    .credit_ncfg_return(credit_ncfg_return),
    .bookend_flit_v(bookend_flit_v),
    .data_fifo_wr_ena(cmd_fifo_wr_ena),
    .fp_rcv_valid(fp_rcv_valid),
    .fp_rcv_info(fp_rcv_info), 
    .data_arb_flit_cnt(data_arb_flit_cnt),
    .control_parsing_start(control_parsing_start), 
    .control_parsing_end(control_parsing_end),   
    .data_hold_vc(data_hold_vc1) 
);

/*ocx_leaf_inferd_regfile #(
     .REGFILE_DEPTH    (2**cmd_addr_width),        //positive integer
     .REGFILE_WIDTH    (168),        //positive integer
     .ADDR_WIDTH        (cmd_addr_width)         //positive integer
     ) CMD_INFO_FIFO (
     .clka(tlx_clk),
     .rsta_n(reset_n),
     .ena(cmd_wr_ena),
     .addra(cmd_wr_addr),
     .dina(cmd_wr_data),   
     .clkb(tlx_clk),
     .rstb_n(reset_n),
     .enb(cmd_rd_ena),
     .addrb(cmd_rd_addr),
     .doutb(cmd_rd_data)  
     );*/
dram_syn_test #( 
     .ADDRESSWIDTH(cmd_addr_width),
     .BITWIDTH(168),
     .DEPTH((2**cmd_addr_width))
     ) CMD_INFO_FIFO (
     .a(cmd_wr_addr),
     .dpra(cmd_rd_addr),
     .clk(tlx_clk),
     .din(cmd_wr_data),
     .we(cmd_wr_ena),
     .reset_n(reset_n),
     .qdpo_ce(cmd_rd_ena),
     .qdpo(cmd_rd_data)
     );     
//assign credit_init_cnt_din = (credit_init_cnt_dout != 0) ? credit_init_cnt_dout - 1 : credit_init_cnt_dout;

// assign rcv_xmt_credit_v = (!reset_n) ? 1'b0 :
//                           (credit_init_cnt_reg != 0) ? 1'b1 : cmd_rd_ena;  
     
assign rcv_xmt_credit_v = (!reset_n) ? 1'b0 :
                          (credit_init_cnt_reg != {cmd_addr_width+1{1'b0}}) ? 1'b1 : cmd_rd_ena;

assign rcv_xmt_tl_crd_cfg_dcp1_valid = cmd_rd_ena_reg & (cmd_rd_data[7:0] == 8'hE1);  

assign credit_ncfg_return = cmd_rd_ena_reg & ~(cmd_rd_data[7:0] == 8'hE1 | cmd_rd_data[7:0] == 8'hE0);//cmd_rd_ena_s1_reg;    
assign credit_ncmd_return = cmd_rd_ena_reg & (cmd_rd_data[7:0] == 8'hE1 | cmd_rd_data[7:0] == 8'hE0);                            
     
assign tlx_afu_valid = cmd_rd_ena_reg & ~(cmd_rd_data[7:0] == 8'hE1 | cmd_rd_data[7:0] == 8'hE0);//cmd_rd_ena_s1_reg;    
assign tlx_cfg_valid = cmd_rd_ena_reg & (cmd_rd_data[7:0] == 8'hE1 | cmd_rd_data[7:0] == 8'hE0);     
assign tlx_cfg_opcode = cmd_rd_data[7:0];
assign tlx_cfg_pa = cmd_rd_data[91:28];
assign tlx_cfg_t = cmd_rd_data[108];
assign tlx_cfg_pl = cmd_rd_data[111:109];
assign tlx_cfg_capptag = cmd_rd_data[107:92];
//assign rcv_xmt_credit_v = cmd_rd_ena;     
assign tlx_afu_opcode = cmd_rd_data[7:0];
assign tlx_afu_pa = cmd_rd_data[91:28];
assign tlx_afu_tag = cmd_rd_data[107:92];
assign tlx_afu_os = cmd_rd_data[108];
assign tlx_afu_dl = cmd_rd_data[111:110];
assign tlx_afu_pl = cmd_rd_data[111:109];
assign tlx_afu_be[63:0] = {cmd_rd_data[167:108], cmd_rd_data[31:28]};
//assign tlx_afu_t = cmd_rd_data[108];
assign tlx_afu_endian = cmd_rd_data[108];
assign tlx_afu_flag = cmd_rd_data[11:8];
endmodule
