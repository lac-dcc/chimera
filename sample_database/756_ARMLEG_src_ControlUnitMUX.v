// This program was cloned from: https://github.com/ronitrex/ARMLEG
// License: GNU General Public License v3.0

module ControlUnitMUX
(
	input [10:0] controlInstruction_in,
	input ControlWire,
	output reg [10:0] controlMuxout
);
	reg [10:0] zeroData = 10'b0;

	always @(*)  case (ControlWire)
		0: controlMuxout = zeroData;
		1: controlMuxout = controlInstruction_in;
		default: controlMuxout = controlInstruction_in;
	endcase
endmodule
