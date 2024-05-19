// This program was cloned from: https://github.com/qmn/riscv-invicta
// License: BSD 2-Clause "Simplified" License

/*
 * Copyright (c) 2013, Quan Nguyen
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 * 
 *     Redistributions of source code must retain the above copyright notice, this
 * list of conditions and the following disclaimer.
 *     Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation and/or
 * other materials provided with the distribution.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

`include "consts.vh"

module datapath (
	input clk,
	input reset,
	input stall,

	output [31:0] fetch_addr,
	output fetch_request,
	input fetch_data_valid,

	output [31:0] dmem_addr,
	output [31:0] dmem_write_data,
	output [3:0] dmem_write_mask,
	output dmem_request,
	output dmem_request_type,
	input dmem_data_valid,

	input [31:0] request_data,

	output [31:0] ptbr,
	output vm_enable,
	output flush_tlb
);

	reg [31:0] inst;
	reg [31:0] pc;

	wire [1:0] next_pc_sel;
	wire [2:0] wb_sel;
	wire rf_wr_en;

	wire interrupt;
	wire [31:0] evec;

	wire branch_taken;
	wire [31:0] branch_target;

	wire jump_taken;
	wire [31:0] jump_target;

	reg [31:0] fetch_pc;

	always @ (*) begin
		if (stall)
			fetch_pc = pc;
		else if (interrupt)
			fetch_pc = evec;
		else if (jump_taken)
			fetch_pc = jump_target;
		else if (branch_taken)
			fetch_pc = branch_target;
		else
			fetch_pc = pc + 4;
	end

	assign fetch_addr = fetch_pc;
	assign fetch_request = !reset;

	always @ (posedge clk) begin
		/* PC */
		if (reset)
			pc <= `PC_START;
		else
			pc <= fetch_pc;
	end

	always @ (posedge clk) begin
		/* Instruction */
		if (reset)
			inst <= `INSTR_NOP;
		else if (fetch_data_valid)
			inst <= request_data;
	end

	/* DECODE and EXECUTE */
	wire [4:0] ex_rs1;
	wire [4:0] ex_rs2;
	wire [4:0] ex_wd;

	wire cp_enable;
	wire [1:0] pcr_cmd;

	decode d(.inst(inst),
		.rs1(ex_rs1), .rs2(ex_rs2), .wd(ex_wd),
		.wb_sel(wb_sel), .rf_wr_en(rf_wr_en),
		.memory_request(dmem_request), .memory_request_type(dmem_request_type),
		.pcr_enable(cp_enable), .pcr_cmd(pcr_cmd));

	wire [31:0] rf_rd1;
	wire [31:0] rf_rd2;

	reg [31:0] rf_wdata;

	regfile rf(.clk(clk), .reset(reset), .rd1(rf_rd1), .rd2(rf_rd2), .rs1(ex_rs1),
		.rs2(ex_rs2), .wd(ex_wd), .w_data(rf_wdata), .w_enable(rf_wr_en), 
		.stall(stall));

	wire [4:0] alu_sel;
	wire [1:0] mul_sel;
	wire [31:0] alu_op1;
	wire [31:0] alu_op2;

	alu_dec ad(.alu_sel(alu_sel), .mul_sel(mul_sel), 
		.op1(alu_op1), .op2(alu_op2),
		.rs1(rf_rd1), .rs2(rf_rd2), .inst(inst));
	
	wire [31:0] multiplier_result;
	wire [31:0] alu_out;
	wire alu_equal;
	wire alu_less;

	multiplier mul(.multiplier_result(multiplier_result), 
		.op1(alu_op1), .op2(alu_op2), .mul_sel(mul_sel));

	alu alu(.alu_out(alu_out),
		.op1(alu_op1), .op2(alu_op2), .multiplier_result(multiplier_result), .alu_sel(alu_sel));

	branch_jump bj(.branch_taken(branch_taken), .branch_target(branch_target),
		.jump(jump_taken), .jump_target(jump_target),
		.inst(inst), .pc(pc), .rd1(rf_rd1), .alu_out(alu_out));

	/* MEMORY and WRITEBACK */
	wire [31:0] mem_data;

	reg [31:0] load_data;

	always @ (posedge clk) begin
		if (reset)
			load_data <= 32'b0;
		else if (dmem_data_valid)
			load_data <= request_data;
	end

	data_memory m(.inst(inst), .data(rf_rd2), .addr(alu_out),
		.memory_addr(dmem_addr),
		.write_data(dmem_write_data), .write_mask(dmem_write_mask),
		.load_data(load_data), .output_data(mem_data));

	wire [31:0] pcr_data;

	control_processor cp(.clk(clk), .reset(reset), .stall(stall),
		.inst(inst), .pc(pc),
		.enable(cp_enable), 
		.pcr_write_data({1'b0, pcr_cmd} == `F3_MTPCR ? rf_rd2 : rf_rd1), 
		.pcr(ex_rs1), .cmd(pcr_cmd), .pcr_data(pcr_data),
		.interrupt(interrupt), .evec(evec), 
		.vm_enable(vm_enable), .ptbr(ptbr), .flush_tlb(flush_tlb));

	always @ (*) begin
		case (wb_sel)
			`WB_ALU: rf_wdata = alu_out;
			`WB_MEM: rf_wdata = mem_data;
			`WB_PC4: rf_wdata = pc + 4;
			`WB_PCR: rf_wdata = pcr_data;
			default: rf_wdata = 32'b0;
		endcase
	end

endmodule
