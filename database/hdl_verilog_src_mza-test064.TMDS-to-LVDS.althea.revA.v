// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2024-01-19 by mza
// last updated 2024-01-19 by mza

`define althea_revA

module top (
	input b_p, b_n,
	input a_p, a_n,
	input c_p, c_n,
	input d_p, d_n,
	input f_p, f_n,
	input e_p,
	inout e_n,
	output lemo,
	output k_p,
	inout k_n,
	output m_p, m_n,
	output l_p, l_n,
	output j_p, j_n,
	output g_p, g_n,
	output h_p, h_n,
	output [7:0] led
);
	begin
		wire d0, d1, d2, ck, heac, sda, scl;
		IBUFDS ibuf_d2   (.I(b_p), .IB(b_n), .O(d2));
		IBUFDS ibuf_d1   (.I(a_p), .IB(a_n), .O(d1));
		IBUFDS ibuf_d0   (.I(c_p), .IB(c_n), .O(d0));
		IBUFDS ibuf_ck   (.I(d_p), .IB(d_n), .O(ck));
		IBUFDS ibuf_heac (.I(f_p), .IB(f_n), .O(heac));
		assign sda = e_n;
		assign scl = e_p;
		assign k_p = scl;
		assign k_n = sda;
		OBUFDS obuf_heac (.I(heac), .O(m_p), .OB(m_n));
		OBUFDS obuf_ck   (.I(ck),   .O(l_p), .OB(l_n));
		OBUFDS obuf_d0   (.I(d0),   .O(j_p), .OB(j_n));
		OBUFDS obuf_d1   (.I(d1),   .O(g_p), .OB(g_n));
		OBUFDS obuf_d2   (.I(d2),   .O(h_p), .OB(h_n));
		assign lemo = ck;
		assign led = 0;
	end
endmodule

module myalthea (
	input clock50_p, clock50_n,
	output lemo,
	input b_p, b_n,
	input a_p, a_n,
	input c_p, c_n,
	input d_p, d_n,
	input f_p, f_n,
	input e_p,
	inout e_n,
	output k_p,
	inout k_n,
	output m_p, m_n,
	output l_p, l_n,
	output j_p, j_n,
	output g_p, g_n,
	output h_p, h_n,
	output [7:0] led
);
	top althea (
		.a_p(a_p), .a_n(a_n), .b_p(b_p), .b_n(b_n),
		.c_p(c_p), .c_n(c_n), .d_p(d_p), .d_n(d_n),
		.e_p(e_p), .e_n(e_n), .f_p(f_p), .f_n(f_n),
		.g_p(g_p), .g_n(g_n), .h_p(h_p), .h_n(h_n),
		.j_p(j_p), .j_n(j_n), .k_p(k_p), .k_n(k_n),
		.l_p(l_p), .l_n(l_n), .m_p(m_p), .m_n(m_n),
		.lemo(lemo), .led(led));
endmodule

