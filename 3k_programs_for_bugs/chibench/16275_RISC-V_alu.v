// This program was cloned from: https://github.com/navin9212/RISC-V
// License: Apache License 2.0

//  module declaration
module alu(
    // input ports
    input clk,
    input reset,
    input wire [6:0] opcode_reg, // depicts the instruction type
    input wire [3:0] AluControl_reg, // specifies the operation
    input wire [31:0] SrcA_reg, // source register 1 (operand 1)
    input wire [31:0] SrcB_reg, // source register 2 (operand 2)
    input wire PCSrc_reg, // selects between AluResult and AluOut
    // output ports
    output reg [31:0] AluResult_reg, // ALU result obtained
    output reg [31:0] AluOut_reg, // register storing ALU result
    output reg Cond_Chk_reg, // checks for the conditional instructions
    output reg [31:0] pc_up_reg // derived/new pc value
);

// PC value selection
always @(PCSrc_reg, AluOut_reg, AluResult_reg) begin
    pc_up_reg <= PCSrc_reg ? AluOut_reg : AluResult_reg; // PCSrc = 1 utilized in Jump & Branch to select AluOut in next clock cycle else AluResult is taken
end

//  definition
always @(posedge clk) begin
    if (reset) begin
        AluResult_reg <= 0;
        AluOut_reg <= 0;
        Cond_Chk_reg <= 1'b0;
        pc_up_reg <= 0;
    end
    //  fixed (add) operation for the AluControl_reg = "0000"
    else if (AluControl_reg == 4'b0000) begin
        AluResult_reg <= SrcA_reg + SrcB_reg;
        Cond_Chk_reg <= 1'b0;
    end
    else begin
        case (opcode_reg)
            //  R-type instructions
            //  I-type instructions(shift, logical, arithmetic)
            7'b0110011 , 7'b0010011: begin
                case (AluControl_reg)
                    4'b0000: AluResult_reg <= SrcA_reg + SrcB_reg; // add, addi
                    4'b0001: AluResult_reg <= SrcA_reg << (SrcB_reg[4:0] & 5'h1F); // sll, slli
                    4'b0010: AluResult_reg <= ($signed(SrcA_reg) < $signed(SrcB_reg)) ? 1 : 0; // slt, slti
                    4'b0011: AluResult_reg <= (SrcA_reg < SrcB_reg) ? 1 : 0; // sltu, sltiu
                    4'b0100: AluResult_reg <= SrcA_reg ^ SrcB_reg; // xor, xori
                    4'b0101: AluResult_reg <= SrcA_reg >> (SrcB_reg[4:0] & 5'h1F); // srl, srli
                    4'b0110: AluResult_reg <= SrcA_reg | SrcB_reg; // or, ori
                    4'b0111: AluResult_reg <= SrcA_reg & SrcB_reg; // and, andi
                    4'b1000: AluResult_reg <= SrcA_reg - SrcB_reg; // sub
                    4'b1101: AluResult_reg <= $signed(SrcA_reg) >>> (SrcB_reg[4:0] & 5'h1F); // sra, srai
                endcase
                Cond_Chk_reg <= 1'b0;
            end

            //  I-type instructions(load) (lb, lh, lw, lbu, lhu) (SrcA_reg + Immediate Offset)
            //  S-type instructions (sb, sh, sw) (SrcA_reg + Immediate Offset)
            //  I-type instructions(jump) (jalr) (PC + Immediate Offset)
            //  J-type instructions (jal) (PC + Immediate Offset)
            //  U-type (add upper immediate) (auipc) (PC + Immediate Offset)
            7'b0000011, 7'b1100111, 7'b0100011, 7'b1101111, 7'b0010111: begin
                AluResult_reg <= SrcA_reg + SrcB_reg; // address calculation
                Cond_Chk_reg <= 1'b0;
            end

            //  U-type (load upper immediate) (lui)
            7'b0110111: begin
                AluResult_reg <= SrcB_reg; // SrcB_reg is passed to AluResult_reg
                Cond_Chk_reg <= 1'b0;
            end
    
            //B-type instructions (PC + SrcB_reg)
            7'b1100011: begin
                AluResult_reg <= SrcA_reg + SrcB_reg;
                case (AluControl_reg)
                    4'b1000: Cond_Chk_reg <= (SrcA_reg == SrcB_reg) ? 1 : 0; // beq
                    4'b1001: Cond_Chk_reg <= (SrcA_reg != SrcB_reg) ? 1 : 0; // bne
                    4'b1100: Cond_Chk_reg <= ($signed(SrcA_reg) < $signed(SrcB_reg)) ? 1 : 0; // blt
                    4'b1101: Cond_Chk_reg <= ($signed(SrcA_reg) >= $signed(SrcB_reg)) ? 1 : 0; // bge
                    4'b1110: Cond_Chk_reg <= (SrcA_reg < SrcB_reg) ? 1 : 0; // bltu
                    4'b1111: Cond_Chk_reg <= (SrcA_reg >= SrcB_reg) ? 1 : 0; // bgeu
                    default: Cond_Chk_reg <= 1'b0;
                endcase
            end
        endcase
    end
    AluOut_reg <= AluResult_reg; // stores the ALU result in next clock cycle
end
endmodule