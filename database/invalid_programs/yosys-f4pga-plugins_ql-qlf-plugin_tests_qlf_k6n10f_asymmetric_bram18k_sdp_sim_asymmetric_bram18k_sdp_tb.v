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
	reg clk_1;
	reg rce;
	reg [`ADDR_WIDTH1-1:0] ra;
	wire [`DATA_WIDTH1-1:0] rq;
	reg wce;
	reg [`ADDR_WIDTH0-1:0] wa;
	reg [`DATA_WIDTH0-1:0] wd;

	initial clk_0 = 0;
	initial clk_1 = 0;
	initial ra = 0;
	initial wa = 0;
	initial wd = 0;
	initial rce = 0;
	initial wce = 0;
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
	initial done_0 = 1'b0;
	wire done_sim = done_0;

	reg [`DATA_WIDTH1-1:0] expected_0;

	reg read_test_0;
	initial read_test_0 = 0;


	wire error_0 = (read_test_0) ? (rq !== expected_0) : 0;

	integer error_0_cnt = 0;

	always @ (posedge clk_1)
	begin
		if (error_0)
			error_0_cnt <= error_0_cnt + 1'b1;
	end

	case (`STRINGIFY(`TOP))
	"spram_9x2048_18x1024": begin
		initial #(1) begin
			// Write data
			for (a = 0; a < (1<<`ADDR_WIDTH0) ; a = a + ADDR_INCR) begin
				@(negedge clk_0) begin
					wa = a[`ADDR_WIDTH0-1:0];
					wd = a[9:1];
					wce = 1;
				end
				@(posedge clk_0) begin
					#(PERIOD/10) wce = 0;
				end
			end
			// Read data
			read_test_0 = 1;
			for (a = 0; a < (1<<`ADDR_WIDTH1); a = a + ADDR_INCR) begin
				@(negedge clk_1) begin
					ra = a;
					rce = 1;
				end
				@(posedge clk_1) begin
					expected_0 <= {a[8],a[8],a[7:0],a[7:0]};				
					#(PERIOD/10) rce = 0;
					if ( rq !== expected_0) begin
						$display("%d: PORT 0: FAIL: mismatch act=%x exp=%x at %x", $time, rq, expected_0, a);
					end else begin
						$display("%d: PORT 0: OK: act=%x exp=%x at %x", $time, rq, expected_0, a);
					end
				end
			end
			done_0 = 1'b1;
			a = 0;		
		end
	end
	"spram_18x1024_9x2048": begin
		initial #(1) begin
			// Write data
			for (a = 0; a < (1<<`ADDR_WIDTH0) ; a = a + ADDR_INCR) begin
				@(negedge clk_0) begin
					wa = a[`ADDR_WIDTH0-1:0];
					wd = {a[8],a[8],a[7:0],a[7:0]};
					wce = 1;
				end
				@(posedge clk_0) begin
					#(PERIOD/10) wce = 0;
				end
			end
			// Read data
			read_test_0 = 1;
			for (a = 0; a < (1<<`ADDR_WIDTH1); a = a + ADDR_INCR) begin
				@(negedge clk_1) begin
					ra = a;
					rce = 1;
				end
				@(posedge clk_1) begin				
					expected_0 <= {a[9:1]};
					#(PERIOD/10) rce = 0;
					if ( rq !== expected_0) begin
						$display("%d: PORT 0: FAIL: mismatch act=%x exp=%x at %x", $time, rq, expected_0, a);
					end else begin
						$display("%d: PORT 0: OK: act=%x exp=%x at %x", $time, rq, expected_0, a);
					end
				end
			end
			done_0 = 1'b1;
			a = 0;		
		end
	end	 
	endcase

	// Scan for simulation finish
	always @(posedge clk_1) begin
		if (done_sim)
			$finish_and_return( (error_0_cnt == 0) ? 0 : -1 );
	end

	case (`STRINGIFY(`TOP))
		"spram_9x2048_18x1024": begin
			spram_9x2048_18x1024 #() bram (
				.clock0(clk_0),
				.clock1(clk_1),			
				.REN_i(rce),
				.RD_ADDR_i(ra),
				.RDATA_o(rq),
				.WEN_i(wce),
				.WR_ADDR_i(wa),
				.WDATA_i(wd)
			);
		end
		"spram_18x1024_9x2048": begin
			spram_18x1024_9x2048 #() bram (
				.clock0(clk_0),
				.clock1(clk_1),			
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
