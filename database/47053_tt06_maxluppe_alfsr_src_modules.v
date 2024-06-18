// This program was cloned from: https://github.com/maxluppe/tt06_maxluppe_alfsr
// License: Apache License 2.0

module buf02(
	A,
	Y
);

input wire	A;
output wire	Y;

	sky130_fd_sc_hd__buf_2 buf_2 (.X(Y), .A(A));

endmodule


module buf04(
	A,
	Y
);

input wire	A;
output wire	Y;

	sky130_fd_sc_hd__buf_4 buf_4 (.X(Y), .A(A));

endmodule


module xnor2(
	A0,
	A1,
	Y
);


input wire	A0;
input wire	A1;
output wire	Y;

	sky130_fd_sc_hd__xnor2_1 xnor2_1 (.Y(Y), .A(A0), .B(A1));

endmodule


module xor2(
	A0,
	A1,
	Y
);


input wire	A0;
input wire	A1;
output wire	Y;

	sky130_fd_sc_hd__xor2_1 xor2_1 (.X(Y), .A(A0), .B(A1));

endmodule


module mux21(
	A0,
	A1,
	S0,
	Y
);

input wire	A0;
input wire	A1;
input wire	S0;
output wire	Y;

	sky130_fd_sc_hd__mux2i_1 mux2i_1 (.Y(Y), .A0(A0), .A1(A1), .S(S0));

endmodule


module mux21_ni(
	A0,
	A1,
	S0,
	Y
);

input wire	A0;
input wire	A1;
input wire	S0;
output wire	Y;

	sky130_fd_sc_hd__mux2_1 mux2_1 (.X(Y), .A0(A0), .A1(A1), .S(S0));

endmodule


module dffs_ni(
	CLK,
	D,
	S,
	Q
);


input wire	CLK;
input wire	D;
input wire	S;
output wire	Q;

	sky130_fd_sc_hd__dfstp_1 dfstp_1 (.Q(Q), .CLK(CLK), .D(D), .SET_B(S));

endmodule


module dffr(
	CLK,
	D,
	R,
	Q
);


input wire	CLK;
input wire	D;
input wire	R;
output wire	Q;

	sky130_fd_sc_hd__dfrtp_1 dfrtp_1 (.Q(Q), .CLK(CLK), .D(D), .RESET_B(R));

endmodule


module dff1(
	CLK,
	D,
	Q
);


input wire	CLK;
input wire	D;
output wire	Q;

	sky130_fd_sc_hd__dfxtp_1 dfxtp_1 (.Q(Q), .CLK(CLK), .D(D));

endmodule
