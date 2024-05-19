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

`timescale 1ns/1ps

module top_test ();
	reg clk;
	reg reset;

	initial clk = 0;
	parameter half_cycle = 5;
	localparam cycle = 2 * half_cycle;
	localparam timeout = 100;

	always #(half_cycle) clk = ~clk;

	wire [(`STR_LEN * 8) - 1:0] s;

	top top(.clk(clk), .reset(reset));

	inst_decoder id(.str(s), 
		.jump_target(top.dpath.jump_target), 
		.branch_target(top.dpath.branch_target),
		.inst(top.dpath.inst));

	integer i;

	initial begin
		$dumpvars();

		i = 0;

		/* toggle reset */
		#(cycle);
		reset = 1;
		#(cycle);
		reset = 0;
		#(cycle);

		while (top.dpath.cp.tohost == 0 && i < timeout) begin
			#(cycle);
			i = i + 1;
			$display("C %10d: pc=[%08x] [%s] W[r%2d=%08x][%b] R[r%2d=%08x] R[r%2d=%08x] inst=[%08x] %s", 
				i, top.dpath.pc, top.stall ? "S" : " ",
				top.dpath.ex_wd, top.dpath.rf_wdata, top.dpath.rf_wr_en,
				top.dpath.ex_rs1, top.dpath.rf_rd1, 
				top.dpath.ex_rs2, top.dpath.rf_rd2,
				top.dpath.inst,
				top.stall ? "" : s);
		end
	
		if (i == timeout) begin
			$display("*** TIMEOUT ***");
			$finish();
		end

		if (top.dpath.cp.tohost == 1) begin
			$display("*** SUCCESS (tohost = 1) ***");
		end else begin
			$display("*** FAILURE (tohost = %d) ***", top.dpath.cp.tohost);
		end

		$finish();
	end
	
endmodule
