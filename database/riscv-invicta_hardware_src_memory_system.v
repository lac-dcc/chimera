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

module memory_system (
	input clk,
	input reset,

	output stall,
	input vm_enable,
	input [31:0] ptbr,
	input flush_tlb,

	input [31:0] fetch_addr,
	input fetch_request,
	output fetch_data_valid,

	input [31:0] dmem_addr,
	input [31:0] dmem_write_data,
	input [3:0] dmem_write_mask,
	input dmem_request,
	input dmem_request_type,
	output dmem_data_valid,

	output [31:0] request_data
);

	localparam S_IDLE = 2'd0;
	localparam S_TRANSLATE = 2'd1;
	localparam S_MEM_ACCESS = 2'd2;

	localparam MM_SELECT_TRANSLATER = 1'd1;
	localparam MM_SELECT_ARBITER = 1'd0;

	reg [1:0] state;
	reg [1:0] next_state;

	always @ (posedge clk) begin
		if (reset)
			state <= S_IDLE;
		else
			state <= next_state;
	end

	wire arbiter_stall;
	wire arbiter_mem_enable;
	wire arbiter_cmd;
	wire [31:0] arbiter_addr;
	wire [31:0] arbiter_write_data = dmem_write_data;
	wire [3:0] arbiter_write_mask = dmem_write_mask;
	wire [31:0] arbiter_read_data;
	wire arbiter_data_valid;

	arbiter arbit(.clk(clk), .reset(reset),
		.request_data(request_data), .stall(arbiter_stall), 
		.fetch_addr(fetch_addr), .fetch_request(fetch_request), .fetch_data_valid(fetch_data_valid),
		.dmem_addr(dmem_addr), .dmem_write_data(dmem_write_data), .dmem_write_mask(dmem_write_mask),
		.dmem_request(dmem_request), .dmem_request_type(dmem_request_type), .dmem_data_valid(dmem_data_valid),
		.mem_addr(arbiter_addr), .mem_mask(arbiter_write_mask), .mem_enable(arbiter_mem_enable), .mem_cmd(arbiter_cmd), 
		.mem_data(arbiter_read_data), .mem_wdata(arbiter_write_data), .mem_valid(arbiter_data_valid));

	wire translater_mem_enable;
	wire translater_cmd = `MEM_CMD_READ;
	wire [31:0] translater_addr;
	wire [31:0] translater_write_data = dmem_write_data;
	wire [3:0] translater_write_mask = dmem_write_mask;
	wire [31:0] translater_read_data;
	wire translater_data_valid;

	wire [31:0] translated_addr;
	wire translate_enable = vm_enable;
	wire translation_complete;
	wire launch_translation;

	translater t(.clk(clk), .reset(reset),
		.vm_enable(translate_enable), .launch_translation(launch_translation),
		.physical_address(translated_addr), .virtual_address(arbiter_addr),
		.translation_complete(translation_complete), .ptbr(ptbr), .flush_tlb(flush_tlb),
		.translate_mem_enable(translater_mem_enable),
		.translate_addr(translater_addr), .request_data(translater_read_data), .translate_data_valid(translater_data_valid));

	wire mem_enable;
	wire mem_cmd;
	wire [31:0] mem_addr;
	wire [31:0] mem_write_data;
	wire [3:0] mem_write_mask;
	wire [31:0] mem_data;
	wire mem_valid;

	wire mm_select;

	memory_mux m(.select(mm_select),

		.enable_0(arbiter_mem_enable), .command_0(arbiter_cmd), .address_0(arbiter_addr),
		.write_data_0(arbiter_write_data), .write_mask_0(arbiter_write_mask), 
		.read_data_0(arbiter_read_data), /* .valid_0(), */

		.enable_1(translater_mem_enable), .command_1(translater_cmd), .address_1(translater_addr),
		.write_data_1(translater_write_data), .write_mask_1(translater_write_mask), 
		.read_data_1(translater_read_data), .valid_1(translater_data_valid),

		.enable(mem_enable), .command(mem_cmd), .address(mem_addr),
		.write_data(mem_write_data), .write_mask(mem_write_mask),
		.read_data(mem_data), .valid(mem_valid));

	assign request_data = mm_select ? translater_read_data : arbiter_read_data;

	always @ (*) begin
		case (state)
			S_IDLE:
				if (vm_enable && arbiter_mem_enable)
					next_state = S_TRANSLATE;
				else
					next_state = S_IDLE;

			S_TRANSLATE:
				if (translation_complete)
					next_state = S_MEM_ACCESS;
				else
					next_state = S_TRANSLATE;

			S_MEM_ACCESS:
				if (mem_valid)
					next_state = S_IDLE;
				else
					next_state = S_MEM_ACCESS;

			default:
				next_state = S_IDLE;
		endcase
	end

	wire translation_stall = (state != S_IDLE);
	assign launch_translation = (next_state == S_TRANSLATE);
	assign mm_select = state == S_TRANSLATE ? MM_SELECT_TRANSLATER : MM_SELECT_ARBITER;
	assign arbiter_data_valid = vm_enable ? mem_valid : translation_complete && mem_valid;

	wire [31:0] physical_address = (vm_enable && translation_complete) ? translated_addr : mem_addr;

	assign stall = arbiter_stall || translation_stall;

	/* actual memory device */
	mem simmem(.clk(clk), .reset(reset),
		.addr(physical_address), .mask(mem_write_mask), .enable(mem_enable), 
		.cmd(mem_cmd), .load_data(mem_data), .write_data(mem_write_data), .valid(mem_valid));

endmodule
