// This program was cloned from: https://github.com/ronitrex/ARMLEG
// License: GNU General Public License v3.0

module ForwardingUnitALUMuxB
(
	input [63:0] regData2,
	input [63:0] dataMemoryMUXout,
	input [63:0] EXMEM_InputAddress,
	input [1:0] ForwardB,
	output reg [63:0] ForwardingUnitALUMUXoutB
);

	always @(*) case (ForwardB)
		2'b00: ForwardingUnitALUMUXoutB = regData2;
		2'b01: ForwardingUnitALUMUXoutB = dataMemoryMUXout;
		2'b10: ForwardingUnitALUMUXoutB = EXMEM_InputAddress;
		default: ForwardingUnitALUMUXoutB = regData2;
	endcase
endmodule
