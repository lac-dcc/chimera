// This program was cloned from: https://github.com/the-pinbo/MIPS-single-cycle
// License: MIT License

module control(
	input [5:0] opcode,
	output reg RegDst,
	output reg ALUSrc,
	output reg MemtoReg,
	output reg RegWrite,
	output reg MemRead,
	output reg MemWrite,
	output reg Branch,
	output reg[1:0] AluOP
);

	always @(opcode) begin
		case (opcode)
			6'b000000:{RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, AluOP} = 9'b100100_0_10; // r
			6'b100011:{RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, AluOP} = 9'b011110_0_00; // lw
			6'b101011:{RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, AluOP} = 9'bx1x001_0_00; // sw
			6'b000100:{RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, AluOP} = 9'bx0x000_1_01; // beq
			default:  {RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, AluOP} = 9'bxxx_xxx_x_xx;
		endcase
	end

endmodule
