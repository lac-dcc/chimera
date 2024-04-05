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
// =================================================================================================
`timescale 1ns/100ps

`include "airi5c_alu_ops.vh"
`include "rv32_opcodes.vh"

module airi5c_alu(
  input [`ALU_OP_WIDTH-1:0] op_i,   // operation to be performed
  input [`XPR_LEN-1:0]      in1_i,  // A input
  input [`XPR_LEN-1:0]      in2_i,  // B input
  output reg [`XPR_LEN-1:0] out_o,   // result
  output                    cmp_true_o
);

  assign cmp_true_o = out_o[0];
  wire [`SHAMT_WIDTH-1:0] shamt = in2_i[`SHAMT_WIDTH-1:0];

  always @(*) begin
    case (op_i)
      `ALU_OP_ADD  : out_o = in1_i + in2_i;            // (signed) add
      `ALU_OP_SLL  : out_o = in1_i << shamt;           // bitwise shift left by shamt bits
      `ALU_OP_XOR  : out_o = in1_i ^ in2_i;            // bitwise XOR
      `ALU_OP_OR   : out_o = in1_i | in2_i;            // bitwise OR
      `ALU_OP_AND  : out_o = in1_i & in2_i;            // bitwise AND
      `ALU_OP_SRL  : out_o = in1_i >> shamt;           // bitwise shift right by shamt bits
      `ALU_OP_SEQ  : out_o = {31'b0, in1_i == in2_i};  // compare EQUAL, extend to 32 bits 
      `ALU_OP_SNE  : out_o = {31'b0, in1_i != in2_i};  // compare NOT EQUAL, extend to 32 bits 
      `ALU_OP_SUB  : out_o = in1_i - in2_i;            // (signed) sub
      `ALU_OP_SRA  : out_o = $signed(in1_i) >>> shamt; // shift right, keep sign bit

      `ALU_OP_SLT  : out_o = {31'b0, $signed(in1_i) < $signed(in2_i)}; // (signed) compare LESS  

      `ALU_OP_SGE  : out_o = {31'b0, $signed(in1_i) >= $signed(in2_i)};// (signed) compare GREATER 
                                                      // OR EQUAL

      `ALU_OP_SLTU : out_o = {31'b0, in1_i < in2_i};  // unsigned compare less, extend to 32 bits 
                                                      // with zeroes
      `ALU_OP_SGEU : out_o = {31'b0, in1_i >= in2_i}; // unsigned compare greater or equal, 
                                                      // extend to 32 bits with zeroes
      default      : out_o = 0;                       // should never be reached.
    endcase
  end
endmodule
