// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

module pp(
	input clk_sys,

	input w_rm,
	input zer,
	input ck_rz_w,
	input zerrz,
	input przerw,
	input rpa,
	input ir14,
	input ir15,
	input wx,
	input sin,
	input rin,
	input zw,
	input zgpn,
	output przerw_z,
	output irq,

	// system-wide signals
	input clm,
	input strob1,
	input strob1b,
	// CPU states
	input k1,
	input i1,
	input i2,
	input i4,
	// interrupts
	input pout,
	input oprq,
	input b_parz,
	input b_p0,
	input zegar,
	input xi,
	input fi0,
	input fi1,
	input fi2,
	input fi3,
	// internal buses
	input [0:15] w,
	output [0:15] bus_rz,
	output [0:9] rs,
	// system bus
	input [0:15] rdt,
	output dok,
	output [0:15] dad
);

	// --- RM - interrupt mask register

	wire clm$ = clm | (strob1 & i4);
	wire clrs = strob1b & w_rm;

	rm RM(
		.clk_sys(clk_sys),
		.clm$(clm$),
		.clrs(clrs),
		.zi(zi),
		.w(w),
		.rs(rs)
	);

	// --- RZ, RP - interrupt request and service registers

	// RZ input: software interrupt drivers (sheet 10)
	wire M104_12 = wx & sin & strob1;
	wire soft_high = ir14 & M104_12;
	wire soft_low = ir15 & M104_12;

	// RZ input: async interrupt signals bus
	wire [0:31] IRQ = {
		pout,			// 0 power out (NMI)
		b_parz,		// 1 memory parity error
		b_p0,			// 2 no memory
		rz4,			// 3 other CPU, high priority
		rpa,			// 4 interface power out
		zegar,		// 5 timer
		xi,				// 6 illegal instruction
		fi0,			// 7 div overflow (fixed point)
		fi1,			// 8 floating point underflow
		fi2,			// 9 floating point overflow
		fi3,			// 10 div/0 or floating point error
		1'b0,			// 11 unused
		zk[0:15],	// 12-27 channel interrupts
		oprq,			// 28 operator request
		rz29,			// 29 other CPU, low priority
		soft_high,// 30 software interrupt high
		soft_low	// 31 software interrupt low
	};

	// RZ input: W bus, synchronous (software-set) interrupt sources
	wire [0:31] INT_SYNC = {
		w[0:11],		// software-settable interrupts
		16'b0, 			// channel interrupts cannot be set synchronously
		w[12:15]		// software-settable interrupts
	};

	// RZ input: clocks
	wire ck_rzwm = strob1 & ck_rz_w;
	wire ck_rzz = strob1 & i2;
	wire [0:31] RZ_CLK = {
		{12{ck_rzwm}},
		{16{ck_rzz}},
		{4{ck_rzwm}}
	};

	// RZ input: resets
	wire _0_rzw = clm | zerrz;
	wire _0_rzz = clm | k1;
	wire M94_3 = _0_rzw | (M104_12 & ~ir14 & ~ir15);
	wire [0:31] RZ_RESET = {
		{12{_0_rzw}},
		{16{_0_rzz}},
		{2{_0_rzw}},
		{2{M94_3}}
	};

	// RZ input: interrupt mask bus (right after RZ outputs)
	wire [0:31] IMASK = {
		1'b1,				// 0 (NMI)
		rs[0:3],		// 1-4
		{7{rs[4]}},	// 5-11
		{2{rs[5]}},	// 12-13
		{2{rs[6]}},	// 14-15
		{6{rs[7]}},	// 16-21
		{6{rs[8]}},	// 22-27
		{4{rs[9]}}	// 28-31
	};

	// RP input: clocks
	wire ez_rpz = i1 & przerw;

	// RP output: interrupt mask drivers (to RM)
	wire [0:9] zi = {
		PRIO_OUT[1],
		PRIO_OUT[2],
		PRIO_OUT[3],
		PRIO_OUT[4],
		PRIO_OUT[11],
		PRIO_OUT[13],
		PRIO_OUT[15],
		PRIO_OUT[21],
		PRIO_OUT[27],
		1'b1
	};

	// RP output: interrupt priority chain
	wire [0:31] PRIO_OUT;
	// RP input: interrupt priority chain
	wire [0:31] PRIO_IN = {
		zer,
		PRIO_OUT[0:30]
	};

	// RZ output: only non-channel interrupts are available to the user
	wire [0:31] __rz;
	assign bus_rz = {
		__rz[0:11],
		__rz[28:31]
	};

	// RZ output: masked
	wire [0:31] sz;

	// RP output
	wire [0:31] rp;

	genvar j;
	generate
		for (j=0 ; j<32 ; j=j+1) begin : GEN_RZ_RP
			rzrp RZ_RP(
				.clk_sys(clk_sys),
				.imask(IMASK[j]),				// IRQ mask input
				.irq(IRQ[j]),						// IRQ (async)
				.w(INT_SYNC[j]),				// synchronous interrupt set
				.rz_c(RZ_CLK[j]),				// RZ clock
				.rz_r(RZ_RESET[j]),			// RZ reset
				.rp_c(ez_rpz),					// RP clock
				.prio_in(PRIO_IN[j]),		// priority chain input
				.rz(__rz[j]),						// RZ content
				.sz(sz[j]),							// RZ & mask
				.rp(rp[j]),							// RP content
				.prio_out(PRIO_OUT[j])	// priority chain output
			);
		end
	endgenerate

	assign irq = |sz; // Suma Zgłoszeń
	assign przerw_z = zi[8] & ~zi[4];

	wire int_chan = ~rdt[15] & zgpn; // channel interrupt for this CPU
	wire int_cpu = rdt[15]; // interrupt from the other CPU
	wire int_ext = int_chan | int_cpu;

	wire dok_trig;
	dok DOK(
		.clk_sys(clk_sys),
		.rin(rin),
		.zw(zw),
		.int_ext(int_ext),
		.dok_trig(dok_trig),
		.dok(dok)
	);

	wire rz29 = dok_trig & rdt[15] & rdt[0];
	wire rz4 = dok_trig & rdt[15] & ~rdt[0];

	wire [0:15] zk;
	decoder16 DEC_ZK(
		.en1(int_chan),
		.en2(dok_trig),
		.i(rdt[11:14]),
		.o(zk)
	);

	// interrupts 17-31 encoded as {npbd, npbc, npbb, npba}
	wire npbd = rp[24] | rp[25] | rp[26] | rp[27] | rp[28] | rp[29] | rp[30] | rp[31];
	wire npbc = rp[20] | rp[21] | rp[22] | rp[23] | rp[28] | rp[29] | rp[30] | rp[31];
	wire npbb = rp[18] | rp[19] | rp[22] | rp[23] | rp[26] | rp[27] | rp[30] | rp[31];
	wire npba = rp[17] | rp[19] | rp[21] | rp[23] | rp[25] | rp[27] | rp[29] | rp[31];

	// interrupts 1-15 encoded as {npad, npac, npab, npaa}
	wire npad = rp[ 8] | rp[ 9] | rp[10] | rp[11] | rp[12] | rp[13] | rp[14] | rp[15];
	wire npac = rp[ 4] | rp[ 5] | rp[ 6] | rp[ 7] | rp[12] | rp[13] | rp[14] | rp[15];
	wire npab = rp[ 2] | rp[ 3] | rp[ 6] | rp[ 7] | rp[10] | rp[11] | rp[14] | rp[15];
	wire npaa = rp[ 1] | rp[ 3] | rp[ 5] | rp[ 7] | rp[ 9] | rp[11] | rp[13] | rp[15];

	wire npe = ~zi[6];
	wire npd = npbd ^ npad; // can be |
	wire npc = npbc ^ npac; // can be |
	wire npb = npbb ^ npab; // can be |
	wire npa = npba ^ npaa; // can be |
	wire np = npd ^ npc;

	wire nk_ad = i2 & zw;
	wire pzwi4 = przerw & zw & i4;

	assign dad[0:3] = 'd0;
	assign dad[4] = nk_ad;
	assign dad[5:10] = 'd0;
	assign dad[11] = (pzwi4 & npe) | (nk_ad & np);
	assign dad[12] = (pzwi4 & npd) | (nk_ad & ~npc);
	assign dad[13] = (pzwi4 & npc) | (nk_ad & npb);
	assign dad[14] = (pzwi4 & npb) | (nk_ad & npa);
	assign dad[15] = (pzwi4 & npa);

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
