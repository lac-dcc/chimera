// This program was cloned from: https://github.com/sxtyzhangzk/mips-cpu
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/21 10:27:50
// Design Name: 
// Module Name: pipeline_mem
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

module pipeline_mem(
	input CLK,
	input RST,
	
	output reg [1:0]	rw_flag,
	output [31:0]		addr,
	input [31:0]		read_data,
	output reg [31:0]	write_data,
	output reg [3:0]	write_mask,
	input 				mem_busy,
	input 				mem_done,
	
	output 							prev_busy,
	input [31:0]					prev_insnPC,
	input [2:0]						prev_insn_id,
	input [`MEM_OPCODE_WIDTH-1:0]	mem_opcode,
	input [31:0]					mem_src1,
	input [31:0]					mem_src2,
	input 							mem_src2_forward,
	input [2:0]						mem_src2_forward_from,
	
	output reg [31:0]	next_insnPC,
	output reg [2:0]	next_insn_id,
	output reg [31:0]	mem_output,
	
	input [2:0]		write_back_insn_id,
	input [31:0]	write_back_data
	);
	
	wire src2_ready;
	wire [31:0] src2;
	
	assign src2_ready = !mem_src2_forward || mem_src2_forward_from == write_back_insn_id;
	assign src2 = mem_src2_forward ? write_back_data : mem_src2;
	
	//reg busy;
	assign prev_busy = mem_busy || !src2_ready;
	
	assign addr = mem_src1 & ~(32'b11);
	//assign write_data = src2;
	
	reg unaligned_addr;
	always @(*) begin
		unaligned_addr = 0;
		write_mask = 0;
		write_data = 0;
		rw_flag = 0;
		if(!prev_busy) begin
			case(mem_opcode)
			`MEM_LB, `MEM_LBU, `MEM_LH, `MEM_LHU, `MEM_LW: begin
				if(((mem_opcode == `MEM_LH || mem_opcode == `MEM_LHU) && mem_src1[1:0] == 2'b11) 
					|| (mem_opcode == `MEM_LW && mem_src1[1:0] != 2'b00)) begin
					unaligned_addr = 1;
					rw_flag = 0;
				end else begin
					rw_flag = 1;
					write_mask = 0;
					write_data = 0;
				end
			end
			
			`MEM_SB: begin
				rw_flag = 2;
				if(mem_src1[1:0] == 2'b00) begin
					write_mask = 4'b0001;		//Little Endian
					write_data = {24'b0, src2[7:0]};
				end else if(mem_src1[1:0] == 2'b01) begin
					write_mask = 4'b0010;
					write_data = {16'b0, src2[7:0], 8'b0};
				end else if(mem_src1[1:0] == 2'b10) begin
					write_mask = 4'b0100;
					write_data = {8'b0, src2[7:0], 16'b0};
				end else begin
					write_mask = 4'b1000;
					write_data = {src2[7:0], 24'b0};
				end
			end
			
			`MEM_SH: begin
				rw_flag = 2;
				if(mem_src1[1:0] == 2'b00) begin
					write_mask = 4'b0011;
					write_data = {16'b0, src2[15:0]};
				end else if(mem_src1[1:0] == 2'b01) begin
					write_mask = 4'b0110;
					write_data = {8'b0, src2[15:0], 8'b0};
				end else if(mem_src1[1:0] == 2'b10) begin
					write_mask = 4'b1100;
					write_data = {src2[15:0], 16'b0};
				end else begin
					rw_flag = 0;
					unaligned_addr = 1;
				end
			end
			
			`MEM_SW: begin
				if(mem_src1[1:0] == 2'b00) begin
					rw_flag = 2;
					write_mask = 4'b1111;
					write_data = src2;
				end else begin
					rw_flag = 0;
					unaligned_addr = 1;
				end
			end
			endcase
		end
	end
	
	reg [31:0]					buf_insnPC;
	reg [2:0]					buf_insn_id;
	reg [31:0] 					buf_src1;
	reg [`MEM_OPCODE_WIDTH-1:0]	buf_opcode;
	
	always @(posedge CLK or posedge RST) begin
		if(RST) begin
			buf_insnPC <= 0;
			buf_insn_id <= 3'b111;
			buf_src1 <= 0;
			buf_opcode <= 0;
		end else begin
			if(!prev_busy) begin
				buf_insnPC <= prev_insnPC;
				buf_insn_id <= prev_insn_id;
				buf_src1 <= mem_src1;
				buf_opcode <= mem_opcode;
			end
		end
	end
	
	function [7:0] get_byte;
		input [1:0] addr_suffix;
		input [31:0] data;
		
		case(addr_suffix)
		2'b00: get_byte = data[7:0];
		2'b01: get_byte = data[15:8];
		2'b10: get_byte = data[23:16];
		2'b11: get_byte = data[31:24];
		endcase
	endfunction
	
	function [15:0] get_half;
		input [1:0] addr_suffix;
		input [31:0] data;
		
		case(addr_suffix)
		2'b00: get_half = data[15:0];
		2'b01: get_half = data[23:8];
		2'b10: get_half = data[31:16];
		default: get_half = 16'b0;
		endcase
	endfunction
	
	function [31:0] sext_byte;
		input [7:0] in;
		sext_byte = {{24{in[7]}}, in};
	endfunction
	
	function [31:0] sext_half;
		input [15:0] in;
		sext_half = {{16{in[15]}}, in};
	endfunction
	
	always @(*) begin
		if(buf_opcode == `MEM_NOP) begin
			next_insnPC = buf_insnPC;
			next_insn_id = buf_insn_id;
			mem_output = buf_src1;
		end else if(mem_done) begin
			next_insnPC = buf_insnPC;
			next_insn_id = buf_insn_id;
			case(buf_opcode)
			`MEM_LB:	mem_output = sext_byte(get_byte(buf_src1[1:0], read_data));
			`MEM_LBU:	mem_output = {24'b0, get_byte(buf_src1[1:0], read_data)};
			`MEM_LH:	mem_output = sext_half(get_half(buf_src1[1:0], read_data));
			`MEM_LHU:	mem_output = {16'b0, get_half(buf_src1[1:0], read_data)};
			`MEM_LW:	mem_output = read_data;
			default:	mem_output = 0;
			endcase
		end else begin
			next_insnPC = 0;
			next_insn_id = 3'b111;
			mem_output = 0;
		end
	end
	
	/*always @(negedge CLK or posedge RST) begin
		if(RST) begin
			//busy <= 0;
			next_insnPC <= 0;
			next_insn_id <= 3'b111;
			mem_output <= 0;
		end else begin
			//busy <= 0;
			
		end
	end*/
endmodule
