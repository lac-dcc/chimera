// This program was cloned from: https://github.com/FPGADude/Digital-Design
// License: GNU General Public License v3.0


module d_ff(
	input clock,
	input reset,
	input data_in,
	output reg q
);

	always @(posedge clock or negedge reset)
		if(~reset)
			q <= 0;
		else
			q <= data_in;

endmodule

