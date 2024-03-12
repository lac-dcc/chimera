`include "defines.v"

module id(
    input  wire                      reset,
    input  wire[`AddressBus]         pc_input,
    input  wire[`DataBus]            instruction_input,

    input  wire                      ex_wreg_input,
    input  wire[`RegisterBus]        ex_wdata_input,
    input  wire[`RegisterAddressBus] ex_wd_input,

    input  wire                      mem_wreg_input,
    input  wire[`RegisterBus]        mem_wdata_input,
    input  wire[`RegisterAddressBus] mem_wd_input,

    input  wire[`RegisterBus]        reg1_data_input,
    input  wire[`RegisterBus]        reg2_data_input,

    output reg                       reg1_read_output,
    output reg                       reg2_read_output,
    output reg[`RegisterAddressBus]  reg1_addr_output,
    output reg[`RegisterAddressBus]  reg2_addr_output,

    output reg[`ALUOpBus]            aluop_output,
    output reg[`ALUSelBus]           alusel_output,
    output reg[`RegisterBus]         reg1_output,
    output reg[`RegisterBus]         reg2_output,
    output reg[`RegisterAddressBus]  wd_output,
    output reg                       wreg_output
);

    wire[5:0] op  = instruction_input[31:26];   // opcode
    wire[4:0] op2 = instruction_input[10:6];
    wire[5:0] op3 = instruction_input[5:0];     // function code
    wire[4:0] op4 = instruction_input[20:16];

    reg[`RegisterBus] imm;
    reg instruction_valid;

    always @ (*) begin
        if (reset == `ResetEnable) begin
            aluop_output <= `EXE_NOP_OP;
            alusel_output <= `EXE_RES_NOP;
            wd_output <= `NOPRegisterAddress;
            wreg_output <= `WriteDisable;
            instruction_valid <= `InstructionValid;
            reg1_read_output <= 1'b0;
            reg2_read_output <= 1'b0;
            reg1_addr_output <= `NOPRegisterAddress;
            reg2_addr_output <= `NOPRegisterAddress;
            imm <= 32'h0;
        end else begin
            aluop_output <= `EXE_NOP_OP;
            alusel_output <= `EXE_RES_NOP;
            wd_output <= instruction_input[15:11];
            wreg_output <= `WriteDisable;
            instruction_valid <= `InstructionValid;
            reg1_read_output <= 1'b0;
            reg2_read_output <= 1'b0;
            reg1_addr_output <= instruction_input[25:21];
            reg2_addr_output <= instruction_input[20:16];
            imm <= `ZeroWord;
            
            case (op)
                `EXE_SPECIAL_INST: begin
                    case (op2)
                        5'b00000: begin
                            case (op3)
                                `EXE_OR: begin
                                    wreg_output <= `WriteEnable;
                                    aluop_output <= `EXE_OR_OP;
                                    alusel_output <= `EXE_RES_LOGIC;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_AND: begin
                                    wreg_output <= `WriteEnable;
                                    aluop_output <= `EXE_AND_OP;
                                    alusel_output <= `EXE_RES_LOGIC;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_XOR: begin
                                    wreg_output <= `WriteEnable;
                                    aluop_output <= `EXE_XOR_OP;
                                    alusel_output <= `EXE_RES_LOGIC;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_NOR: begin
                                    wreg_output <= `WriteEnable;
                                    aluop_output <= `EXE_NOR_OP;
                                    alusel_output <= `EXE_RES_LOGIC;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_SLLV: begin
                                    wreg_output <= `WriteEnable;
                                    aluop_output <= `EXE_SLL_OP;
                                    alusel_output <= `EXE_RES_SHIFT;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_SRLV: begin
                                    wreg_output <= `WriteEnable;
                                    aluop_output <= `EXE_SRL_OP;
                                    alusel_output <= `EXE_RES_SHIFT;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_SRAV: begin
                                    wreg_output <= `WriteEnable;
                                    aluop_output <= `EXE_SRA_OP;
                                    alusel_output <= `EXE_RES_SHIFT;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_SYNC: begin
                                    wreg_output <= `WriteDisable;
                                    aluop_output <= `EXE_NOP_OP;
                                    alusel_output <= `EXE_RES_NOP;
                                    reg1_read_output <= 1'b0;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                default: begin
                                end
                            endcase
                        end
                        default: begin
                        end
                    endcase
                end
                `EXE_ORI: begin
                    wreg_output <= `WriteEnable;
                    aluop_output <= `EXE_OR_OP;
                    alusel_output <= `EXE_RES_LOGIC;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b0;
                    imm <= {16'h0, instruction_input[15:0]};
                    wd_output <= instruction_input[20:16];
                    instruction_valid <= `InstructionValid;
                end
                `EXE_ANDI: begin
                    wreg_output <= `WriteEnable;
                    aluop_output <= `EXE_AND_OP;
                    alusel_output <= `EXE_RES_LOGIC;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b0;
                    imm <= {16'h0, instruction_input[15:0]};
                    wd_output <= instruction_input[20:16];
                    instruction_valid <= `InstructionValid;
                end
                `EXE_XORI: begin
                    wreg_output <= `WriteEnable;
                    aluop_output <= `EXE_XOR_OP;
                    alusel_output <= `EXE_RES_LOGIC;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b0;
                    imm <= {16'h0, instruction_input[15:0]};
                    wd_output <= instruction_input[20:16];
                    instruction_valid <= `InstructionValid;
                end
                `EXE_LUI: begin
                    wreg_output <= `WriteEnable;
                    aluop_output <= `EXE_OR_OP;
                    alusel_output <= `EXE_RES_LOGIC;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b0;
                    imm <= {instruction_input[15:0], 16'h0};
                    wd_output <= instruction_input[20:16];
                    instruction_valid <= `InstructionValid;
                end
                `EXE_PREF: begin
                    wreg_output <= `WriteDisable;
                    aluop_output <= `EXE_NOP_OP;
                    alusel_output <= `EXE_RES_NOP;
                    reg1_read_output <= 1'b0;
                    reg2_read_output <= 1'b0;
                    instruction_valid <= `InstructionValid;
                end
                default: begin
                end
            endcase

            if (instruction_input[31:21] == 11'b00000000000) begin
                if (op3 == `EXE_SLL) begin
                    wreg_output <= `WriteEnable;
                    aluop_output <= `EXE_SLL_OP;
                    alusel_output <= `EXE_RES_SHIFT;
                    reg1_read_output <= 1'b0;
                    reg2_read_output <= 1'b1;
                    imm[4:0] <= instruction_input[10:6];
                    wd_output <= instruction_input[15:11];
                    instruction_valid <= `InstructionValid;
                end else if (op3 == `EXE_SRL) begin
                    wreg_output <= `WriteEnable;
                    aluop_output <= `EXE_SRL_OP;
                    alusel_output <= `EXE_RES_SHIFT;
                    reg1_read_output <= 1'b0;
                    reg2_read_output <= 1'b1;
                    imm[4:0] <= instruction_input[10:6];
                    wd_output <= instruction_input[15:11];
                    instruction_valid <= `InstructionValid;
                end else if (op3 == `EXE_SRA) begin
                    wreg_output <= `WriteEnable;
                    aluop_output <= `EXE_SRA_OP;
                    alusel_output <= `EXE_RES_SHIFT;
                    reg1_read_output <= 1'b0;
                    reg2_read_output <= 1'b1;
                    imm[4:0] <= instruction_input[10:6];
                    wd_output <= instruction_input[15:11];
                    instruction_valid <= `InstructionValid;
                end
            end

        end
    end

    always @ (*) begin
        if (reset == `ResetEnable) begin
            reg1_output <= `ZeroWord;
        end else if ((reg1_read_output == 1'b1) &&
                    (ex_wreg_input == 1'b1) &&
                    (ex_wd_input == reg1_addr_output)) begin
            reg1_output <= ex_wdata_input;
        end else if ((reg1_read_output == 1'b1) &&
                    (mem_wreg_input == 1'b1) &&
                    (mem_wd_input == reg1_addr_output)) begin
            reg1_output <= mem_wdata_input;
        end else if (reg1_read_output == 1'b1) begin
            reg1_output <= reg1_data_input;
        end else if (reg1_read_output == 1'b0) begin
            reg1_output <= imm;
        end else begin
            reg1_output <= `ZeroWord;
        end
    end

    always @ (*) begin
        if (reset == `ResetEnable) begin
            reg2_output <= `ZeroWord;
        end else if ((reg2_read_output == 1'b1) &&
                    (ex_wreg_input == 1'b1) &&
                    (ex_wd_input == reg2_addr_output)) begin
            reg2_output <= ex_wdata_input;
        end else if ((reg2_read_output == 1'b1) &&
                    (mem_wreg_input == 1'b1) &&
                    (mem_wd_input == reg2_addr_output)) begin
            reg2_output <= mem_wdata_input;
        end else if (reg2_read_output == 1'b1) begin
            reg2_output <= reg2_data_input;
        end else if (reg2_read_output == 1'b0) begin
            reg2_output <= imm;
        end else begin
            reg2_output <= `ZeroWord;
        end
    end
     
endmodule