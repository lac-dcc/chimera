// This program was cloned from: https://github.com/sxtyzhangzk/mips-cpu
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/22 16:25:04
// Design Name: 
// Module Name: alu_multiplier
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

module alu_multiplier(
	input CLK,
	input RST,
	
	input [`ALU_OPCODE_WIDTH-1:0]	opcode,
	input [31:0]					src1,
	input [31:0]					src2,
	output reg [31:0]				result,
	
	output reg	busy,
	output reg	done
	);
	
	reg [31:0] 	mult1, mult2;
	reg			sign;
	reg [63:0] 	partial_result[4:0];
	reg [63:0] 	full_result;
	reg			get_high_32;
	
	integer i;
	always @(posedge CLK or posedge RST) begin
		if(RST) begin
			mult1 <= 0;
			mult2 <= 0;
			for(i=0; i<5; i=i+1)
				partial_result[i] <= 0;
			busy <= 0;
			done <= 0;
			result <= 0;
			get_high_32 <= 0;
		end else begin
			done <= 0;
			if(!busy) begin
				if(opcode == `ALU_MULTH || opcode == `ALU_MULTHU)
					get_high_32 = 1;
				else
					get_high_32 = 0;
				
				case(opcode)
				`ALU_MULTL, `ALU_MULTH: begin
					if(mult1 == src1 && mult2 == src2 && sign) begin
						result <= get_high_32 ? full_result[63:32] : full_result[31:0];
						busy <= 0;
						done <= 1;
					end else begin
						mult1 <= src1;
						mult2 <= src2;
						sign <= 1;
						partial_result[0] <= src1[15:0] * src2[15:0];
						partial_result[1] <= src1[31:16] * src2[15:0] << 16;
						partial_result[2] <= src1[15:0] * src2[31:16] << 16;
						partial_result[3] <= src1[31:16] * src2[31:16] << 32;
						partial_result[4] <= 
							(src1[31] ? (-src2[31:0] << 32) : 0) +
							(src2[31] ? (-src1[31:0] << 32) : 0);
						busy <= 1;
					end
				end
				
				`ALU_MULTLU, `ALU_MULTHU: begin
					if(mult1 == src1 && mult2 == src2 && !sign) begin
						result <= get_high_32 ? full_result[63:32] : full_result[31:0];
						busy <= 0;
						done <= 1;
					end else begin
						mult1 <= src1;
						mult2 <= src2;
						sign <= 0;
						partial_result[0] <= src1[15:0] * src2[15:0];
						partial_result[1] <= src1[31:16] * src2[15:0] << 16;
						partial_result[2] <= src1[15:0] * src2[31:16] << 16;
						partial_result[3] <= src1[31:16] * src2[31:16] << 32;
						partial_result[4] <= 0;
						busy <= 1;
					end
				end
				
				default: begin
					busy <= 0;
					done <= 0;
				end
				endcase
			end else begin
				full_result = 
					partial_result[0] + 
					partial_result[1] +
					partial_result[2] +
					partial_result[3] +
					partial_result[4];
				result <= get_high_32 ? full_result[63:32] : full_result[31:0];
				busy <= 0;
				done <= 1;
			end
		end
	end
endmodule
