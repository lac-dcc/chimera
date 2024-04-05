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
// File             : airi5c_branch_prediction.v
// Author           : M. Richter, S. Nolting
// Creation Date    : 21.12.21
// Last Modified    : 14.12.22
// Version          : 0.1
// Abstract         : Branch prediction logic for AIRISC
// History          : 21.12.2021 - initial creation [richter]
//                  : 14.12.2022 - cleanups [nolting]
// Notes            : 
//

`include "rv32_opcodes.vh"

module airi5c_branch_prediction (
  input   [`XPR_LEN-1:0]  instruction_i,
  input   [`XPR_LEN-1:0]  PC_i,
  input                   c_jal_i,
  input                   c_j_i,
  input                   c_beqz_i,
  input                   c_bnez_i,
  input   [20:0]          jal_imm_i,
  input   [20:0]          j_imm_i,
  input   [12:0]          beqz_imm_i,
  input   [12:0]          bnez_imm_i,
  output                  predicted_branch_o,
  output  [`XPR_LEN-1:0]  branch_target_o
);

// Simple branch prediction
// ------------------------
// Prediction: Forward branches are never taken, backward branches are always taken.

// partially decode instruction_i to find branches/jmps
wire branch = (instruction_i[6:0] == 7'b1100011);
wire jump   = (instruction_i[6:0] == 7'b1101111);

// calculate the branch target (register-indirect branches are not predicted!)
wire        predicted_branch   = (branch & instruction_i[31]) || jump;
wire        predicted_c_branch = ((c_beqz_i || c_bnez_i) & instruction_i[12]) || c_jal_i || c_j_i;
wire [12:0] branch_offset      = {instruction_i[31], instruction_i[7], instruction_i[30:25], instruction_i[11:8], 1'b0};
wire [20:0] jump_offset        = {instruction_i[31], instruction_i[19:12], instruction_i[20], instruction_i[30:21], 1'b0};

wire [31:0] sign_ext_offset = branch   ? {{19{branch_offset[12]}}, branch_offset} :
                              jump     ? {{11{jump_offset[20]}}, jump_offset} :
                              c_jal_i  ? {{11{jal_imm_i[20]}}, jal_imm_i} : 
                              c_j_i    ? {{11{j_imm_i[20]}}, j_imm_i} : 
                              c_beqz_i ? {{19{beqz_imm_i[12]}}, beqz_imm_i} :
                              c_bnez_i ? {{19{bnez_imm_i[12]}}, bnez_imm_i} : 32'h0;

assign branch_target_o    = PC_i + sign_ext_offset;
assign predicted_branch_o = predicted_branch || predicted_c_branch;

endmodule
