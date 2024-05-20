// This program was cloned from: https://github.com/rolo-g/TRISC-Processor
// License: MIT License

//Rolando Rosales 1001850424 - 4-bit Four to Eleven Decoder 

module fourto11decoder (
	input [3:0] x,
	output reg LDA, STA, ADD, SUB, XOR, INC, CLR, JMP, JPZ, JPN, HLT);
	always @ (x)
		case ({x})
		4'b0000: {LDA, STA, ADD, SUB, XOR, INC, CLR, JMP, JPZ, JPN, HLT} = 11'b10000000000;
		4'b0001: {LDA, STA, ADD, SUB, XOR, INC, CLR, JMP, JPZ, JPN, HLT} = 11'b01000000000;
		4'b0010: {LDA, STA, ADD, SUB, XOR, INC, CLR, JMP, JPZ, JPN, HLT} = 11'b00100000000;
		4'b0011: {LDA, STA, ADD, SUB, XOR, INC, CLR, JMP, JPZ, JPN, HLT} = 11'b00010000000;
		4'b0100: {LDA, STA, ADD, SUB, XOR, INC, CLR, JMP, JPZ, JPN, HLT} = 11'b00001000000;
		4'b0110: {LDA, STA, ADD, SUB, XOR, INC, CLR, JMP, JPZ, JPN, HLT} = 11'b00000100000;
		4'b0111: {LDA, STA, ADD, SUB, XOR, INC, CLR, JMP, JPZ, JPN, HLT} = 11'b00000010000;
		4'b1000: {LDA, STA, ADD, SUB, XOR, INC, CLR, JMP, JPZ, JPN, HLT} = 11'b00000001000;
		4'b1100: {LDA, STA, ADD, SUB, XOR, INC, CLR, JMP, JPZ, JPN, HLT} = 11'b00000000100;
		4'b1001: {LDA, STA, ADD, SUB, XOR, INC, CLR, JMP, JPZ, JPN, HLT} = 11'b00000000010;
		4'b1111: {LDA, STA, ADD, SUB, XOR, INC, CLR, JMP, JPZ, JPN, HLT} = 11'b00000000001;
	endcase
endmodule 