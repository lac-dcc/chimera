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

module tlb (
	input clk,
	input reset,
	input flush,

	input vm_enable,
	input enable,
	input [31:0] virtual_address,
	output reg [31:0] physical_address,

	output reg tlb_hit,
	output reg translation_required,
	input [31:0] translated_address,
	input translation_complete
);

	localparam TLB_ENTRIES = 4;

	reg [1:0] entry; /* Next one to replace */
	reg [40:0] tlb [TLB_ENTRIES-1:0];

	integer i, j;

	always @ (posedge clk) begin
		if (reset || flush) begin
			for (j = 0; j < TLB_ENTRIES; j = j + 1) begin
				tlb[j] = 41'b0;
			end
			entry = 0;
		end
	end

	localparam S_CHECK = 0;
	localparam S_WAIT  = 1;

	reg state;
	reg next_state;

	always @ (posedge clk) begin
		if (reset)
			state <= S_CHECK;
		else
			state <= next_state;
	end

	always @ (*) begin
		case (state)
			S_CHECK: begin
				tlb_hit = 0;
				/* Check each TLB entry for a match */
				for (i = 0; i < TLB_ENTRIES; i = i + 1) begin
					if (virtual_address[31:12] == tlb[i][39:20] && tlb[i][40]) begin
						physical_address = {tlb[i][19:0], virtual_address[11:0]};
						tlb_hit = 1;
					end
				end

				translation_required = !tlb_hit && enable && vm_enable;
				next_state = !translation_required ? S_CHECK : S_WAIT;
			end

			S_WAIT:
				next_state = translation_complete ? S_CHECK : S_WAIT;

			default:
				next_state = S_CHECK;
		endcase
	end

	always @ (*) begin
		if (state == S_WAIT && translation_complete) begin
			tlb[entry] = {1'b1, virtual_address[31:12], translated_address[31:12]};
			entry = entry + 1;
		end
	end

endmodule

	
