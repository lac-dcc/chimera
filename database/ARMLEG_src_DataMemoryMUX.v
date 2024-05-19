// This program was cloned from: https://github.com/ronitrex/ARMLEG
// License: GNU General Public License v3.0

module DataMemoryMUX
(
	input [63:0] readData,
	input [63:0] ALUresult,
	input memToReg,
	output reg [63:0] dataMemoryMUXout
);

	always @(*) case (memToReg)
		0: dataMemoryMUXout = ALUresult;
		1: dataMemoryMUXout = readData;
		default: dataMemoryMUXout = ALUresult;
	endcase
endmodule
