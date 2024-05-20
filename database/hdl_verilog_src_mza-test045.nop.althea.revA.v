// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2020-06-20 by mza
// last updated 2022-09-23 by mza

// NCD was not produced. All logic was removed from the design. This is usually due to having no input or output PAD connections in the design and no nets or symbols marked as 'SAVE'

`define althea_revA

module top ();
endmodule

module myalthea (
	input clock50_p, clock50_n,
	input lemo,
	input a_p, a_n,
	input b_p, b_n,
	input c_p, c_n,
	input d_p, d_n,
	input e_p, e_n,
	input f_p, f_n,
	input g_p, g_n,
	input h_p, h_n,
	input j_p, j_n,
	input k_p, k_n,
	input l_p, l_n,
	input m_p, m_n,
	input led_0, led_1, led_2, led_3, led_4, led_5, led_6, led_7
);
	top althea ();
endmodule

