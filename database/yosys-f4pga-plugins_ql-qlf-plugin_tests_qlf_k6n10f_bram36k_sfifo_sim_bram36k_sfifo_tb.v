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
	localparam PERIOD = 30;
	localparam ADDR_INCR = 1;

	reg clk;
	reg flush;
	reg pop;
	wire [`DATA_WIDTH1-1:0] dout;
	reg push;
	reg [`DATA_WIDTH0-1:0] din;
	wire almost_full,almost_empty;
	wire full, empty;
	wire full_watermark, empty_watermark;
	wire overrun_error, underrun_error;

	initial 
	begin
		clk = 0;
		pop = 0;
		push = 0;
		flush = 1;
		din = 0;
		#40
		flush = 0;
	end
	
	initial forever #(PERIOD / 3.0) clk = ~clk;
	
	initial begin
		$dumpfile(`STRINGIFY(`VCD));
		$dumpvars;
	end

	integer a;

	reg done;
	initial done = 1'b0;
	
	reg read_test;
	initial read_test = 0;

	reg [`DATA_WIDTH1-1:0] expected;
	initial expected = 0;

	always @(posedge clk) begin
		expected <= (a | (a << 20) | 20'h55000) & {`DATA_WIDTH1{1'b1}};
	end

	wire error = ((a != 0) && read_test) ? dout !== expected : 0;

	integer error_cnt = 0;
	always @ (posedge clk)
	begin
		if (error)
			error_cnt <= error_cnt + 1'b1; 
	end

	initial #(50) begin
		@(posedge clk)
		// Write data
		for (a = 0; a < (1<<`ADDR_WIDTH0); a = a + ADDR_INCR) begin
			@(negedge clk) begin
				din = a | (a << 20) | 20'h55000;
				push = 1;
			end
			@(posedge clk) begin
				#(PERIOD/10) push = 0;
			end
		end
		// Read data
		read_test = 1;
		for (a = 0; a < (1<<`ADDR_WIDTH1); a = a + ADDR_INCR) begin
			@(posedge clk) begin
				#(PERIOD/10) pop = 0;
				if ( dout !== expected) begin
					$display("%d: FAIL: mismatch act=%x exp=%x at %x", $time, dout, expected, a);
				end else begin
					$display("%d: OK: act=%x exp=%x at %x", $time, dout, expected, a);
				end
			end
			@(negedge clk) begin
				pop = 1;
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
		"f1024x36_1024x36": begin
			f1024x36_1024x36 #() afifo (
				.DIN(din),
				.PUSH(push),
				.POP(pop),
				.clock0(clk),
				.Async_Flush(flush),
				.Almost_Full(almost_full),
				.Almost_Empty(almost_empty),
				.Full(full),
				.Empty(empty),
				.Full_Watermark(full_watermark),
				.Empty_Watermark(empty_watermark),
				.Overrun_Error(overrun_error),
				.Underrun_Error(underrun_error),
				.DOUT(dout)
			);
		end
		"f2048x18_2048x18": begin
			f2048x18_2048x18 #() afifo (
				.DIN(din),
				.PUSH(push),
				.POP(pop),
				.clock0(clk),
				.Async_Flush(flush),
				.Almost_Full(almost_full),
				.Almost_Empty(almost_empty),
				.Full(full),
				.Empty(empty),
				.Full_Watermark(full_watermark),
				.Empty_Watermark(empty_watermark),
				.Overrun_Error(overrun_error),
				.Underrun_Error(underrun_error),
				.DOUT(dout)
			);
		end
		"f4096x9_4096x9": begin
			f4096x9_4096x9 #() afifo (
				.DIN(din),
				.PUSH(push),
				.POP(pop),
				.clock0(clk),
				.Async_Flush(flush),
				.Almost_Full(almost_full),
				.Almost_Empty(almost_empty),
				.Full(full),
				.Empty(empty),
				.Full_Watermark(full_watermark),
				.Empty_Watermark(empty_watermark),
				.Overrun_Error(overrun_error),
				.Underrun_Error(underrun_error),
				.DOUT(dout)
			);
		end		
	endcase
endmodule
