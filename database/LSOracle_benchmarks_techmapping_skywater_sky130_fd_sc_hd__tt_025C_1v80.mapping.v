// This program was cloned from: https://github.com/lnis-uofu/LSOracle
// License: MIT License

module mapped_register(D, Q, CLK);
input D, CLK;
output Q;
wire B;
sky130_fd_sc_hd__dfxtp_1 fflop (.CLK(CLK), .D(D), .Q(B));
sky130_fd_sc_hd__buf_8 buffer (.A(B), .X(Q));
endmodule

module mapped_inverter(A, Y);
input A; output Y;
sky130_fd_sc_hd__inv_1 i(.A(A), .Y(Y));
endmodule
