// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// P-D unit (instruction decoder)

module pd(
	input clk_sys,
	input [0:15] w,		// internal W bus
	input strob1,			// STROB1
	input strob1b,		// STROB1 back
	input w_ir,				// W -> IR: send bus W to instruction register IR
	output [0:15] ir,	// IR register
	input si1,				// invalidate IR contents
	// --- Instructions ------------------------------------------------------
	output ls,				// LS
	output rj,				// RJ
	output bs,				// BS
	output ou,				// OU
	output in,				// IN
	output is,				// IS
	output ri,				// RI
	output pufa,			// any of the wide or floating point arithmetic instructions
	output rb$,				// RB
	output cb,				// CB
	output sc$,				// S/C opcode group
	output oc,				// BRC, BLC
	output ka2,				// KA2 opcode group
	output gr,				// G/L opcode group
	output hlt,				// HLT
	output mcl,				// MCL
	output sin,				// SIU, SIL, SIT, CIT
	output gi,				// GIU, GIL
	output lip,				// LIP
	output mb,				// MB
	output im,				// IM
	output ki,				// KI
	output fi,				// FI
	output sp,				// SP
	output rz,				// RZ
	output ib,				// IB
	output lpc,				// LPC
	output rpc,				// RPC
	output shc,				// SHC
	output rc$,				// RIC, RKY
	output ng$,				// NGA, NGC
	output zb$,				// ZLB, ZRB
	output uj,				// UJ
	output lwlwt,			// LWT, LW
	output lj,				// LJ
	output ka1,				// KA1 opcode group
	output exl,				// EXL
	output inou,			// IN, OU
	output sr,				// SRX, SRY, SRZ, SHC (shift right)
	output md,				// MD
	output jkrb,			// JS, IRB, DRB
	output lwrs,			// LWS, RWS
	output lrcb,			// LB, CB, RB (byte-addressing ops)
	output nrf,				// NRF
	// --- Instruction params ------------------------------------------------
	output b0,				// B==0 (opcode field B is 0 - no B-modification)
	output c0,				// C==0 (opcode field C is 0 - instruction argument is stored in the next word)
	output na,				// instruction with a Normal Argument
	output xi,				// instruction is illegal
	output nef,				// instruction is ineffective
	input q,					// Q system flag
	input mc_3,				// MC==3: three consecutive pre-modifications
	input [0:8] r0,		// upper R0 register (CPU flags)
	output _0_v,			// A14
	input p,					// P flag (branch)
	output amb,				// A75
	output apb,				// B65
	output ap1,				// register A plus 1 (for IRB)
	output am1,				// register A minus 1 (for DRB)
	input wls,				// A70
	output bcoc$,			// A89
	output saryt,			// SARYT: ALU operation mode (0 - logic, 1 - arythmetic)
	output sd,				// ALU function select
	output scb,				// ALU function select
	output sca,				// ALU function select
	output sb,				// ALU function select
	output sab,				// ALU function select
	output saa,				// ALU function select
	output aryt,			// A68
	output sbar$,			// B91
	input at15,				// A07
	output ust_z,			// B49
	output ust_v,			// A08
	output ust_mc,		// B80
	output ust_leg,		// B93
	output eat0,			// A13
	output ust_y,			// A53
	output ust_x,			// A47
	output blr,				// A87
	input wpb,				// A58
	input wr,					// A60
	input pp,					// A62
	input ww,					// B60
	input wm,					// A38
	input wp,					// A37
	input wzi,				// "0" indicator (Wskaźnik Zera)
	// --- States ------------------------------------------------------------
	input w$,					// W& state
	input p4,					// P4 state
	input we,					// WE state
	input wx,					// WX state
	input wa,					// WA state
	input wz,					// WZ state
	// --- State transitions -------------------------------------------------
	output ewz,				// Enter WZ
	output ew$,				// Enter W&
	output ewe,				// Enter WE
	output ewa,				// Enter WA
	output ewp,				// Enter WP
	output ewr,				// Enter WR
	output ewm,				// Enter WM
	output eww,				// Enter WW
	output ewx,				// Enter WX
	output ekc_1,			// EKC*1 - Enter cycle end (Koniec Cyklu)
	output ekc_2,			// EKC*2 - Enter cycle end (Koniec Cyklu)
	output lar$,			// B82
	output ssp$,			// B81
	output p16,				// A36
	input lk,					// LK != 0
	output efp,				// A11
	output sar$,			// A05
	output srez$,			// A17
	output axy,				// A46
	output lac				// B43
);

	parameter INOU_USER_ILLEGAL;

	wor __NC; // unconnected signals here, to suppress warnings

	// IR - instruction register

	wire ir_clk = strob1 & w_ir;
	ir REG_IR(
		.clk_sys(clk_sys),
		.d(w),
		.c(ir_clk),
		.invalidate(si1),
		.q(ir)
	);

	assign c0 = (ir[13:15] != 0);
	wire ir13_14 = (ir[13:14] != 0);
	wire ir01 = (ir[0:1] != 0);
	wire b_1 = (ir[10:12] == 1);
	assign b0 = (ir[10:12] == 0);

	// decoder for 2-arg instructions with normal argument (opcodes 020-036 and 040-057)
	// decoder for KA1 instruction group (opcodes 060-067)

	wire lw, tw, rw, pw, bb, bm, bc, bn;
	wire aw, ac, sw, cw, _or, om, nr, nm, er, em, xr, xm, cl, lb;
	wire awt, trb, irb, drb, cwt, lwt, lws, rws, js, c, s, j, l, g, b_n;
	idec1 IDEC1(
		.i(ir[0:5]),
		.o({lw, tw, ls, ri, rw, pw, rj, is, bb, bm, bs, bc, bn, ou, in, pufa, aw, ac, sw, cw, _or, om, nr, nm, er, em, xr, xm, cl, lb, rb$, cb, awt, trb, irb, drb, cwt, lwt, lws, rws, js, ka2, c, s, j, l, g, b_n})
	);

	assign sc$ = s | c;
	assign oc = ka2 & ~ir[7];
	assign gr = l | g;

	// opcode field A register number decoder
	wire [0:7] a_eq;
	decoder8 DEC_A_EQ(
		.i(ir[7:9]),
		.ena(1'b1),
		.o({a_eq})
	);

	// S opcode group decoder
	decoder8 DEC_S(
		.i(ir[7:9]),
		.ena(s),
		.o({hlt, mcl, sin, gi, lip, __NC, __NC, __NC})
	);

	// B/N opcode group decoder
	decoder8 DEC_BN(
		.i(ir[7:9]),
		.ena(b_n),
		.o({mb, im, ki, fi, sp, md, rz, ib})
	);

	wire ngl, srz;
	decoder8 DEC_D(
		.i({b_1, ir[15], ir[6]}),
		.ena(c),
		.o({__NC, __NC, __NC, __NC, ngl, srz, rpc, lpc})
	);
	assign shc = c & ir[11];

	wire c_b0 = c & b0;

	// C opcode group decoder
	wire sx, sz, sly, slx, srxy;
	decoder8 DEC_OTHER(
		.i(ir[13:15]),
		.ena(c_b0),
		.o({rc$, zb$, sx, ng$, sz, sly, slx, srxy})
	);

	// --- Ineffective, illegal instr. ---------------------------------------

	wire snef = (a_eq[5:7] != 0);
	wire M85_11 = ir[10] | (ir[11] & ir[12]);
	wire xi_1 = (INOU_USER_ILLEGAL & inou & q) | (M85_11 & c) | (q & s) | (q & ~snef & b_n);
	wire xi_2 = (md & mc_3) | (c & ir13_14 & b_1) | (snef & s);

	wire nef_jcs = a_eq[7] & ~r0[3];
	wire nef_jys = a_eq[6] & ~r0[7];
	wire nef_jxs = a_eq[5] & ~r0[8];
	wire nef_jvs = a_eq[4] & ~r0[2];
	wire nef_js = js & (nef_jcs | nef_jys | nef_jxs | nef_jvs);

	wire nef_jg = a_eq[3] & ~r0[6];
	wire nef_je = a_eq[2] & ~r0[5];
	wire nef_jl = a_eq[1] & ~r0[4];
	wire nef_jjs = (j | js) & (nef_jg | nef_je | nef_jl);

	wire nef_jn = j & a_eq[6] & r0[5];
	wire nef_jm = j & a_eq[5] & ~r0[1];
	wire nef_jz = j & a_eq[4] & ~r0[0];

	assign xi = ~ir01 | xi_1 | xi_2;
	assign nef = xi | p | nef_js | nef_jjs | nef_jm | nef_jn | nef_jz;

	// --- Instruction groups ------------------------------------------------

	wire cns = ccb | ng$ | sw;
	wire a = aw | ac | awt;
	assign lwrs = lws | rws;
	wire ans = sw | ng$ | a;
	wire riirb = ri | irb;
	wire krb = irb | drb;
	assign jkrb = js | krb;
	wire nglbb = ngl | bb;
	assign bcoc$ = bc | oc;
	wire wlsbs = wls | bs;
	wire emnm = em | nm;
	wire orxr = _or | xr;
	wire lbcb = lb | cb;
	assign lrcb = lbcb | rb$;
	wire mis = m | is;
	assign aryt = cw | cwt;
	wire c$ = cw | cwt | cl;
	wire ccb = c$ | cb;
	assign inou = in | ou;
	wire rbib = rb$ | ib;
	wire bmib = bm | ib;
	assign sr = srxy | srz | shc;
	wire lrcbsr = lrcb | sr;
	wire gmio = mcl | gi | inou;
	wire hsm = hlt | sin | md;
	wire sl = slx | sz | sly;
	wire pcrs = rpc | lpc | rc$ | sx;
	wire fimb = fi | im | mb;

	// --- ALU control signals -----------------------------------------------

	wire uka = ka1 & ir[6];
	wire M90_8 = sl | ri | krb;
	assign saryt = (we & M49_6) | (p4) | (w$ & M90_8) | ((cns ^ M90_12) & w$);
	wire M90_12 = a | trb | ib;
	wire M49_6 = lwrs | lj | js | krb;
	assign apb = (~uka & p4) | (M90_12 & w$) | (M49_6 & we);
	assign amb = (uka & p4) | (cns & w$);

	wire M84_8 = riirb ^ nglbb;
	wire M67_8 = bm | is | er | xr;
	wire sds = (wz & (xm | em)) | (M67_8 & w$) | (w$ & M84_8) | (we & wlsbs);
	wire ssb = w$ & (ngl | oc | bc);

	assign sd = sds | amb;
	assign sb = apb | ssb | sl | ap1;

	wire M93_12 = sl | ls | orxr;
	wire M50_8 = (M93_12 & w$) | (w$ & nglbb) | (wlsbs & we) | (wz & ~nm & (mis | lrcb));
	wire ssab = rb$ & w$ & wpb;
	wire ssaa = (rb$ & w$ & ~wpb) | (w$ & lb);
	wire ssca = (M84_8 & w$) | (w$ & (bs | bn | nr)) | (wz & (emnm | lrcb)) | (we & ls);

	assign sca = ssca | apb | ssaa;
	assign scb = ssca | apb | ssab;
	assign saa = ssaa | amb | ap1 | M50_8;
	assign sab = ssab | amb | ap1 | M50_8;

	assign sbar$ = lrcb | mis | (gr & ir[7]) | bm | pw | tw;
	assign nrf = ir[7] & ka2 & ir[6];
	wire fppn = pufa ^ nrf;

	assign _0_v = js & a_eq[4] & we;
	assign ap1 = riirb & w$;
	assign am1 = drb & w$;

	// R0 flags control signals

	wire nor$ = ngl | er | nr | orxr;
	assign ust_z = (nor$ & w$) | (w$ & ans) | (m & wz);
	wire m = xm | om | emnm;
	assign ust_v = (ans ^ (ir[6] & sl)) & w$;
	assign ust_mc = ans & w$;
	assign ust_leg = ccb & w$;
	wire M59_8 = (ir[6] & r0[8]) | (~ir[6] & r0[7]);
	assign eat0 = (srxy & M59_8) | (shc & at15); // | was ^, but there is no need for ^
	assign ust_y = (w$ & sl) | (sr & ~shc & wx);
	assign ust_x = wa & sx;
	assign blr = w$ & oc & ~ir[6];

	// execution phase control signals

	wire ngrij = ng$ | ri | rj;
	wire prawy = lbcb & wpb;
	assign lwlwt = lwt | lw;
	assign uj = j & ~a_eq[7]; // Note: jump conditions are checked during ineffective instruction tests, so everything becomes "UJ"
	assign lj = j & a_eq[7];
	assign ewa = (pcrs & pp) | (ngrij & pp) | (we & ~wls & ls) | (~wpb & lbcb & wr);
	assign ewp = (lrcb & wx) | (wx & sr & ~lk) | (rj & wa) | (pp & (uj | lwlwt));
	assign ewe = (lj & ww) | (ls & wa) | (pp & (llb | zb$ | js)) | (~wzi & krb & w$);

	// execution phase control signals
	// instruction cycle end signal

	wire grlk = gr & lk;

	wire M59_6 = rbib | (~wzi & (krb | is));
	assign ekc_1 = (~lac & wr & ~grlk & ~lrcb) | (~lrcb & wp) | (~llb & we) | (~M59_6 & w$);
	assign ewz = (w$ & ~wzi & is) | (wr & m) | (pp & lrcbsr);
	wire M88_6 = is | rb$ | bmib | prawy;
	assign ew$ = (wr & M88_6) | (we & wlsbs) | (ri & ww) | ((ng$ | lbcb) & wa) | (pp & sew$);

	// control signals

	assign lar$ = lb | ri | ans | trb | ls | sl | nor$ | krb;
	wire M92_12 = bc | bn | bb | trb | oc;
	assign ssp$ = is | bmib | M92_12 | bs;
	wire sew$ = M92_12 | krb | nor$ | sl | sw | a | c$;
	wire llb = bs | ls | lwrs;
	assign ka1 = js | (ir[0:2] == 3'b110);
	assign na = ~ka1 & ~ka2 & ~sc$ & ir01;
	assign exl = ka2 & (ir[6:7] == 2'b01);

	wire M63_3 = ng$ & ir[6];
	wire M31_6 = ((ac | M63_3) & w$ & r0[3]) | (r0[7] & sly) | (uka & p4) | (lj & we);
	assign p16 = (~M63_3 & w$ & cns) | (riirb & w$) | (ib & w$) | (slx & r0[8]) | M31_6;

	// execution phase control signals

	wire M60_8 = ~lk & inou;
	wire M76_3 = l ^ M60_8;
	assign ewr = (wp & lrcb) | (lk & wr & l) | (lws & we) | (M76_3 & wx) | M20_9 | M20_10;
	wire M20_9 = M60_8 & wm;
	wire M20_10 = (fimb | lac | tw) & pp;
	assign ewm = gmio & pp;
	assign efp = fppn & pp;
	assign sar$ = l | lws | tw;
	wire M75_6 = pw | rw | lj | rz | ki;
	assign eww = (we & rws) | (pp & M75_6) | (ri & wa) | (lk & ww & g) | (wx & g) | (mis & wz) | (rbib & w$);
	assign srez$ = rbib | mis; // it was ^ instead of |, but there is no need for ^

	// execution phase control signal
	// instruction cycle end signal

	assign ewx = (lrcbsr & wz) | (pp & (gr ^ hsm)) | ((inou & lk) & wm) | (lk & (inou | sr) & wx);
	assign axy = sr | (ir[6] & rbib);
	assign ekc_2 = (wx & hsm) | (wm & ~inou) | (~grlk & ~lj & ~ri & ww) | (pcrs & wa);
	assign lac = bmib | mis;

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
