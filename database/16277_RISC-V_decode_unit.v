// This program was cloned from: https://github.com/navin9212/RISC-V
// License: Apache License 2.0

//  module declaration
module decode_unit(
    //  input ports
    input clk,
    input reset,
    input wire Cond_Chk_reg,
    input wire [31:0] instruction,
    //  output ports
    output reg [6:0] opcode_reg,
    output reg [4:0] rs1_reg,
    output reg [4:0] rs2_reg,
    output reg [4:0] rd_reg,
    output reg [2:0] funct3_reg,
    output reg [6:0] funct7_reg,
    output reg IorD_reg,
    output reg MemWrite_reg,
    output reg [1:0] MtoR_reg,
    output reg IRWrite_reg,
    output reg [31:0] Imm_reg,
    output reg AluSrcA_reg,
    output reg [1:0] AluSrcB_reg,
    output reg [3:0] AluControl_reg,
    output reg PCSrc_reg,
    output reg RegWrite_reg,
    output reg Branch_reg,
    output reg PCWrite_reg,
    output reg PCEn_reg,
    output reg [4:0] stage
);

//  PC_En controlling block
always @(PCWrite_reg, Branch_reg, Cond_Chk_reg) begin
PCEn_reg <= PCWrite_reg | (Branch_reg & Cond_Chk_reg);
end

