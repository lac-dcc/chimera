// This program was cloned from: https://github.com/chandana38/RISCVerse
// License: MIT License

`timescale 1ns / 1ps
module top_decode #(parameter data_width = 32)(
input clk,
input rst,
input [data_width-1:0] instr_reg_fetch,
input [data_width-1:0] pc_fetch,
input [data_width-1:0] npc_fetch,
output [data_width-1:0] instr_reg_decode,
output reg [data_width-1:0] pc_fetch_decode,
output reg [data_width-1:0] npc_fetch_decode,
output reg  [31:0] cntrl_sig_decode,
output reg  [3:0] alu_control_decode,
output reg  [31:0] imm_data_decodel,
output reg  [31:0] operand_a,
output reg  [31:0] operand_b
);

wire [31:0] cntrl_sig_decode;
wire [3:0] alu_control_decode;
wire [31:0] imm_data_decodel;
wire [31:0] operand_a;
wire [31:0] operand_b;

control_block uui_cntrl(
.rst(rst),
.instr_reg_fetch(instr_reg_fetch),
.cntrl_sig_decode(cntrl_sig_decode));

alu_cntrl uui_alu_cntrl(
.rst(rst),
.instr_reg_fetch(instr_reg_fetch),
.alu_control_decode(alu_control_decode));

sign_extension uui_sign(
.rst(rst),
.instr_reg_fetch(instr_reg_fetch),
.imm_data_decode(imm_data_decode));

reg_bank uui_regbank(
.clk(clk),
.rst(rst),
.instr_reg_fetch(instr_reg_fetch),
.alu_control_decode(alu_control_decode),
.operand_a(operand_a),
.operand_b(operand_b));


decode uui_decode( .clk(clk), 
.rst(rst), 
.instr_reg_fetch(instr_reg_fetch), 
.pc_fetch(pc_fetch), 
.npc_fetch(npc_fetch),
.cntrl_sig_decode(cntrl_sig_decode),
.alu_control_decode(alu_control_decode),
.imm_data_decodel(imm_data_decodel),
.operand_a(operand_a),
.operand_b(operand_b),
.instr_reg_decode(instr_reg_decode),
.pc_fetch_decode(pc_fetch_decode),
.npc_fetch_decode(npc_fetch_decode),
.cntrl_sig_decode(cntrl_sig_decode),
 .alu_control_decode(alu_control_decode),
.imm_data_decodel(imm_data_decodel),
.operand_a(operand_a),
.operand_b(operand_b));

endmodule

