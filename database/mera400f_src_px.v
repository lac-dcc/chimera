// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

/*
	P-X unit (state control)

	document: 12-006368-01-8A
	unit:     P-X3-2
	pages:    2-1..2-10
*/

module px(
	input clk_sys,	// system clock
	input clo,			// general clear (reset)

	input strob_fp,	// strob1 front from the FPU
	input strobb_fp,// strob1 back from the FPU
	output got,			// CPU ready for the next state (state preload strob)
	output strob1,	// CPU STROB2
	output strob1b,	// CPU STROB2 back
	output strob2,	// CPU STROB1
	output strob2b,	// CPU STROB1 back
	output ldstate,

	input ek1,	// Enter state K1
	input ek2,	// Enter state K2
	input ep0,	// Enter state P0
	input sp0,	// Set (async) state P0
	input ep1,	// Enter state P1
	input sp1,	// Set (async) state P1
	input ep2,	// Enter state P2
	input ep3,	// Enter state P3
	input ep4,	// Enter state P4
	input ep5,	// Enter state P5
	input ewp,	// Enter state WP
	input ewa,	// Enter state WA
	input ewe,	// Enter state WE
	input ewr,	// Enter state WR
	input ew$,	// Enter state W&
	input ewz,	// Enter state WZ
	input ewx,	// Enter state WX
	input ewm,	// Enter state WM
	input eww,	// Enter state WW
	input si1,	// Set (async) state I1
	output ekc_i,	// EKC*I - Enter state KC (Koniec Cyklu)

	output reg k1,	// state K1
	output reg k2,	// state K2
	output reg p0,	// state P0
	output reg p1,	// state P1
	output reg p2,	// state P2
	output reg p3,	// state P3
	output reg p4,	// state P5
	output reg p5,	// state P5
	output reg wp,	// state WP
	output reg wa,	// state WA
	output reg wz,	// state WZ
	output reg w$,	// state W&
	output reg wr,	// state WR
	output reg we,	// state WE
	output reg ww,	// state WW
	output reg wm,	// state WM
	output reg wx,	// state WX
	output reg i1,	// state I1
	output reg i2,	// state I2
	output reg i3,	// state I3
	output reg i4,	// state I4
	output reg i5,	// state I5

	input stp0,			// B48
	output as2_sum_at,	// A13

	// control panel
	input laduj,		// LOAD
	input mode,			// MODE
	input step,			// STEP
	input stop,			// STOP
	input k2_bin_store,	// BIN | STORE @ K2
	input k2fetch,	// FETCH @ K2

	input przerw_z,	// A61
	input przerw,		// A24

	// instructions
	input lip,			// op: LIP
	input sp,				// op: SP
	input in,				// op: IN
	input ou,				// op: OU
	input mcl,			// op: MCL
	input gi,				// op: GI
	input fi,				// op: FI
	input is,				// op: IS
	input exl,			// op: EXL
	input pufa,			// op: any of the wide or floating point instructions
	output lipsp,		// op: LIP | SP

	input arz,			// AR[0:7]==0
	input lg_0,			// LG==0
	input lg_3,			// LG==3 (Licznik Grupowy)
	input pp,				// A64
	output blw_pw,	// B85
	output zer_sp,	// A73
	input sbar$,		// A53
	input q,				// Q system flag
	input read_fp,	// A39

	// microoperations
	output pn_nb,		// PN -> NB
	output bp_nb,		// BP -> NB
	output bar_nb,	// BAR -> NB
	output barnb,		// A72
	output q_nb,		// Q -> NB
	output w_dt,		// W -> DT
	output dt_w,		// DT -> W
	output ar_ad,		// AR -> AD
	output ic_ad,		// IC -> AD bus
	output arm4,		// AR-4 -> AR

	// interface drivers
	output df,			// "fetch" I/F driver
	output dr,			// "read" I/F driver
	output din,			// "interrupt" I/F driver
	output dw,			// "write" I/F driver
	output ds,			// "send" I/F driver // NOTE: missing on original schematic
	output dmcl,		// software reset I/F driver
	output [0:15] ddt, // DT bus
	output [0:15] dad, // AD bus

	input lrz,			// B78
	output i3_ex_przer,	// A52
	output ck_rz_w,	// B91
	output zerrz,		// B85
	input sr_fp,		// B53
	input srez$,		// B76
	input wzi,			// arithmetic "0" indicator
	input efp,			// B09

	// interface related
	output zg,			// request to use the system bus (ZGłoszenie)
	input zw,				// module allowed to use the system bus (CPU) (ZezWolenie)
	input ren,			// EN received on the interface
	input rok,			// OK received on the interface
	output oken,		// OK | EN on the interface
	output bod,			// PE | EN on the interface
	output ok$,			// other party is done with the reply (with either OK, EN or ALARM)

	input stop_n,		// B55
	input zga,			// B57
	input rpe,			// A82
	input ir6,			// B58
	input ir7,			// A06
	input ir8,			// A04
	input ir9,			// B06
	output hlt_n,		// A94
	output b_parz,	// parity error interrupt source
	output b_p0,		// memory access error interrupt source
	output awaria		// CPU stopped due to a memory access or parity error indicator
);

	parameter AWP_PRESENT;
	parameter STOP_ON_NOMEM;
	parameter LOW_MEM_WRITE_DENY;

	parameter ALARM_DLY_TICKS;
	parameter ALARM_TICKS;

	// CPU state registers

	always @ (posedge clk_sys, posedge clo) begin
		if (clo) begin
			{k1, k2} <= 2'd0;
			{wp, wa, we, wr, w$, wz, wx, wm, ww} <= 9'd0;
			{p0, p1, p2, p3, p4, p5} <= 6'b100000;
			{i1, i2, i3, i4, i5} <= 5'd0;
		end else begin
			if (ldstate) begin
				{k1, k2} <= {ek1, ek2};
				{wp, wa, we, wr, w$, wz, wx, wm, ww} <= {ewp, ewa, ewe, ewr, ew$, ewz, ewx, ewm, eww};
				{p2, p3, p4, p5} <= {ep2, ep3, ep4, ep5};
				{i2, i3, i4, i5} <= {ei2, ei3, ei4, ei5};
			end

			if (sp1) p1 <= 1'b1;
			else if (ldstate) p1 <= ep1;

			if (sp0) p0 <= 1'b1;
			else if (ldstate) p0 <= ep0;

			if (si1) i1 <= 1'b1;
			else if (ldstate) i1 <= ei1;
		end
	end

	// strob triggers

	assign as2_sum_at = wz | p4 | we | w$;
	wire M19_6 = w$ | we | p4 | (k2 & laduj);
	wire M18_8 = p1 | k1 | k2 | i1 | i3;
	wire M20_8 = p5 | wr | ww | wm | i2 | i4 | i5;
	wire M16_8 = wz | (p0 & stp0) | p3 | wa;
	wire M15_8 = p2 | wp | wx;

	strobgen STROBGEN(
		.clk_sys(clk_sys),
		.ok$(ok$),
		.zw(zw),
		.oken(oken),
		.mode(mode),
		.step(step),
		.strob_fp(strob_fp),
		.strobb_fp(strobb_fp),
		.ss11(M19_6),
		.ss12(M18_8),
		.ss13(M20_8),
		.ss14(M16_8),
		.ss15(M15_8),
		.ldstate(ldstate),
		.strob1(strob1),
		.strob1b(strob1b),
		.strob2(strob2),
		.strob2b(strob2b),
		.got(got)
	);

	// interrupt phase control signals

	wire ei1 = (exr | lip) & pp;
	wire ei2 = i1 & przerw_z;
	wire ei3 = (~przerw_z & przerw & i1) | (i1 & exr) | (sp & pp) | (i2) | (i5 & lip) | (~lipsp & ~lg_0 & i3) | (i3 & lipsp & ~lg_3);
	wire ei4 = i3 & lg_0;
	wire ei5 = i4 | (lip & i1);

	assign arm4 = strob2b & i1 & lip;
	assign blw_pw = ~przerw_z & lg_3 & i3 & przerw;
	wire exrprzerw = przerw | exr;
	wire i3lips = i3 & lipsp;
	assign ekc_i = (lg_3 & i3lips) | (i5 & ~lip);
	assign zer_sp = ~lip & i5;
	assign lipsp = lip | sp;

	// ---

	wire M28_8 = wr | p1 | p5 | wm | k2fbs | ww | read_fp;
	wire M30_8 = i3 | read_fp | wm | p5 | ww | k2fbs | (wr & ~inou);

	assign pn_nb = ~(barnb & ~wm) & zwzg;
	assign bp_nb = (barnb & ~wm) & zwzg;
	assign bar_nb = barnb & zwzg;
	assign barnb = (i3 & sp) | (ww & sbar$) | (sbar$ & wr) | (q & M28_8);
	assign q_nb = zwzg & ~i2;
	wire inou = in | ou;
	wire M40_8 = i2 | (in & wm) | k1;
	assign df = M40_8 & zwzg;
	wire M49_3 = (ou & wm) ^ w;
	assign w_dt = M49_3 & zwzg;
	assign dr = r & zwzg;
	wire r = k2fetch | p5 | i4 | i1 | i3lips | wr | p1 | read_fp;
	assign dt_w = M40_8 | r;
	assign ar_ad = M30_8 & zwzg;
	assign ds = ou & wm & zwzg;

	// system bus drivers

	assign ic_ad = zwzg & (k1 | p1 | (inou & wr));
	assign dmcl = zwzg & mcl & wm;
	wire wmgi = wm & gi;
	assign ddt[0] = zwzg & (wmgi & ir6);
	assign ddt[1:14] = 'd0;
	assign ddt[15] = zwzg & wmgi;
	assign din = zwzg & wmgi;
	wire write_deny = LOW_MEM_WRITE_DENY & arz & q & ~exrprzerw;
	assign dw = zwzg & w & ~write_deny;
	wire w = i5 | i3_ex_przer | ww | k2_bin_store;
	assign i3_ex_przer = i3 & exrprzerw;
	wire rw = r ^ w;
	wire k2fbs = k2_bin_store | k2fetch;
	assign ck_rz_w = (wr & fi) | lrz | blw_pw;

	// TODO: is it needed?

	wire __ck_rz_w_dly;
	dly #(.ticks(2'd2)) DLY_ZERZ( // 2 ticks @50MHz = 40ns (~25ns orig.)
		.clk(clk_sys),
		.i(ck_rz_w),
		.o(__ck_rz_w_dly)
	);
	wire __ck_rz_w_dly_ = ~__ck_rz_w_dly;

	assign zerrz = __ck_rz_w_dly_ & ck_rz_w & ~blw_pw;

	// ---

	wire gotst1 = got | strob1b;
	wire zgi_j = wm | i2 | wr | ww | read_fp | i1 | i3 | i4 | i5 | k2fbs | p1 | p5 | k1;
	wire zgi_set = sr_fp | si1 | sp1;
	wire ifhold_j = srez$ & wr;
	wire ifhold_reset = strob2 & w$ & wzi & is;

	wire zwzg, talarm;
	ifctl #(
		.ALARM_DLY_TICKS(ALARM_DLY_TICKS),
		.ALARM_TICKS(ALARM_TICKS)
	) IFCTL(
		.clk_sys(clk_sys),
		.clo(clo),
		.gotst1(gotst1),
		.zgi_j(zgi_j),
		.zgi_set(zgi_set),
		.ifhold_j(ifhold_j),
		.ifhold_reset(ifhold_reset),
		.zw(zw),
		.ren(ren),
		.rok(rok),
		.ok$(ok$),
		.zg(zg),
		.zwzg(zwzg),
		.talarm(talarm)
	);

	assign oken = ren | rok;

	wire ad_ad = zwzg & (i4 & soft_fp);

	wire ef = efp & ~AWP_PRESENT;

	reg soft_fp;
	always @ (posedge clk_sys, posedge clo) begin
		if (clo) soft_fp <= 1'b0;
		else if (ldstate) begin
			case ({ef, i5})
				2'b00: soft_fp <= soft_fp;
				2'b01: soft_fp <= 1'b0;
				2'b10: soft_fp <= 1'b1;
				2'b11: soft_fp <= ~soft_fp;
			endcase
		end
	end

	wire exr = soft_fp | ef | exl;

	// ---

	wire hltn_reset = zwzg & rw;
	wire hltn_d = stop_n & zga & hltn_reset;
	wire hltn_set = awaria_set & STOP_ON_NOMEM;

	always @ (posedge clk_sys, negedge hltn_reset) begin
		if (~hltn_reset) hlt_n <= 1'b0;
		else if (hltn_set) hlt_n <= 1'b1;
		else if (strob1) hlt_n <= hltn_d;
	end

	assign bod = rpe | ren;
	assign b_parz = strob1 & rpe & r;
	assign b_p0 = rw & talarm;

	wire awaria_set = (b_parz | b_p0) & ~bar_nb;
	always @ (posedge clk_sys) begin
		if (clo | stop) awaria <= 1'b0;
		else if (awaria_set) awaria <= 1'b1;
	end

	assign dad[0:8] = 'd0;
	assign dad[9] = zwzg & (i1 | i4 | i5);
	assign dad[10] = zwzg & (i1 | (i4 & exr) | i5);
	assign dad[11] = 'd0;
	assign dad[12] = ad_ad & pufa;
	assign dad[13] = ad_ad & ir7;
	assign dad[14] = ad_ad & ir8;
	assign dad[15] = (ad_ad & ir9) | dad15i;
	wire dad15i = zwzg & (i5 | i1);

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
