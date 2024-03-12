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
// File             : airi5c_imm_gen.v
// Author           : A. Stanitzki
// Creation Date    : 09.10.20
// Last Modified    : 15.02.21
// Version          : 1.0
// Abstract         : Defines the position of immediates depending on the instruction format 
//
`timescale 1ns/100ps


`include "airi5c_ctrl_constants.vh"
`include "rv32_opcodes.vh"

module airi5c_imm_gen(
  input [`XPR_LEN-1:0]        inst_i,
  input [`IMM_TYPE_WIDTH-1:0] imm_type_i,
  output reg [`XPR_LEN-1:0]   imm_o
);

  always @(*) begin
    case (imm_type_i)
     `IMM_I : imm_o = { {21{inst_i[31]}}, inst_i[30:25], inst_i[24:21], inst_i[20] };
     `IMM_S : imm_o = { {21{inst_i[31]}}, inst_i[30:25], inst_i[11:8], inst_i[7] };
     `IMM_U : imm_o = { inst_i[31], inst_i[30:20], inst_i[19:12], 12'b0 };
     `IMM_J : imm_o = { {12{inst_i[31]}}, inst_i[19:12], inst_i[20], inst_i[30:25], inst_i[24:21], 1'b0 };
     default : imm_o = `XPR_LEN'hdeadbeef;
    endcase 
   end

endmodule 
