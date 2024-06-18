// This program was cloned from: https://github.com/zhanghai/archexp
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module ClockDivider(
		input clock,
		input reset,
		output reg [31:0] counter
	);

	always @(posedge clock) begin
		if (reset) begin
			counter <= 0;
		end else begin
			counter <= counter + 1'b1;
		end
	end
endmodule