//  definition
always @(posedge clk) begin
    if (reset) begin
        opcode_reg <= 0;
        rs1_reg <= 0;
        rs2_reg <= 0;
        rd_reg <= 0;
        funct3_reg <= 0;
        funct7_reg <= 0;
        IorD_reg <= 1'bz;
        MemWrite_reg <= 0;
        MtoR_reg <= 2'bzz;
        IRWrite_reg <= 0;
        Imm_reg <= 0;
        AluSrcA_reg <= 1'bz;
        AluSrcB_reg <= 2'bzz;
        AluControl_reg <= 4'bzzzz;
        PCSrc_reg <= 1'bz;
        RegWrite_reg <= 0;
        Branch_reg <= 0;
        PCWrite_reg <= 0;
        PCEn_reg <= 0;
        stage <= 0;
    end 
    else begin
        case (stage)
            //  Fetching
            0: begin
                assign opcode_reg = instruction[6:0];
                assign rs1_reg = instruction[19:15];
                assign rs2_reg = instruction[24:20];
                assign rd_reg = instruction[11:7];
                assign funct3_reg = instruction[14:12];
                assign funct7_reg = instruction[31:25];
                IorD_reg <= 1'b0;
                MemWrite_reg <= 1'b0;
                MtoR_reg <= 2'bzz;
                IRWrite_reg <= 1'b1;
                AluSrcA_reg <= 1'b0;
                AluSrcB_reg <= 2'b01;
                AluControl_reg <= 4'b0000;
                PCSrc_reg <= 1'b0;
                RegWrite_reg <= 1'b0;
                PCWrite_reg <= 1'b1;
                if(opcode_reg == 7'b1100011) begin // branch instruction
                    Branch_reg <= 1'b1;
                end
                else begin // other instructions
                    Branch_reg <= 1'b0;
                end
                stage <= 1;
            end

            //  Decode
            1: begin
                IorD_reg <= 1'bz;
                MemWrite_reg <= 1'b0;
                MtoR_reg <= 2'bzz;
                IRWrite_reg <= 1'b0;
                PCSrc_reg <= 1'bz;
                RegWrite_reg <= 1'b0;
                PCWrite_reg <= 1'b0;
                if(opcode_reg == 7'b1100011) begin // branch instruction (calculation of jumping address)
                    AluSrcA_reg <= 1'b0;
                    AluSrcB_reg <= 2'b10;
                    AluControl_reg <= 4'b0000;
                    Branch_reg <= 1'b1;
                end
                else begin // other instructions
                    AluSrcA_reg <= 1'bz;
                    AluSrcB_reg <= 2'bzz;
                    AluControl_reg <= 4'bzzzz;
                    Branch_reg <= 1'b0;
                end
                case (opcode_reg)
                    7'b0110011: begin // R-type
                        Imm_reg <= 0;
                        stage <= 2;
                    end
                    7'b0000011: begin // I-type (load)
                        Imm_reg <= {{20{instruction[31]}}, instruction[31:20]};
                        stage <= 4;
                    end
                    7'b1100111: begin // I-type (jump)
                        Imm_reg <= {{20{instruction[31]}}, instruction[31:20]};
                        stage <= 12;
                    end
                    7'b0010011: begin // I-type (shift, logical, arithmetic)
                        case (funct3_reg)
                            3'b001, 3'b101: begin // slli, srli, srai
                                Imm_reg = {12'b0, instruction[31:20]}; // shift amount immediate
                            end
                            3'b000, 3'b010, 3'b011, 3'b100, 3'b111: begin // addi, slti, sltiu, xori, ori, andi
                                Imm_reg <= {{20{instruction[31]}}, instruction[31:20]};
                            end
                        endcase
                        stage <= 7;
                    end
                    7'b0100011: begin // S-type
                        Imm_reg <= {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
                        stage <= 8;
                    end
                    7'b1100011: begin // B-type
                        Imm_reg <= {{20{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8]};
                        stage <= 16;
                    end
                    7'b1100011: begin // J-type
                        Imm_reg <= {{12{instruction[31]}}, instruction[31], instruction[19:12], instruction[20], instruction[30:21]};
                        stage <= 14;
                    end
                    7'b0110111: begin // U-type (load)
                        Imm_reg <= {instruction[31:20], 12'b0};
                        stage <= 10;
                    end
                    7'b0010111: begin // U-type (add)
                        Imm_reg <= {instruction[31:20], 12'b0};
                        stage <= 11;
                    end
                endcase
                stage <= 2;
            end

            //  Execute (R-type)
            2: begin
                IorD_reg <= 1'bz;
                MemWrite_reg <= 0;
                MtoR_reg <= 2'bzz;
                IRWrite_reg <= 0;
                AluSrcA_reg <= 1'b1;
                AluSrcB_reg <= 2'b00;
                if (funct7_reg == 7'b0000000) begin
                    AluControl_reg <= {1'b0, funct3_reg}; // add, slt, sltu, sll, xor, srl, or, and
                end
                else if (funct7_reg == 7'b0100000) begin
                    AluControl_reg <= {1'b1, funct3_reg}; // sub, sra
                end
                PCSrc_reg <= 1'bz;
                RegWrite_reg <= 0;
                Branch_reg <= 0;
                PCWrite_reg <= 0;
                stage <= 3;
            end

            //  ALU Writeback (R-type & I-type (shift, logical, arithmetic) & U-type (auipc))
            3: begin
                IorD_reg <= 1'bz;
                MemWrite_reg <= 1'b0;
                MtoR_reg <= 2'b00;
                IRWrite_reg <= 1'b0;
                AluSrcA_reg <= 1'bz;
                AluSrcB_reg <= 2'bzz;
                AluControl_reg <= 4'bzzzz;
                PCSrc_reg <= 1'bz;
                RegWrite_reg <= 1'b1;
                Branch_reg <= 1'b0;
                PCWrite_reg <= 1'b0;
                stage <= 0;
            end

            //  Memory Adrress Calculation (I-type (load))
            4: begin
                IorD_reg <= 1'bz;
                MemWrite_reg <= 1'b0;
                MtoR_reg <= 2'bzz;
                IRWrite_reg <= 1'b0;
                AluSrcA_reg <= 1'b1;
                AluSrcB_reg <= 2'b10;
                AluControl_reg <= {1'b1, funct3_reg}; //lb, lh, lw, lbu, lhu
                PCSrc_reg <= 1'bz;
                RegWrite_reg <= 1'b0;
                Branch_reg <= 1'b0;
                PCWrite_reg <= 1'b0;
                stage <= 5;
            end

            //  Memory Read (I-type (load))
            5: begin
                IorD_reg <= 1'b1;
                MemWrite_reg <= 1'b0;
                MtoR_reg <= 2'bzz;
                IRWrite_reg <= 1'b0;
                AluSrcA_reg <= 1'bz;
                AluSrcB_reg <= 2'bzz;
                AluControl_reg <= 4'bzzzz;
                PCSrc_reg <= 1'bz;
                RegWrite_reg <= 1'b0;
                Branch_reg <= 1'b0;
                PCWrite_reg <= 1'b0;
                stage <= 6;
            end

            //  Memory Writeback (I-type (load))
            6: begin
                IorD_reg <= 1'bz;
                MemWrite_reg <= 1'b0;
                MtoR_reg <= 2'b01;
                IRWrite_reg <= 1'b0;
                AluSrcA_reg <= 1'bz;
                AluSrcB_reg <= 2'bzz;
                AluControl_reg <= 4'bzzzz;
                PCSrc_reg <= 1'bz;
                RegWrite_reg <= 1'b1;
                Branch_reg <= 1'b0;
                PCWrite_reg <= 1'b0;
                stage <= 0;
            end

            //  Execute (I-type (shift, logical, arithmetic))
            7: begin
                IorD_reg <= 1'bz;
                MemWrite_reg <= 0;
                MtoR_reg <= 2'bzz;
                IRWrite_reg <= 0;
                AluSrcA_reg <= 1'b1;
                AluSrcB_reg <= 2'b10;
                if (funct7_reg == 7'b0000000) begin
                    AluControl_reg <= {1'b0, funct3_reg}; // addi, slti, sltiu, slli, xori, srli, ori, andi
                end
                else if (funct7_reg == 7'b0100000) begin
                    AluControl_reg <= {1'b1, funct3_reg}; // srai
                end
                PCSrc_reg <= 1'bz;
                RegWrite_reg <= 0;
                Branch_reg <= 0;
                PCWrite_reg <= 0;
                stage <= 3;
            end

            //  Memory Adrress Calculation (S-type)
            8: begin
                IorD_reg <= 1'bz;
                MemWrite_reg <= 1'b0;
                MtoR_reg <= 2'bzz;
                IRWrite_reg <= 1'b0;
                AluSrcA_reg <= 1'b1;
                AluSrcB_reg <= 2'b10;
                AluControl_reg <= {1'b1, funct3_reg}; // sb, sh, sw
                PCSrc_reg <= 1'bz;
                RegWrite_reg <= 1'b0;
                Branch_reg <= 1'b0;
                PCWrite_reg <= 1'b0;
                stage <= 9;
            end

            //  Memory Write (S-type)
            9: begin
                IorD_reg <= 1'b1;
                MemWrite_reg <= 1'b1;
                MtoR_reg <= 2'bzz;
                IRWrite_reg <= 1'b0;
                AluSrcA_reg <= 1'bz;
                AluSrcB_reg <= 2'bzz;
                AluControl_reg <= 4'bzzzz;
                PCSrc_reg <= 1'bz;
                RegWrite_reg <= 1'b0;
                Branch_reg <= 1'b0;
                PCWrite_reg <= 1'b0;
                stage <= 0;
            end

            //  Load Immediate (U-type)
            10: begin
                IorD_reg <= 1'bz;
                MemWrite_reg <= 1'b0;
                MtoR_reg <= 2'b10;
                IRWrite_reg <= 1'b0;
                AluSrcA_reg <= 1'bz;
                AluSrcB_reg <= 2'bzz;
                AluControl_reg <= 4'bzzzz;
                PCSrc_reg <= 1'bz;
                RegWrite_reg <= 1'b1;
                Branch_reg <= 1'b0;
                PCWrite_reg <= 1'b0;
                stage <= 0;
            end

            //  Add Immediate (U-type)
            11: begin
                IorD_reg <= 1'bz;
                MemWrite_reg <= 1'b0;
                MtoR_reg <= 2'bzz;
                IRWrite_reg <= 1'b0;
                AluSrcA_reg <= 1'b0;
                AluSrcB_reg <= 2'b10;
                AluControl_reg <= 4'b0000;
                PCSrc_reg <= 1'bz;
                RegWrite_reg <= 1'b0;
                Branch_reg <= 1'b0;
                PCWrite_reg <= 1'b0;
                stage <= 3;
            end

            //  ALU Writeback (I-type (jump))
            12: begin
                IorD_reg <= 1'bz;
                MemWrite_reg <= 1'b0;
                MtoR_reg <= 2'b00;
                IRWrite_reg <= 1'b0;
                AluSrcA_reg <= 1'bz;
                AluSrcB_reg <= 2'bzz;
                AluControl_reg <= 4'bzzzz;
                PCSrc_reg <= 1'b1;
                RegWrite_reg <= 1'b1;
                Branch_reg <= 1'b0;
                PCWrite_reg <= 1'b0;
                stage <= 13;
            end

            //  Jump (I-type (jump))
            13: begin
                IorD_reg <= 1'bz;
                MemWrite_reg <= 1'b0;
                MtoR_reg <= 2'bzz;
                IRWrite_reg <= 1'b0;
                AluSrcA_reg <= 1'b1;
                AluSrcB_reg <= 2'b10;
                AluControl_reg <= 4'b0000;
                PCSrc_reg <= 1'b0;
                RegWrite_reg <= 1'b0;
                Branch_reg <= 1'b0;
                PCWrite_reg <= 1'b1;
                stage <= 0;
            end

            //  ALU Writeback (J-type)
            14: begin
                IorD_reg <= 1'bz;
                MemWrite_reg <= 1'b0;
                MtoR_reg <= 2'b00;
                IRWrite_reg <= 1'b0;
                AluSrcA_reg <= 1'bz;
                AluSrcB_reg <= 2'bzz;
                AluControl_reg <= 4'bzzzz;
                PCSrc_reg <= 1'b1;
                RegWrite_reg <= 1'b1;
                Branch_reg <= 1'b0;
                PCWrite_reg <= 1'b0;
                stage <= 15;
            end

            //  Jump (J-type)
            15: begin
                IorD_reg <= 1'bz;
                MemWrite_reg <= 1'b0;
                MtoR_reg <= 2'bzz;
                IRWrite_reg <= 1'b0;
                AluSrcA_reg <= 1'b0;
                AluSrcB_reg <= 2'b10;
                AluControl_reg <= 4'b0000;
                PCSrc_reg <= 1'b0;
                RegWrite_reg <= 1'b0;
                Branch_reg <= 1'b0;
                PCWrite_reg <= 1'b1;
                stage <= 0;
            end

            //  Condition Check (B-type)
            16: begin
                IorD_reg <= 1'bz;
                MemWrite_reg <= 1'b0;
                MtoR_reg <= 2'bzz;
                IRWrite_reg <= 1'b0;
                AluSrcA_reg <= 1'b1;
                AluSrcB_reg <= 2'b10;
                AluControl_reg <= {1'b1, funct3_reg}; //beq, bne, blt, bge, bltu, bgeu
                PCSrc_reg <= 1'b1;
                RegWrite_reg <= 1'b0;
                Branch_reg <= 1'b1;
                PCWrite_reg <= 1'b0;
                stage <= 17;
            end

            //  PC Update (B-type)
            17: begin
                IorD_reg <= 1'b0;
                MemWrite_reg <= 1'b0;
                MtoR_reg <= 2'bzz;
                IRWrite_reg <= 1'b0;
                AluSrcA_reg <= 1'bz;
                AluSrcB_reg <= 2'bzz;
                AluControl_reg <= 4'bzzzz;
                PCSrc_reg <= 1'bz;
                RegWrite_reg <= 1'b0;
                Branch_reg <= 1'b1;
                PCWrite_reg <= 1'b0;
                stage <= 0;
            end
        endcase
    end
end
endmodule