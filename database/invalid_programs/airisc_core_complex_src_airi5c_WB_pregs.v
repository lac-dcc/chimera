//
// Copyright 2022 FRAUNHOFER INSTITUTE OF MICROELECTRONIC CIRCUITS AND SYSTEMS (IMS), DUISBURG, GERMANY.
// --- All rights reserved --- 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License");
// you may not use this file except in compliance with the License, or, at your option, the Apache License version 2.0.
// You may obtain a copy of the License at
// https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.
//
//
`timescale 1ns/100ps


`include "airi5c_ctrl_constants.vh"
`include "airi5c_alu_ops.vh"
`include "rv32_opcodes.vh"

module airi5c_WB_pregs(
input                           clk_i,
input                           rst_ni,

input                           stall_WB_i,

input                           killed_EX_i,
input                           ex_EX_i,
input [`XPR_LEN-1:0]            PC_EX_i,
input [`XPR_LEN-1:0]            alu_out_i,
input [`XPR_LEN-1:0]            csr_rdata_i,
input [`MEM_TYPE_WIDTH-1:0]     dmem_type_i,
input [`XPR_LEN-1:0]            store_data_i,
input [`XPR_LEN-1:0]            pcpi_rd_i,
input [`XPR_LEN-1:0]            pcpi_rd2_i,
input                           pcpi_use_rd64_i,
input [`XPR_LEN-1:0]            inst_ex_i,
input [`XPR_LEN-1:0]            rs1_data_i,

output                           prev_killed_WB_o,
output                           had_ex_WB_o,
output [`XPR_LEN-1:0]           PC_WB_o,
output [`XPR_LEN-1:0]           alu_out_wb_o,
output [`XPR_LEN-1:0]           csr_rdata_wb_o,
output [`MEM_TYPE_WIDTH-1:0]    dmem_type_wb_o,
output [`XPR_LEN-1:0]           store_data_wb_o,
output [`XPR_LEN-1:0]           pcpi_rd_wb_o,
output [`XPR_LEN-1:0]           pcpi_rd2_wb_o,
output                          pcpi_use_rd64_wb_o,
output [`XPR_LEN-1:0]           inst_wb_o,
output [`XPR_LEN-1:0]           rs1_data_wb_o

`ifdef ISA_EXT_F
,
input  [`XPR_LEN-1:0]           fpu_out_i,
output [`XPR_LEN-1:0]           fpu_out_wb_o
`endif

);

reg                              prev_killed_WB_r;
reg                              had_ex_WB_r;
reg [`XPR_LEN-1:0]               PC_WB_r;
reg [`XPR_LEN-1:0]               alu_out_wb_r;
reg [`XPR_LEN-1:0]               csr_rdata_wb_r;
reg [`MEM_TYPE_WIDTH-1:0]        dmem_type_wb_r;
reg [`XPR_LEN-1:0]               store_data_wb_r;
reg [`XPR_LEN-1:0]               pcpi_rd_wb_r;
reg [`XPR_LEN-1:0]               pcpi_rd2_wb_r;
reg                              pcpi_use_rd64_wb_r;
reg [`XPR_LEN-1:0]               inst_wb_r;
reg [`XPR_LEN-1:0]               rs1_data_wb_r;

assign prev_killed_WB_o      =  prev_killed_WB_r;
assign had_ex_WB_o           =  had_ex_WB_r;
assign PC_WB_o               =  PC_WB_r;
assign alu_out_wb_o          =  alu_out_wb_r;
assign csr_rdata_wb_o        =  csr_rdata_wb_r;
assign dmem_type_wb_o        =  dmem_type_wb_r;
assign store_data_wb_o       =  store_data_wb_r;
assign pcpi_rd_wb_o          =  pcpi_rd_wb_r;
assign pcpi_rd2_wb_o         =  pcpi_rd2_wb_r;
assign pcpi_use_rd64_wb_o    =  pcpi_use_rd64_wb_r;
assign inst_wb_o             =  inst_wb_r;
assign rs1_data_wb_o         =  rs1_data_wb_r;

`ifdef ISA_EXT_F
reg [`XPR_LEN-1:0]              fpu_out_wb_r;
assign fpu_out_wb_o          =  fpu_out_wb_r;
`endif


always @(posedge clk_i or negedge rst_ni) begin
  if (~rst_ni) begin
    prev_killed_WB_r      <= 0;
    had_ex_WB_r           <= 0;
    PC_WB_r               <= 0;
    alu_out_wb_r          <= 0;
    csr_rdata_wb_r        <= 0;
    dmem_type_wb_r        <= 0;
    store_data_wb_r       <= 0;
    pcpi_rd_wb_r          <= 0;
    pcpi_rd2_wb_r         <= 0;
    pcpi_use_rd64_wb_r    <= 0;
    inst_wb_r             <= 0;
    rs1_data_wb_r         <= 0;
`ifdef ISA_EXT_F
   fpu_out_wb_r           <= 0;
`endif
  end else if (!stall_WB_i) begin
    prev_killed_WB_r      <= killed_EX_i;
    had_ex_WB_r           <= ex_EX_i;
    PC_WB_r               <= PC_EX_i;
    alu_out_wb_r          <= alu_out_i;
    csr_rdata_wb_r        <= csr_rdata_i;
    dmem_type_wb_r        <= dmem_type_i;
    store_data_wb_r       <= store_data_i;
    pcpi_rd_wb_r          <= pcpi_rd_i;
    pcpi_rd2_wb_r         <= pcpi_rd2_i;
    pcpi_use_rd64_wb_r    <= pcpi_use_rd64_i;
    inst_wb_r             <= inst_ex_i;
    rs1_data_wb_r         <= rs1_data_i;
`ifdef ISA_EXT_F
    fpu_out_wb_r         <= fpu_out_i;
`endif 
  end
end
endmodule

