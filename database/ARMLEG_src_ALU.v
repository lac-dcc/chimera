// This program was cloned from: https://github.com/ronitrex/ARMLEG
// License: GNU General Public License v3.0

module ALU
(
	input [63:0] A,
	input [63:0] B,
	input [3:0] control,
	output reg [63:0] result,
	output reg zeroFlag
);

	always @(*) begin
		case (control)
			4'b0000 : result = A & B;
			4'b0001 : result = A | B;
			4'b0010 : result = A + B;
			4'b0110 : result = A - B;
			4'b0111 : result = B;
			4'b1100 : result = ~(A | B);
		endcase

		if (result == 0) begin
			zeroFlag = 1'b1;
		end else begin
			zeroFlag = 1'b0;
		end
	end
endmodule