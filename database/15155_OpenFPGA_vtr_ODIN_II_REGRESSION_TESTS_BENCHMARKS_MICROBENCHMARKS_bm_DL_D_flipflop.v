// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

/* pg 389 - D flip flop */

module bm_DL_D_flipflop(D, Clock, Q);
	input D, Clock;
	output Q;
	reg Q;
	
	always @(posedge Clock)
		Q <= D;
	
endmodule
