// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

module drv_cp_in(
	input ready,
	input cpd,
	input cpr,
	input cpf,
	input [0:7] a1,
	input [0:15] a3,
	output [0:3] rotary_out,
	output rotary_trig,
	output [0:15] keys,
	output keys_trig,
	output [0:3] fn,
	output fn_v,
	output fn_trig
);

	assign keys = a3;
	assign rotary_out = a1[4:7];
	assign fn = a1[4:7];
	assign fn_v = a1[3];

	assign fn_trig = ready & cpf;
	assign rotary_trig = ready & cpr;
	assign keys_trig = ready & cpd;

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
