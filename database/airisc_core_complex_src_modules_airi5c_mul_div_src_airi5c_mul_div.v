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
// File              : airi5c_mul_div.v 
// Author            : A. Stanitzki
// Creation Date     : 09.10.20
// Last Modified     : 15.02.21
// Version           : 1.0
// Abstract          : Implementation of multiplication and division   



`include "airi5c_hasti_constants.vh"

module airi5c_mul_div (
  input                       nreset,
  input                       clk,
  input                       pcpi_valid,
  input       [`XPR_LEN-1:0]  pcpi_insn,
  input       [`XPR_LEN-1:0]  pcpi_rs1,
  input       [`XPR_LEN-1:0]  pcpi_rs2,
  output  reg                 pcpi_wr,
  output  reg [`XPR_LEN-1:0]  pcpi_rd,
  output  reg                 pcpi_wait,
  output  reg                 pcpi_ready
);

reg [2:0] state, next_state;

`define STATE_RESET    0
`define STATE_IDLE     1
`define STATE_DECODE   2
`define STATE_MUL      3
`define STATE_DIV      4
`define STATE_REM      5
`define STATE_FINISH   6
`define STATE_ERROR    7

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
    if(state == `STATE_DECODE) begin
      rs1_r  <= pcpi_rs1;
      rs2_r  <= pcpi_rs2;
    end
  end
end

// insn decoding

wire  [6:0] funct7; assign funct7 = pcpi_insn[31:25]; //insn_r[31:25];
wire  [2:0] funct3; assign funct3 = pcpi_insn[14:12]; //insn_r[14:12];
wire  [6:0] opcode; assign opcode = pcpi_insn[6:0];   //insn_r[6:0];

wire  mul_div_funct;
assign mul_div_funct = (funct7 == 7'h1) && (opcode == 7'h33);

wire  inst_mul, inst_mulh, inst_mulhsu, inst_mulhu;

