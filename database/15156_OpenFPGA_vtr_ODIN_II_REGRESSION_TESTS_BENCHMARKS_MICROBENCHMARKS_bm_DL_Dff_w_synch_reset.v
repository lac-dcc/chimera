// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

/* pg 396 - synchronous DFF reset */

module bm_DL_Dff_w_synch_reset(D, Clock, Resetn, Q);
	input D, Clock, Resetn;
	output Q;
	reg Q;
	
	always @(posedge Clock)
		if (!Resetn)
			Q <= 0;
		else 
			Q <= D;
	
endmodule
