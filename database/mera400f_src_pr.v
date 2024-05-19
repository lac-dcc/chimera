// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// P-R unit (registers)

module pr(
	input clk_sys,
	input blr,				// A50 - BLokuj Rejestry
	input lpc,				// A94 - LPC instruction
	input wa,				// B94 - state WA
	input rpc,				// B03 - RPC instruction
	input ra,				// B48 - user register address
	input rb,				// B49 - user register address
	input rc,				// A49
	input as2,				// B43
	input w_r,				// B47
	input strob1,		// B32
	input strob1b,		// B32
	input strob2,		// B42
	input strob2b,		// B42
	input [0:15] w,		// B07, B12, B11, B10, B22, B24, B25, B23, B13, B19, B20, B21, B16, B08, B17, B18 - bus W
	output [0:15] l,	// A04, A03, A28, A27, A09, A10, A26, A25, A07, A08, A16, A17, A06, A05, A18, A19 - bus L
	input bar_nb,		// B83 - BAR->NB: output BAR register to system bus
	input w_rbb,			// A51 - RB[4:9] clock in
	input w_rbc,			// B46 - RB[0:3] clock in
	input w_rba,			// B50 - RB[10:15] clock in
	output [0:3] dnb,	// A86, A90, A87, B84 - DNB: NB system bus driver
	input rpn,				// B85
	input bp_nb,			// B86
	input pn_nb,			// A92
	input q_nb,				// B90
	input w_bar,			// B56 - W->BAR: send W bus to {BAR, Q, BS} registers
	input zer_sp,		// A89
	input clm,				// B93
	input ustr0_fp,	// A11
	input ust_leg,		// B39
	input aryt,				// B45
	input zs,					// A47
	input carry,			// A48
	input s_1,				// B44
	output zgpn,			// B88
	output dpn,			// B87 - PN system bus driver
	output dqb,			// B89 - Q system bus driver
	output q,					// A53 - Q: system flag
	output zer,			// A52
	input ust_z,			// B53
	input ust_mc,			// B55
	input s0,					// B92
	input ust_v,			// A93
	input _0_v,				// B91
	output [0:8] r0,	// A44, A46, A43, A42, A41, A45, A40, A39, B09 - CPU flags in R0 register
	input exy,				// A37
	input ust_y,			// B40
	input exx,				// A38
	input ust_x,			// B41
	input kia,				// B81
	input kib,				// A91
	input [0:15] bus_rz,	// B70, B76, B60, B66, A60, A64, A68, A56, B80, A80, A74, A84, A77, B74, A71, B57
										// NOTE: rz[14] is rz30, rz[15] is rz31
	input [0:15] zp,	// B68, B72, B62, B64, A62, B63, A66, A58, B78, A82, A75, A85, A78, A83, A70, A54
	input [0:9] rs,		// B69, B75, B61, B65, A61, A63, A67, A57, B79, A81
	output [0:15] bus_ki	// B71, B77, B59, B67, A59, A65, A69, A55, B82, A79, A73, B73, A76, A88, A72, B58
);

	parameter CPU_NUMBER;
	parameter AWP_PRESENT;

	wire strob_a = ~as2 & strob1;
	wire strob_b =  as2 & strob2;

	wire sel_r1_r7 = rb | ra | rc; // r1-r7 selected
	wire wr0 = ~sel_r1_r7; // R0 selected

	wire M60_6 = ~(wa & rpc);

	wire [0:15] R1_7;
	regs USER_REGS(
		.clk_sys(clk_sys),
		.w(w),
		.addr({rc, rb, ra}),
		.we((strob_a | strob_b) & w_r & sel_r1_r7),
		.l(R1_7)
	);

	l BUS_L(
		.r0({r0, r0low}),
		.rn(R1_7),
		.sel({blr, sel_r1_r7 & M60_6}),
		.l(l)
	);

	// RB register (binary load register)

	wire [0:15] rRB;
	rb REG_RB(
		.clk_sys(clk_sys),
		.w(w[10:15]),
		.w_rba(w_rba),
		.w_rbb(w_rbb),
		.w_rbc(w_rbc),
		.rb(rRB)
	);

	assign zgpn = rpn ^ ~CPU_NUMBER; // CPU number matches
	wire M35_8 = CPU_NUMBER ^ bs;
	wire M23_11 = CPU_NUMBER & pn_nb;
	assign dpn = (M35_8 & bp_nb) | M23_11;
	assign dqb = q_nb & q;

	wire cnb0_3 = w_bar & strob1b;
	assign zer = zer_sp | clm;

	// NB (BAR) register and system bus drivers
	// Q and BS flag registers and system bus drivers

	wire [0:3] nb;
	wire bs;
	bar REG_BAR(
		.clk_sys(clk_sys),
		.w(w[10:15]),
		.cnb(cnb0_3),
		.clm(clm),
		.zer_sp(zer_sp),
		.bar({q, bs, nb})
	);
	assign dnb = nb & {4{bar_nb}};

	wire M60_3  = strob_a & AWP_PRESENT & ustr0_fp;
	wire M62_6  = strob_a & w_r & wr0 & ~q;
	wire M62_8  = strob_b & w_r & wr0 & ~q;
	wire M61_8  = strob_a & w_r & wr0;
	wire M61_12 = strob_b & w_r & wr0;

	wire lr0 = lpc & strob_a & wa;
	wire w_zmvc = lr0 | M62_8 | M62_6 | M60_3;
	wire w_legy = lr0 | M62_8 | M62_6;
	wire lrp = lr0 | M61_8 | M61_12;

	wire cleg = as2 & strob2b & ust_leg;
	wire vg = (~aryt & ~(zs | ~carry)) | (~(zs | s_1) & aryt);
	wire vl = (~aryt & ~carry) | (aryt & s_1);

	// R0 register

	wire [9:15] r0low;
	r0 REG_R0(
		.clk_sys(clk_sys),
		.w(w),
		.r0({r0, r0low}),
		.zs(zs),
		.s_1(s_1),
		.s0(s0),
		.carry(carry),
		.vl(vl),
		.vg(vg),
		.exy(exy),
		.exx(exx),
		.strob1b(strob1b),
		.ust_z(ust_z),
		.ust_v(ust_v),
		.ust_mc(ust_mc),
		.ust_y(ust_y),
		.ust_x(ust_x),
		.cleg(cleg),
		.w_zmvc(w_zmvc),
		.w_legy(w_legy),
		._0_v(_0_v),
		.lrp(lrp),
		.zer(zer)
	);

	// KI bus

	bus_ki BUS_KI(
		.kia(kia),
		.kib(kib),
		.rz(bus_rz),
		.sr({rs[0:9], q, bs, nb[0:3]}),
		.rb(rRB),
		.zp(zp),
		.ki(bus_ki)
	);

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
