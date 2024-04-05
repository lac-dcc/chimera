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
// File             : airi5c_src_a_mux.v
// Author           : A. Stanitzki
// Creation Date    : 09.10.20
// Last Modified    : 15.02.21
// Version          : 1.0
// Abstract         : Sets the source for the ALU 
//
`timescale 1ns/100ps

`include "airi5c_ctrl_constants.vh"
`include "rv32_opcodes.vh"

module airi5c_src_a_mux(
  input [`SRC_A_SEL_WIDTH-1:0] src_a_sel_i,
  input [`XPR_LEN-1:0]         pc_ex_i,
  input [`XPR_LEN-1:0]         rs1_data_i,
  output reg [`XPR_LEN-1:0]    alu_src_a_o
);


always @(*) begin
  case (src_a_sel_i)
    `SRC_A_RS1 : alu_src_a_o = rs1_data_i;
    `SRC_A_PC : alu_src_a_o = pc_ex_i;
    default : alu_src_a_o = 0;
  endcase
end

endmodule
