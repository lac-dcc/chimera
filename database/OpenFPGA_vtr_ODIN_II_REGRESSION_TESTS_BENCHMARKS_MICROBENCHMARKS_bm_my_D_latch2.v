// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

/* My D latch with attempts to bypass icarus FF inference */

module bm_my_D_latch2(D, C, Q);
	input D, C;
	output Q;
	reg Q;
	
	always @(D or C)
		Q = D;
endmodule
