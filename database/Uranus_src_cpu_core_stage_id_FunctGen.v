// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

`include "../../define/bus.v"
`include "../../define/opcode.v"
`include "../../define/funct.v"
`include "../../define/regimm.v"

module FunctGen(
    input [`INST_OP_BUS] op,
    input [`FUNCT_BUS] funct_in,
    input [`REG_ADDR_BUS] rt,
    output reg[`FUNCT_BUS] funct
);

    // generating FUNCT signal in order for the ALU to perform operations
    always @(*) begin
        case (op)
            `OP_SPECIAL: funct <= funct_in;
            `OP_SPECIAL2:   begin
                case (funct_in)
                    `FUNCT_MADD:    funct   <= `FUNCT2_MADD;
                    `FUNCT_MADDU:   funct   <= `FUNCT2_MADDU;
                    `FUNCT_MUL:     funct   <= `FUNCT2_MUL;
                    `FUNCT_MSUB:    funct   <= `FUNCT2_MSUB;
                    `FUNCT_MSUBU:   funct   <= `FUNCT2_MSUBU;
                    `FUNCT_CLZ:     funct   <= `FUNCT2_CLZ;
                    `FUNCT_CLO:     funct   <= `FUNCT2_CLO;
                    default:        funct   <= `FUNCT_NOP;
                endcase
            end
            `OP_ORI: funct <= `FUNCT_OR;
            `OP_ANDI: funct <= `FUNCT_AND;
            `OP_XORI: funct <= `FUNCT_XOR;
            `OP_LUI: funct <= `FUNCT_OR;
            `OP_LB, `OP_LBU, `OP_LH, `OP_LHU, `OP_LW,
            `OP_SB, `OP_SH, `OP_SW, `OP_ADDI: funct <= `FUNCT_ADD;
            `OP_ADDIU: funct <= `FUNCT_ADDU;
            `OP_SLTI: funct <= `FUNCT_SLT;
            `OP_SLTIU: funct <= `FUNCT_SLTU;
            `OP_JAL: funct <= `FUNCT_OR;
            `OP_REGIMM: begin
                case (rt)
                    `REGIMM_BLTZAL, `REGIMM_BGEZAL: funct <= `FUNCT_OR;
                    default: funct <= `FUNCT_NOP;
                endcase
            end
            default: funct <= `FUNCT_NOP;
        endcase
    end

endmodule // FunctGen
