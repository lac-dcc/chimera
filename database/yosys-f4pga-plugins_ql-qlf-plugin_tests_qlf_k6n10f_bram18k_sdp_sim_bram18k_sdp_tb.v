// This program was cloned from: https://github.com/chipsalliance/yosys-f4pga-plugins
// License: Apache License 2.0

// Copyright 2020-2022 F4PGA Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//		 http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0

`timescale 1ns/1ps

`define STRINGIFY(x) `"x`"

module TB;
	localparam PERIOD = 50;
	localparam ADDR_INCR = 1;

	reg clk_0;
	reg rce_0;
	reg [`ADDR_WIDTH0-1:0] ra_0;
	wire [`DATA_WIDTH0-1:0] rq_0;
	reg wce_0;
	reg [`ADDR_WIDTH0-1:0] wa_0;
	reg [`DATA_WIDTH0-1:0] wd_0;

	reg clk_1;
	reg rce_1;
	reg [`ADDR_WIDTH1-1:0] ra_1;
	wire [`DATA_WIDTH1-1:0] rq_1;
	reg wce_1;
	reg [`ADDR_WIDTH1-1:0] wa_1;
	reg [`DATA_WIDTH1-1:0] wd_1;


	initial clk_0 = 0;
	initial clk_1 = 0;
	initial ra_0 = 0;
	initial ra_1 = 0;
	initial rce_0 = 0;
	initial rce_1 = 0;
	initial forever #(PERIOD / 2.0) clk_0 = ~clk_0;
	initial begin
		#(PERIOD / 4.0);
		forever #(PERIOD / 2.0) clk_1 = ~clk_1;
	end
	initial begin
		$dumpfile(`STRINGIFY(`VCD));
		$dumpvars;
	end

	integer a;
	integer b;

	reg done_0;
	reg done_1;
	initial done_0 = 1'b0;
	initial done_1 = 1'b0;
	wire done_sim = done_0 & done_1;

	reg [`DATA_WIDTH0-1:0] expected_0;
	reg [`DATA_WIDTH1-1:0] expected_1;

	reg read_test_0;
	reg read_test_1;
	initial read_test_0 = 0;
	initial read_test_1 = 0;

	always @(posedge clk_0) begin
		expected_0 <= (a | (a << 20) | 20'h55000) & {`DATA_WIDTH0{1'b1}};
	end
	always @(posedge clk_1) begin
		expected_1 <= ((b+1) | ((b+1) << 20) | 20'h55000) & {`DATA_WIDTH1{1'b1}};
	end

	wire error_0 = ((a != 0) && read_test_0) ? (rq_0 !== expected_0) : 0;
	wire error_1 = ((b != (1<<`ADDR_WIDTH1) / 2) && read_test_1) ? (rq_1 !== expected_1) : 0;

	integer error_0_cnt = 0;
	integer error_1_cnt = 0;

	always @ (posedge clk_0)
	begin
		if (error_0)
			error_0_cnt <= error_0_cnt + 1'b1;
	end
	always @ (posedge clk_1)
	begin
		if (error_1)
			error_1_cnt <= error_1_cnt + 1'b1;
	end

	// PART 0
	initial #(1) begin
		// Write data
		for (a = 0; a < (1<<`ADDR_WIDTH0) / 2; a = a + ADDR_INCR) begin
			@(negedge clk_0) begin
				wa_0 = a;
				wd_0 = a | (a << 20) | 20'h55000;
				wce_0 = 1;
			end
			@(posedge clk_0) begin
				#(PERIOD/10) wce_0 = 0;
			end
		end
		// Read data
		read_test_0 = 1;
		for (a = 0; a < (1<<`ADDR_WIDTH0) / 2; a = a + ADDR_INCR) begin
			@(negedge clk_0) begin
				ra_0 = a;
				rce_0 = 1;
			end
			@(posedge clk_0) begin
				#(PERIOD/10) rce_0 = 0;
				if ( rq_0 !== expected_0) begin
					$display("%d: PORT 0: FAIL: mismatch act=%x exp=%x at %x", $time, rq_0, expected_0, a);
				end else begin
					$display("%d: PORT 0: OK: act=%x exp=%x at %x", $time, rq_0, expected_0, a);
				end
			end
		end
		done_0 = 1'b1;
		a = 0;
	end

	// PART 1
	initial #(1) begin
		// Write data
		for (b = (1<<`ADDR_WIDTH1) / 2; b < (1<<`ADDR_WIDTH1); b = b + ADDR_INCR) begin
			@(negedge clk_1) begin
				wa_1 = b;
				wd_1 = (b+1) | ((b+1) << 20) | 20'h55000;
				wce_1 = 1;
			end
			@(posedge clk_1) begin
				#(PERIOD/10) wce_1 = 0;
			end
		end
		// Read data
		read_test_1 = 1;
		for (b = (1<<`ADDR_WIDTH1) / 2; b < (1<<`ADDR_WIDTH1); b = b + ADDR_INCR) begin
			@(negedge clk_1) begin
				ra_1 = b;
				rce_1 = 1;
			end
			@(posedge clk_1) begin
				#(PERIOD/10) rce_1 = 0;
				if ( rq_1 !== expected_1) begin
					$display("%d: PORT 1: FAIL: mismatch act=%x exp=%x at %x", $time, rq_1, expected_1, b);
				end else begin
					$display("%d: PORT 1: OK: act=%x exp=%x at %x", $time, rq_1, expected_1, b);
				end
			end
		end
		done_1 = 1'b1;
		b = (1<<`ADDR_WIDTH1) / 2;
	end

	// Scan for simulation finish
	always @(posedge clk_0, posedge clk_1) begin
		if (done_sim)
			$finish_and_return( (error_0_cnt == 0 & error_1_cnt == 0) ? 0 : -1 );
	end

	case (`STRINGIFY(`TOP))
		"spram_18x1024_2x": begin
			spram_18x1024_2x #() bram (
				.clock0(clk_0),
				.REN0_i(rce_0),
				.RD_ADDR0_i(ra_0),
				.RDATA0_o(rq_0),
				.WEN0_i(wce_0),
				.WR_ADDR0_i(wa_0),
				.WDATA0_i(wd_0),

				.clock1(clk_1),
				.REN1_i(rce_1),
				.RD_ADDR1_i(ra_1),
				.RDATA1_o(rq_1),
				.WEN1_i(wce_1),
				.WR_ADDR1_i(wa_1),
				.WDATA1_i(wd_1)
			);
		end
		"spram_9x2048_x2": begin
			spram_9x2048_x2 #() bram (
				.clock0(clk_0),
				.REN0_i(rce_0),
				.RD_ADDR0_i(ra_0),
				.RDATA0_o(rq_0),
				.WEN0_i(wce_0),
				.WR_ADDR0_i(wa_0),
				.WDATA0_i(wd_0),

				.clock1(clk_1),
				.REN1_i(rce_1),
				.RD_ADDR1_i(ra_1),
				.RDATA1_o(rq_1),
				.WEN1_i(wce_1),
				.WR_ADDR1_i(wa_1),
				.WDATA1_i(wd_1)
			);
		end
		"spram_9x2048_18x1024": begin
			spram_9x2048_18x1024 #() bram (
				.clock0(clk_0),
				.REN0_i(rce_0),
				.RD_ADDR0_i(ra_0),
				.RDATA0_o(rq_0),
				.WEN0_i(wce_0),
				.WR_ADDR0_i(wa_0),
				.WDATA0_i(wd_0),

				.clock1(clk_1),
				.REN1_i(rce_1),
				.RD_ADDR1_i(ra_1),
				.RDATA1_o(rq_1),
				.WEN1_i(wce_1),
				.WR_ADDR1_i(wa_1),
				.WDATA1_i(wd_1)
			);
		end
	endcase
endmodule
