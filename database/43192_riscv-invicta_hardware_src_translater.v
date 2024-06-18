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

module translater (
	input clk,
	input reset,

	input vm_enable,
	input launch_translation,

	output reg [31:0] physical_address,
	input [31:0] virtual_address,

	output translation_complete,

	input [31:0] ptbr,
	input flush_tlb,

	/* memory interface */
	output reg [31:0] translate_addr,
	output translate_mem_enable,
	input [31:0] request_data,
	input translate_data_valid
);

	wire [31:0] tlb_output_address;
	wire tlb_hit;
	wire translation_required;

	localparam S_IDLE      = 2'd0;
	localparam S_TLB       = 2'd1;
	localparam S_TRAN_PPN1 = 2'd2;
	localparam S_TRAN_PPN0 = 2'd3;

	reg [31:0] address;

	reg [1:0] state;
	reg [1:0] next_state;

	always @ (posedge clk) begin
		if (reset)
			state <= S_IDLE;
		else
			state <= next_state;
	end

	always @ (posedge clk) begin
		if (reset)
			address <= 0;
		else if (state == S_IDLE && launch_translation)
			address <= virtual_address;
	end

	always @ (*) begin
		case (state)
			S_IDLE:
				next_state = launch_translation ? S_TLB : S_IDLE;

			S_TLB:
				if (tlb_hit)
					next_state = S_IDLE;
				else if (translation_required)
					next_state = S_TRAN_PPN1;
				else
					next_state = S_TLB;
			
			S_TRAN_PPN1:
				next_state = translate_data_valid ? S_TRAN_PPN0 : S_TRAN_PPN1;

			S_TRAN_PPN0:
				next_state = translate_data_valid ? S_IDLE : S_TRAN_PPN0;

			default:
				next_state = S_IDLE;
		endcase
	end

	reg [31:0] ppn1_data;
	reg ppn1_valid;

	reg [31:0] ppn0_data;
	reg ppn0_valid;

	always @ (posedge clk) begin
		if (reset) begin
			ppn1_valid <= 0;
			ppn1_data <= 0;
			ppn0_valid <= 0;
			ppn0_data <= 0;
		end else begin
			if (state == S_IDLE && launch_translation) begin
				ppn1_valid <= 0;
				ppn1_data <= 0;
				ppn0_valid <= 0;
				ppn0_data <= 0;
			end else if (state == S_TRAN_PPN1 && translate_data_valid) begin
				ppn1_data <= request_data;
				ppn1_valid <= 1;
			end else if (state == S_TRAN_PPN0 && translate_data_valid) begin
				ppn0_data <= request_data;
				ppn0_valid <= 1;
			end
		end
	end

	always @ (*) begin
		case (state)
			S_TRAN_PPN1:
				translate_addr = {ptbr[31:12], address[31:22], 2'b0};
			S_TRAN_PPN0:
				translate_addr = {ppn1_data[31:12], address[21:12], 2'b0};
			default:
				translate_addr = 32'b0;
		endcase
	end

	assign translate_mem_enable = (state == S_TRAN_PPN1) || (state == S_TRAN_PPN0);
	assign translation_complete = (state == S_IDLE);

	/* Latch inferred. */
	always @ (*) begin
		if (translation_complete)
			if (tlb_hit)
				physical_address = {tlb_output_address[31:12], address[11:0]};
			else
				physical_address = {ppn0_data[31:12], address[11:0]};
	end

	/* TLB */

	wire tlb_enable = (state == S_TLB);

	tlb tlb(.clk(clk), .reset(reset), .flush(flush_tlb),
		.vm_enable(vm_enable), .enable(tlb_enable),
		.virtual_address(virtual_address), .physical_address(tlb_output_address),
		.tlb_hit(tlb_hit), .translation_required(translation_required),
		.translated_address(physical_address), .translation_complete(translation_complete));

endmodule
