// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module control(
    input [31:0]instr,

    output reg [11:0]imm12,
    output reg rf_we,
    output reg [2:0]alu_op,
    output reg has_imm,
    output reg mem_we,
    output reg alu_alt,
    output reg inv_cmp,
    output reg is_branch
);

wire [6:0]opcode = instr[6:0];
wire [2:0]funct3 = instr[14:12];

always @(*) begin
    rf_we = 1'b0;
    alu_op = 3'b0;
    imm12 = 12'b0;
    has_imm = 1'b0;
    mem_we = 1'b0;
    alu_alt = 1'b0;
    inv_cmp = 1'b0;
    is_branch = 1'b0;

    casez (opcode)
        7'b0010011: begin // ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI
            rf_we = 1'b1;
            alu_op = funct3;
            imm12 = instr[31:20];
            has_imm = 1'b1;
            alu_alt = (funct3 == 3'b101) && instr[30];
`ifdef __ICARUS__
            $strobe("(%s) opcode = %b", "OP-IMM", opcode);
`endif
        end
        7'b0110011: begin // ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND
            rf_we = 1'b1;
            alu_op = funct3;
            alu_alt = instr[30];
`ifdef __ICARUS__
            $strobe("(%s) opcode = %b", "OP", opcode);
`endif
        end
        7'b0100011: begin // SW
            imm12 = {instr[31:25], instr[11:7]};
            has_imm = 1'b1;
            mem_we = (funct3 == 3'b010);
`ifdef __ICARUS__
            $strobe("(%s) opcode = %b", "STORE", opcode);
`endif
        end
        7'b1100011: begin // BEQ, BNE, BLT, BGE, BLTU, BGEU
            alu_op = {1'b0, funct3[2:1]};
            alu_alt = 1'b1;
            inv_cmp = ~funct3[2] ^ funct3[0];
            is_branch = 1'b1;
            imm12 = {instr[31], instr[31], instr[7], instr[30:25], instr[11:9]};
`ifdef __ICARUS__
            $strobe("(%s) opcode = %b", "BRANCH", opcode);
`endif
        end
        default: begin
`ifdef __ICARUS__
            $strobe("(%s) opcode = %b", "UNKNOWN", opcode);
`endif
        end
    endcase
end

endmodule
