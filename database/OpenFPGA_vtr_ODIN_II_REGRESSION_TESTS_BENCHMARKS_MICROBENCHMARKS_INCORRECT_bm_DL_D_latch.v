// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

/* pg 389 - D latch */

module bm_DL_D_latch(D, Clk, Q);
	input D, Clk;
	output Q;
	reg Q;
	
	always @(D or Clk)
		if (Clk)
			Q = D;
endmodule
