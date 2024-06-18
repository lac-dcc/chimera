// This program was cloned from: https://github.com/regales/cpre281
// License: Apache License 2.0

module mux4to1(W0, W1, W2, W3, S0, S1, F);
	input W0, W1, W2, W3, S0, S1;
	output F;
	assign F = S1 ? (S0 ? W3 : W2) : (S0 ? W1 : W0);
endmodule