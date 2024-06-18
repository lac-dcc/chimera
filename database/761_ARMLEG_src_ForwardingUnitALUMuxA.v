// This program was cloned from: https://github.com/ronitrex/ARMLEG
// License: GNU General Public License v3.0

module ForwardingUnitALUMuxA
(
	input [63:0] regData1,
	input [63:0] dataMemoryMUXout,
	input [63:0] EXMEM_InputAddress,
	input [1:0] ForwardA,
	output reg [63:0] ForwardingUnitALUMUXoutA
);

	always @(*) case (ForwardA)
		2'b00: ForwardingUnitALUMUXoutA = regData1;
		2'b01: ForwardingUnitALUMUXoutA = dataMemoryMUXout;
		2'b10: ForwardingUnitALUMUXoutA = EXMEM_InputAddress;
		default: ForwardingUnitALUMUXoutA = regData1;
	endcase
endmodule
