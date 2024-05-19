// This program was cloned from: https://github.com/sxtyzhangzk/mips-cpu
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/21 07:55:11
// Design Name: 
// Module Name: pipeline_exec
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

module pipeline_exec(
	input CLK,
	input RST,
	
	output 							prev_busy,
	input [31:0]					prev_insnPC,
	input [2:0]						prev_insn_id,
	input [`ALU_OPCODE_WIDTH-1:0]	alu_opcode,
	input [31:0]					alu_src1,
	input 							alu_src1_forward,
	input [2:0]						alu_src1_forward_from,
	input [31:0]					alu_src2,
	input 							alu_src2_forward,
	input [2:0]						alu_src2_forward_from,
	input [`MEM_OPCODE_WIDTH-1:0]	prev_mem_opcode,
	input [31:0]					prev_mem_src2,
	input 							prev_mem_src2_forward,
	input [2:0]						prev_mem_src2_forward_from,
	
	input 								next_busy,
	output reg [31:0]					next_insnPC,
	output reg [2:0]					next_insn_id,
	output reg [`MEM_OPCODE_WIDTH-1:0]	mem_opcode,
	output reg [31:0]					mem_src1,
	output reg [31:0]					mem_src2,
	output reg							mem_src2_forward,
	output reg [2:0]					mem_src2_forward_from,
	
	input [2:0]		write_back_insn_id,
	input [31:0]	write_back_data,
	
	input [2:0]		alu_forward_insn_id,
	input [31:0]	alu_forward_data
    );
	
	function test_ready;
		input 		forward_flag;
		input [2:0]	forward_from;
		test_ready = !forward_flag
			|| forward_from == write_back_insn_id
			|| forward_from == alu_forward_insn_id;
	endfunction
	
	wire src1_ready = !alu_src1_forward
		|| alu_src1_forward_from == write_back_insn_id 
		|| alu_src1_forward_from == alu_forward_insn_id;
	wire src2_ready = !alu_src2_forward
		|| alu_src2_forward_from == write_back_insn_id
		|| alu_src2_forward_from == alu_forward_insn_id;
		
	wire [31:0] src1 = alu_src1_forward ? 
		(alu_src1_forward_from == write_back_insn_id ? write_back_data : alu_forward_data) :
		alu_src1;
	wire [31:0] src2 = alu_src2_forward ?
		(alu_src2_forward_from == write_back_insn_id ? write_back_data : alu_forward_data) :
		alu_src2;
	
	//assign src1_ready = test_ready(alu_src1_forward, alu_src1_forward_from);
	//assign src2_ready = test_ready(alu_src2_forward, alu_src2_forward_from);
	
	function [31:0] get_forward_src;
		input [31:0] 	src;
		input 			forward_flag;
		input [2:0]		forward_from;
		
		if(!forward_flag)
			get_forward_src = src;
		else if(forward_from == write_back_insn_id)
			get_forward_src = write_back_data;
		else if(forward_from == alu_forward_insn_id)
			get_forward_src = alu_forward_data;
		else
			get_forward_src = 32'b0;
	endfunction
		
	//reg [31:0] src1;
	//reg [31:0] src2;
		
	/*always @(*) begin
		src1 = get_forward_src(alu_src1, alu_src1_forward, alu_src1_forward_from);
		src2 = get_forward_src(alu_src2, alu_src2_forward, alu_src2_forward_from);
	end*/
	
	reg busy;
	assign prev_busy = next_busy || busy || !src1_ready || !src2_ready;
	
	reg [31:0]					buf_insnPC;
	reg [2:0]					buf_insn_id;
	reg [`ALU_OPCODE_WIDTH-1:0]	buf_opcode;
	reg [31:0]					buf_src1;
	reg [31:0]					buf_src2;
	reg [`MEM_OPCODE_WIDTH-1:0]	buf_mem_opcode;
	reg [31:0]					buf_mem_src2;
	reg 						buf_mem_src2_forward;
	reg [2:0]					buf_mem_src2_forward_from;
	reg	[1:0]					buf_alu_id;
	
	wire [`ALU_OPCODE_WIDTH-1:0] 	ALU_opcode = prev_busy ? `ALU_NOP : alu_opcode;
	wire [31:0] 					ALU_result[3:0];
	wire [3:0]						ALU_busy;
	wire [3:0]						ALU_done;
	alu ALU(CLK, RST, ALU_opcode, src1, src2, ALU_result[0], ALU_busy[0], ALU_done[0]);
	alu_multiplier ALU_MULT(CLK, RST, ALU_opcode, src1, src2, ALU_result[1], ALU_busy[1], ALU_done[1]);
	alu_divider ALU_DIV(CLK, RST, ALU_opcode, src1, src2, ALU_result[2], ALU_busy[2], ALU_done[2]);
	
	assign ALU_result[3] = buf_src1;
	assign ALU_busy[3] = 0;
	assign ALU_done[3] = 1;
	
	always @(*) begin
		next_insn_id = 3'b111;
		next_insnPC = 0;
		mem_opcode = `MEM_NOP;
		//mem_src1 = 0;
		mem_src2 = 0;
		mem_src2_forward = 0;
		mem_src2_forward_from = 0;
		busy = ALU_busy[buf_alu_id];
		
		mem_src1 = ALU_result[buf_alu_id];
		
		if(!busy) begin
			next_insn_id = buf_insn_id;
			next_insnPC = buf_insnPC;
			mem_opcode = buf_mem_opcode;
			mem_src2 = buf_mem_src2;
			mem_src2_forward = buf_mem_src2_forward;
			mem_src2_forward_from = buf_mem_src2_forward_from;
		end
	end
	
	always @(posedge CLK or posedge RST) begin
		if(RST) begin
			buf_insnPC <= 0;
			buf_insn_id <= 3'b111;
			buf_opcode <= 0;
			buf_src1 <= 0;
			buf_src2 <= 0;
			buf_mem_opcode <= 0;
			buf_mem_src2 <= 0;
			buf_mem_src2_forward <= 0;
			buf_mem_src2_forward_from <= 0;
			buf_alu_id <= 3;
		end else begin
			if(!prev_busy) begin
				buf_insnPC <= prev_insnPC;
				buf_insn_id <= prev_insn_id;
				buf_opcode <= alu_opcode;
				buf_src1 <= src1;
				buf_src2 <= src2;
				buf_mem_opcode <= prev_mem_opcode;
				buf_mem_src2 <= get_forward_src(prev_mem_src2, prev_mem_src2_forward, prev_mem_src2_forward_from);
				buf_mem_src2_forward <= !test_ready(prev_mem_src2_forward, prev_mem_src2_forward_from);
				buf_mem_src2_forward_from <= prev_mem_src2_forward_from;
				
				case(alu_opcode)
				`ALU_NOP: buf_alu_id <= 3;
				`ALU_MULTL, `ALU_MULTH, `ALU_MULTLU, `ALU_MULTHU: buf_alu_id <= 1;
				`ALU_DIV, `ALU_MOD, `ALU_DIVU, `ALU_MODU: buf_alu_id <= 2;
				default: buf_alu_id <= 0;
				endcase
			end else if(!busy && !next_busy) begin	//src not ready
				buf_insnPC <= prev_insnPC;
				buf_insn_id <= 3'b111;	//set insn_id[2] = 1 to indicate it's not a valid instruction
				buf_opcode <= `ALU_NOP;
				buf_src1 <= 0;
				buf_src2 <= 0;
				buf_mem_opcode <= `MEM_NOP;
				buf_mem_src2 <= 0;
				buf_mem_src2_forward <= 0;
				buf_mem_src2_forward_from <= 0;
				buf_alu_id <= 3;
			end else begin
				buf_mem_src2 <= get_forward_src(buf_mem_src2, buf_mem_src2_forward, buf_mem_src2_forward_from);
				if(test_ready(buf_mem_src2_forward, buf_mem_src2_forward_from))
					buf_mem_src2_forward <= 0;
			end
		end
	end
	
	/*
	reg	[31:0] 	last_dividend, last_divisor, last_divide_sign;
	reg [31:0] 	quotient, remainder, divisor_work;
	reg [4:0] 	divide_currentbit;	//31 for done
	reg			divide_finished;
	
	task divide_bit;
		reg [63:0] tmp;
		
		begin
			tmp = {{32{1'b0}}, divisor_work} << divide_currentbit;
			if(tmp > remainder) begin
				quotient[divide_currentbit] = 1;
				remainder = remainder - tmp;
			end else
				quotient[divide_currentbit] = 0;
			divide_currentbit = divide_currentbit - 1;
		end
	endtask
	
	task divide;
		input [31:0] dividend;
		input [31:0] divisor;
		input sign;
		
		if(dividend == last_dividend && divisor == last_divisor && sign == last_divide_sign) begin
			if(divide_currentbit != 31)
				divide_bit();
			else if(!divide_finished) begin
				if(sign) begin
					if($signed(last_dividend) < 0)
						remainder = -remainder;
					if(($signed(last_dividend) < 0) ^ ($signed(last_divisor) < 0))
						quotient = -quotient;
				end
				divide_finished = 1;
			end
		end else begin
			last_dividend = dividend;
			last_divisor = divisor;
			last_divide_sign = sign;
			
			if(sign) begin
				if($signed(dividend) < 0)
					remainder = -dividend;
				else
					remainder = dividend;
				if($signed(divisor) < 0)
					divisor_work = -divisor;
				else
					divisor_work = divisor;
			end else begin
				remainder = dividend;
				divisor_work = divisor;
			end
			
			divide_currentbit = 31;
			divide_bit();
		end
	endtask
	
	function divide_done;
		input [31:0] 	dividend;
		input [31:0] 	divisor;
		input 			sign;
		divide_done = dividend == last_dividend && divisor == last_divisor && sign == last_divide_sign && divide_finished;
	endfunction
	
	reg [31:0] last_mult1, last_mult2, last_sign;
	reg [63:0] partial_result[4:0];
	reg [63:0] multiply_result;
	reg mult_done;
	
	task multiply;
		input [31:0] mult1;
		input [31:0] mult2;
		input sign;
		if(mult1 == last_mult1 && mult2 == last_mult2 && sign == last_sign) begin
			if(!mult_done) begin
				multiply_result = 
					partial_result[0] 
					+ partial_result[1]
					+ partial_result[2]
					+ partial_result[3]
					+ partial_result[4];
				mult_done = 1;
			end
		end else begin
			last_mult1 = mult1;
			last_mult2 = mult2;
			last_sign = sign;
			mult_done = 0;
			partial_result[0] = last_mult1[15:0] * last_mult2[15:0];
			partial_result[1] = last_mult1[31:16] * last_mult2[15:0] << 16;
			partial_result[2] = last_mult1[15:0] * last_mult2[31:16] << 16;
			partial_result[3] = last_mult1[31:16] * last_mult2[31:16] << 32;
			if(sign) begin
				partial_result[4] = 
					(last_mult1[31] ? ((-last_mult2[31:0]) << 32) : 0)
					+ (last_mult2[31] ? ((-last_mult1[31:0]) << 32) : 0);
			end else 
				partial_result[4] = 0;
		end
	endtask
	
	function multiply_done;
		input [31:0] mult1;
		input [31:0] mult2;
		input sign;
		multiply_done = (mult1 == last_mult1 & mult2 == last_mult2) & (sign == last_sign & mult_done);
	endfunction
	
	task set_busy;
		input [31:0] src1;
		input [31:0] src2;
		input [`ALU_OPCODE_WIDTH-1:0] opcode;
		begin
			case(alu_opcode)
			`ALU_MULTL, `ALU_MULTH: busy <= !multiply_done(src1, src2, 1);
			`ALU_MULTLU, `ALU_MULTHU: busy <= !multiply_done(src1, src2, 0);
			`ALU_DIV, `ALU_MOD: busy <= !divide_done(src1, src2, 1);
			`ALU_DIVU, `ALU_MODU: busy <= !divide_done(src1, src2, 0);
			endcase
		end
	endtask
	
	always @(posedge CLK or posedge RST) begin
		if(RST) begin
			busy <= 0;
		end else begin
			busy <= 0;
			if(!prev_busy) begin
				set_busy(alu_src1, alu_src2, alu_opcode);
			end else if(busy) begin
				set_busy(buf_src1, buf_src2, buf_opcode);
			end
		end
	end
	
	integer i;
	always @(negedge CLK or posedge RST) begin
		if(RST) begin
			//busy <= 0;
			next_insnPC <= 0;
			next_insn_id <= 3'b111;
			mem_opcode <= 0;
			mem_src1 <= 0;
			mem_src2 <= 0;
			mem_src2_forward <= 0;
			mem_src2_forward_from <= 0;
			last_dividend <= 0;
			last_divisor <= 0;
			last_divide_sign <= 0;
			divisor_work <= 0;
			quotient <= 0;
			remainder <= 0;
			divide_currentbit <= 0;
			divide_finished <= 0;
			last_mult1 <= 0;
			last_mult2 <= 0;
			last_sign <= 0;
			multiply_result <= 0;
			mult_done <= 0;
			for(i=0; i<5; i=i+1)
				partial_result[i] <= 0;
		end else begin
			//busy <= 0;
			
			next_insnPC <= buf_insnPC;
			next_insn_id <= buf_insn_id;
			mem_opcode <= buf_mem_opcode;
			mem_src2 <= buf_mem_src2;
			if(mem_src2_forward != 0 && mem_src2_forward_from != 1)
				$display("DEBUG! FORWARD=%d", mem_src2_forward);
			mem_src2_forward <= buf_mem_src2_forward[0];
			mem_src2_forward_from <= buf_mem_src2_forward_from;
			
			case(buf_opcode)
			`ALU_NOP:		mem_src1 <= buf_src1;
			`ALU_ADD:		mem_src1 <= buf_src1 + buf_src2;
			`ALU_ADDU:		mem_src1 <= buf_src1 + buf_src2;
			`ALU_SUB:		mem_src1 <= buf_src1 - buf_src2;
			`ALU_SUBU:		mem_src1 <= buf_src1 - buf_src2;
			`ALU_MULTL:	begin
				if(multiply_done(buf_src1, buf_src2, 1))
					mem_src1 <= multiply_result[31:0];
				else begin
					multiply(buf_src1, buf_src2, 1);
					//set_busy();
				end
			end
			`ALU_MULTH: begin
				if(multiply_done(buf_src1, buf_src2, 1))
					mem_src1 <= multiply_result[63:32];
				else begin
					multiply(buf_src1, buf_src2, 1);
					//set_busy();
				end
			end
			`ALU_MULTLU: begin
				if(multiply_done(buf_src1, buf_src2, 0))
					mem_src1 <= multiply_result[31:0];
				else begin
					multiply(buf_src1, buf_src2, 0);
					//set_busy();
				end
			end
			`ALU_MULTHU: begin
				if(multiply_done(buf_src1, buf_src2, 0))
					mem_src1 <= multiply_result[63:32];
				else begin
					multiply(buf_src1, buf_src2, 0);
					//set_busy();
				end
			end
			`ALU_DIV, `ALU_MOD: begin
				if(divide_done(buf_src1, buf_src2, 1))
					mem_src1 <= buf_opcode == `ALU_DIV ? quotient : remainder;
				else begin
					//set_busy();
					divide(buf_src1, buf_src2, 1);
				end
			end
			`ALU_DIVU, `ALU_MODU: begin
				if(divide_done(buf_src1, buf_src2, 0))
					mem_src1 <= buf_opcode == `ALU_DIVU ? quotient : remainder;
				else begin
					//set_busy();
					divide(buf_src1, buf_src2, 0);
				end
			end
			`ALU_AND:		mem_src1 <= buf_src1 & buf_src2;
			`ALU_OR:		mem_src1 <= buf_src1 | buf_src2;
			`ALU_NOR:		mem_src1 <= ~(buf_src1 | buf_src2);
			`ALU_XOR:		mem_src1 <= buf_src1 ^ buf_src2;
			`ALU_SLL:		mem_src1 <= buf_src1 << buf_src2[4:0];
			`ALU_SRL:		mem_src1 <= buf_src1 >> buf_src2[4:0];
			`ALU_SRA:		mem_src1 <= $signed(buf_src1) >>> buf_src2[4:0];
			`ALU_ROR:		mem_src1 <= (buf_src1 >> buf_src2[4:0]) | (buf_src1 << (32-buf_src2[4:0]));
			`ALU_SEQ:		mem_src1 <= buf_src1 == buf_src2 ? 32'b1 : 32'b0;
			`ALU_SLT:		mem_src1 <= $signed(buf_src1) < $signed(buf_src2) ? 32'b1 : 32'b0;
			`ALU_SLTU:		mem_src1 <= buf_src1 < buf_src2 ? 32'b1 : 32'b0;
			default: mem_src1 <= 0;
			endcase
		end
	end
	*/
endmodule
