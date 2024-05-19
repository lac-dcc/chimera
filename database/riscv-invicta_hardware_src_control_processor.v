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

module control_processor (
	input clk,
	input reset,
	input stall,

	input [31:0] inst,
	input [31:0] pc,

	input enable,
	output reg [31:0] pcr_data,
	input [31:0] pcr_write_data,
	input [4:0] pcr,
	input [1:0] cmd,

	output interrupt,
	output reg [31:0] ptbr,
	output reg [31:0] evec,
	output vm_enable,
	output flush_tlb
);

	wire [2:0] command = {1'b0, cmd};

	wire [11:0] imm12 = inst[21:10];
	wire [31:0] sext_imm = imm12[11] ? {20'hFFFFF, imm12} : {20'b0, imm12};

	reg [23:0] status; /* top 8 bits are IP */
	reg [7:0]  interrupts_pending;
	reg [31:0] epc;
	reg [31:0] badvaddr;
	/* evec */
	reg [31:0] count;
	reg [31:0] compare;
	reg [31:0] cause;
	/* ptbr */
	reg [31:0] k0;
	reg [31:0] k1;
	reg [31:0] tohost;
	reg [31:0] fromhost;

	/* Upon reset, only the supervisor bit is set. S64 and U64 are hard-wired
	 * to zero, as are EC, EV, and EF. */
	localparam SR_WRITE_MASK = (`SR_IM | `SR_VM | `SR_S | `SR_PS | `SR_ET);

	reg [31:0] write_data;

	always @ (*) begin
		if (!stall && enable)
			case (command)
				`F3_MTPCR: write_data = pcr_write_data;
				`F3_SETPCR: write_data = pcr_data | sext_imm;
				`F3_CLEARPCR: write_data = pcr_data | ~(sext_imm);
				default: write_data = 32'b0;
			endcase
	end

	always @ (posedge clk) begin
		if (reset)
			interrupts_pending <= 8'b0;

		if (reset)
			status <= (`SR_S);
		else if (!stall && enable && pcr == `PCR_STATUS)
			status <= write_data & SR_WRITE_MASK;

		if (reset)
			epc <= 32'h0;
		else if (!stall && enable && pcr == `PCR_EPC)
			epc <= write_data;
		else if (interrupt)
			epc <= pc;

		if (reset)
			badvaddr <= 32'h0;

		if (reset)
			evec <= 32'h0;
		else if (!stall && enable && pcr == `PCR_EVEC)
			evec <= write_data & 32'hFFFFFFFC;

		if (reset)
			count <= 32'h0;
		else if (!stall && enable && pcr == `PCR_COUNT)
			count <= write_data;

		if (reset) begin
			compare <= 32'h0;
		end else if (!stall && enable && pcr == `PCR_COMPARE) begin
			compare <= write_data;
			interrupts_pending[`IRQ_TIMER] = 0;
		end

		if (reset)
			cause <= 32'h0;

		if (reset)
			ptbr <= 32'h0;
		else if (!stall && enable && pcr == `PCR_PTBR)
			ptbr <= write_data;

		if (reset)
			k0 <= 32'h0;
		else if (!stall && enable && pcr == `PCR_K0)
			k0 <= write_data;

		if (reset)
			k1 <= 32'h0;
		else if (!stall && enable && pcr == `PCR_K1)
			k1 <= write_data;
	
		if (reset)
			tohost <= 32'h0;
		else if (!stall && enable && pcr == `PCR_TOHOST)
			tohost <= write_data;

		if (reset)
			fromhost <= 32'h0;
		else if (!stall && enable && pcr == `PCR_FROMHOST)
			fromhost <= write_data;
	end

	/* The old value of a PCR is returned on a write */
	always @ (*) begin
		if (enable)
			case (pcr)
				`PCR_STATUS:   pcr_data = {interrupts_pending, status};
				`PCR_EPC:      pcr_data = epc;
				`PCR_BADVADDR: pcr_data = badvaddr;
				`PCR_EVEC:     pcr_data = evec;
				`PCR_COUNT:    pcr_data = count;
				`PCR_COMPARE:  pcr_data = compare;
				`PCR_PTBR:     pcr_data = ptbr;  
				`PCR_K0:       pcr_data = k0;
				`PCR_K1:       pcr_data = k1;
				`PCR_TOHOST:   pcr_data = tohost;
				`PCR_FROMHOST: pcr_data = fromhost;
				default: pcr_data = 32'h0;
			endcase
		else
			pcr_data = 32'h0;
	end

	/* Timer interrupt */
	always @ (posedge clk) begin
		count <= count + 1;
	end

	always @ (*) begin
		if (count == compare)
			interrupts_pending[`IRQ_TIMER] = 1;
	end

	wire interrupt_mask = status[23:16];

	assign interrupt = ((status & `SR_ET) && (interrupt_mask & interrupts_pending));

	/* Virtual memory */
	assign flush_tlb = (!stall && enable && pcr == `PCR_PTBR);
	assign vm_enable = status[8];

endmodule
