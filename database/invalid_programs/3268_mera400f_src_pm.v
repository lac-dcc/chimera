// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// P-M unit (microinstructions)

module pm(
	input clk_sys,
	input start,
	input pon,
	input work,
	input hlt_n,
	input stop,
	input clo,
	input hlt,
	input cycle,
	input irq,
	output _wait,
	output run,
	input ekc_1,
	input ekc_i,
	input ekc_2,
	input got,
	input ekc_fp,
	input clm,
	input strob1,
	input strob1b,
	input strob2,
	input strob2b,
	input ldstate,
	output sp0,
	output przerw,
	output si1,
	output sp1,
	input k2,
	input panel_store,
	input panel_fetch,
	input panel_load,
	input panel_bin,
	input rdt9,
	input rdt11,
	input k1,
	output laduj,
	output k2_bin_store,
	output k2fetch,
	output w_rbc,
	output w_rba,
	output w_rbb,
	input p0,
	output ep0,
	output stp0,
	output ek2,
	output ek1,
	input j$,
	input bcoc$,
	input zs,
	input p2,
	input ssp$,
	input sc$,
	input md,
	input xi,
	output p,
	output mc_3,
	output mc_0,
	output xi$,
	input p4,
	input b0,
	input na,
	input c0,
	input ka2,
	input ka1,
	input p3,
	input p1,
	input nef,
	input p5,
	input i2,
	output pp,
	output ep5,
	output ep4,
	output ep3,
	output ep1,
	output ep2,
	output icp1,
	input exl,
	input lipsp,
	input gr,
	input wx,
	input shc,
	input read_fp,
	input ir7,
	input inou,
	input rok,
	output arp1,
	output lg_3,
	output lg_0,
	input rsc,
	input ir10,
	input lpb,
	input ir11,
	input rsb,
	input ir12,
	input rsa,
	input lpa,
	input rlp_fp,
	output rc,
	output rb,
	output ra,
	input bod,
	input ir15,
	input ir14,
	input ir13,
	input ir9,
	input ir8,
	output lk,
	input rj,
	input uj,
	input lwlwt,
	input sr,
	input lac,
	input lrcb,
	input rpc,
	input rc$,
	input ng$,
	input ls,
	input oc,
	input wa,
	input wm,
	input wz,
	input ww,
	input wr,
	input wp,
	output wls,
	input ri,
	input war,
	input wre,
	input i3,
	input s_fp,
	input sar$,
	input lar$,
	input in,
	input bs,
	input zb$,
	output w_r,
	input wic,
	input i4,
	input wac,
	input i1,
	output w_ic,
	output w_ac,
	output w_ar,
	input wrz,
	input wrs,
	input mb,
	input im,
	input lj,
	input lwrs,
	input jkrb,
	output lrz,
	output w_bar,
	output w_rm,
	input we,
	input ib,
	input ir6,
	input cb,
	input i5,
	input rb$,
	input w$,
	input i3_ex_przer,
	output baa,
	output bab,
	output bac,
	output aa,
	output ab,
	input at15,
	input srez$,
	input rz,
	input wir,
	input blw_pw,
	output wpb, // WPB - Wskaźnik Prawego Bajtu
	output bwb,
	output bwa,
	output kia,
	output kib,
	output w_ir,
	input ki,
	input dt_w,
	input f13,
	input wkb,
	output mwa,
	output mwb,
	output mwc
);

	// START, WAIT, CYCLE

	wire start_reset = hlt_n | stop | clo;
	wire start_clk = pon & work;
	reg startq;
	always @ (posedge clk_sys, posedge start_reset) begin
		if (start_reset) startq <= 1'b0;
		else if (start_clk | start) startq <= 1'b1;
	end

	wire wait_reset = start_reset | si1;
	always @ (posedge clk_sys, posedge wait_reset) begin
		if (wait_reset) _wait <= 1'b0;
		else if (wx) _wait <= hlt;
	end

	reg __cycle_q;
	always @ (posedge clk_sys, posedge cycle) begin
		if (cycle) __cycle_q <= 1'b1;
		else if (rescyc) __cycle_q <= 1'b0;
	end

	assign run = startq & ~_wait;
	wire stpc = dpr | dprzerw;

	wire ekc = ekc_1 | ekc_i | ekc_2 | p2 | p0stpc;
	wire kc_reset = clo | pc;
	wire rescyc = clm | strob2 | si1;
	wire dpr = run | __cycle_q;
	wire dprzerw = (__cycle_q | startq) & irq & ~p & mc_0;

	// PR (pobranie rozkazu - instruction fetch)
	// PP (przyjęcie przerwania - interrupt receive)
	// KC (koniec cyklu - cycle end)
	// PC (początek cyklu - cycle start)

	wire kc, pc;
	wire pr;
	kcpc KCPC(
		.clk_sys(clk_sys),
		.kc_reset(kc_reset),
		.ekc(ekc),
		.ekc_fp(ekc_fp),
		.ldstate(ldstate),
		.rescyc(rescyc),
		.dpr(dpr),
		.clm(clm),
		.dprzerw(dprzerw),
		.przerw(przerw),
		.pr(pr),
		.kc(kc),
		.pc(pc)
	);

	assign sp0 = ~pr & ~przerw & pc;
	assign si1 = pc & przerw;
	assign sp1 = ~przerw & pr & pc;
	wire zerstan = kc | clm | p0;

	// FETCH, STORE, LOAD, BIN (bootstrap)

	wire st2k2 = strob2 & k2;

	wire bin, load;
	reg fetch;
	wire store;

	always @ (posedge clk_sys, posedge panel_store) begin
		if (panel_store) store <= 1'b1;
		else if (clm | st2k2) store <= 1'b0;
	end

	always @ (posedge clk_sys, posedge panel_fetch) begin
		if (panel_fetch) fetch <= 1'b1;
		else if (clm | st2k2) fetch <= 1'b0;
	end

	always @ (posedge clk_sys, posedge panel_load) begin
		if (panel_load) load <= 1'b1;
		else if (clm | st2k2) load <= 1'b0;
	end

	wire bin_d = ~(rdt9 & rdt11 & lg_0);
	wire s1k1 = strob1 & k1;
	always @ (posedge clk_sys, posedge panel_bin) begin
		if (panel_bin) bin <= 1'b1;
		else if (clm) bin <= 1'b0;
		else if (s1k1) bin <= bin_d;
	end

	assign laduj = load;
	wire sfl = store | fetch | load;
	wire ur = k2 & (load | fetch);
	wire ar_1 = k2 & ~load;
	wire k2store = k2 & store;
	assign k2_bin_store = k2 & (store | bin);
	assign k2fetch = k2 & fetch;

	wire k1s1 = k1 & strob1;
	assign w_rbc = k1s1 & lg_0;
	assign w_rba = k1s1 & lg_2;
	assign w_rbb = k1s1 & lg_1;

	// control panel state transitions
	// transition to P0 state

	wire psr = p0 | k2store;
	wire p0stpc = p0 & stpc;
	wire p0_k2 = p0 | k2;
	assign ep0 = (k2 | k1) & ~bin;
	assign stp0 = bin | stpc | sfl;
	assign ek2 = (p0 & sfl) | (bin & lg_3 & k1);
	assign ek1 = (p0_k2 & bin) | (k1 & bin & ~lg_3);
	wire lg_plus_1 = (bin & k2) | (k1 & rdt9);

	// P - wskaźnik przeskoku (branch indicator)
	always @ (posedge clk_sys, posedge clm) begin
		if (clm) p <= 1'b0;
		else if (strob1) begin
			if (rok & ~inou & wm) p <= 1'b1;
			else if (p2) p <= 1'b0;
			else if (ssp$ & w$) p <= p_d;
		end
	end

	wire p_d = (~j$ & bcoc$) | zs;
	wire p_set = (p2 & strob1) | clm;

	wire setwp = strob1 & wx & md;
	wire reswp = p_set | (sc$ & strob2 & p1);
	wire reset_mc = reswp | (~md & p4);

	// MC - premodification counter
	mc MC(
		.clk_sys(clk_sys),
		.inc(setwp),
		.reset(reset_mc),
		.mc_3(mc_3),
		.mc_0(mc_0)
	);

	assign xi$ = ~p & p1 & strob2 & xi;
	wire wm_d = pr & ~c0 & na;

	// WMI - wskaźnik rozkazu dwusłowowego (2-word instruction indicator)

	// TODO: moved from strob2 to strob1b
	// trzeba pewnie będzie ostatecznie wrócić do strob2 jakoś
	reg wm_q;
	always @ (posedge clk_sys) begin
		if (strob1b) begin
			if (~p & p1 & xi) wm_q <= 1'b0;
			else wm_q <= wm_d;
		end
	end

	wire wb_j = pr & ~b0 & na;
	wire wb_k = (p4 & ~wpp) | p2;

	// WBI - wskaźnik B-modyfikacji (B-modification indicator)

	reg wb;
	always @ (posedge clk_sys, posedge zerstan) begin
		if (zerstan) wb <= 1'b0;
		else if (strob1b) begin
			case ({wb_j, wb_k})
				2'b00: wb <= wb;
				2'b01: wb <= 1'b0;
				2'b10: wb <= 1'b1;
				2'b11: wb <= ~wb;
			endcase
		end
	end

	// WPI - wskaźnik premodyfikacji (premodification indicator)

	reg wpp;
	always @ (posedge clk_sys, posedge reswp) begin
		if (reswp) wpp <= 1'b0;
		else if (strob1b) begin
			if (wx & md) wpp <= 1'b1; // wire setwp = strob1 & wx & md;
			else if (p4) wpp <= 1'b0;
		end
	end

	wire p4wp = p4 & wpp;
	// Wskaźnik Premodyfikacji lub B-modyfikacji (było: wpb)
	wire wpbmod = wb | wpp;
	wire bla = p4 & ka1ir6 & ~wpp;
	wire nair6 = na & ir6;
	wire ka12x = (na & c0) | ka2 | ka1;
	wire ka1ir6 = ka1 & ir6;

	// interrupt loop state transition signals

	wire p3_p4 = p3 | p4;
	wire p5_p4 = p5 | p4;
	wire p1ef = p1 & ~nef;
	wire p3ka1ir6 = p3 & ka1ir6;
	wire wm_ka12x = wm_q | ka12x;
	wire nair6_wpbmod = nair6 | wpbmod;

	assign pp = p5 | (p3_p4 & ~nair6_wpbmod & ~p3ka1ir6) | (p1ef & ~nair6_wpbmod & ~wm_ka12x);
	assign ep1 = p1ef & wm_q;
	assign ep2 = p1 & nef;
	assign ep3 = p1ef & ka12x;
	assign ep4 = p3ka1ir6 | (p3_p4 & wpbmod) | (~wm_ka12x & p1ef & wpbmod);
	assign ep5 = (p3_p4 & nair6 & ~wpbmod) | (nair6 & ~wm_ka12x & p1ef & ~wpbmod);

	wire load_ac = p5_p4 | p1 | p3 | i2;
	assign icp1 = (wm_q & p2) | p1 | ic_1;

	wire lolk = slg2 | (strob2 & p1 & shc) | (strob1 & wm & inou);

	wire downlk = strob1 & (wrwwgr | ((shc | inou) & wx));
	wire wrwwgr = gr & wrww;

	// group counter (licznik grupowy)

	assign arp1 = ar_1 | read_fp | i3 | wrwwgr;

	// LG+1
	wire lg_p1 = strob1b & (i3 | wrwwgr | lg_plus_1);
	// LG reset
	wire lg_reset = zerstan | i1;

	// LG load
	wire slg1 = strob2 & ~gr & p1 & ~exl & ~lipsp; // "common" preload at P1
	wire slg2 = strob1 & gr & wx; // preload for register group operations (at WX)

	wire lg_2, lg_1;
	wire lga, lgb, lgc;
	lg LG(
		.clk_sys(clk_sys),
		.cu(lg_p1),
		.reset(lg_reset),
		.gr(gr),
		.slg1(slg1),
		.slg2(slg2),
		.ir({ir7, ir8, ir9}),
		.lg_0(lg_0),
		.lg_1(lg_1),
		.lg_2(lg_2),
		.lg_3(lg_3),
		.lga(lga),
		.lgb(lgb),
		.lgc(lgc)
	);

	wire ic_1 = wx & inou;
	wire okinou = inou & rok;

	// general register selectors

	assign rc = _7_rkod | (p3 & ir13) | (p4 & ir10) | (p0_k2 & rsc) | (rlp_fp & 1'b0) | (w & lgc);
	assign rb = _7_rkod | (p3 & ir14) | (p4 & ir11) | (p0_k2 & rsb) | (rlp_fp & lpb)  | (w & lgb);
	assign ra = _7_rkod | (p3 & ir15) | (p4 & ir12) | (p0_k2 & rsa) | (rlp_fp & lpa)  | (w & lga);

	// step counter (licznik kroków)

	wire [0:3] lk_in;

	assign lk_in[3] = (shc & ir15) | (gr & (ir9 | ir8)) | (inou & bod);
	assign lk_in[2] = (shc & ir14) | (gr) | okinou;
	assign lk_in[1] = (shc & ir13) | (gr & (~ir9 & ir8));
	assign lk_in[0] = (shc & ir6);

	lk CNT_LK(
		.clk_sys(clk_sys),
		.cd(downlk),
		.i(lk_in),
		.l(lolk),
		.r(zerstan),
		.lk(lk)
	);
	
	wire ruj = rj | uj;
	wire pac = rj | uj | lwlwt;
	wire lwtsr = lwlwt | sr;
	wire lrcblac = lac | lrcb;
	wire pat = lrcb | sr;
	wire rjcpc = rj | rpc | rc$;
	wire lrcbngls$ = lrcb | ng$ | ls;

	wire M95_10 = ~w$ & ls;
	always @ (posedge clk_sys, negedge M95_10) begin
		if (~M95_10) wls <= 1'b0;
		else if (wa & strob1) wls <= 1'b1;
	end

	wire M24_8 = ~oc & ~bs & w$;
	wire M36_3 = ~ls & we;
	wire w = wa | M24_8 | M36_3 | wm | wz | ww | wr | wp;
	wire wrww = wr | ww;

	// W bus to Rx microoperation

	wire warx = (p1 & ~wpp) | (~wpp & p3) | (ri & wa) | (war & ur);
	wire w_r_1 = (ur & wre) | (lipsp & lg_1 & i3) | (lwtsr & wp) | (wa & rjcpc);
	wire w_r_2 = (wr & sar$) | (zb$ & we) | (lar$ & w$) | (wm & in & rok);
	assign w_r = w_r_1 | s_fp | w_r_2;
	wire _7_rkod = (w$ & bs) | (ls & we);

	// W bus to IC, AC, AR microoperations

	wire bs_wls = bs | wls;
	wire wrinou = inou & wr;
	assign w_ic = (lg_0 & lipsp & i3) | (ljkrb & we) | (wp & ruj) | (ur & wic) | wrinou | i4;
	assign w_ac = (bs_wls & we) | (ur & wac) | (wa & lrcbngls$) | (wr & lrcblac) | load_ac;
	assign w_ar = (~wls & ls & we) | (we & lwrs) | (wp & lrcb) | warx | i1 | p5_p4;

	// W bus to block number (NB) and interrupt mask (RM)

	assign lrz = ur & wrz;
	wire wrsz = wrz ^ wrs;
	assign w_bar = (wrs & ur) | (mb & wr) | (i3 & lipsp & lg_2);
	assign w_rm = (wrs & ur) | (wr & im) | (lg_2 & lipsp & i3);
	wire abx = (psr & wic) | (wa & rj) | (we & (lwrs | jkrb)) | (lj & ww);
	wire ljkrb = lj | jkrb;

	// A bus control signals

	wire ib_ng = ib | ng$;
	wire cb_oc = cb | oc;
	wire M9_6 = (zb$ & ir6) ^ lj;
	wire M9_3 = (zb$ & ~ir6) ^ lj;
	wire M67_8 = (we & M9_6) | (w$ & ib_ng);
	wire M72_8 = (ib_ng & w$) | (cb_oc & w$) | (we & M9_3) | (~na & p3);
	wire M71_8 = (w$ & ls) | (psr & war);
	wire M89_4 = ~wpb & rb$;
	wire M71_6 = (~na & p3) | (w$ & M89_4);
	wire M10_4 = ~ir6 & rc$;
	wire M55_8 = (M10_4 & wa) | (lg_0 & i3_ex_przer);

	assign baa = bla | M67_8;
	assign bab = bla | M67_8 | (ka1 & p3);
	assign bac = bla | M72_8;
	assign aa = M71_6 | i5 | p4wp | M71_8;
	assign ab = M71_6 | M55_8 | abx;

	// left/right byte selection signals

	wire str1wx = strob1b & wx;

	reg WPB;
	assign wpb = WPB;
	always @ (posedge clk_sys, negedge lrcb) begin
		if (~lrcb) WPB <= 1'b0;
		else if (str1wx) WPB <= at15;
	end

	assign w_ir = (wir & ur) | pr;

	// KI bus control signals

	assign kia = f13 | (psr & wrs) | i3_ex_przer;
	assign kib = f13 | bin;

	// W bus control signals

	wire bw = blw_pw | (ww & rz);
	assign bwa = bw;
	assign bwb = bw | (cb & wpb & wr);

	wire wirpsr = wir & psr;
	wire mwax = (i3_ex_przer & lg_3) | (wp & pac) | (ri & ww) | (wac & psr);
	wire mwbx = (pat & wp) | (srez$ & ww);
	wire M56_8 = (wrsz & psr) | (i3_ex_przer & lg_2) | (bin & k2) | (ww & ki);
	wire M73_8 = (k2 & load) | (psr & wkb) | (ir6 & wa & rc$);
	assign mwa = wirpsr | mwax | M56_8 | f13 | dt_w;
	assign mwb = wirpsr | mwbx | M56_8 | f13 | we | w$ | p4 | M73_8;
	assign mwc = wirpsr | dt_w | M73_8 | (wa & lrcb);

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
