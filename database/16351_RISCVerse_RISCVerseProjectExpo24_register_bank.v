// This program was cloned from: https://github.com/chandana38/RISCVerse
// License: MIT License

`timescale 1ns / 1ps
module register_bank(
input clk,
input rst,
input [31:0] instr_reg_fetch,
input [31:0] alu_control_decode,
output reg [31:0] operand_a,
output reg [31:0] operand_b);

reg [31:0] reg_bnk [31:0];

always@(*)
begin
	if(!rst)
	begin
		operand_a = 32'h0;
		operand_b = 32'h0;
	end
	else
	begin
		if(alu_control_decode[1])
		begin
			operand_a = reg_bnk[instr_reg_fetch[19:15]];
			operand_b = reg_bnk[instr_reg_fetch[24:20]];
		end
		else
		begin
			operand_a = operand_a;
			operand_b = operand_b;
		end
	end
	end
endmodule

