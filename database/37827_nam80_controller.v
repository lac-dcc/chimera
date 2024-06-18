// This program was cloned from: https://github.com/namberino/nam80
// License: BSD 2-Clause "Simplified" License

module controller(
    input clk,
    input rst,
    input[7:0] opcode,
    input[7:0] flags,
    output[32:0] out
);

    reg[32:0] ctrl_word;
    reg[3:0] stage; // 16 stages max
    reg stage_rst;

    // control signals
    localparam HLT = 0;

    localparam IR_WRITE_EN = 1;

    localparam MEM_MAR_WRITE_EN = 2; 
    localparam MEM_WRITE_EN = 3;
    localparam MEM_OUT_EN = 4;

    localparam REG_WRITE_EN = 5;
    localparam REG_OUT_EN = 6;
    localparam REG_READ_SEL_BIT_0 = 7;
    localparam REG_READ_SEL_BIT_4 = 11;
    localparam REG_WRITE_SEL_BIT_0 = 12;
    localparam REG_WRITE_SEL_BIT_4 = 16;
    localparam REG_EXT_BIT_0 = 17;
    localparam REG_EXT_BIT_1 = 18;

    localparam ALU_OP_BIT0 = 19;
    localparam ALU_OP_BIT4 = 23;
    localparam ALU_OUT_EN = 24;
    localparam ALU_FLAGS_WRITE_EN = 25;
    localparam ALU_FLAGS_OUT_EN = 26;
    localparam ALU_CTRL_SIG = 27;
    localparam ALU_ACC_WRITE_EN = 28;
    localparam ALU_TMP_WRITE_EN = 29;
    localparam ALU_ACT_STORE = 30;
    localparam ALU_ACT_RESTORE = 31;

    localparam DISPLAY = 32;

    // register extended operations
    localparam REG_EXT_INC = 2'b01;
    localparam REG_EXT_DCR = 2'b10;
    localparam REG_EXT_INC2 = 2'b11;

    // register opcodes
    localparam REG_B = 5'b00000;
    localparam REG_C = 5'b00001;
    localparam REG_BC = 5'b10000;

    localparam REG_D = 5'b00010;
    localparam REG_E = 5'b00011;
    localparam REG_DE = 5'b10010;

    localparam REG_H = 5'b00100;
    localparam REG_L = 5'b00101;
    localparam REG_HL = 5'b10100;

    localparam REG_W = 5'b00110;
    localparam REG_Z = 5'b00111;
    localparam REG_WZ = 5'b10110;

    localparam REG_PC_P = 5'b01000;
    localparam REG_PC_C = 5'b01001;
    localparam REG_PC = 5'b11000;

    localparam REG_SP_S = 5'b01010;
    localparam REG_SP_P = 5'b01011;
    localparam REG_SP = 5'b11010;

    // instruction decoding
    always @ (*)
    begin
        ctrl_word = 0;
        stage_rst = 0;

        if (stage == 0)
        begin
            ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_PC;
            ctrl_word[REG_OUT_EN] = 1'b1;
            ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
        end else if (stage == 1)
        begin
            ctrl_word[MEM_OUT_EN] = 1'b1;
            ctrl_word[IR_WRITE_EN] = 1'b1;
        end else if (stage == 2)
        begin
            ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
            ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC;
        end else
        begin
            // handling opcodes
            casez (opcode)
                // HLT
                8'o166:
                begin
                    ctrl_word[HLT] = 1'b1;
                end

                // NOP
                8'o000:
                begin
                    stage_rst = 1'b1;
                end

                // OUT
                8'o323:
                begin
                    if (stage == 3)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC;
                        ctrl_word[DISPLAY] = 1'b1;
                        stage_rst = 1'b1;
                    end
                end

                // MOV M, Ry (Ry = opcode[2:0])
                8'o16?:
                begin
                    if (stage == 3)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_HL;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 4)
                    begin
                        if (opcode[2:0] == 3'b111)
                            ctrl_word[ALU_OUT_EN] = 1'b1;
                        else begin
                            ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = {2'b0, opcode[2:0]};
                            ctrl_word[REG_OUT_EN] = 1'b1;
                        end

                        ctrl_word[MEM_WRITE_EN] = 1'b1;
                        stage_rst = 1'b1;
                    end
                end

                // MOV Rx, M (Rx = opcode[5:3])
                8'o1?6:
                begin
                    if (stage == 3)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_HL;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 4)
                    begin
                        if (opcode[5:3] == 3'b111)
                            ctrl_word[ALU_ACC_WRITE_EN] = 1'b1;
                        else begin
                            ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = {2'b0, opcode[5:3]};
                            ctrl_word[REG_WRITE_EN] = 1'b1;
                        end

                        ctrl_word[MEM_OUT_EN] = 1'b1;
                        stage_rst = 1'b1;
                    end
                end

                // MOV Rx, Ry (Rx = opcode[5:3], Ry = opcode[2:0])
                8'o1??:
                begin
                    if (stage == 3)
                    begin
                        if (opcode[2:0] == 3'b111)
                            ctrl_word[ALU_OUT_EN] = 1'b1;
                        else begin
                            ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = {2'b0, opcode[2:0]};
                            ctrl_word[REG_OUT_EN] = 1'b1;
                        end

                        if (opcode[5:3] == 3'b111)
                            ctrl_word[ALU_ACC_WRITE_EN] = 1'b1;
                        else begin
                            ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = {2'b0, opcode[5:3]};
                            ctrl_word[REG_WRITE_EN] = 1'b1;
                        end

                        stage_rst = 1'b1;
                    end
                end

                // MVI M, d8
                8'o066:
                begin
                    if (stage == 3)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 4)
                    begin
                        ctrl_word[MEM_OUT_EN] = 1'b1;
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_W;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                    end else if (stage == 5)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_HL;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 6)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_W;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_WRITE_EN] = 1'b1;
                    end else if (stage == 7)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC;
                        stage_rst = 1'b1;
                    end
                end

                // MVI Rx, d8 (Rx = opcode[5:3])
                8'o0?6:
                begin
                    if (stage == 3)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 4)
                    begin
                        if (opcode[5:3] == 3'b111)
                            ctrl_word[ALU_ACC_WRITE_EN] = 1'b1;
                        else begin
                            ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = {2'b0, opcode[5:3]};
                            ctrl_word[REG_WRITE_EN] = 1'b1;
                            ctrl_word[MEM_OUT_EN] = 1'b1;
                        end
                    end else if (stage == 5)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC;
                        stage_rst = 1'b1;
                    end
                end

                // INR / DCR (opcode[0] = 1 -> DCR, opcode[0] = 0 -> INR)
                // INR / DCR M
                8'o064, 8'o065:
                begin
                    if (stage == 3)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_HL;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 4)
                    begin
                        ctrl_word[MEM_OUT_EN] = 1'b1;
                        ctrl_word[ALU_ACT_STORE] = 1'b1;
                        ctrl_word[ALU_ACC_WRITE_EN] = 1'b1;
                    end else if (stage == 5)
                    begin
                        ctrl_word[ALU_CTRL_SIG] = 1'b1;
                        ctrl_word[ALU_OP_BIT4:ALU_OP_BIT0] = {4'b1000, opcode[0]};
                    end else if (stage == 6)
                    begin
                        ctrl_word[ALU_OUT_EN] = 1'b1;
                        ctrl_word[ALU_ACT_RESTORE] = 1'b1;
                        ctrl_word[MEM_WRITE_EN] = 1'b1;
                        stage_rst = 1'b1;
                    end
                end

                // INR / DCR Rx (Rx = opcode[5:3])
                8'o0?4, 8'o0?5:
                begin
                    if (stage == 3)
                    begin
                        if (opcode[5:3] == 3'b111) // increment directly and reset stage
                        begin
                            ctrl_word[ALU_CTRL_SIG] = 1'b1;
                            ctrl_word[ALU_OP_BIT4:ALU_OP_BIT0] = {4'b1000, opcode[0]};
                            stage_rst = 1'b1;
                        end else
                        begin
                            ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = {2'b0, opcode[5:3]};
                            ctrl_word[REG_OUT_EN] = 1'b1;
                            ctrl_word[ALU_ACT_STORE] = 1'b1;
                            ctrl_word[ALU_ACC_WRITE_EN] = 1'b1;
                        end
                    end else if (stage == 4)
                    begin
                        ctrl_word[ALU_CTRL_SIG] = 1'b1;
                        ctrl_word[ALU_OP_BIT4:ALU_OP_BIT0] = {4'b1000, opcode[0]};
                    end else if (stage == 5)
                    begin
                        ctrl_word[ALU_OUT_EN] = 1'b1;
                        ctrl_word[ALU_ACT_RESTORE] = 1'b1;
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = {2'b0, opcode[5:3]};
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                        stage_rst = 1'b1;
                    end
                end

                // INX / DCX Rx (Rx = opcode[5:4], opcode[3] = 0 -> INX, opcode[3] = 1 -> DCX)
                8'o0?3:
                begin
                    if (stage == 3)
                    begin
                        if (opcode[5:4] == 2'b11) // if register is SP
                            ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_SP;
                        else
                            ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = {2'b10, opcode[5:4], 1'b0};
                        
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = {opcode[3], ~opcode[3]};
                        stage_rst = 1'b1;
                    end
                end

                // ---------------- //
                // ALU instructions //
                // ---------------- //
                // Arithmetic and logic instructions for M (Operation = opcode[5:3])
                8'o2?6:
                begin
                    if (stage == 3)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_HL;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 4)
                    begin
                        ctrl_word[MEM_OUT_EN] = 1'b1;
                        ctrl_word[ALU_TMP_WRITE_EN] = 1'b1;
                    end else if (stage == 5)
                    begin
                        ctrl_word[ALU_CTRL_SIG] = 1'b1;
                        ctrl_word[ALU_OP_BIT4:ALU_OP_BIT0] = {2'b0, opcode[5:3]};
                        stage_rst = 1'b1;
                    end
                end

                // Arithmetic and logic instructions for Rx (Operation = opcode[5:3], Rx = opcode[2:0])
                8'o2??:
                begin
                    if (stage == 3)
                    begin
                        if (opcode[2:0] == 3'b111) // since ACC is already in ALU
                        begin
                            ctrl_word[ALU_CTRL_SIG] = 1'b1;
                            ctrl_word[ALU_OP_BIT4:ALU_OP_BIT0] = {2'b0, opcode[5:3]};
                            stage_rst = 1'b1;
                        end else
                        begin
                            ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = {2'b0, opcode[2:0]};
                            ctrl_word[REG_OUT_EN] = 1'b1;
                            ctrl_word[ALU_TMP_WRITE_EN] = 1'b1;
                        end
                    end else if (stage == 4)
                    begin
                        ctrl_word[ALU_CTRL_SIG] = 1'b1;
                        ctrl_word[ALU_OP_BIT4:ALU_OP_BIT0] = {2'b0, opcode[5:3]};
                        stage_rst = 1'b1;
                    end
                end

                // Other ALU ACC operations (Operation = opcode[5:3])
                8'o0?7:
                begin
                    if (stage == 3)
                    begin
                        ctrl_word[ALU_CTRL_SIG] = 1'b1;
                        ctrl_word[ALU_OP_BIT4:ALU_OP_BIT0] = {2'b01, opcode[5:3]};
                        stage_rst = 1'b1;
                    end
                end

                // ALU immediate operations (Operation = opcode[5:3])
                8'o3?6:
                begin
                    if (stage == 3)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 4)
                    begin
                        ctrl_word[MEM_OUT_EN] = 1'b1;
                        ctrl_word[ALU_TMP_WRITE_EN] = 1'b1;
                    end else if (stage == 5)
                    begin
                        ctrl_word[ALU_CTRL_SIG] = 1'b1;
                        ctrl_word[ALU_OP_BIT4:ALU_OP_BIT0] = {2'b0, opcode[5:3]};
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC;
                        stage_rst = 1'b1;
                    end
                end

                // LDA / STA a16 (opcode[3] = 0 -> STA, opcode[3] = 1 -> LDA)
                8'o062, 8'o072:
                begin
                    if (stage == 3)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 4)
                    begin
                        ctrl_word[MEM_OUT_EN] = 1'b1;
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_Z;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                    end else if (stage == 5)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC;
                    end else if (stage == 6)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 7)
                    begin
                        ctrl_word[MEM_OUT_EN] = 1'b1;
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_W;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                    end else if (stage == 8)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC;
                    end else if (stage == 9)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_WZ;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 10)
                    begin
                        if (opcode[3] == 0)
                        begin
                            ctrl_word[ALU_OUT_EN] = 1'b1;
                            ctrl_word[MEM_WRITE_EN] = 1'b1;
                        end else
                        begin
                            ctrl_word[ALU_ACC_WRITE_EN] = 1'b1;
                            ctrl_word[MEM_OUT_EN] = 1'b1;
                        end

                        stage_rst = 1'b1;
                    end
                end

                // LDAX / STAX Rx (Rx = opcode[5:4])
                8'o002, 8'o012, 8'o022, 8'o032:
                begin
                    if (stage == 3)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = {2'b0, opcode[5:4], 1'b0};
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_W;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                    end else if (stage == 4)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = {2'b0, opcode[5:4], 1'b1};
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_Z;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                    end else if (stage == 5)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_WZ;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 6)
                    begin
                        if (opcode[3] == 0)
                        begin
                            ctrl_word[ALU_OUT_EN] = 1'b1;
                            ctrl_word[MEM_WRITE_EN] = 1'b1;
                        end else
                        begin
                            ctrl_word[ALU_ACC_WRITE_EN] = 1'b1;
                            ctrl_word[MEM_OUT_EN] = 1'b1;
                        end

                        stage_rst = 1'b1;
                    end
                end

                // LXI Rx, d16 (Rx = opcode[5:4])
                8'o001, 8'o021, 8'o041, 8'o061:
                begin
                    if (stage == 3)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 4)
                    begin
                        ctrl_word[MEM_OUT_EN] = 1'b1;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_Z;
                    end else if (stage == 5)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC;
                    end else if (stage == 6)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 7)
                    begin
                        ctrl_word[MEM_OUT_EN] = 1'b1;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_W;
                    end else if (stage == 8)
                    begin
                        if (opcode[5:4] == 2'b11)
                            ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_SP;
                        else
                            ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = {2'b10, opcode[5:4], 1'b0};

                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_WZ;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                    end else if (stage == 9)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC;
                        stage_rst = 1'b1;
                    end
                end

                // DAD Rx (Rx = opcode[5:4])
                8'o011, 8'o031, 8'o051, 8'o071:
                begin
                    if (stage == 3)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_L;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[ALU_ACT_STORE] = 1'b1;
                        ctrl_word[ALU_ACC_WRITE_EN] = 1'b1;
                    end else if (stage == 4)
                    begin
                        if (opcode[5:4] == 2'b11)
                            ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_SP_P;
                        else
                            ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = {2'b10, opcode[5:4], 1'b1};

                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[ALU_TMP_WRITE_EN] = 1'b1;
                    end else if (stage == 5)
                    begin
                        ctrl_word[ALU_CTRL_SIG] = 1'b1;
                        ctrl_word[ALU_OP_BIT4:ALU_OP_BIT0] = 5'b00000; // ADD opcode
                    end else if (stage == 6)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_Z;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                        ctrl_word[ALU_OUT_EN] = 1'b1;
                    end else if (stage == 7)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_H;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[ALU_ACC_WRITE_EN] = 1'b1;
                    end else if (stage == 8)
                    begin
                        if (opcode[5:4] == 2'b11)
                            ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_SP_S;
                        else
                            ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = {2'b10, opcode[5:4], 1'b0};
                        
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[ALU_TMP_WRITE_EN] = 1'b1;
                    end else if (stage == 9)
                    begin
                        ctrl_word[ALU_CTRL_SIG] = 1'b1;
                        ctrl_word[ALU_OP_BIT4:ALU_OP_BIT0] = 5'b00001; // ADC opcode
                    end else if (stage == 10)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_W;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                        ctrl_word[ALU_OUT_EN] = 1'b1;
                        ctrl_word[ALU_ACT_RESTORE] = 1'b1;
                    end else if (stage == 11)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_HL;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_WZ;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        stage_rst = 1'b1;
                    end
                end

                // JMP a16
                8'o303:
                begin
                    if (stage == 3)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 4)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_Z;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                        ctrl_word[MEM_OUT_EN] = 1'b1;
                    end else if (stage == 5)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC;
                    end else if (stage == 6)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 7)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_W;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                        ctrl_word[MEM_OUT_EN] = 1'b1;
                    end else if (stage == 8)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_WZ;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        stage_rst = 1'b1;
                    end
                end

                // CALL a16
                8'o315:
                begin
                    if (stage == 3)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 4)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_Z;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                        ctrl_word[MEM_OUT_EN] = 1'b1;
                    end else if (stage == 5)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC;
                    end else if (stage == 6)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 7)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_W;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                        ctrl_word[MEM_OUT_EN] = 1'b1;
                    end else if (stage == 8)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC;
                    end else if (stage == 9)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_SP;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_DCR;
                    end else if (stage == 10)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_SP;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 11)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_PC_C;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_WRITE_EN] = 1'b1;
                    end else if (stage == 12)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_SP;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_DCR;
                    end else if (stage == 13)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_SP;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 14)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_PC_P;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_WRITE_EN] = 1'b1;
                    end else if (stage == 15)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_WZ;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        stage_rst = 1'b1;
                    end
                end

                // RET
                8'o311:
                begin
                    if (stage == 3)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_SP;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 4)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_W;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                        ctrl_word[MEM_OUT_EN] = 1'b1;
                    end else if (stage == 5)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_SP;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC;
                    end else if (stage == 6)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_SP;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 7)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_Z;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                        ctrl_word[MEM_OUT_EN] = 1'b1;
                    end else if (stage == 8)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_SP;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC;
                    end else if (stage == 9)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_WZ;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        stage_rst = 1'b1;
                    end
                end

                // Conditional jump (flags = opcode[5:4], opcode[3] = 0 -> unset, opcode[3] = 1 -> set)
                8'o3?2:
                begin
                    if (stage == 3)
                    begin
                        if (flags[opcode[5:4]] != opcode[3]) // if doesn't meet condition
                        begin
                            ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
                            ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC2; // skip the other 2 bytes
                            stage_rst = 1'b1;
                        end else 
                        begin
                            ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_PC;
                            ctrl_word[REG_OUT_EN] = 1'b1;
                            ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                        end
                    end else if (stage == 4)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_Z;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                        ctrl_word[MEM_OUT_EN] = 1'b1;
                    end else if (stage == 5)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC;
                    end else if (stage == 6)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 7)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_W;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                        ctrl_word[MEM_OUT_EN] = 1'b1;
                    end else if (stage == 8)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_WZ;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                        stage_rst = 1'b1;
                    end
                end

                // Conditional call (flags = opcode[5:4], opcode[3] = 0 -> unset, opcode[3] = 1 -> set)
                8'o3?4:
                begin
                    if (stage == 3)
                    begin
                        if (flags[opcode[5:4]] != opcode[3]) // if doesn't meet condition
                        begin
                            ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
                            ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC2; // skip the other 2 bytes
                            stage_rst = 1'b1;
                        end else 
                        begin
                            ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_PC;
                            ctrl_word[REG_OUT_EN] = 1'b1;
                            ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                        end
                    end else if (stage == 4)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_Z;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                        ctrl_word[MEM_OUT_EN] = 1'b1;
                    end else if (stage == 5)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC;
                    end else if (stage == 6)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 7)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_W;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                        ctrl_word[MEM_OUT_EN] = 1'b1;
                    end else if (stage == 8)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC;
                    end else if (stage == 9)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_SP;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_DCR;
                    end else if (stage == 10)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_SP;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 11)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_PC_C;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_WRITE_EN] = 1'b1;
                    end else if (stage == 12)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_SP;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_DCR;
                    end else if (stage == 13)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_SP;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 14)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_PC_P;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_WRITE_EN] = 1'b1;
                    end else if (stage == 15)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_WZ;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                        stage_rst = 1'b1;
                    end
                end

                // Conditional return (flags = opcode[5:4], opcode[3] = 0 -> unset, opcode[3] = 1 -> set)
                8'o3?0:
                begin
                    if (stage == 3)
                    begin
                        if (flags[opcode[5:4]] != opcode[3]) // if doesn't meet condition
                        begin
                            stage_rst = 1'b1;
                        end else 
                        begin
                            ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_SP;
                            ctrl_word[REG_OUT_EN] = 1'b1;
                            ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                        end
                    end else if (stage == 4)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_W;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                        ctrl_word[MEM_OUT_EN] = 1'b1;
                    end else if (stage == 5)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_SP;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC;
                    end else if (stage == 6)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_SP;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 7)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_Z;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                        ctrl_word[MEM_OUT_EN] = 1'b1;
                    end else if (stage == 8)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_SP;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC;
                    end else if (stage == 9)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_WZ;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                        stage_rst = 1'b1;
                    end
                end

                // opcode[2:0] = 001 -> POP, opcode[2:0] = 101 -> PUSH
                // PUSH Rx (Rx = opcode[5:4])
                // PSW: Push Status Word (flags and ACC)
                8'o305, 8'o325, 8'o345, 8'o365:
                begin
                    if (stage == 3)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_SP;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_DCR;
                    end else if (stage == 4)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_SP;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 5)
                    begin
                        if (opcode[5:4] == 2'b11) // if PSW
                            ctrl_word[ALU_OUT_EN] = 1'b1;
                        else
                        begin
                            ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = {2'b0, opcode[5:4], 1'b0};
                            ctrl_word[REG_OUT_EN] = 1'b1;
                        end

                        ctrl_word[MEM_WRITE_EN] = 1'b1;
                    end else if (stage == 6)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_SP;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_DCR;
                    end else if (stage == 7)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_SP;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 8)
                    begin
                        if (opcode[5:4] == 2'b11) // if PSW
                            ctrl_word[ALU_FLAGS_OUT_EN] = 1'b1;
                        else
                        begin
                            ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = {2'b0, opcode[5:4], 1'b1};
                            ctrl_word[REG_OUT_EN] = 1'b1;
                        end

                        ctrl_word[MEM_WRITE_EN] = 1'b1;
                        stage_rst = 1'b1;
                    end
                end

                // POP Rx (Rx = opcode[5:4])
                // PSW: Pop Status Word (flags and ACC)
                8'o301, 8'o321, 8'o341, 8'o361:
                begin
                    if (stage == 3)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_SP;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 4)
                    begin
                        if (opcode[5:4] == 2'b11) // if PSW
                            ctrl_word[ALU_FLAGS_WRITE_EN] = 1'b1;
                        else
                        begin
                            ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = {2'b0, opcode[5:4], 1'b1};
                            ctrl_word[REG_WRITE_EN] = 1'b1;
                        end

                        ctrl_word[MEM_OUT_EN] = 1'b1;
                    end else if (stage == 5)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_SP;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC;
                    end else if (stage == 6)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_SP;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 7)
                    begin
                        if (opcode[5:4] == 2'b11) // if PSW
                            ctrl_word[ALU_ACC_WRITE_EN] = 1'b1;
                        else
                        begin
                            ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = {2'b0, opcode[5:4], 1'b0};
                            ctrl_word[REG_WRITE_EN] = 1'b1;
                        end
                        
                        ctrl_word[MEM_OUT_EN] = 1'b1;
                    end else if (stage == 8)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_SP;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC;
                        stage_rst = 1'b1;
                    end
                end

                // SHLD / LHLD a16 (opcode[3] = 0 -> SHLD, opcode[3] = 1 -> LHLD)
                8'o042, 8'o052:
                begin
                    if (stage == 3)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 4)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_Z;
                        ctrl_word[MEM_OUT_EN] = 1'b1;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                    end else if (stage == 5)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC;
                    end else if (stage == 6)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 7)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_W;
                        ctrl_word[MEM_OUT_EN] = 1'b1;
                        ctrl_word[REG_WRITE_EN] = 1'b1;
                    end else if (stage == 8)
                    begin
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_PC;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC;
                    end else if (stage == 9)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_WZ; // address
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 10)
                    begin
                        if (opcode[3] == 0)
                        begin
                            ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_H;
                            ctrl_word[REG_OUT_EN] = 1'b1;
                            ctrl_word[MEM_WRITE_EN] = 1'b1;
                        end else
                        begin
                            ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_H;
                            ctrl_word[REG_WRITE_EN] = 1'b1;
                            ctrl_word[MEM_OUT_EN] = 1'b1;
                        end
                    end else if (stage == 11)
                    begin // access next address
                        ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_WZ;
                        ctrl_word[REG_EXT_BIT_1:REG_EXT_BIT_0] = REG_EXT_INC;
                    end else if (stage == 12)
                    begin
                        ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_WZ; // address
                        ctrl_word[REG_OUT_EN] = 1'b1;
                        ctrl_word[MEM_MAR_WRITE_EN] = 1'b1;
                    end else if (stage == 13)
                    begin
                        if (opcode[3] == 0)
                        begin
                            ctrl_word[REG_READ_SEL_BIT_4:REG_READ_SEL_BIT_0] = REG_L;
                            ctrl_word[REG_OUT_EN] = 1'b1;
                            ctrl_word[MEM_WRITE_EN] = 1'b1;
                        end else
                        begin
                            ctrl_word[REG_WRITE_SEL_BIT_4:REG_WRITE_SEL_BIT_0] = REG_L;
                            ctrl_word[REG_WRITE_EN] = 1'b1;
                            ctrl_word[MEM_OUT_EN] = 1'b1;
                        end

                        stage_rst = 1'b1;
                    end
                end
            endcase
        end
    end

    // stage reset logic
    always @ (negedge clk, posedge rst)
    begin
        if (rst)
            stage <= 0;
        else
        begin
            if (stage_rst) 
                stage <= 0;
            else 
                stage <= stage + 1;
        end
    end

    assign out = ctrl_word;

endmodule
