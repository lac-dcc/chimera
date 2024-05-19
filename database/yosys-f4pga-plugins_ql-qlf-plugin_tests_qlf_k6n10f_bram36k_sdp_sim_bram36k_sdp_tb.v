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

	reg clk;
	reg rce;
	reg [`ADDR_WIDTH-1:0] ra;
	wire [`DATA_WIDTH-1:0] rq;
	reg wce;
	reg [`ADDR_WIDTH-1:0] wa;
	reg [`DATA_WIDTH-1:0] wd;

	initial clk = 0;
	initial ra = 0;
	initial rce = 0;
	initial forever #(PERIOD / 2.0) clk = ~clk;
	initial begin
		$dumpfile(`STRINGIFY(`VCD));
		$dumpvars;
	end

	integer a;

	reg done;
	initial done = 1'b0;

	reg [`DATA_WIDTH-1:0] expected;

	always @(posedge clk) begin
		expected <= (a | (a << 20) | 20'h55000) & {`DATA_WIDTH{1'b1}};
	end

	wire error = ((a != 0) && read_test) ? rq !== expected : 0;

	integer error_cnt = 0;
	always @ (posedge clk)
	begin
		if (error)
			error_cnt <= error_cnt + 1'b1;
	end

	reg read_test;
	initial read_test = 0;

	initial #(1) begin
		// Write data
		for (a = 0; a < (1<<`ADDR_WIDTH); a = a + ADDR_INCR) begin
			@(negedge clk) begin
				wa = a;
				wd = a | (a << 20) | 20'h55000;
				wce = 1;
			end
			@(posedge clk) begin
				#(PERIOD/10) wce = 0;
			end
		end
		// Read data
		read_test = 1;
		for (a = 0; a < (1<<`ADDR_WIDTH); a = a + ADDR_INCR) begin
			@(negedge clk) begin
				ra = a;
				rce = 1;
			end
			@(posedge clk) begin
				#(PERIOD/10) rce = 0;
				if ( rq !== expected) begin
					$display("%d: FAIL: mismatch act=%x exp=%x at %x", $time, rq, expected, a);
				end else begin
					$display("%d: OK: act=%x exp=%x at %x", $time, rq, expected, a);
				end
			end
		end
		done = 1'b1;
	end

	// Scan for simulation finish
	always @(posedge clk) begin
		if (done)
			$finish_and_return( (error_cnt == 0) ? 0 : -1 );
	end

	case (`STRINGIFY(`TOP))
		"spram_36x1024": begin
			spram_36x1024 #() bram (
				.clock0(clk),
				.clock1(clk),				 
				.REN_i(rce),
				.RD_ADDR_i(ra),
				.RDATA_o(rq),
				.WEN_i(wce),
				.WR_ADDR_i(wa),
				.WDATA_i(wd)
			);
		end
		"spram_32x1024": begin
			spram_32x1024 #() bram (
				.clock0(clk),
				.clock1(clk),				 
				.REN_i(rce),
				.RD_ADDR_i(ra),
				.RDATA_o(rq),
				.WEN_i(wce),
				.WR_ADDR_i(wa),
				.WDATA_i(wd)
			);
		end
		"spram_18x2048": begin
			spram_18x2048 #() bram (
				.clock0(clk),
				.clock1(clk),				 
				.REN_i(rce),
				.RD_ADDR_i(ra),
				.RDATA_o(rq),
				.WEN_i(wce),
				.WR_ADDR_i(wa),
				.WDATA_i(wd)
			);
		end
		"spram_16x2048": begin
			spram_16x2048 #() bram (
				.clock0(clk),
				.clock1(clk),				 
				.REN_i(rce),
				.RD_ADDR_i(ra),
				.RDATA_o(rq),
				.WEN_i(wce),
				.WR_ADDR_i(wa),
				.WDATA_i(wd)
			);
		end
		"spram_9x4096": begin
			spram_9x4096 #() bram (
				.clock0(clk),
				.clock1(clk),				 
				.REN_i(rce),
				.RD_ADDR_i(ra),
				.RDATA_o(rq),
				.WEN_i(wce),
				.WR_ADDR_i(wa),
				.WDATA_i(wd)
			);
		end
		"spram_8x4096": begin
			spram_8x4096 #() bram (
				.clock0(clk),
				.clock1(clk),				 
				.REN_i(rce),
				.RD_ADDR_i(ra),
				.RDATA_o(rq),
				.WEN_i(wce),
				.WR_ADDR_i(wa),
				.WDATA_i(wd)
			);
		end
	endcase
endmodule
