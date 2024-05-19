// This program was cloned from: https://github.com/ronitrex/ARMLEG
// License: GNU General Public License v3.0

module ALUControl
(
	input [1:0] ALUop,
	input [10:0] opcodeField,
	output reg [3:0] ALUoperation
);

	always @(*) case (ALUop)
		2'b00 : ALUoperation = 4'b0010; // Jump instruction
		2'b01 : ALUoperation = 4'b0111;
		2'b10 : case (opcodeField)
			11'b10001011000 : ALUoperation = 4'b0010; // ADD
			11'b11001011000 : ALUoperation = 4'b0110; // SUB
			11'b10001010000 : ALUoperation = 4'b0000; // AND
			11'b10101010000 : ALUoperation = 4'b0001; // ORR
		endcase
	endcase
endmodule
