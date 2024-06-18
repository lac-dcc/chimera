// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

/* Uses behavioural specification for adder */

module bm_DL_behavioural_full_adder (Cin, x, y, s, Cout);
	input Cin, x, y;
	output s, Cout;
	reg s, Cout;
	
	always @(x or y or Cin)
		{Cout, s} = x + y + Cin;

endmodule
