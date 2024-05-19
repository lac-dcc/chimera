// This program was cloned from: https://github.com/matrix-io/matrix-creator-fpga
// License: GNU General Public License v3.0


module ODDR2 #(
	parameter DDR_ALIGNMENT = "NONE",
	parameter INIT = 1'b0,
	parameter SRTYPE = "ASYNC"
)(
	input D0,
	input D1,
	input C0,
	input C1,
	input CE,
	input R,
	input S,
	output reg Q
);

wire Q0, Q1;

flip_flop_d ffD0(
	.D(D0),
	.clk(C0),
	.ce(CE),
	.reset(R),
	.set(S),
	.Q(Q0)
);

flip_flop_d ffD1(
	.D(D1),
	.clk(C1),
	.ce(CE),
	.reset(R),
	.set(S),
	.Q(Q1)
);

always @(*) begin
	if (C0 & ~C1) 
		Q <= Q0;
	else if(~C0 & C1)
		Q <= Q1;
end
endmodule






