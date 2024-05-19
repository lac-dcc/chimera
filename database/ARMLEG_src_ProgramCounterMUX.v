// This program was cloned from: https://github.com/ronitrex/ARMLEG
// License: GNU General Public License v3.0

module ProgramCounterMUX
(
	input [63:0] adderResult,
	input [63:0] branch,
	input PCsrc,
	output reg [63:0] programCounterMUXout
);

	always @(*) case (PCsrc)
		0: programCounterMUXout = adderResult;
		1: programCounterMUXout = branch;
		default: programCounterMUXout = adderResult;
	endcase
endmodule
