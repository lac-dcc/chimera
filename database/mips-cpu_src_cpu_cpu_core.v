// This program was cloned from: https://github.com/sxtyzhangzk/mips-cpu
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/21 12:26:00
// Design Name: 
// Module Name: cpu_core
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

module cpu_core(
	input CLK,
	input RST,
	
	//To Memory Controller
	output [2*2-1:0] 	rw_flag,
	output [2*32-1:0]	addr,
	input [2*32-1:0]	read_data,
	output [2*32-1:0]	write_data,
	output [2*4-1:0]	write_mask,
	input [1:0]			busy,
	input [1:0]			done
	);
	
	wire [2:0]	writeback_insn_id;
	wire [31:0]	writeback_data;
	wire [2:0]	alu_forward_insn_id;
	wire [31:0]	alu_forward_data;
	
	wire 		ID_IF_next_insn_enabled;
	wire [31:0]	ID_IF_next_insn;
	wire 		ID_IF_busy;
	
	wire [31:0]	IF_ID_insn;
	wire [31:0] IF_ID_insnPC;
	wire 		IF_ID_placeholder_insn;
	
	
	
	wire [1:0]	ICACHE_rw_flag;
	wire [31:0]	ICACHE_addr;
	wire [31:0]	ICACHE_read_data;
	wire [31:0]	ICACHE_write_data;
	wire [3:0]	ICACHE_write_mask;
	wire		ICACHE_busy;
	wire 		ICACHE_done;
	
	wire		ICACHE_flush_flag;
	wire [31:0]	ICACHE_flush_addr;
	
	assign ICACHE_write_data = 0;
	assign ICACHE_write_mask = 0;
	assign ICACHE_rw_flag[1] = 0;
	
	cache ICACHE(
		CLK, RST, 
		ICACHE_rw_flag,
		ICACHE_addr,
		ICACHE_read_data,
		ICACHE_write_data, ICACHE_write_mask,
		ICACHE_busy, ICACHE_done,
		ICACHE_flush_flag, ICACHE_flush_addr,
		rw_flag[3:2], addr[63:32], read_data[63:32], write_data[63:32], write_mask[7:4], busy[1], done[1]);
	
	pipeline_insnfetch IF(
		CLK, RST,
		ICACHE_rw_flag[0], ICACHE_addr, ICACHE_read_data, ICACHE_busy, ICACHE_done,
		ID_IF_next_insn_enabled, ID_IF_next_insn, ID_IF_busy,
		IF_ID_insn, IF_ID_insnPC, IF_ID_placeholder_insn);
	
	wire 							EX_ID_busy;
	wire [31:0]						ID_EX_insnPC;
	wire [2:0]						ID_EX_insn_id;
	wire [`ALU_OPCODE_WIDTH-1:0]	ID_EX_alu_opcode;
	wire [31:0]						ID_EX_alu_src1;
	wire 							ID_EX_alu_src1_forward;
	wire [2:0]						ID_EX_alu_src1_forward_from;
	wire [31:0]						ID_EX_alu_src2;
	wire 							ID_EX_alu_src2_forward;
	wire [2:0]						ID_EX_alu_src2_forward_from;
	wire [`MEM_OPCODE_WIDTH-1:0]	ID_EX_mem_opcode;
	wire [31:0]						ID_EX_mem_src2;
	wire 							ID_EX_mem_src2_forward;
	wire [2:0]						ID_EX_mem_src2_forward_from;
	
	pipeline_decode ID(
		CLK, RST,
		IF_ID_insn, IF_ID_insnPC, IF_ID_placeholder_insn,
		ID_IF_next_insn_enabled, ID_IF_next_insn, ID_IF_busy,
		EX_ID_busy,
		ID_EX_insnPC, ID_EX_insn_id,
		ID_EX_alu_opcode, 
		ID_EX_alu_src1, ID_EX_alu_src1_forward, ID_EX_alu_src1_forward_from,
		ID_EX_alu_src2, ID_EX_alu_src2_forward, ID_EX_alu_src2_forward_from,
		ID_EX_mem_opcode, 
		ID_EX_mem_src2, ID_EX_mem_src2_forward, ID_EX_mem_src2_forward_from,
		writeback_insn_id, writeback_data,
		alu_forward_insn_id, alu_forward_data);
	
	wire 							MEM_EX_busy;
	wire [31:0]						EX_MEM_insnPC;
	wire [2:0]						EX_MEM_insn_id;
	wire [`MEM_OPCODE_WIDTH-1:0]	EX_MEM_opcode;
	wire [31:0]						EX_MEM_src1;
	wire [31:0]						EX_MEM_src2;
	wire 							EX_MEM_src2_forward;
	wire [2:0]						EX_MEM_src2_forward_from;
	
	pipeline_exec EX(
		CLK, RST,
		EX_ID_busy,
		ID_EX_insnPC, ID_EX_insn_id,
		ID_EX_alu_opcode,
		ID_EX_alu_src1, ID_EX_alu_src1_forward, ID_EX_alu_src1_forward_from,
		ID_EX_alu_src2, ID_EX_alu_src2_forward, ID_EX_alu_src2_forward_from,
		ID_EX_mem_opcode,
		ID_EX_mem_src2, ID_EX_mem_src2_forward, ID_EX_mem_src2_forward_from,
		MEM_EX_busy,
		EX_MEM_insnPC, EX_MEM_insn_id,
		EX_MEM_opcode,
		EX_MEM_src1, 
		EX_MEM_src2, EX_MEM_src2_forward, EX_MEM_src2_forward_from,
		writeback_insn_id, writeback_data,
		alu_forward_insn_id, alu_forward_data);
	
	wire [31:0] MEM_WB_insnPC;
	wire [2:0]	MEM_WB_insn_id;
	wire [31:0]	MEM_WB_mem_output;
	
	wire [1:0]	DCACHE_rw_flag;
	wire [31:0]	DCACHE_addr;
	wire [31:0]	DCACHE_read_data;
	wire [31:0]	DCACHE_write_data;
	wire [4:0]	DCACHE_write_mask;
	wire		DCACHE_busy;
	wire 		DCACHE_done;
	
	assign ICACHE_flush_flag = DCACHE_rw_flag[1];
	assign ICACHE_flush_addr = DCACHE_addr;
	
	cache DCACHE(
		CLK, RST, 
		DCACHE_rw_flag,
		DCACHE_addr,
		DCACHE_read_data,
		DCACHE_write_data, DCACHE_write_mask,
		DCACHE_busy, DCACHE_done,
		0, 32'b0,
		rw_flag[1:0], addr[31:0], read_data[31:0], write_data[31:0], write_mask[3:0], busy[0], done[0]);
	
	pipeline_mem MEM(
		CLK, RST,
		//rw_flag[1:0], addr[31:0], read_data[31:0], write_data[31:0], write_mask[3:0], busy[0], done[0],
		DCACHE_rw_flag, DCACHE_addr, DCACHE_read_data, DCACHE_write_data, DCACHE_write_mask, DCACHE_busy, DCACHE_done,
		MEM_EX_busy,
		EX_MEM_insnPC, EX_MEM_insn_id,
		EX_MEM_opcode,
		EX_MEM_src1,
		EX_MEM_src2, EX_MEM_src2_forward, EX_MEM_src2_forward_from,
		MEM_WB_insnPC, MEM_WB_insn_id, MEM_WB_mem_output,
		writeback_insn_id, writeback_data);
	
	assign alu_forward_insn_id = EX_MEM_opcode == `MEM_NOP ? EX_MEM_insn_id : 3'b111;
	assign alu_forward_data = EX_MEM_src1;
	assign writeback_insn_id = MEM_WB_insn_id;
	assign writeback_data = MEM_WB_mem_output;
endmodule
