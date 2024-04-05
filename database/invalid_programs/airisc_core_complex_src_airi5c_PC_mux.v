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
// File             : airi5c_PC_mux.v
// Author           : A. Stanitzki
// Creation Date    : 09.10.20
// Last Modified    : 01.02.22
// Version          : 1.0
// Abstract         : Calculates possible branch targets for the program counter 
// Notes            : originally, calculation of next PC (PC_PIF) starts with finalized
//                    branch decision in ALU stage. It is way faster to calculate
//                    possible branch targets in parallel and multiplex the chosen 
//                    address to the PC_PIF, as soon as the ALU decides. 
`timescale 1ns/100ps

`include "airi5c_ctrl_constants.vh"
`include "rv32_opcodes.vh"
`include "airi5c_arch_options.vh"
`include "rv32_opcodes.vh"

module airi5c_pc_mux(
  input  [`PC_SRC_SEL_WIDTH-1:0] pc_src_sel_i,
  input                          compressed_if_i,
  input                          compressed_ex_i,
  input  [`INST_WIDTH-1:0]       inst_ex_i,
  input  [`XPR_LEN-1:0]          rs1_data_bypassed_i,
  input  [`XPR_LEN-1:0]          pc_if_i,
  input  [`XPR_LEN-1:0]          pc_ex_i,
  input  [`XPR_LEN-1:0]          handler_pc_i,
  input  [`XPR_LEN-1:0]          dpc_i,
  input  [`XPR_LEN-1:0]          epc_i,
  output [`XPR_LEN-1:0]          pc_pif_o
  );

  wire [`XPR_LEN-1:0] imm_b = { {20{inst_ex_i[31]}}, inst_ex_i[7], inst_ex_i[30:25], inst_ex_i[11:8], 1'b0 };
  wire [`XPR_LEN-1:0] jal_offset = { {12{inst_ex_i[31]}}, inst_ex_i[19:12], inst_ex_i[20], inst_ex_i[30:25], inst_ex_i[24:21], 1'b0 };
  wire [`XPR_LEN-1:0] jalr_offset = { {21{inst_ex_i[31]}}, inst_ex_i[30:20]};

  wire [6:0]          opcode = inst_ex_i[6:0];

  wire                jal    = (opcode == `RV32_JAL);
  wire                jalr   = (opcode == `RV32_JALR);
  wire                branch = (opcode == `RV32_BRANCH);
  reg [`XPR_LEN-1:0]  base;
  reg [`XPR_LEN-1:0]  offset;
  reg [`XPR_LEN-1:0]  result;

  always @(*) begin
    case (pc_src_sel_i)
      `PC_JAL_TARGET : begin
         base = pc_ex_i;
         offset = jal_offset;
         result = base + offset;
      end
      `PC_JALR_TARGET : begin  
         //base = bypass_rs1_i ? rs1_data_bypassed_i : rs1_data_i;
         base = rs1_data_bypassed_i;
         offset = jalr_offset;
         result = (base + offset) & ~(`XPR_LEN'h1);
      end
      `PC_BRANCH_TARGET : begin
         base = pc_ex_i;
         offset = imm_b;
         result = base + offset;
      end
      `PC_REPLAY : begin
         base = pc_if_i;
         offset = `XPR_LEN'h0;
         result = base + offset;
      end
      `PC_HANDLER : begin
         base = handler_pc_i;
         offset = `XPR_LEN'h0;
         result = base + offset;
      end
      `PC_EPC : begin
         base = epc_i;
         offset = `XPR_LEN'h0;
         result = base + offset;
      end
      `PC_DPC : begin
         base = dpc_i;
         offset = `XPR_LEN'h0;
         result = base + offset;
      end
      `PC_MISSED_PREDICT : begin
         base = pc_ex_i;
         offset = compressed_ex_i ? `XPR_LEN'h2 : `XPR_LEN'h4;
         result = base + offset;
      end
      default : begin
         base = pc_if_i;
         offset = compressed_if_i ? `XPR_LEN'h2 : `XPR_LEN'h4;
         result = base + offset;
      end
    endcase   
  end 

  assign pc_pif_o = result;

endmodule

