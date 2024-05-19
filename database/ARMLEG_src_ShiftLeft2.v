// This program was cloned from: https://github.com/ronitrex/ARMLEG
// License: GNU General Public License v3.0

module ShiftLeft2
(
	input [63:0] inputData,
	output reg [63:0] outputData
);

	always @(*) begin
		outputData = inputData << 2;
	end
endmodule