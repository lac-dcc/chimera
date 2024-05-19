// This program was cloned from: https://github.com/Canaan-Creative/MM
// License: The Unlicense

`timescale 1ns / 1ps
module BB(
	input I,
	input T,
	output wire O,
	output wire B
);
assign  B = T ? 1'bz : I;
assign  O = B;
endmodule
