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
`include "./airi5c_hasti_constants.vh"
`ifndef XPR_LEN
`define XPR_LEN 32
`endif

module airi5c_custom (
  input                       nreset,
  input                       clk,
  input                       pcpi_valid,
  input       [`XPR_LEN-1:0]  pcpi_insn,
  input       [`XPR_LEN-1:0]  pcpi_rs1,
  input       [`XPR_LEN-1:0]  pcpi_rs2,
  input       [`XPR_LEN-1:0]  pcpi_rs3,
  output  reg                 pcpi_wr,
  output  reg [`XPR_LEN-1:0]  pcpi_rd,
  output  reg [`XPR_LEN-1:0]  pcpi_rd2,
  output  reg                 pcpi_use_rd64,
  output  reg                 pcpi_wait,
  output  reg                 pcpi_ready
);

reg [2:0] state, next_state;


localparam [2:0] STATE_RESET = 0,
                 STATE_DECODE = 1,
                 STATE_CUSTOM = 2,
                 STATE_FINISH = 3,
                 STATE_ERROR  = 4;

reg [`XPR_LEN-1:0]  insn_r; 
reg [`XPR_LEN-1:0]  rs1_r, rs2_r;

// input hold registers

always @(posedge clk or negedge nreset) begin
  if(~nreset) begin
    insn_r <= `XPR_LEN'h0;
    rs1_r  <= `XPR_LEN'h0;
    rs2_r  <= `XPR_LEN'h0;
  end else begin
    if(pcpi_valid) begin
      insn_r <= pcpi_insn;
    end
    if(state == STATE_DECODE) begin
      rs1_r  <= pcpi_rs1;
      rs2_r  <= pcpi_rs2;
    end
  end
end

// insn decoding

wire  [6:0] funct7; assign funct7 = pcpi_insn[31:25]; //insn_r[31:25];
wire  [2:0] funct3; assign funct3 = pcpi_insn[14:12]; //insn_r[14:12];
wire  [6:0] opcode; assign opcode = pcpi_insn[6:0];   //insn_r[6:0];

wire simd_funct = (funct3 == 0) && (funct7 == 7'b1010100 || funct7 == 7'b1010101 || funct7 == 7'b1011100 || funct7 == 7'b1011101 || (funct7 == 7'h50) || (funct7 == 7'h51) || (funct7 == 7'h58) || (funct7 == 7'h59) ); 

wire  custom_funct;
assign custom_funct = (opcode == 7'h77) && ~simd_funct;

wire  inst_custom;
assign inst_custom = custom_funct;

wire  inst_invalid;
assign inst_invalid = ~custom_funct;      

always @(posedge clk or negedge nreset) begin
  if(~nreset) begin
    state <= STATE_RESET;
  end else begin
    state <= next_state;
  end
end

/* ================================== */

reg [`XPR_LEN-1:0]  result_r;
reg  [`XPR_LEN-1:0] reversed;
wire [`XPR_LEN-1:0] result_custom;

always @(posedge clk or negedge nreset) begin
  if(~nreset) begin
    result_r <= `XPR_LEN'hdeadbeef;
  end else begin
    case(state)
      STATE_CUSTOM  : result_r <= result_custom;
      default        : result_r <= result_r;
    endcase
  end
end

always @* begin
  reversed[0] = rs1_r[31]; //why not reversed[31:0] = rs1_r[0:31]; or does that only work in VHDl? 
  reversed[1] = rs1_r[30];
  reversed[2] = rs1_r[29];
  reversed[3] = rs1_r[28];
  reversed[4] = rs1_r[27];
  reversed[5] = rs1_r[26];
  reversed[6] = rs1_r[25];
  reversed[7] = rs1_r[24];
  reversed[8] = rs1_r[23];
  reversed[9] = rs1_r[22];
  reversed[10] = rs1_r[21];
  reversed[11] = rs1_r[20];
  reversed[12] = rs1_r[19];
  reversed[13] = rs1_r[18];
  reversed[14] = rs1_r[17];
  reversed[15] = rs1_r[16];
  reversed[16] = rs1_r[15];
  reversed[17] = rs1_r[14];
  reversed[18] = rs1_r[13];
  reversed[19] = rs1_r[12];
  reversed[20] = rs1_r[11];
  reversed[21] = rs1_r[10];
  reversed[22] = rs1_r[9];
  reversed[23] = rs1_r[8];
  reversed[24] = rs1_r[7];
  reversed[25] = rs1_r[6];
  reversed[26] = rs1_r[5];
  reversed[27] = rs1_r[4];
  reversed[28] = rs1_r[3];
  reversed[29] = rs1_r[2];
  reversed[30] = rs1_r[1];
  reversed[31] = rs1_r[0];
end
	
assign result_custom = reversed;

always @(*) begin
  next_state = STATE_ERROR;
  pcpi_wr = 1'b0;
  pcpi_rd = 0;
  pcpi_wait = 1'b0;
  pcpi_ready = 1'b0;

  // third operand / second result is not used in 
  // this example
  pcpi_use_rd64 = 1'b0;
  pcpi_rd2      = 32'h0;


  case(state) 
    STATE_RESET  : next_state = STATE_DECODE; // rfu    
    STATE_DECODE : begin
      pcpi_wait  = ~inst_invalid;
      next_state = !(pcpi_valid && ~inst_invalid) ? STATE_DECODE : 
      (inst_custom) ? STATE_CUSTOM : STATE_DECODE;
    end
    STATE_CUSTOM  : begin
      pcpi_wait = 1'b1;
      next_state = STATE_FINISH;
    end
    STATE_FINISH : begin
      pcpi_ready = 1'b1;
      pcpi_wr = 1'b1;
      pcpi_rd = result_r;
      next_state = STATE_DECODE;
    end
  endcase
end

endmodule 
