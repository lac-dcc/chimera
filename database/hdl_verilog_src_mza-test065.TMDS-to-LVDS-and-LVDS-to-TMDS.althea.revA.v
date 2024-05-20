// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2024-02-07 by mza
// based on mza-test064.TMDS-to-LVDS.althea.revA.v
// last updated 2024-02-07 by mza

`define althea_revA

module top (
	 input b_p, b_n, // d2 trig_top
	output a_p, a_n, // d1 dat_a_t2f
	output c_p, c_n, // d0 dat_b_m2f
	 input d_p, d_n, // ck sstclk
	 input f_p, f_n, // heac
	input e_p,
	inout e_n,
	output lemo,
	output k_p,
	inout k_n,
	output m_p, m_n, // heac
	output l_p, l_n, // ck sstclk
	 input j_p, j_n, // d0 dat_b_m2f
	 input g_p, g_n, // d1 dat_a_t2f
	output h_p, h_n, // d2 trig_top
	output [7:0] led
);
	begin
		wire d0, d1, d2, ck, heac, sda, scl;
		IBUFDS ibuf_d2   (.I(b_p), .IB(b_n), .O(d2)); // trig_top
		OBUFDS ibuf_d1   (.O(a_p), .OB(a_n), .I(d1)); // dat_a_t2f
		OBUFDS ibuf_d0   (.O(c_p), .OB(c_n), .I(d0)); // dat_b_m2f
		IBUFDS ibuf_ck   (.I(d_p), .IB(d_n), .O(ck)); // sstclk
		IBUFDS ibuf_heac (.I(f_p), .IB(f_n), .O(heac));
		assign sda = e_n;
		assign scl = e_p;
		assign k_p = scl;
		assign k_n = sda;
		OBUFDS obuf_heac (.I(heac), .O(m_p), .OB(m_n));
		OBUFDS obuf_ck   (.I(ck),   .O(l_p), .OB(l_n)); // sstclk
		IBUFDS obuf_d0   (.O(d0),   .I(j_p), .IB(j_n)); // dat_b_m2f
		IBUFDS obuf_d1   (.O(d1),   .I(g_p), .IB(g_n)); // dat_a_t2f
		OBUFDS obuf_d2   (.I(d2),   .O(h_p), .OB(h_n)); // trig_top
		assign lemo = ~d1; // dat_a_t2f
		assign led = 0;
	end
endmodule

module myalthea (
	input clock50_p, clock50_n,
	output lemo,
	 input b_p, b_n, // d2 trig_top  TMDS_33
	output a_p, a_n, // d1 dat_a_t2f TMDS_33
	output c_p, c_n, // d0 dat_b_m2f TMDS_33
	 input d_p, d_n, // ck sstclk    TMDS_33
	 input f_p, f_n, // heac
	input e_p,
	inout e_n,
	output k_p,
	inout k_n,
	output m_p, m_n, // heac
	output l_p, l_n, // ck sstclk    LVDS_33
	 input j_p, j_n, // d0 dat_b_m2f LVDS_33
	 input g_p, g_n, // d1 dat_a_t2f LVDS_33
	output h_p, h_n, // d2 trig_top  LVDS_33
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

