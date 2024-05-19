// This program was cloned from: https://github.com/sxtyzhangzk/mips-cpu
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/22 16:45:58
// Design Name: 
// Module Name: alu_divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "opcode.h"

module alu_divider(
	input CLK,
	input RST,
	
	input [`ALU_OPCODE_WIDTH-1:0]	opcode,
	input [31:0]					src1,
	input [31:0]					src2,
	output reg [31:0]				result,
	
	output reg	busy,
	output reg	done
	);
	
	reg [31:0]	dividend, divisor;
	reg 		sign, remainder_flag;
	reg [31:0]	quotient, remainder, work_divisor;
	reg [4:0]	current_bit;
	
	//wire [31:0]	sign_remainder = $signed(dividend) < 0 ? -remainder : remainder;
	//wire [31:0]	sign_quotient = ($signed(dividend) < 0) ^ ($signed(divisor) < 0) ? -quotient : quotient;
	
	function [31:0] sign_remainder;
		input [31:0] in_dividend;
		input [31:0] in_remainder;
		
		if($signed(in_dividend) < 0)
			sign_remainder = -in_remainder;
		else
			sign_remainder = in_remainder;
	endfunction
	
	function [31:0] sign_quotient;
		input [31:0] in_dividend;
		input [31:0] in_divisor;
		input [31:0] in_quotient;
		
		if(($signed(dividend) < 0) ^ ($signed(divisor) < 0))
			sign_quotient = -quotient;
		else
			sign_quotient = quotient;
	endfunction
	
	task divide_bit;
		reg [63:0] tmp;
		
		begin
			tmp = {{32{1'b0}}, work_divisor} << current_bit;
			if(tmp <= remainder) begin
				quotient[current_bit] = 1;
				remainder = remainder - tmp;
			end else
				quotient[current_bit] = 0;
			current_bit = current_bit - 1;
		end
	endtask
	
	always @(posedge CLK or posedge RST) begin
		if(RST) begin
			dividend <= 0;
			divisor <= 0;
			sign <= 0;
			remainder_flag <= 0;
			quotient <= 0;
			remainder <= 0;
			current_bit <= 0;
			result <= 0;
			busy <= 0;
			done <= 0;
		end else begin
			done <= 0;
			if(!busy) begin
				if(opcode == `ALU_MOD || opcode == `ALU_MODU)
					remainder_flag = 1;
				else
					remainder_flag = 0;
				
				case(opcode)
				`ALU_DIV, `ALU_MOD: begin
					if(dividend == src1 && divisor == src2 && sign) begin
						result <= remainder_flag ? sign_remainder(dividend, remainder) : sign_quotient(dividend, divisor, quotient);
						busy <= 0;
						done <= 1;
					end else begin
						dividend <= src1;
						divisor <= src2;
						sign <= 1;
						if($signed(src1) < 0)
							remainder <= -src1;
						else
							remainder <= src1;
						if($signed(src2) < 0)
							work_divisor <= -src2;
						else
							work_divisor <= src2;
						current_bit <= 31;
						busy <= 1;
						done <= 0;
					end
				end
				
				`ALU_DIVU, `ALU_MODU: begin
					if(dividend == src1 && divisor == src2 && !sign) begin
						result <= remainder_flag ? remainder : quotient;
						busy <= 0;
						done <= 1;
					end else begin
						dividend <= src1;
						divisor <= src2;
						sign <= 0;
						remainder <= src1;
						work_divisor <= src2;
						current_bit <= 31;
						busy <= 1;
						done <= 0;
					end
				end
				
				default: begin
					busy <= 0;
					done <= 0;
				end
				endcase
			end else begin
				divide_bit();
				if(current_bit == 31) begin
					if(sign)
						result <= remainder_flag ? sign_remainder(dividend, remainder) : sign_quotient(dividend, divisor, quotient);
					else
						result <= remainder_flag ? remainder : quotient;
					busy <= 0;
					done <= 1;
				end
			end
		end
	end
endmodule
