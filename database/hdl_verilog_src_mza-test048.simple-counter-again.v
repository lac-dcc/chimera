// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2021-01-28 by mza

module counter #(
	parameter WIDTH = 8,
	parameter LOAD_VALUE = 8'h45
) (
	input clk,
	input rst,
	input load,
	output [WIDTH-1:0] cnt_out
);
	reg [WIDTH-1:0] counter = 0;
	always @(posedge clk) begin
		if (~rst) begin
			counter <= 0;
		end else if (load) begin
			counter <= LOAD_VALUE;
		end else begin
			counter <= counter + 1'b1;
		end
	end
	assign cnt_out = counter;
endmodule

`ifndef SYNTHESIS
module counter_tb;
	parameter WIDTH = 8;
	parameter HALF_PERIOD = 5;
	parameter PERIOD = 2*HALF_PERIOD;
	reg clk = 0;
	reg pre_rst = 0;
	reg rst = 0;
	reg pre_load = 0;
	reg load = 0;
	wire [WIDTH-1:0] cnt;
	initial begin
		pre_rst <= 0;
		pre_load <= 0;
		#100;
		pre_rst <= 1;
		#PERIOD;
		$display("%02x", cnt);
		#PERIOD;
		$display("%02x", cnt);
		#1000;
		$display("%02x", cnt);
		#PERIOD;
		$display("%02x", cnt);
		pre_load <= 1;
		#PERIOD;
		pre_load <= 0;
		#PERIOD;
		$display("%02x", cnt);
		#PERIOD;
		$display("%02x", cnt);
		#10000;
		$display("%02x", cnt);
		#PERIOD;
		$display("%02x", cnt);
		$finish;
	end
	always begin
		#HALF_PERIOD;
		clk <= ~clk;
	end
	always @(posedge clk) begin
		rst <= pre_rst;
		load <= pre_load;
	end
	counter counter1(.clk(clk), .rst(rst), .load(load), .cnt_out(cnt));
endmodule
`endif

