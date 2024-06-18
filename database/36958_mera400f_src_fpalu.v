// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

module fpalu(
	input [0:39] t,
	input [0:39] c,
	input faa,
	input fab,
	input fra,
	input frb,
	input p_16,
	input p_32,
	input p_40,
	output fp0_,
	output fp16_,
	output p32_,
	output [0:39] sum
);

	wor __NC;

	wire g0a, g1a, g2a, g3a;
	wire p0a, p1a, p2a, p3a;

	alu181 M52(
		.a(t[0:3]),
		.b(c[0:3]),
		.m(1'b0),
		.c_(p4_),
		.s({faa, fab, fab, faa}),
		.f(sum[0:3]),
		.g(g3a),
		.p(p3a),
		.co_(fp0_),
		.eq(__NC)
	);

	alu181 M53(
		.a(t[4:7]),
		.b(c[4:7]),
		.m(1'b0),
		.c_(p8_),
		.s({faa, fab, fab, faa}),
		.f(sum[4:7]),
		.g(g2a),
		.p(p2a),
		.co_(__NC),
		.eq(__NC)
	);

	wire p12_, p8_, p4_;

	carry182 M42(
		.c_(~p_16),
		.g({g3a, g2a, g1a, g0a}),
		.p({p3a, p2a, p1a, p0a}),
		.c1_(p12_),
		.c2_(p8_),
		.c3_(p4_),
		.op(__NC),
		.og(__NC)
	);

	alu181 M54(
		.a(t[8:11]),
		.b(c[8:11]),
		.m(1'b0),
		.c_(p12_),
		.s({faa, fab, fab, faa}),
		.f(sum[8:11]),
		.g(g1a),
		.p(p1a),
		.co_(__NC),
		.eq(__NC)
	);

	alu181 M55(
		.a(t[12:15]),
		.b(c[12:15]),
		.m(1'b0),
		.c_(~p_16),
		.s({faa, fab, fab, faa}),
		.f(sum[12:15]),
		.g(g0a),
		.p(p0a),
		.co_(__NC),
		.eq(__NC)
	);

	alu181 M56(
		.a(t[16:19]),
		.b(c[16:19]),
		.m(1'b0),
		.c_(p21_),
		.s({fra, frb, frb, fra}),
		.f(sum[16:19]),
		.g(g3b),
		.p(p3b),
		.co_(fp16_),
		.eq(__NC)
	);

	alu181 M57(
		.a(t[20:23]),
		.b(c[20:23]),
		.m(1'b0),
		.c_(p24_),
		.s({fra, frb, frb, fra}),
		.f(sum[20:23]),
		.g(g2b),
		.p(p2b),
		.co_(__NC),
		.eq(__NC)
	);

	wire p21_, p24_, p28_;
	wire g3b, g2b, g1b, g0b;
	wire p3b, p2b, p1b, p0b;
	carry182 M47(
		.c_(~p_32),
		.g({g3b, g2b, g1b, g0b}),
		.p({p3b, p2b, p1b, p0b}),
		.c1_(p28_),
		.c2_(p24_),
		.c3_(p21_),
		.op(__NC),
		.og(__NC)
	);

	alu181 M58(
		.a(t[24:27]),
		.b(c[24:27]),
		.m(1'b0),
		.c_(p28_),
		.s({fra, frb, frb, fra}),
		.f(sum[24:27]),
		.g(g1b),
		.p(p1b),
		.co_(__NC),
		.eq(__NC)
	);

	alu181 M59(
		.a(t[28:31]),
		.b(c[28:31]),
		.m(1'b0),
		.c_(~p_32),
		.s({fra, frb, frb, fra}),
		.f(sum[28:31]),
		.g(g0b),
		.p(p0b),
		.co_(__NC),
		.eq(__NC)
	);

	wire p36_;

	alu181 M60(
		.a(t[32:35]),
		.b(c[32:35]),
		.m(1'b0),
		.c_(p36_),
		.s({fra, frb, frb, fra}),
		.f(sum[32:35]),
		.g(__NC),
		.p(__NC),
		.co_(p32_),
		.eq(__NC)
	);

	alu181 M61(
		.a(t[36:39]),
		.b(c[36:39]),
		.m(1'b0),
		.c_(~p_40),
		.s({fra, frb, frb, fra}),
		.f(sum[36:39]),
		.g(__NC),
		.p(__NC),
		.co_(p36_),
		.eq(__NC)
	);

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
