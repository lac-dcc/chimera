// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// 74182 Look-Ahead Carry Generator

module carry182(
	input c_,
	input [3:0] g, p,
	output c1_, c2_, c3_,
	output op, og
);

	assign c1_ = ~(                                g[0] & (p[0] | ~c_));
	assign c2_ = ~(                g[1] & (p[1] | (g[0] & (p[0] | ~c_))));
	assign c3_ = ~(g[2] & (p[2] | (g[1] & (p[1] | (g[0] & (p[0] | ~c_))))));

	assign og = g[3] & (p[3] | g[2]) & (p[3] | p[2] | g[1]) & (p[3] | p[2] | p[1] | g[0]);
	assign op = |p;

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
