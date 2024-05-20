// This program was cloned from: https://github.com/the-pinbo/MIPS-5-Stage-Pipeline-Project
// License: MIT License

module M_CONTROLLER(input [5:0] opcode,
    output memtoreg,
    output memwrite,
    output branch,
    output alusrc,
    output regdst,
    output regwrite,
    output jump,
    output [1:0] aluop);

    reg[8:0] controls;

    assign {regwrite, regdst, alusrc, branch, memwrite,memtoreg, jump, aluop} = controls;

    always@(opcode)
    case(opcode)
        6'b000000: controls = 9'b110000010; // RTYPE
        6'b100011: controls = 9'b101001000; // LW
        6'b101011: controls = 9'b001010000; // SW
        6'b000100: controls = 9'b000100001; // BEQ
        6'b001000: controls = 9'b101000000; // ADDI
        6'b000010: controls = 9'b000000100; // J
        6'b011100: controls = 9'b110000010; // MUL
        default:   controls = 9'bxxxxxxxxx; // illegal op
    endcase
endmodule