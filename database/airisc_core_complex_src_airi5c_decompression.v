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
//
// File             : airi5c_decompression.v
// Author           : M. Richter, S. Nolting
// Creation Date    : 21.12.21
// Last Modified    : 12.12.22
// Version          : 0.1
// Abstract         : Decompression logic for C-Extension
// History          : 21.12.2021 - initial creation
//                    14.12.2022 - Code cleanups [nolting]
//

`include "rv32_opcodes.vh"

module airi5c_decompression (
  input   [(`XPR_LEN/2)-1:0]  instruction_i,
  output  [`XPR_LEN-1:0]      instruction_o,
  output                      c_inst_detected_o,
  output                      c_jal_o,
  output                      c_j_o,
  output                      c_beqz_o,
  output                      c_bnez_o,
  output  [20:0]              jal_imm_o,
  output  [20:0]              j_imm_o,
  output  [12:0]              beqz_imm_o,
  output  [12:0]              bnez_imm_o
);

reg                 c_inst_detected;
reg  [`XPR_LEN-1:0] instruction_decoded;
wire [4:0]          func = {instruction_i[15:13],instruction_i[1:0]};

// decode instructions

wire  c_addi4spn           = (func == 5'b00000) && (instruction_i[12:5] != 0);
wire  c_fld                = (func == 5'b00100);
wire  c_lw                 = (func == 5'b01000);
wire  c_flw                = (func == 5'b01100);
wire  c_fsd                = (func == 5'b10100);
wire  c_sw                 = (func == 5'b11000);
wire  c_fsw                = (func == 5'b11100);

wire  c_nop                = (func == 5'b00001) && (instruction_i[11:7] == 0);
wire  c_addi               = (func == 5'b00001) && ~(instruction_i[11:7] == 0) && ~({instruction_i[12],instruction_i[6:2]} == 0);
wire  c_jal                = (func == 5'b00101);
wire  c_li                 = (func == 5'b01001);
wire  c_addi16sp           = (func == 5'b01101) && (instruction_i[11:7] == 2);
wire  c_lui                = (func == 5'b01101) && ~((instruction_i[11:7] == 2) || (instruction_i[11:7] == 0));
wire  c_srli               = (func == 5'b10001) && (instruction_i[11:10] == 2'b00);
wire  c_srai               = (func == 5'b10001) && (instruction_i[11:10] == 2'b01);
wire  c_andi               = (func == 5'b10001) && (instruction_i[11:10] == 2'b10);

wire  c_sub                = (func == 5'b10001) && (instruction_i[12] == 1'b0) && (instruction_i[11:10] == 2'b11) && (instruction_i[6:5] == 2'b00);
wire  c_xor                = (func == 5'b10001) && (instruction_i[12] == 1'b0) && (instruction_i[11:10] == 2'b11) && (instruction_i[6:5] == 2'b01);
wire  c_or                 = (func == 5'b10001) && (instruction_i[12] == 1'b0) && (instruction_i[11:10] == 2'b11) && (instruction_i[6:5] == 2'b10);
wire  c_and                = (func == 5'b10001) && (instruction_i[12] == 1'b0) && (instruction_i[11:10] == 2'b11) && (instruction_i[6:5] == 2'b11);

wire  c_subw               = (func == 5'b10001) && (instruction_i[12] == 1'b1) && (instruction_i[11:10] == 2'b11) && (instruction_i[6:5] == 2'b00);
wire  c_addw               = (func == 5'b10001) && (instruction_i[12] == 1'b1) && (instruction_i[11:10] == 2'b11) && (instruction_i[6:5] == 2'b01);

wire  c_j                  = (func == 5'b10101);

wire  c_beqz               = (func == 5'b11001);
wire  c_bnez               = (func == 5'b11101);

wire  c_slli               = (func == 5'b00010) && ~(instruction_i[11:7] == 0);
wire  c_fldsp              = (func == 5'b00110);
wire  c_lwsp               = (func == 5'b01010) && ~(instruction_i[11:7] == 0);
wire  c_flwsp              = (func == 5'b01110);
wire  c_jr                 = (func == 5'b10010) && (instruction_i[12] == 1'b0) && ~(instruction_i[11:7] == 0) && (instruction_i[6:2] == 0);
wire  c_mv                 = (func == 5'b10010) && (instruction_i[12] == 1'b0) && ~(instruction_i[11:7] == 0) && ~(instruction_i[6:2] == 0);
wire  c_ebreak             = (instruction_i[15:0] == 16'b1001000000000010);
wire  c_jalr               = (func == 5'b10010) && (instruction_i[12] == 1'b1) && ~(instruction_i[11:7] == 0) && (instruction_i[6:2] == 0);
wire  c_add                = (func == 5'b10010) && (instruction_i[12] == 1'b1) && ~(instruction_i[11:7] == 0) && ~(instruction_i[6:2] == 0);
wire  c_fsdsp              = (func == 5'b10110);
wire  c_swsp               = (func == 5'b11010);
wire  c_fswsp              = (func == 5'b11110);

wire  [11:0]  fld_imm      = {4'b0000,instruction_i[6:5],instruction_i[12:10],3'b000};
//wire  [19:0]  jal_imm    = {instruction_i[12],instruction_i[8],instruction_i[10:9],instruction_i[6],instruction_i[7],instruction_i[2],instruction_i[11],instruction_i[5:3],instruction_i[12],{8{instruction_i[12]}}};
wire  [20:0]  jal_imm      = {{10{instruction_i[12]}},instruction_i[8],instruction_i[10:9],instruction_i[6],instruction_i[7],instruction_i[2],instruction_i[11],instruction_i[5:3], 1'b0};
wire  [11:0]  fldsp_imm    = {3'b000,instruction_i[4:2],instruction_i[12],instruction_i[6:5],3'b000};
wire  [11:0]  lw_imm       = {5'b00000,instruction_i[5],instruction_i[12:10],instruction_i[6],2'b00};
wire  [11:0]  li_imm       = {{7{instruction_i[12]}},instruction_i[6:2]};

wire  [11:0]  lwsp_imm     = {4'b0000,instruction_i[3:2],instruction_i[12],instruction_i[6:4],2'b00};
wire  [11:0]  flwsp_imm    = {4'b0000,instruction_i[3:2],instruction_i[12],instruction_i[6:4],2'b00};

wire  [11:0]  flw_imm      = {5'b00000,instruction_i[5],instruction_i[12:10],instruction_i[6],2'b00};
wire  [11:0]  addi_imm     = {{7{instruction_i[12]}},instruction_i[6:2]};
wire  [11:0]  addi4spn_imm = {2'b00,instruction_i[10:7],instruction_i[12:11],instruction_i[5],instruction_i[6],2'b00};
wire  [11:0]  addi16sp_imm = {{2{instruction_i[12]}},instruction_i[12],instruction_i[4:3],instruction_i[5],instruction_i[2],instruction_i[6],4'b0000};
wire  [31:12] lui_imm      = {{14{instruction_i[12]}},instruction_i[12],instruction_i[6:2]};
wire  [11:0]  andi_imm     = {{7{instruction_i[12]}},instruction_i[6:2]};
wire  [11:0]  fsd_imm      = {4'b0000,instruction_i[6:5],instruction_i[12:10],3'b000};
//wire  [19:0]  j_imm      = {instruction_i[12],instruction_i[8],instruction_i[10:9],instruction_i[6],instruction_i[7],instruction_i[2],instruction_i[11],instruction_i[5:3],instruction_i[12],{8{instruction_i[12]}}};
wire  [20:0]  j_imm        = {{10{instruction_i[12]}},instruction_i[8],instruction_i[10:9],instruction_i[6],instruction_i[7],instruction_i[2],instruction_i[11],instruction_i[5:3], 1'b0};

wire  [11:0]  fsdsp_imm    = {3'b000,instruction_i[9:7],instruction_i[12:10],3'b000};

wire  [11:0]  sw_imm       = {5'b00000,instruction_i[5],instruction_i[12:10],instruction_i[6],2'b00};
wire  [11:0]  fsw_imm      = {5'b00000,instruction_i[5],instruction_i[12:10],instruction_i[6],2'b00};

wire  [12:0]  beqz_imm     = {{4{instruction_i[12]}},instruction_i[12],instruction_i[6:5],instruction_i[2],instruction_i[11:10],instruction_i[4:3],1'b0};
wire  [12:0]  bnez_imm     = {{4{instruction_i[12]}},instruction_i[12],instruction_i[6:5],instruction_i[2],instruction_i[11:10],instruction_i[4:3],1'b0};

wire  [11:0]  swsp_imm     = {4'b0000,instruction_i[8:7],instruction_i[12:9],2'b00};
wire  [11:0]  fswsp_imm    = {4'b0000,instruction_i[8:7],instruction_i[12:9],2'b00};

always @(*) begin
  instruction_decoded = 32'hdeadbeef;
  if (instruction_i[1:0] == 2'b11) begin // regular instruction (32-bit)
    c_inst_detected     = 1'b0;
    instruction_decoded = instruction_i;
  end else begin // compressed instruction (16-bit)
    c_inst_detected = 1'b1;
    case(func)
      5'b00000  : instruction_decoded = c_addi4spn ? {addi4spn_imm,5'b00010,3'b000,2'b01,instruction_i[4:2],7'b0010011} : 32'h0;  // addi4spn or illegal
      5'b00001  : instruction_decoded = c_nop ? 32'h00000013 : c_addi ? {addi_imm ,instruction_i[11:7],3'b000,instruction_i[11:7],7'b0010011} : 32'h00000013; // nop or addi or reserved for hint (--> do a nop)
      5'b00010  : instruction_decoded = c_slli ? {7'b0000000, instruction_i[6:2],instruction_i[11:7],3'b001,instruction_i[11:7],7'b0010011} : 32'h0; // slli or illegal
//    5'b00011  : instruction_decoded = 
      5'b00100  : instruction_decoded = c_fld ? {fld_imm,2'b01,instruction_i[9:7],3'b011,2'b01,instruction_i[4:2],7'b0000111} : 32'h0; // fld or illegal
      5'b00101  : instruction_decoded = c_jal ? {jal_imm[20],jal_imm[10:1],jal_imm[11],jal_imm[19:12],5'b00001,7'b1101111} : 32'h0; // jal or illegal
      5'b00110  : instruction_decoded = c_fldsp ? {fldsp_imm,5'b00010,3'b011,instruction_i[11:7],7'b0000111} : 32'h0; // fldsp or illegal
//    5'b00111  : instruction_decoded = 
      5'b01000  : instruction_decoded = c_lw ? {lw_imm,2'b01,instruction_i[9:7],3'b010,2'b01,instruction_i[4:2],7'b0000011} : 32'h0; // lw or illegal
      5'b01001  : instruction_decoded = c_li ? {li_imm,5'b00000,3'b000,instruction_i[11:7],7'b0010011} : 32'h0; // li or illegal
      5'b01010  : instruction_decoded = c_lwsp ? {lwsp_imm,5'b00010,3'b010,instruction_i[11:7],7'b0000011} : 32'h0; // lw or illegal
//    5'b01011  : instruction_decoded = 
      5'b01100  : instruction_decoded = c_flw ? {flw_imm,2'b01,instruction_i[9:7],3'b010,2'b01,instruction_i[4:2],7'b0000111} : 32'h0; // flw or illegal
      5'b01101  : instruction_decoded = c_addi16sp ? {addi16sp_imm, 5'b00010,3'b000,5'b00010,7'b0010011} : c_lui ? {lui_imm,instruction_i[11:7],7'b0110111} : 32'h0; // addi16sp or lui or illegal
      5'b01110  : instruction_decoded = c_flwsp ? {flwsp_imm,5'b00010,3'b010,instruction_i[11:7],7'b0000111} : 32'h0; // flwsp or illegal
//    5'b01111  : instruction_decoded = 
      5'b10000  : instruction_decoded = 32'h0; // reserved
      5'b10001  : instruction_decoded = c_srli ? { 7'b0000000,instruction_i[6:2],2'b01,instruction_i[9:7],3'b101,2'b01,instruction_i[9:7],7'b0010011} :
                                        c_srai ? { 7'b0100000,instruction_i[6:2],2'b01,instruction_i[9:7],3'b101,2'b01,instruction_i[9:7],7'b0010011} :
                                        c_andi ? { andi_imm,2'b01,instruction_i[9:7],3'b111,2'b01,instruction_i[9:7],7'b0010011} :
                                        c_sub ? { 7'b0100000,2'b01,instruction_i[4:2],2'b01,instruction_i[9:7],3'b000,2'b01,instruction_i[9:7],7'b0110011} :
                                        c_xor ? { 7'b0000000,2'b01,instruction_i[4:2],2'b01,instruction_i[9:7],3'b100,2'b01,instruction_i[9:7],7'b0110011} :
                                        c_or ? { 7'b0000000,2'b01,instruction_i[4:2],2'b01,instruction_i[9:7],3'b110,2'b01,instruction_i[9:7],7'b0110011} :
                                        c_and ? { 7'b0000000,2'b01,instruction_i[4:2],2'b01,instruction_i[9:7],3'b111,2'b01,instruction_i[9:7],7'b0110011} : 32'h0;
      5'b10010  : instruction_decoded = c_jr ? { 12'h0, instruction_i[11:7],3'b000,5'h0,7'b1100111} : 
                                        c_mv ? { 7'b0000000,instruction_i[6:2],5'b00000,3'b000,instruction_i[11:7],7'b0110011} : //C.MV expands into add rd, x0, rs2
                                        c_ebreak ? { 12'h1,13'h0,7'b1110011} :
                                        c_jalr ? { 12'h0,instruction_i[11:7],3'b000,5'b00001,7'b1100111 } :
                                        c_add ? { 7'h0,instruction_i[6:2],instruction_i[11:7],3'b000,instruction_i[11:7],7'b0110011 } : 32'h0;
//      5'b10011  :  instruction_decoded = 
      5'b10100  : instruction_decoded = c_fsd ? { fsd_imm[11:5],2'b01,instruction_i[4:2],2'b01,instruction_i[9:7],3'b011,fsd_imm[4:0],7'b0100111} : 32'h0; // fsd or illegal
      5'b10101  : instruction_decoded = c_j ? { j_imm[20],j_imm[10:1],j_imm[11],j_imm[19:12],5'b00000,7'b1101111} : 32'h0; // j or illegal
      5'b10110  : instruction_decoded = c_fsdsp ? { fsdsp_imm[11:5], instruction_i[6:2],5'b00010,3'b011,fsdsp_imm[4:0],7'b0100111} : 32'h0; // fsdsp or illegal
//    5'b10111  : instruction_decoded = 
      5'b11000  : instruction_decoded = c_sw ? { sw_imm[11:5],2'b01,instruction_i[4:2],2'b01,instruction_i[9:7],3'b010,sw_imm[4:0],7'b0100011} : 32'h0; // sw or illegal
      5'b11001  : instruction_decoded = c_beqz ? { beqz_imm[12],beqz_imm[10:5],5'b00000,2'b01,instruction_i[9:7],3'b000,beqz_imm[4:1],beqz_imm[11],7'b1100011} : 32'h0; // beqz or illegal
      5'b11010  : instruction_decoded = c_swsp ? { swsp_imm[11:5],instruction_i[6:2],5'b00010,3'b010,swsp_imm[4:0],7'b0100011} : 32'h0; // swsp or illegal
//    5'b11011  : instruction_decoded = 
      5'b11100  : instruction_decoded = c_fsw ? { fsw_imm[11:5],2'b01,instruction_i[4:2],2'b01,instruction_i[9:7],3'b010,fsw_imm[4:0],7'b0100111} : 32'h0; // fsw or illegal
      5'b11101  : instruction_decoded = c_bnez ? { bnez_imm[12],bnez_imm[10:5],5'b00000,2'b01,instruction_i[9:7],3'b001,bnez_imm[4:1],bnez_imm[11],7'b1100011} : 32'h0; // bnez or illegal
      5'b11110  : instruction_decoded = c_fswsp ? { fswsp_imm[11:5],instruction_i[6:2],5'b00010,3'b010,fswsp_imm[4:0],7'b0100111} : 32'h0; // fswsp or illegal
//    5'b11111  : instruction_decoded = 
    endcase
  end  
end
    
assign instruction_o     = instruction_decoded;
assign c_inst_detected_o = c_inst_detected;
assign c_jal_o           = c_jal;
assign c_jalr_o          = c_jalr;
assign c_j_o             = c_j;
assign c_jr_o            = c_jr;
assign c_beqz_o          = c_beqz;
assign c_bnez_o          = c_bnez;
assign jal_imm_o         = jal_imm;
assign j_imm_o           = j_imm;
assign beqz_imm_o        = beqz_imm;
assign bnez_imm_o        = bnez_imm;

endmodule
