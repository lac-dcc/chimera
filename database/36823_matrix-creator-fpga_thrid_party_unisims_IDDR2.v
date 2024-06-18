// This program was cloned from: https://github.com/matrix-io/matrix-creator-fpga
// License: GNU General Public License v3.0


module IDDR2#(
	parameter DDR_ALIGNMENT = "NONE",
	parameter INIT_Q0 = 1'b0,
	parameter INIT_Q1 = 1'b0,
	parameter SRTYPE = "ASYNC"
)(
	input D,
	input C0,
	input C1,
	input CE,
	input R,
	input S,
	output Q1,
	output Q0
);


flip_flop_d ffD0(
	.D(D),
	.clk(C0),
	.ce(CE),
	.reset(R),
	.set(S),
	.Q(Q0)
);

flip_flop_d ffD1(
	.D(D),
	.clk(C1),
	.ce(CE),
	.reset(R),
	.set(S),
	.Q(Q1)
);

endmodule






