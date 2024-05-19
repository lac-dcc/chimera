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
// Create Date: 04/11/2017 11:54:54 AM
// Design Name: 
// Module Name: ocx_tlx_cfg_mac
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


module ocx_tlx_cfg_mac
    #(parameter addr_width = 6)
    (
    input tlx_clk,
    input reset_n,
    input crc_error,
    input cfg_data_v,
    input [31:0] cfg_data_bus,
    input cfg_rd_ena,
    output [31:0] tlx_cfg_data_bus,
    output rcv_xmt_tl_crd_cfg_dcp1_valid,
    input good_crc,
    input crc_flush_inprog,
    input crc_flush_done
    );
wire [addr_width:0] fifo_wr_ptr_din,fifo_rd_ptr_din,fifo_wr_verif_ptr_din;
reg  [addr_width:0] fifo_wr_ptr_dout,fifo_rd_ptr_dout,fifo_wr_verif_ptr_dout;   
wire crc_error_din;
reg  crc_error_dout;
wire crc_flush_inprog_din;
reg  crc_flush_inprog_dout; 
reg  crc_flush_done_s1_dout;
reg  crc_flush_done_s2_dout;
reg  crc_flush_inprog_s1_dout;
reg  crc_flush_inprog_s2_dout;
reg  good_crc_s1_dout;
reg  good_crc_s2_dout;
reg  crc_error_s2_reg;
always @(posedge tlx_clk)
    begin
        if (!reset_n)
        begin
        fifo_wr_ptr_dout <= {addr_width+1{1'b0}};
        fifo_wr_verif_ptr_dout <= {addr_width+1{1'b0}};
        fifo_rd_ptr_dout <= {addr_width+1{1'b0}};
        crc_error_dout <= 1'b0;
        crc_flush_inprog_dout <= 1'b0;
        crc_flush_done_s1_dout <= 1'b0;
        crc_flush_done_s2_dout <= 1'b0;
        crc_flush_inprog_s1_dout <= 1'b0;
        crc_flush_inprog_s2_dout <= 1'b0;
        good_crc_s1_dout <= 1'b0;
        good_crc_s2_dout <= 1'b0;
        end
        else
        begin
        fifo_wr_ptr_dout <= fifo_wr_ptr_din;
        fifo_wr_verif_ptr_dout <= fifo_wr_verif_ptr_din;
        fifo_rd_ptr_dout <= fifo_rd_ptr_din;  
        crc_error_dout <= crc_error_din;
        crc_error_s2_reg <= crc_error_dout;
        crc_flush_inprog_dout <= crc_flush_inprog_din; 
        crc_flush_done_s1_dout <= crc_flush_done;
        crc_flush_done_s2_dout <= crc_flush_done_s1_dout;
        crc_flush_inprog_s1_dout <= crc_flush_inprog_dout;
        crc_flush_inprog_s2_dout <= crc_flush_inprog_s1_dout; 
        good_crc_s1_dout <= good_crc;
        good_crc_s2_dout <= good_crc_s1_dout;
        end 
    end    
assign rcv_xmt_tl_crd_cfg_dcp1_valid = cfg_rd_ena;    
assign crc_flush_inprog_din = crc_flush_inprog;
assign crc_error_din = crc_error;    
assign fifo_wr_ptr_din = (crc_flush_done_s2_dout || (~crc_flush_inprog_s1_dout && crc_error_s2_reg && ~good_crc_s2_dout)) ? fifo_wr_verif_ptr_dout : 
                         cfg_data_v  ? fifo_wr_ptr_dout + {{addr_width{1'b0}}, 1'b1}      : fifo_wr_ptr_dout;
                            
assign fifo_wr_verif_ptr_din = (good_crc_s2_dout && cfg_data_v) ? fifo_wr_ptr_din :
                               (good_crc_s2_dout || crc_flush_inprog_s2_dout) ? fifo_wr_ptr_dout : fifo_wr_verif_ptr_dout; 
assign fifo_rd_ptr_din = cfg_rd_ena ? fifo_rd_ptr_dout + {{addr_width{1'b0}}, 1'b1} : fifo_rd_ptr_dout;                                     
dram_syn_test #( 
         .ADDRESSWIDTH(addr_width),
         .BITWIDTH(32),
         .DEPTH((2**addr_width))
         ) CFG_DATA_FIFO (
         .a(fifo_wr_ptr_dout[addr_width-1:0]),
         .dpra(fifo_rd_ptr_dout[addr_width-1:0]),
         .clk(tlx_clk),
         .din(cfg_data_bus),
         .we(cfg_data_v),
         .reset_n(reset_n),
         .qdpo_ce(cfg_rd_ena),
         .qdpo(tlx_cfg_data_bus)
         );      
endmodule
