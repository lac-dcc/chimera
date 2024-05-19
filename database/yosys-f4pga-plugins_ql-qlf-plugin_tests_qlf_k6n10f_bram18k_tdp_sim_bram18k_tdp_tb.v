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

	reg clk_a;
	reg rce_a_0;
	reg rce_a_1;
	reg [`ADDR_WIDTH0-1:0] ra_a_0;
	reg [`ADDR_WIDTH1-1:0] ra_a_1;
	wire [`DATA_WIDTH0-1:0] rq_a_0;
	wire [`DATA_WIDTH1-1:0] rq_a_1;
	reg wce_a_0;
	reg wce_a_1;
	reg [`ADDR_WIDTH0-1:0] wa_a_0;
	reg [`ADDR_WIDTH1-1:0] wa_a_1;
	reg [`DATA_WIDTH0-1:0] wd_a_0;
	reg [`DATA_WIDTH1-1:0] wd_a_1;

	reg clk_b;
	reg rce_b_0;
	reg rce_b_1;
	reg [`ADDR_WIDTH0-1:0] ra_b_0;
	reg [`ADDR_WIDTH1-1:0] ra_b_1;
	wire [`DATA_WIDTH0-1:0] rq_b_0;
	wire [`DATA_WIDTH1-1:0] rq_b_1;
	reg wce_b_0;
	reg wce_b_1;
	reg [`ADDR_WIDTH0-1:0] wa_b_0;
	reg [`ADDR_WIDTH1-1:0] wa_b_1;
	reg [`DATA_WIDTH0-1:0] wd_b_0;
	reg [`DATA_WIDTH1-1:0] wd_b_1;


	initial clk_a = 0;
	initial clk_b = 0;
	initial ra_a_0 = 0;
	initial ra_a_1 = 0;
	initial ra_b_0 = 0;
	initial ra_b_1 = 0;
	initial rce_a_0 = 0;
	initial rce_a_1 = 0;
	initial rce_b_0 = 0;
	initial rce_b_1 = 0;
	initial wce_a_0 = 0;
	initial wce_a_1 = 0;
	initial wce_b_0 = 0;
	initial wce_b_1 = 0;
	initial forever #(PERIOD / 2.0) clk_a = ~clk_a;
	initial begin
		#(PERIOD / 4.0);
		forever #(PERIOD / 2.0) clk_b = ~clk_b;
	end	 
	initial begin
		$dumpfile(`STRINGIFY(`VCD));
		$dumpvars;
	end

	integer a0;
	integer b0;
	integer a1;
	integer b1;

	reg done_a0;
	reg done_b0;
	reg done_a1;
	reg done_b1;
	initial done_a0 = 1'b0;
	initial done_b0 = 1'b0;
	initial done_a1 = 1'b0;
	initial done_b1 = 1'b0;
	wire done_sim = done_a0 & done_b0 & done_a1 & done_b1;

	reg [`DATA_WIDTH0-1:0] expected_a_0;
	reg [`DATA_WIDTH1-1:0] expected_a_1;
	reg [`DATA_WIDTH0-1:0] expected_b_0;
	reg [`DATA_WIDTH1-1:0] expected_b_1;

	always @(posedge clk_a) begin
			expected_a_0 <= (a0 | (a0 << 20) | 20'h55000) & {`DATA_WIDTH0{1'b1}};
			expected_a_1 <= ((a1+1) | ((a1+1) << 20) | 20'h55000) & {`DATA_WIDTH1{1'b1}};
	end
	always @(posedge clk_b) begin
			expected_b_0 <= ((b0+2) | ((b0+2) << 20) | 20'h55000) & {`DATA_WIDTH0{1'b1}};
			expected_b_1 <= ((b1+3) | ((b1+3) << 20) | 20'h55000) & {`DATA_WIDTH1{1'b1}};
	end

	wire error_a_0 = a0 != 0 ? (rq_a_0 !== expected_a_0) : 0;
	wire error_a_1 = a1 != 0 ? (rq_a_1 !== expected_a_1) : 0;
	wire error_b_0 = b0 != (1<<`ADDR_WIDTH0) / 2 ? (rq_b_0 !== expected_b_0) : 0;
	wire error_b_1 = b1 != (1<<`ADDR_WIDTH1) / 2 ? (rq_b_1 !== expected_b_1) : 0;

	integer error_a_0_cnt = 0;
	integer error_a_1_cnt = 0;
	integer error_b_0_cnt = 0;
	integer error_b_1_cnt = 0;

	always @ (posedge clk_a)
	begin
		if (error_a_0)
			error_a_0_cnt <= error_a_0_cnt + 1'b1;
		if (error_a_1)
			error_a_1_cnt <= error_a_1_cnt + 1'b1;
	end
	always @ (posedge clk_b)
	begin
		if (error_b_0)
			error_b_0_cnt <= error_b_0_cnt + 1'b1;
		if (error_b_1)
			error_b_1_cnt <= error_b_1_cnt + 1'b1;
	end

	// PORTs A0
	initial #(1) begin
		// Write data
		for (a0 = 0; a0 < (1<<`ADDR_WIDTH0) / 2; a0 = a0 + ADDR_INCR) begin
			@(negedge clk_a) begin
				wa_a_0 = a0;
				wd_a_0 = a0 | (a0 << 20) | 20'h55000;
				wce_a_0 = 1;
			end
			@(posedge clk_a) begin
				#(PERIOD/10) wce_a_0 = 0;
			end
		end
		// Read data
		for (a0 = 0; a0 < (1<<`ADDR_WIDTH0) / 2; a0 = a0 + ADDR_INCR) begin
			@(negedge clk_a) begin
				ra_a_0 = a0;
				rce_a_0 = 1;
			end
			@(posedge clk_a) begin
				#(PERIOD/10) rce_a_0 = 0;
				if ( rq_a_0 !== expected_a_0) begin
					$display("%d: PORT A0: FAIL: mismatch act=%x exp=%x at %x", $time, rq_a_0, expected_a_0, a0);
				end else begin
					$display("%d: PORT A0: OK: act=%x exp=%x at %x", $time, rq_a_0, expected_a_0, a0);
				end
			end
		end
		done_a0 = 1'b1;
		a0 = 0;
		// PORTs B0
		@(posedge clk_b)
		#2;
		// Write data
		for (b0 = (1<<`ADDR_WIDTH0) / 2; b0 < (1<<`ADDR_WIDTH0); b0 = b0 + ADDR_INCR) begin
			@(negedge clk_b) begin
				wa_b_0 = b0;
				wd_b_0 = (b0+2) | ((b0+2) << 20) | 20'h55000;
				wce_b_0 = 1;
			end
			@(posedge clk_b) begin
				#(PERIOD/10) wce_b_0 = 0;
			end
		end
		// Read data
		for (b0 = (1<<`ADDR_WIDTH0) / 2; b0 < (1<<`ADDR_WIDTH0); b0 = b0 + ADDR_INCR) begin
			@(negedge clk_b) begin
				ra_b_0 = b0;
				rce_b_0 = 1;
			end
			@(posedge clk_b) begin
				#(PERIOD/10) rce_b_0 = 0;
				if ( rq_b_0 !== expected_b_0) begin
					$display("%d: PORT B0: FAIL: mismatch act=%x exp=%x at %x", $time, rq_b_0, expected_b_0, b0);
				end else begin
					$display("%d: PORT B0: OK: act=%x exp=%x at %x", $time, rq_b_0, expected_b_0, b0);
				end
			end
		end
		done_b0 = 1'b1;
		b0 = (1<<`ADDR_WIDTH0) / 2;
		// PORTs A1
		@(posedge clk_a)
		#2;
		// Write data
		for (a1 = 0; a1 < (1<<`ADDR_WIDTH1) / 2; a1 = a1 + ADDR_INCR) begin
			@(negedge clk_a) begin
				wa_a_1 = a1;
				wd_a_1 = (a1+1) | ((a1+1) << 20) | 20'h55000;
				wce_a_1 = 1;
			end
			@(posedge clk_a) begin
				#(PERIOD/10) wce_a_1 = 0;
			end
		end
		// Read data
		for (a1 = 0; a1 < (1<<`ADDR_WIDTH1) / 2; a1 = a1 + ADDR_INCR) begin
			@(negedge clk_a) begin
				ra_a_1 = a1;
				rce_a_1 = 1;
			end
			@(posedge clk_a) begin
				#(PERIOD/10) rce_a_1 = 0;
				if ( rq_a_1 !== expected_a_1) begin
					$display("%d: PORT A1: FAIL: mismatch act=%x exp=%x at %x", $time, rq_a_1, expected_a_1, a1);
				end else begin
					$display("%d: PORT A1: OK: act=%x exp=%x at %x", $time, rq_a_1, expected_a_1, a1);
				end
			end
		end
		done_a1 = 1'b1;
		a1 = 0;
		// PORTs B1
		@(posedge clk_b)
		#2;
		// Write data
		for (b1 = (1<<`ADDR_WIDTH1) / 2; b1 < (1<<`ADDR_WIDTH1); b1 = b1 + ADDR_INCR) begin
			@(negedge clk_b) begin
				wa_b_1 = b1;
				wd_b_1 = (b1+3) | ((b1+3) << 20) | 20'h55000;
				wce_b_1 = 1;
			end
			@(posedge clk_b) begin
				#(PERIOD/10) wce_b_1 = 0;
			end
		end
		// Read data
		for (b1 = (1<<`ADDR_WIDTH1) / 2; b1 < (1<<`ADDR_WIDTH1); b1 = b1 + ADDR_INCR) begin
			@(negedge clk_b) begin
				ra_b_1 = b1;
				rce_b_1 = 1;
			end
			@(posedge clk_b) begin
				#(PERIOD/10) rce_b_1 = 0;
				if ( rq_b_1 !== expected_b_1) begin
					$display("%d: PORT B1: FAIL: mismatch act=%x exp=%x at %x", $time, rq_b_1, expected_b_1, b1);
				end else begin
					$display("%d: PORT B1: OK: act=%x exp=%x at %x", $time, rq_b_1, expected_b_1, b1);
				end
			end
		end
		done_b1 = 1'b1;
		b1 = (1<<`ADDR_WIDTH1) / 2;
	end

	// Scan for simulation finish
	always @(posedge clk_a, posedge clk_b) begin
		if (done_sim)
			$finish_and_return( (error_a_0_cnt == 0 & error_b_0_cnt == 0 & error_a_1_cnt == 0 & error_b_1_cnt == 0) ? 0 : -1 );
	end
	
	case (`STRINGIFY(`TOP))
		"dpram_18x1024_9x2048": begin
			dpram_18x1024_9x2048 #() bram (
				.clk_a_0(clk_a),
				.REN_a_0(rce_a_0),
				.RD_ADDR_a_0(ra_a_0),
				.RDATA_a_0(rq_a_0),
				.WEN_a_0(wce_a_0),
				.WR_ADDR_a_0(wa_a_0),
				.WDATA_a_0(wd_a_0),
				.clk_b_0(clk_b),
				.REN_b_0(rce_b_0),
				.RD_ADDR_b_0(ra_b_0),
				.RDATA_b_0(rq_b_0),
				.WEN_b_0(wce_b_0),
				.WR_ADDR_b_0(wa_b_0),
				.WDATA_b_0(wd_b_0),

				.clk_a_1(clk_a),
				.REN_a_1(rce_a_1),
				.RD_ADDR_a_1(ra_a_1),
				.RDATA_a_1(rq_a_1),
				.WEN_a_1(wce_a_1),
				.WR_ADDR_a_1(wa_a_1),
				.WDATA_a_1(wd_a_1),
				.clk_b_1(clk_b),
				.REN_b_1(rce_b_1),
				.RD_ADDR_b_1(ra_b_1),
				.RDATA_b_1(rq_b_1),
				.WEN_b_1(wce_b_1),
				.WR_ADDR_b_1(wa_b_1),
				.WDATA_b_1(wd_b_1)
			);
		end
		"dpram_9x2048_x2": begin
			dpram_9x2048_x2 #() bram (
				.clk_a_0(clk_a),
				.REN_a_0(rce_a_0),
				.RD_ADDR_a_0(ra_a_0),
				.RDATA_a_0(rq_a_0),
				.WEN_a_0(wce_a_0),
				.WR_ADDR_a_0(wa_a_0),
				.WDATA_a_0(wd_a_0),
				.clk_b_0(clk_b),
				.REN_b_0(rce_b_0),
				.RD_ADDR_b_0(ra_b_0),
				.RDATA_b_0(rq_b_0),
				.WEN_b_0(wce_b_0),
				.WR_ADDR_b_0(wa_b_0),
				.WDATA_b_0(wd_b_0),

				.clk_a_1(clk_a),
				.REN_a_1(rce_a_1),
				.RD_ADDR_a_1(ra_a_1),
				.RDATA_a_1(rq_a_1),
				.WEN_a_1(wce_a_1),
				.WR_ADDR_a_1(wa_a_1),
				.WDATA_a_1(wd_a_1),
				.clk_b_1(clk_b),
				.REN_b_1(rce_b_1),
				.RD_ADDR_b_1(ra_b_1),
				.RDATA_b_1(rq_b_1),
				.WEN_b_1(wce_b_1),
				.WR_ADDR_b_1(wa_b_1),
				.WDATA_b_1(wd_b_1)
			);
		end
		"dpram_18x1024_x2": begin
			dpram_18x1024_x2 #() bram (
				.clk_a_0(clk_a),
				.REN_a_0(rce_a_0),
				.RD_ADDR_a_0(ra_a_0),
				.RDATA_a_0(rq_a_0),
				.WEN_a_0(wce_a_0),
				.WR_ADDR_a_0(wa_a_0),
				.WDATA_a_0(wd_a_0),
				.clk_b_0(clk_b),
				.REN_b_0(rce_b_0),
				.RD_ADDR_b_0(ra_b_0),
				.RDATA_b_0(rq_b_0),
				.WEN_b_0(wce_b_0),
				.WR_ADDR_b_0(wa_b_0),
				.WDATA_b_0(wd_b_0),

				.clk_a_1(clk_a),
				.REN_a_1(rce_a_1),
				.RD_ADDR_a_1(ra_a_1),
				.RDATA_a_1(rq_a_1),
				.WEN_a_1(wce_a_1),
				.WR_ADDR_a_1(wa_a_1),
				.WDATA_a_1(wd_a_1),
				.clk_b_1(clk_b),
				.REN_b_1(rce_b_1),
				.RD_ADDR_b_1(ra_b_1),
				.RDATA_b_1(rq_b_1),
				.WEN_b_1(wce_b_1),
				.WR_ADDR_b_1(wa_b_1),
				.WDATA_b_1(wd_b_1)
			);
		end
	endcase
endmodule
