/*
 *  Copyright (C) 2018  Clifford Wolf <clifford@symbioticeda.com>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */

module marlann_sequencer (
	input             clock,
	input             reset,
	input             start,
	input      [15:0] addr,
	output reg        busy,

	output reg        smem_valid,
	input             smem_ready,
	output reg [15:0] smem_addr,
	input      [31:0] smem_data,

	output reg        comp_valid,
	input             comp_ready,
	output reg [31:0] comp_insn
);
	localparam [5:0] opcode_sync    = 0;
	localparam [5:0] opcode_call    = 1;
	localparam [5:0] opcode_return  = 2;
	localparam [5:0] opcode_execute = 3;
	localparam [5:0] opcode_contld  = 7;

	/**** Front-End ****/

	reg running;
	reg [16:0] pc;

	reg [7:0] callstack_ptr;
	reg [15:0] callstack [0:255];

	reg [7:0] queue_iptr, queue_optr;
	reg [31:0] queue [0:255];

	wire [7:0] queue_fill = queue_iptr - queue_optr;
	reg queue_full;

	always @(posedge clock) begin
		if (smem_valid && smem_ready) begin
			smem_valid <= 0;
			if (smem_data[5:0] == opcode_call) begin
				callstack_ptr <= callstack_ptr + 1;
				callstack[callstack_ptr+1] <= (pc + 4) >> 1;
				pc <= smem_data[31:15];
			end else
			if (smem_data[5:0] == opcode_return) begin
				if (callstack_ptr) begin
					callstack_ptr <= callstack_ptr - 1;
					pc <= callstack[callstack_ptr] << 1;
				end else begin
					running <= 0;
				end
			end else begin
				queue_iptr <= queue_iptr + 1;
				queue[queue_iptr] <= smem_data;
				pc <= pc + 4;
			end
		end

		if (running && !smem_valid && !queue_full) begin
			smem_valid <= 1;
			smem_addr <= pc >> 1;
		end

		queue_full <= &queue_fill[7:5];

		if (reset || start) begin
			pc <= addr << 1;
			running <= start;
			smem_valid <= 0;
			callstack_ptr <= 0;
			queue_iptr <= 0;
			queue_full <= 0;
		end
	end

	/**** Back-End ****/

	reg [31:0] queue_insn;
	reg queue_insn_valid;

	reg [31:0] buffer_insn;
	reg buffer_insn_valid;

	wire insn_valid = queue_insn_valid || buffer_insn_valid;
	wire [31:0] insn = buffer_insn_valid ? buffer_insn : queue_insn;

	reg stall_queue;
	reg next_buffer_insn_valid;
	reg [31:0] next_buffer_insn;

	always @* begin
		stall_queue = comp_valid && !comp_ready;
		next_buffer_insn = insn;
		next_buffer_insn_valid = 0;

		if (insn_valid) begin
			if (((insn[5:0] == opcode_execute) || (insn[5:0] == opcode_contld)) && (insn[24:15] != 1)) begin
				stall_queue = 1;
				next_buffer_insn_valid = 1;
				next_buffer_insn[24:15] = insn[24:15] - 1;
				next_buffer_insn[14:6] = insn[14:6] + 1;
			end
		end
	end

	always @(posedge clock) begin
		if (!stall_queue) begin
			if (queue_iptr != queue_optr) begin
				queue_optr <= queue_optr + 1;
				queue_insn <= queue[queue_optr];
				queue_insn_valid <= 1;
			end else begin
				queue_insn_valid <= 0;
			end
		end
		
		if (!comp_valid || comp_ready) begin
			buffer_insn <= next_buffer_insn;
			buffer_insn_valid <= next_buffer_insn_valid;

			if (insn_valid) begin
				comp_valid <= 1;
				if (insn[5:0] == opcode_contld) begin
					comp_insn[31:15] <= comp_insn[31:15] + (comp_insn[5:0] == 4 ? 4 : 8);
					comp_insn[14:6] <= comp_insn[14:6] + 1;
				end else begin
					comp_insn <= insn;
				end
			end else begin
				comp_valid <= 0;
			end
		end

		if (reset || start) begin
			queue_insn_valid <= 0;
			buffer_insn_valid <= 0;
			queue_optr <= 0;
		end
	end

	/**** Busy ****/

	always @(posedge clock) begin
		busy <= !reset && (running || queue_iptr != queue_optr || start || stall_queue || comp_valid);
	end
endmodule
