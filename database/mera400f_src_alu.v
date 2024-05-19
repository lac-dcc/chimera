// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// 16-bit ALU

/*

0-7: {sd, scb, sb, sab}
8-15: {sd, sca, sb, saa}

			.-> saryt
			| .-> ~sd, ~sca, ~sb, ~saa (s[3:0])
			| |			.-> ~sd, ~scb, ~sb, ~sab (s[3:0])
			| |			|
A+B		1	1001	1001	ad, lws, rws, js, lj, ib, trb, krb
A-B		1	0110	0110	sw, co, ng, cb
A|B		0	1110	1110	or, om, ls, is
A|~B	0	1101	1101	bc, oc
A&B		0	1011	1011	nr, nm, ls & ~wls, bn, bs
~A&B	0	0010	0010	ls & wls, bb
A&~B	0	0111	0111	er, em, is, bm
A^B		0	0110	0110	xr, xm, bs
A			1	0000	0000	ri
A			0	1111	1111	zb, (lb, rb) & W&, irb, sr
B			0 1010	1010	(lb, rb) & wz
A-1		1	1111	1111	drb
~A		0 0000	0000	ngl
A+A		1 1100	1100	sl

*/

module alu(
	input p16_,
	input [0:15] a,
	input [0:15] ac,
	input saryt,
	input sd, sb,
	input scb, sab,
	input sca, saa,
	output [0:15] f,
	output j$,
	output carry,
	output zsum
);

	wor __NC;

	wire [3:0] g, p;
	wire [3:1] c_;
	wire [3:0] j$1;

	// most significant
	wire carry_;
	alu181 ALU_0_3(
		.a(a[0:3]),
		.b(ac[0:3]),
		.m(~saryt),
		.c_(c_[3]),
		.s({~sd, ~scb, ~sb, ~sab}),
		.f(f[0:3]),
		.g(g[3]),
		.p(p[3]),
		.co_(carry_),
		.eq(j$1[3])
	);

	alu181 ALU_4_7(
		.a(a[4:7]),
		.b(ac[4:7]),
		.m(~saryt),
		.c_(c_[2]),
		.s({~sd, ~scb, ~sb, ~sab}),
		.f(f[4:7]),
		.p(p[2]),
		.g(g[2]),
		.co_(__NC),
		.eq(j$1[2])
	);

	alu181 ALU_8_11(
		.a(a[8:11]),
		.b(ac[8:11]),
		.m(~saryt),
		.c_(c_[1]),
		.s({~sd, ~sca, ~sb, ~saa}),
		.f(f[8:11]),
		.p(p[1]),
		.g(g[1]),
		.co_(__NC),
		.eq(j$1[1])
	);

	// least significant
	alu181 ALU_12_15(
		.a(a[12:15]),
		.b(ac[12:15]),
		.m(~saryt),
		.c_(p16_),
		.s({~sd, ~sca, ~sb, ~saa}),
		.f(f[12:15]),
		.p(p[0]),
		.g(g[0]),
		.co_(__NC),
		.eq(j$1[0])
	);

	carry182 CARRY(
		.g(g),
		.p(p),
		.c_(p16_),
		.c1_(c_[1]),
		.c2_(c_[2]),
		.c3_(c_[3]),
		.op(__NC),
		.og(__NC)
	);

	assign carry = ~carry_;
	assign zsum = ~|f;
	assign j$ = &j$1;

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
