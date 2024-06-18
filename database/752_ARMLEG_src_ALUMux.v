// This program was cloned from: https://github.com/ronitrex/ARMLEG
// License: GNU General Public License v3.0

module ALUMux
(
	input [63:0] registerData,
	input [63:0] signExtendedData,
	input ALUsrc,
	output reg [63:0] ALUMUXout
);

	always @(*) case (ALUsrc)
		0: ALUMUXout = registerData;
		1: ALUMUXout = signExtendedData;
		default: ALUMUXout = registerData;
	endcase
endmodule
