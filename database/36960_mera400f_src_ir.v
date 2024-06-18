// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// Instruction register (IR)

module ir(
	input clk_sys,
	input [0:15] d,
	input c,
	input invalidate,
	output reg [0:15] q
);

	// NOTE: in the original design, -SI1 drives open-collector buffers which
	// short ir[0:1] 7475 outputs to ground, causing reset of the two most significant bits of IR.
	// This is a way of 'disabling' instruction decoder so it doesn't send -LIP/-SP
	// signals to interrupt control loop when serving 'invalid instruction' interrupt caused
	// by LIP/SP instructions executed in user program. Here we just reset two bits in IR.

	always @ (posedge clk_sys, posedge invalidate) begin
		if (invalidate) q[0:1] <= 2'd0;
		else if (c) q <= d;
	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