assign inst_mul     = mul_div_funct && (funct3 == 3'h0);
assign inst_mulh    = mul_div_funct && (funct3 == 3'h1);
assign inst_mulhsu  = mul_div_funct && (funct3 == 3'h2);
assign inst_mulhu   = mul_div_funct && (funct3 == 3'h3);

wire  inst_div, inst_divu;

assign inst_div   = mul_div_funct && (funct3 == 3'h4);
assign inst_divu  = mul_div_funct && (funct3 == 3'h5);

wire  inst_rem, inst_remu;

assign inst_rem   = mul_div_funct && (funct3 == 3'h6);
assign inst_remu  = mul_div_funct && (funct3 == 3'h7);

wire  inst_invalid;
assign inst_invalid = ~(inst_mul ||
      inst_mulh   ||
      inst_mulhsu ||
      inst_mulhu  ||
      inst_div    ||
      inst_divu   ||
      inst_rem    ||
      inst_remu);


always @(posedge clk or negedge nreset) begin
  if(~nreset) begin
    state <= `STATE_RESET;
  end else begin
    state <= next_state;
  end
end

`define STATE_MUL_IDLE     1
`define STATE_MUL_STAGE1   2
`define STATE_MUL_STAGE2   3
`define STATE_MUL_STAGE3   4
`define STATE_MUL_STAGE4   5
`define STATE_MUL_STAGE5   6
`define STATE_MUL_FINISHED 7

wire  signed [`XPR_LEN-1:0] rs1_r_signed; assign rs1_r_signed = rs1_r;
wire  signed [`XPR_LEN-1:0] rs2_r_signed; assign rs2_r_signed = rs2_r;

reg signed [(2*`XPR_LEN)-1:0] result_mul;
reg [`XPR_LEN-1:0]      mul_opa, mul_opb, mul_opa_r, mul_opb_r;
reg         mul_sign, mul_sign_r;
reg [(2*`XPR_LEN)-1:0]    pp, pp_r;



reg [2:0] mul_state, next_mul_state;
reg   mul_finished;

always @(posedge clk or negedge nreset) begin 
  if(~nreset) begin
    mul_state  <= `STATE_MUL_IDLE;
    mul_opa_r  <= 0;
    mul_opb_r  <= 0;
    mul_sign_r <= 0;
    pp_r <= 0;
  end else begin
    mul_state <= next_mul_state;
    pp_r <= pp;
    if(mul_state == `STATE_MUL_STAGE1) begin
      mul_opa_r  <= mul_opa;
      mul_opb_r  <= mul_opb;
      mul_sign_r <= mul_sign;
    end
  end
end

always @(*) begin
  next_mul_state = `STATE_MUL_IDLE;
  mul_finished = 1'b0;
  result_mul = 64'hdeadbeefdeadbeef;
  mul_sign = 1'b0;
  pp = 0;
  mul_opa = 0;
  mul_opb = 0;
  case(mul_state)
    `STATE_MUL_IDLE : next_mul_state = ((state == `STATE_DECODE) && pcpi_valid && (inst_mul || inst_mulh || inst_mulhsu || inst_mulhu)) ? `STATE_MUL_STAGE1 : `STATE_MUL_IDLE;
    `STATE_MUL_STAGE1 : begin     
      next_mul_state = `STATE_MUL_STAGE2;
      if(inst_mul || inst_mulh) begin
        mul_sign = rs1_r[31] ^ rs2_r[31];
        mul_opa = rs1_r[31] ? ((rs1_r ^ {`XPR_LEN{1'b1}}) + 1) : rs1_r;
        mul_opb = rs2_r[31] ? ((rs2_r ^ {`XPR_LEN{1'b1}}) + 1) : rs2_r;
        end else if(inst_mulhsu) begin
        mul_sign = rs1_r[31];
        mul_opa = rs1_r[31] ? ((rs1_r ^ {`XPR_LEN{1'b1}}) + 1) : rs1_r;
        mul_opb = rs2_r;
      end else if(inst_mulhu) begin
        mul_sign = 1'b0;
        mul_opa = rs1_r;
        mul_opb = rs2_r;
      end
    end
    `STATE_MUL_STAGE2 : begin
`ifdef ARCH_M_FAST
          next_mul_state = `STATE_MUL_FINISHED;
          pp = mul_opa_r * mul_opb_r;
`else
          next_mul_state = `STATE_MUL_STAGE3;
          pp = mul_opa_r[15:0] * mul_opb_r[15:0];
`endif
    end
    `STATE_MUL_STAGE3 : begin
      next_mul_state = `STATE_MUL_STAGE4;
      pp = pp_r + ((mul_opa_r[15:0] * mul_opb_r[31:16]) << 16);
    end
    `STATE_MUL_STAGE4 : begin
        next_mul_state = `STATE_MUL_STAGE5;
        pp = pp_r + ((mul_opa_r[31:16] * mul_opb_r[15:0]) << 16);
      end
    `STATE_MUL_STAGE5 : begin
      next_mul_state = `STATE_MUL_FINISHED;
      pp = pp_r + ((mul_opa_r[31:16] * mul_opb_r[31:16]) << 32);
    end
    `STATE_MUL_FINISHED : begin
      mul_finished = 1'b1;
      next_mul_state = `STATE_MUL_IDLE;
      result_mul = mul_sign_r ? (pp_r ^ {`XPR_LEN*2{1'b1}}) + 1 : pp_r;
    end
  endcase
end


`define STATE_DIV_IDLE     1
`define STATE_DIV_STAGE1   2
`define STATE_DIV_STAGE2   3
`define STATE_DIV_FINISHED 4
`define STATE_DIV_ERROR    5

reg [2:0] div_state, next_div_state;
reg   div_finished;
reg [`XPR_LEN-1:0]  result_div;
reg [`XPR_LEN-1:0]  divider_r, divider;
reg [`XPR_LEN-1:0]  divisor_r, divisor;
reg [`XPR_LEN-1:0]  sub_r, sub;
reg     div_sign_r, div_sign;
reg [5:0]   shftamnt_r, shftamnt;

always @(posedge clk or negedge nreset) begin
  if(~nreset) begin
    div_state <= `STATE_DIV_IDLE;
    divider_r <= 0;
    divisor_r <= 0;
    sub_r <= 0;
    div_sign_r <= 0;
    shftamnt_r <= 0;
  end else begin
    div_state  <= next_div_state;
    divider_r  <= divider;
    divisor_r  <= divisor;
    sub_r      <= sub;
    div_sign_r <= div_sign;
    shftamnt_r <= shftamnt;
  end
end

// non-restoring divider implementation
always @(*) begin
  next_div_state = `STATE_DIV_IDLE;
  div_sign = div_sign_r;
  div_finished = 0;
  result_div = 0;
  divider = 0;
  divisor = 0;
  sub = 0;
  shftamnt = 0;
  case(div_state)
    `STATE_DIV_IDLE : begin
      next_div_state = ((state == `STATE_DECODE) && pcpi_valid && (inst_div || inst_divu || inst_rem || inst_remu)) ? `STATE_DIV_STAGE1 : `STATE_DIV_IDLE;

    end
    `STATE_DIV_STAGE1 : begin
      next_div_state = |rs2_r ? `STATE_DIV_STAGE2 : `STATE_DIV_ERROR; // skip STAGE2 if we are dividing by zero.
      if(inst_div || inst_rem) begin        
        divisor = rs1_r[31] ? ({32{1'b1}} ^ rs1_r) + 1 : rs1_r;
        sub = rs2_r[31] ? ({32{1'b1}} ^ rs2_r) + 1 : rs2_r;
        div_sign = inst_rem ? rs1_r[31] : (rs1_r[31] ^ rs2_r[31]);
      end else begin
        divisor = rs1_r;
        sub = rs2_r;
        div_sign = 1'b0;
      end
    end
    `STATE_DIV_STAGE2 : begin       
      sub = sub_r;

      divider = ({divider_r[30:0],divisor_r[31]} < sub_r[31:0]) ? {divider_r[30:0],divisor_r[31]} : ({divider_r[30:0],divisor_r[31]} - sub_r[31:0]);

      divisor = ({divider_r[30:0],divisor_r[31]} < sub_r[31:0]) ? {divisor_r[30:0],1'b0} : {divisor_r[30:0],1'b1};

      if(shftamnt_r == 31) begin
        next_div_state = `STATE_DIV_FINISHED;
      end else begin
        next_div_state = `STATE_DIV_STAGE2;
        shftamnt = shftamnt_r + 1;
      end
    end
    `STATE_DIV_FINISHED : begin
      div_finished = 1'b1;
      next_div_state = `STATE_DIV_IDLE;
      result_div = (inst_div || inst_divu) ? (div_sign_r ? ({32{1'b1}} ^ divisor_r) + 1 : divisor_r) :
             (inst_rem || inst_remu) ? (div_sign_r ? ({32{1'b1}} ^ divider_r) + 1 : divider_r) : -1;
    end
    `STATE_DIV_ERROR : begin
      div_finished = 1'b1;
      next_div_state = `STATE_DIV_IDLE;
      result_div = (state == `STATE_DIV) ? 32'hffffffff : 
             (state == `STATE_REM) ? rs1_r : 32'hdeadbeef;
    end
  endcase
end

/* ================================== */

reg [`XPR_LEN-1:0]  result_r;
always @(posedge clk or negedge nreset) begin
  if(~nreset) begin
    result_r <= `XPR_LEN'hdeadbeef;
  end else begin
    case(state)
      `STATE_MUL  : if(mul_finished) result_r <= inst_mul ? result_mul[31:0] :
                  (inst_mulh || inst_mulhu || inst_mulhsu) ? result_mul[63:32] : -1;
      `STATE_DIV  : result_r <= result_div;
      `STATE_REM  : result_r <= result_div;
      default   : result_r <= result_r;
    endcase
  end
end


always @(*) begin
  next_state = `STATE_ERROR;
  pcpi_wr = 1'b0;
  pcpi_rd = 0; // important to allow wired OR
  pcpi_wait = 1'b0;
  pcpi_ready = 1'b0;

  case(state) 
    `STATE_RESET  : next_state = `STATE_DECODE; // rfu
    `STATE_IDLE : begin
      next_state = pcpi_valid ? `STATE_DECODE : `STATE_IDLE;
    end
    `STATE_DECODE : begin
      pcpi_wait  = ~inst_invalid;
      next_state = !(pcpi_valid && ~inst_invalid) ? `STATE_DECODE : 
      (inst_mul || inst_mulh || inst_mulhsu || inst_mulhu) ? `STATE_MUL : 
      (inst_div || inst_divu) ? `STATE_DIV :
      (inst_rem || inst_remu) ? `STATE_REM : `STATE_IDLE;
    end
    `STATE_MUL  : begin
      pcpi_wait = 1'b1;
      next_state = mul_finished ? `STATE_FINISH : `STATE_MUL;
    end
    `STATE_DIV  : begin
      pcpi_wait = 1'b1;
      next_state = div_finished ? `STATE_FINISH : `STATE_DIV;
    end
    `STATE_REM  : begin
      pcpi_wait = 1'b1;
      next_state = div_finished ? `STATE_FINISH : `STATE_REM;
    end
    `STATE_FINISH : begin
      pcpi_ready = 1'b1;
      pcpi_wr = 1'b1;
      pcpi_rd = result_r;
      next_state = `STATE_DECODE;
    end
  endcase
end

endmodule 
