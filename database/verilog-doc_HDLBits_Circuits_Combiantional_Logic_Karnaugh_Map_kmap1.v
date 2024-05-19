// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module(
	input a, 
	input b,
	input c,
	output out
);

	// SOP form: Three prime implicants (1 term each), summed.
	// POS form: One prime implicant (of 3 terms)
	// In this particular case, the result is the same for both SOP and POS.
	assign out = (a | b | c);
	
endmodule

