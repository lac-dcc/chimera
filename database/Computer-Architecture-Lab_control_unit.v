// This program was cloned from: https://github.com/matahho/Computer-Architecture-Lab
// License: MIT License

module ControlUnit(
    input [1:0] mode,
    input [3:0] opcode,
    input sIn,
    output reg [3:0] aluCmd,
    output reg memRead, memWrite,
    output reg wbEn, branch, sOut
);
    always @(mode, opcode, sIn) begin
        aluCmd = 4'd0;
        {memRead, memWrite} = 2'd0;
        {wbEn, branch, sOut} = 3'd0;

        case (opcode)
            4'b1101: aluCmd = 4'b0001; // MOV
            4'b1111: aluCmd = 4'b1001; // MVN
            4'b0100: aluCmd = 4'b0010; // ADD, LDR, STR
            4'b0101: aluCmd = 4'b0011; // ADC
            4'b0010: aluCmd = 4'b0100; // SUB
            4'b0110: aluCmd = 4'b0101; // SBC
            4'b0000: aluCmd = 4'b0110; // AND
            4'b1100: aluCmd = 4'b0111; // ORR
            4'b0001: aluCmd = 4'b1000; // EOR
            4'b1010: aluCmd = 4'b0100; // CMP
            4'b1000: aluCmd = 4'b0110; // TST
            default: aluCmd = 4'b0001;
        endcase

        case (mode)
            2'b00: begin
                sOut = sIn;
                // no write-back for CMP and TST
                wbEn = (opcode == 4'b1010 || opcode == 4'b1000) ? 1'b0 : 1'b1;
            end
            2'b01: begin
                wbEn = sIn;
                memRead = sIn;
                memWrite = ~sIn;
            end
            2'b10: branch = 1'b1;
            default:;
        endcase
    end
endmodule
