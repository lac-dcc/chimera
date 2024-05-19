// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

/*
	F-PA unit (FPU arithmetic)

	document: 12-006370-01-4A
	unit:     F-PA2-1
	pages:    2-29..2-48
*/

module fpa(
	input clk_sys,
	input strob_fp,
	input strobb_fp,
	// sheet 1
	input [0:15] w,
	input taa,
	// sheet 2
	output t_1,
	input t_1_d,
	input m_1_d,
	input tab,
	input clockta,
	input clocktb,
	input clocktc,
	output t_0_1,
	output t_2_7,
	output t_8_15,
	output t_16_23,
	output t_24_31,
	output t_32_39,
	// sheet 3
	output m_1,
	input ma,
	input mb,
	input clockm,
	input _0_m,
	output c0_eq_c1,
	output c0,
	output t1,
	output t0_eq_c0,
	output t0_neq_c0,
	output t0_neq_t1,
	output t0_neq_t_1,
	output m0,
	output t0,
	// sheet 4
	input fab,
	input faa,
	output fp0_,
	// sheet 5
	// sheet 6
	input p_16,
	output m14,
	output m15,
	// sheet 7
	// (nothing)
	// sheet 8
	output fp16_,
	// sheet 9
	output t16,
	// sheet 10
	// (nothing)
	// sheet 11
	input m_32,
	input p_32,
	// sheet 12
	// also w[8:11]
	// sheet 13
	// w[12:15]
	// sheet 14
	input m_40,
	input cp,
	input t_c,
	output m32,
	output m38,
	output m39,
	output c39,
	// sheet 15
	input fra,
	input frb,
	input p_40,
	output p32_,
	// sheet 16
	input trb,
	input _0_t,
	output t39,
	// sheet 17
	input f9,
	input lkb,
	// sheet 18
	input z_f,
	input m_f,
	input v_f,
	input c_f,
	output [0:15] zp,
	// sheet 19
	input [-2:7] d,
	input _0_zp,
	input zpb,
	input zpa
);

	// --- K bus ------------------------------------------------------------

	wire [0:39] k;

	k K(
		.lkb(lkb),
		.f9(f9),
		.sum(sum),
		.m(m[0:39]),
		.w(w),
		.k(k)
	);

	// --- T register -------------------------------------------------------

	wire [-1:39] t;

	t T(
		.clk_sys(clk_sys),
		._0_t(_0_t),
		.taa(taa),
		.tab(tab),
		.trb(trb),
		.clockta(clockta),
		.clocktb(clocktb),
		.clocktc(clocktc),
		.t_1_d(t_1_d),
		.k(k),
		.m_1(m[-1]),
		.t(t)
	);

	assign t_1 = t[-1];
	assign t0 = t[0];
	assign t1 = t[1];
	assign t16 = t[16];
	assign t39 = t[39];

	assign t0_eq_c0 = t[0] == c[0];
	assign t0_neq_c0 = c[0] != t[0];
	assign t0_neq_t1 = t[0] != t[1];
	assign t0_neq_t_1 = t[0] != t[-1];

	assign t_0_1 = |t[0:1];
	assign t_2_7 = |t[2:7];
	assign t_8_15 = |t[8:15];
	assign t_16_23 = |t[16:23];
	assign t_24_31 = |t[24:31];
	assign t_32_39 = |t[32:39];

	// --- M register -------------------------------------------------------

	wire [-1:39] m;
	m M(
		.clk_sys(clk_sys),
		._0_m(_0_m),
		.clockm(clockm),
		.ma(ma),
		.mb(mb),
		.m_32(m_32),
		.m_40(m_40),
		.m_1_d(m_1_d),
		.t(t[0:39]),
		.m(m)
	);

	assign m_1 = m[-1];
	assign m0 = m[0];
	assign m14 = m[14];
	assign m15 = m[15];
	assign m32 = m[32];
	assign m38 = m[38];
	assign m39 = m[39];

	// --- C register -------------------------------------------------------

	wire [0:39] c;

	c C(
		.clk_sys(clk_sys),
		.t(t[0:39]),
		.t_c(t_c),
		.cp(cp),
		.c(c)
	);

	assign c0_eq_c1 = c[0] == c[1];
	assign c0 = c[0];
	assign c39 = c[39];

	// --- Mantissa ALU -----------------------------------------------------

	wire [0:39] sum;

	fpalu FPALU(
		.t(t[0:39]),
		.c(c),
		.faa(faa),
		.fab(fab),
		.fra(fra),
		.frb(frb),
		.p_16(p_16),
		.p_32(p_32),
		.p_40(p_40),
		.fp0_(fp0_), // carry out above bit 0
		.fp16_(fp16_), // carry out above bit 16
		.p32_(p32_), // carry out above bit 32
		.sum(sum)
	);

	// --- ZP bus -----------------------------------------------------------

	zp ZP(
		._0_zp(_0_zp),
		.zpa(zpa),
		.zpb(zpb),
		.t(t[0:39]),
		.d(d[0:7]),
		.z_f(z_f),
		.m_f(m_f),
		.v_f(v_f),
		.c_f(c_f),
		.zp(zp)
	);

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
