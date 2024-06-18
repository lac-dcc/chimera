// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
// written 2018-11-01 by mza
// last updated 2018-11-20 by mza

module mza_test025_b2tt (
	output b_p, b_n,
	output e_p, e_n,
	output m_p, m_n,
	output l_p, l_n,
	input j_p, j_n,
	input clock_p, clock_n,
	input trg_p, trg_n,
	output ack_p, ack_n,
	output rsv_p, rsv_n
);
	wire clock; // 128.205 MHz
	wire trg;
	wire frame;
	wire frame9;
	wire trig_in;
//	wire ack = 0;
//	wire rsv = 0;
//	IBUFDS clocky (.I(clock_p), .IB(clock_n), .O(clock));
//	IBUFDS triggy (.I(trg_p), .IB(trg_n), .O(trg));
//	OBUFDS acky (.I(ack), .O(ack_p), .OB(ack_n));
//	OBUFDS rsvy (.I(rsv), .O(rsv_p), .OB(rsv_n));
	OBUFDS laserblaster1 (.I(trg), .O(b_p), .OB(b_n));
	OBUFDS laserblaster2 (.I(trg), .O(e_p), .OB(e_n));
	OBUFDS trigout (.I(trg), .O(m_p), .OB(m_n));
	IBUFDS trgin (.I(j_p), .IB(j_n), .O(trig_in));
	OBUFDS framingham9 (.I(frame9), .O(l_p), .OB(l_n));
	b2tt myb2tt (
		.clkp(clock_p), .clkn(clock_n),
		.trgp(trg_p), .trgn(trg_n),
		.ackp(ack_p), .ackn(ack_n),
		.rsvp(rsv_p), .rsvn(rsv_n),
		.rawclk(clock),
		.extclk(1'b0), .extclkinv(1'b1), .extclkdbl(1'b0), .extdblinv(1'b1), .extclklck(1'b1),
		.id(16'h1234),
		.usrdat(16'h5678),
		.trgout(trg),
		.frame(frame),
		.frame9(frame9),
		.busysrc(8'b0),
		.feeerr(8'b0),
		.b2plllk(1'b1), .b2linkup(1'b1), .b2linkwe(1'b1), .b2lclk(1'b0),
		.semscan(1'b0), .semdet(1'b0), .semmbe(1'b0), .semcrc(1'b0),
		.fifonext(1'b0),
		.regdbg(8'b0)
	);
endmodule

module mza_test025_b2tt_althea (
	output b_p, b_n,
	output e_p, e_n,
	output m_p, m_n,
	output l_p, l_n,
	input j_p, j_n,
	input d_p, d_n,
	input c_p, c_n,
	output f_p, f_n,
	output g_p, g_n
);
	mza_test025_b2tt myinstance (
		.b_p(b_p), .b_n(b_n),
		.e_p(e_p), .e_n(e_n),
		.m_p(m_p), .m_n(m_n),
		.l_p(l_p), .l_n(l_n),
		.j_p(j_p), .j_n(j_n),
		.clock_p(d_p), .clock_n(d_n),
		.trg_p(c_p), .trg_n(c_n),
		.ack_p(f_p), .ack_n(f_n),
		.rsv_p(g_p), .rsv_n(g_n)
	);
endmodule

