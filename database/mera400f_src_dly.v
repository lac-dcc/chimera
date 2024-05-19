// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// Generic delay line

module dly(
	input clk,
	input i,
	output o
);

	parameter ticks = 3'd5;
	localparam width = $clog2(ticks+1);

	reg [width-1:0] counter = ticks;

	always @ (posedge clk) begin
		case (i)
			1'b1: if (|counter) counter <= counter - 1'b1;
			1'b0: counter <= ticks;
		endcase
	end

	assign o = i & ~(|counter);

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
