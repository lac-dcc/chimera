// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

//	74181 4-bit ALU

module alu181(
	input [3:0] a, b,
	input m,
	input c_,
	input [3:0] s,
	output [3:0] f,
	output g, p,
	output co_,
	output eq
);

	wire [3:0] s0 = {4{s[0]}};
	wire [3:0] s1 = {4{s[1]}};
	wire [3:0] s2 = {4{s[2]}};
	wire [3:0] s3 = {4{s[3]}};

	wire [3:0] u = ~((a) | (b & s0) | (~b & s1)); // 3 ands
	wire [3:0] v = ~((~b & s2 & a) | (b & s3 & a)); // 2 ands
	wire [3:0] w = u ^ v;

	wire [3:0] z;
	assign z[0] = ~(~m &                                                                        c_);
	assign z[1] = ~(~m & ((u[0]) |                                                      (v[0] & c_)));
	assign z[2] = ~(~m & ((u[1]) |                        (u[0] & v[1]) |        (v[1] & v[0] & c_)));
	assign z[3] = ~(~m & ((u[2]) | (v[2] & u[1]) | (v[2] & u[0] & v[1]) | (v[2] & v[1] & v[0] & c_)));

	assign g = ~((u[0] & v[1] & v[2] & v[3]) | (u[1] & v[2] & v[3]) | (u[2] & v[3]) | (u[3]));

	assign p = ~(&v);
	wire g2 = ~(&v & c_);

	assign co_ = ~g2 | ~g;
	assign f = w ^ z;
	assign eq = &f;

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
