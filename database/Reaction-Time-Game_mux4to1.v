// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

`ifndef mux4to1
  `define mux4to1
module mux4to1(W0, W1, W2, W3, S, F);
	input W0, W1, W2, W3;
	input [1:0] S;
	output F;
	
	assign SW1 = (S[0]) ? (W1) : (W0);
	assign SW2 = (S[0]) ? (W3) : (W2);
	
	assign F = (S[1]) ? (SW2) : (SW1);
endmodule

`endif
