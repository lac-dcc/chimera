// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

module expadd(
	input [0:7] b,
	input [-1:7] d,
	input pc8,
	input fcb,
	input scc,
	input b0,
	output abs_sum_c_ge_40,
	output [-2:7] sum_c
);

	wire sum_c_1_tmp;
	assign {sum_c_1_tmp, sum_c[0:7]} = b + d[0:7] + pc8;

	wire M9_3 = fcb ^ scc;
	wire M3_6 = ~((b0 & M9_3) | (~b0 & ~scc));
	wire M27_8 = M3_6 ^ ~d[-1];
	assign sum_c[-2] = ~((sum_c_1_tmp & M3_6) | (sum_c_1_tmp & ~d[-1]) | (M3_6 & ~d[-1]));
	assign sum_c[-1] = sum_c_1_tmp ^ M27_8;

	// --- |sum_c| >= 40 ----------------------------------------------------

	wire signed [0:8] v = sum_c[-1:7];
	assign abs_sum_c_ge_40 = (v >= 40) || (v <= -40);

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
