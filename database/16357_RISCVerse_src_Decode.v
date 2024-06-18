// This program was cloned from: https://github.com/chandana38/RISCVerse
// License: MIT License




`timescale 1ns / 1ps
module decode1#( parameter data_width = 32)(
input clk,
input rst,
input [data_width-1:0] instr_reg_fetch,
input [data_width-1:0] pc_fetch,
input [data_width-1:0] npc_fetch,
input [31:0] cntrl_sig_decode,
input [3:0] alu_control_decode,
input [31:0] imm_data_decode,
input [31:0] operand_a,
input [31:0] operand_b,
output reg [data_width-1:0] instr_reg_decode,
output reg [data_width-1:0] pc_decode,
output reg [data_width-1:0] npc_decode,
output reg  [31:0] cntrl_sig_decode_out,
output reg  [3:0] alu_control_decode_out,
output reg  [31:0] imm_data_decode_out,
output reg  [31:0] operand_A,
output reg  [31:0] operand_B);

always @(posedge clk or negedge rst)
begin
	if(rst)
	begin
      instr_reg_decode <= 0;
		pc_decode <= 0;
		npc_decode <= 0;
		cntrl_sig_decode_out <= 0;
		alu_control_decode_out <= 0;
		imm_data_decode_out <= 0;
	
	end
	else
	begin
		instr_reg_decode <= instr_reg_fetch;
		pc_decode <= pc_fetch+4;
		npc_decode <= npc_fetch+4;
		cntrl_sig_decode_out <= cntrl_sig_decode;
		alu_control_decode_out <= alu_control_decode;
		imm_data_decode_out <= imm_data_decode;
		operand_A <= operand_a;
		operand_B <= operand_b;
	end
end



endmodule
