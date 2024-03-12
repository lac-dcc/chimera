`include "defines.v"

module id(
    input  wire                         reset,
    input  wire[`InstructionAddressBus] program_counter_input,
    input  wire[`InstructionBus]        instruction_input,

    input  wire[`ALUOpBus]              ex_aluop_input,
    input  wire                         ex_write_reg_enable_intput,
    input  wire[`RegisterBus]           ex_write_reg_data_input,
    input  wire[`RegisterAddressBus]    ex_write_reg_address_intput,

    input  wire                         mem_write_reg_enable_input,
    input  wire[`RegisterBus]           mem_write_reg_data_input,
    input  wire[`RegisterAddressBus]    mem_write_reg_address_input,
    
    input  wire[`RegisterBus]           reg1_data_input,
    input  wire[`RegisterBus]           reg2_data_input,
    
    input  wire                         is_in_delay_slot_input,
    
    output reg                          reg1_read_output,
    output reg                          reg2_read_output,
    output reg[`RegisterAddressBus]     reg1_address_output,
    output reg[`RegisterAddressBus]     reg2_address_output,
    
    output reg[`ALUOpBus]               aluop_output,
    output reg[`ALUSelBus]              alusel_output,
    output wire[`RegisterBus]           instruction_ouput,
    output reg[`RegisterBus]            reg1_output,
    output reg[`RegisterBus]            reg2_output,
    output reg[`RegisterAddressBus]     write_reg_address_output,
    output reg                          write_reg_enable_output,
    
    output wire                         stop_all_req_from_id,
    
    output reg                          next_instrcution_in_delay_slot_output,
    output reg[`RegisterBus]            branch_address_output,
    output reg[`RegisterBus]            link_address_output,
    output reg                          is_in_delay_slot_output,
    
    output reg                          is_branch_output
);

    wire[5:0] op  = instruction_input[31:26];   // opcode
    wire[4:0] op2 = instruction_input[10:6];
    wire[5:0] op3 = instruction_input[5:0];     // function code
    wire[4:0] op4 = instruction_input[20:16];

    reg[`RegisterBus]  imm;
    reg                instruction_valid;
    wire[`RegisterBus] program_counter_plus_8;
    wire[`RegisterBus] program_counter_plus_4;
    wire[`RegisterBus] imm_sll2_signedext;
    wire               pre_instruction_is_load;
    reg                stop_all_req_for_reg1_loadrelate;
    reg                stop_all_req_for_reg2_loadrelate;

    assign program_counter_plus_8 = program_counter_input + 8;
    assign program_counter_plus_4 = program_counter_input + 4;
    assign imm_sll2_signedext =     {{14{instruction_input[15]}}, instruction_input[15:0], 2'b00};
    assign stop_all_req_from_id = stop_all_req_for_reg1_loadrelate | stop_all_req_for_reg2_loadrelate;
    assign pre_instruction_is_load = ((ex_aluop_input == `EXE_LB_OP) || 
                                    (ex_aluop_input == `EXE_LBU_OP) ||
                                    (ex_aluop_input == `EXE_LH_OP)  ||
                                    (ex_aluop_input == `EXE_LHU_OP) ||
                                    (ex_aluop_input == `EXE_LW_OP) ||
                                    (ex_aluop_input == `EXE_LWR_OP) ||
                                    (ex_aluop_input == `EXE_LWL_OP) ||
                                    (ex_aluop_input == `EXE_LL_OP) ||
                                    (ex_aluop_input == `EXE_SC_OP)) ? 1'b1 : 1'b0;

    assign instruction_ouput = instruction_input;

    always @ (*) begin
        if (reset == `ResetEnable) begin
            aluop_output <= `EXE_NOP_OP;
            alusel_output <= `EXE_RES_NOP;
            write_reg_address_output <= `NOPRegisterAddress;
            write_reg_enable_output <= `WriteDisable;
            instruction_valid <= `InstructionValid;
            reg1_read_output <= 1'b0;
            reg2_read_output <= 1'b0;
            reg1_address_output <= `NOPRegisterAddress;
            reg2_address_output <= `NOPRegisterAddress;
            imm <= 32'h0;
            link_address_output <= `ZeroWord;
            branch_address_output <= `ZeroWord;
            is_branch_output <= `NotBranch;
            next_instrcution_in_delay_slot_output <= `NotInDelaySlot;
        end else begin
            aluop_output <= `EXE_NOP_OP;
            alusel_output <= `EXE_RES_NOP;
            write_reg_address_output <= instruction_input[15:11];
            write_reg_enable_output <= `WriteDisable;
            instruction_valid <= `InstructionValid;
            reg1_read_output <= 1'b0;
            reg2_read_output <= 1'b0;
            reg1_address_output <= instruction_input[25:21];
            reg2_address_output <= instruction_input[20:16];
            imm <= `ZeroWord;
            link_address_output <= `ZeroWord;
            branch_address_output <= `ZeroWord;
            is_branch_output <= `NotBranch;
            next_instrcution_in_delay_slot_output <= `NotInDelaySlot;
            case (op)
                `EXE_SPECIAL_INST: begin
                    case (op2)
                        5'b00000: begin
                            case (op3)
                                `EXE_OR: begin
                                    write_reg_enable_output <= `WriteEnable;
                                    aluop_output <= `EXE_OR_OP;
                                    alusel_output <= `EXE_RES_LOGIC;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_AND: begin
                                    write_reg_enable_output <= `WriteEnable;
                                    aluop_output <= `EXE_AND_OP;
                                    alusel_output <= `EXE_RES_LOGIC;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_XOR: begin
                                    write_reg_enable_output <= `WriteEnable;
                                    aluop_output <= `EXE_XOR_OP;
                                    alusel_output <= `EXE_RES_LOGIC;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_NOR: begin
                                    write_reg_enable_output <= `WriteEnable;
                                    aluop_output <= `EXE_NOR_OP;
                                    alusel_output <= `EXE_RES_LOGIC;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_SLLV: begin
                                    write_reg_enable_output <= `WriteEnable;
                                    aluop_output <= `EXE_SLL_OP;
                                    alusel_output <= `EXE_RES_SHIFT;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_SRLV: begin
                                    write_reg_enable_output <= `WriteEnable;
                                    aluop_output <= `EXE_SRL_OP;
                                    alusel_output <= `EXE_RES_SHIFT;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_SRAV: begin
                                    write_reg_enable_output <= `WriteEnable;
                                    aluop_output <= `EXE_SRA_OP;
                                    alusel_output <= `EXE_RES_SHIFT;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_SYNC: begin
                                    write_reg_enable_output <= `WriteDisable;
                                    aluop_output <= `EXE_NOP_OP;
                                    alusel_output <= `EXE_RES_NOP;
                                    reg1_read_output <= 1'b0;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_MFHI: begin
                                    write_reg_enable_output <= `WriteEnable;
                                    aluop_output <= `EXE_MFHI_OP;
                                    alusel_output <= `EXE_RES_MOVE;
                                    reg1_read_output <= 1'b0;
                                    reg2_read_output <= 1'b0;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_MFLO: begin
                                    write_reg_enable_output <= `WriteEnable;
                                    aluop_output <= `EXE_MFLO_OP;
                                    alusel_output <= `EXE_RES_MOVE;
                                    reg1_read_output <= 1'b0;
                                    reg2_read_output <= 1'b0;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_MTHI: begin
                                    write_reg_enable_output <= `WriteDisable;
                                    aluop_output <= `EXE_MTHI_OP;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b0;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_MTLO: begin
                                    write_reg_enable_output <= `WriteDisable;
                                    aluop_output <= `EXE_MTLO_OP;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b0;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_MOVN: begin
                                    aluop_output <= `EXE_MOVN_OP;
                                    alusel_output <= `EXE_RES_MOVE;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                    if (reg2_output != `ZeroWord) begin
                                        write_reg_enable_output <= `WriteEnable;
                                    end else begin
                                        write_reg_enable_output <= `WriteDisable;
                                    end
                                end
                                `EXE_MOVZ: begin
                                    aluop_output <= `EXE_MOVZ_OP;
                                    alusel_output <= `EXE_RES_MOVE;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                    if (reg2_output == `ZeroWord) begin
                                        write_reg_enable_output <= `WriteEnable;
                                    end else begin
                                        write_reg_enable_output <= `WriteDisable;
                                    end
                                end
                                `EXE_SLT: begin
                                    write_reg_enable_output <= `WriteEnable;
                                    aluop_output <= `EXE_SLT_OP;
                                    alusel_output <= `EXE_RES_ARITHMETIC;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_SLTU: begin
                                    write_reg_enable_output <= `WriteEnable;
                                    aluop_output <= `EXE_SLTU_OP;
                                    alusel_output <= `EXE_RES_ARITHMETIC;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_ADD: begin
                                    write_reg_enable_output <= `WriteEnable;
                                    aluop_output <= `EXE_ADD_OP;
                                    alusel_output <= `EXE_RES_ARITHMETIC;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_ADDU: begin
                                    write_reg_enable_output <= `WriteEnable;
                                    aluop_output <= `EXE_ADDU_OP;
                                    alusel_output <= `EXE_RES_ARITHMETIC;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_SUB: begin
                                    write_reg_enable_output <= `WriteEnable;
                                    aluop_output <= `EXE_SUB_OP;
                                    alusel_output <= `EXE_RES_ARITHMETIC;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_SUBU: begin
                                    write_reg_enable_output <= `WriteEnable;
                                    aluop_output <= `EXE_SUBU_OP;
                                    alusel_output <= `EXE_RES_ARITHMETIC;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_MULT: begin
                                    write_reg_enable_output <= `WriteDisable;
                                    aluop_output <= `EXE_MULT_OP;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_MULTU: begin
                                    write_reg_enable_output <= `WriteDisable;
                                    aluop_output <= `EXE_MULTU_OP;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_DIV: begin
                                    write_reg_enable_output <= `WriteDisable;
                                    aluop_output <= `EXE_DIV_OP;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_DIVU: begin
                                    write_reg_enable_output <= `WriteDisable;
                                    aluop_output <= `EXE_DIVU_OP;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b1;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_JR: begin
                                    write_reg_enable_output <= `WriteDisable;
                                    aluop_output <= `EXE_JR_OP;
                                    alusel_output <= `EXE_RES_JUMP_BRANCH;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b0;
                                    link_address_output <= `ZeroWord;
                                    branch_address_output <= reg1_output;
                                    is_branch_output <= `Branch;
                                    next_instrcution_in_delay_slot_output <= `InDelaySlot;
                                    instruction_valid <= `InstructionValid;
                                end
                                `EXE_JALR: begin
                                    write_reg_enable_output <= `WriteEnable;
                                    aluop_output <= `EXE_JALR_OP;
                                    alusel_output <= `EXE_RES_JUMP_BRANCH;
                                    reg1_read_output <= 1'b1;
                                    reg2_read_output <= 1'b0;
                                    write_reg_address_output <= instruction_input[15:11];
                                    link_address_output <= program_counter_plus_8;
                                    branch_address_output <= reg1_output;
                                    is_branch_output <= `Branch;
                                    next_instrcution_in_delay_slot_output <= `InDelaySlot;
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
                    write_reg_enable_output <= `WriteEnable;
                    aluop_output <= `EXE_OR_OP;
                    alusel_output <= `EXE_RES_LOGIC;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b0;
                    imm <= {16'h0, instruction_input[15:0]};
                    write_reg_address_output <= instruction_input[20:16];
                    instruction_valid <= `InstructionValid;
                end
                `EXE_ANDI: begin
                    write_reg_enable_output <= `WriteEnable;
                    aluop_output <= `EXE_AND_OP;
                    alusel_output <= `EXE_RES_LOGIC;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b0;
                    imm <= {16'h0, instruction_input[15:0]};
                    write_reg_address_output <= instruction_input[20:16];
                    instruction_valid <= `InstructionValid;
                end
                `EXE_XORI: begin
                    write_reg_enable_output <= `WriteEnable;
                    aluop_output <= `EXE_XOR_OP;
                    alusel_output <= `EXE_RES_LOGIC;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b0;
                    imm <= {16'h0, instruction_input[15:0]};
                    write_reg_address_output <= instruction_input[20:16];
                    instruction_valid <= `InstructionValid;
                end
                `EXE_LUI: begin
                    write_reg_enable_output <= `WriteEnable;
                    aluop_output <= `EXE_OR_OP;
                    alusel_output <= `EXE_RES_LOGIC;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b0;
                    imm <= {instruction_input[15:0], 16'h0};
                    write_reg_address_output <= instruction_input[20:16];
                    instruction_valid <= `InstructionValid;
                end
                `EXE_PREF: begin
                    write_reg_enable_output <= `WriteDisable;
                    aluop_output <= `EXE_NOP_OP;
                    alusel_output <= `EXE_RES_NOP;
                    reg1_read_output <= 1'b0;
                    reg2_read_output <= 1'b0;
                    instruction_valid <= `InstructionValid;
                end
                `EXE_SLTI: begin
                    write_reg_enable_output <= `WriteEnable;
                    aluop_output <= `EXE_SLT_OP;
                    alusel_output <= `EXE_RES_ARITHMETIC;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b0;
                    imm <= {{16{instruction_input[15]}}, instruction_input[15:0]};
                    write_reg_address_output <= instruction_input[20:16];
                    instruction_valid <= `InstructionValid;
                end
                `EXE_SLTIU: begin
                    write_reg_enable_output <= `WriteEnable;
                    aluop_output <= `EXE_SLTU_OP;
                    alusel_output <= `EXE_RES_ARITHMETIC;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b0;
                    imm <= {{16{instruction_input[15]}}, instruction_input[15:0]};
                    write_reg_address_output <= instruction_input[20:16];
                    instruction_valid <= `InstructionValid;
                end
                `EXE_ADDI: begin
                    write_reg_enable_output <= `WriteEnable;
                    aluop_output <= `EXE_ADDI_OP;
                    alusel_output <= `EXE_RES_ARITHMETIC;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b0;
                    imm <= {{16{instruction_input[15]}}, instruction_input[15:0]};
                    write_reg_address_output <= instruction_input[20:16];
                    instruction_valid <= `InstructionValid;
                end
                `EXE_ADDIU: begin
                    write_reg_enable_output <= `WriteEnable;
                    aluop_output <= `EXE_ADDIU_OP;
                    alusel_output <= `EXE_RES_ARITHMETIC;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b0;
                    imm <= {{16{instruction_input[15]}}, instruction_input[15:0]};
                    write_reg_address_output <= instruction_input[20:16];
                    instruction_valid <= `InstructionValid;
                end
                `EXE_J: begin
                    write_reg_enable_output <= `WriteDisable;
                    aluop_output <= `EXE_J_OP;
                    alusel_output <= `EXE_RES_JUMP_BRANCH;
                    reg1_read_output <= 1'b0;
                    reg2_read_output <= 1'b0;
                    link_address_output <= `ZeroWord;
                    is_branch_output <= `Branch;
                    next_instrcution_in_delay_slot_output <= `InDelaySlot;
                    instruction_valid <= `InstructionValid;
                    branch_address_output <= {program_counter_plus_4[31:28], instruction_input[25:0], 2'b00};
                end
                `EXE_JAL: begin
                    write_reg_enable_output <= `WriteEnable;
                    aluop_output <= `EXE_JAL_OP;
                    alusel_output <= `EXE_RES_JUMP_BRANCH;
                    reg1_read_output <= 1'b0;
                    reg2_read_output <= 1'b0;
                    write_reg_address_output <= 5'b11111;
                    link_address_output <= program_counter_plus_8;
                    is_branch_output <= `Branch;
                    next_instrcution_in_delay_slot_output <= `InDelaySlot;
                    instruction_valid <= `InstructionValid;
                    branch_address_output <= {program_counter_plus_4[31:28], instruction_input[25:0], 2'b00};
                end
                `EXE_BEQ: begin
                    write_reg_enable_output <= `WriteDisable;
                    aluop_output <= `EXE_BEQ_OP;
                    alusel_output <= `EXE_RES_JUMP_BRANCH;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b1;
                    instruction_valid <= `InstructionValid;
                    if (reg1_output == reg2_output) begin
                        branch_address_output <= program_counter_plus_4 + imm_sll2_signedext;
                        is_branch_output <= `Branch;
                        next_instrcution_in_delay_slot_output <= `InDelaySlot;
                    end
                end
                `EXE_BGTZ: begin
                    write_reg_enable_output <= `WriteDisable;
                    aluop_output <= `EXE_BGTZ_OP;
                    alusel_output <= `EXE_RES_JUMP_BRANCH;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b0;
                    instruction_valid <= `InstructionValid;
                    if (reg1_output[31] == 1'b0 && reg1_output != `ZeroWord) begin
                        branch_address_output <= program_counter_plus_4 + imm_sll2_signedext;
                        is_branch_output <= `Branch;
                        next_instrcution_in_delay_slot_output <= `InDelaySlot;
                    end
                end
                `EXE_BLEZ: begin
                    write_reg_enable_output <= `WriteDisable;
                    aluop_output <= `EXE_BLEZ_OP;
                    alusel_output <= `EXE_RES_JUMP_BRANCH;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b0;
                    instruction_valid <= `InstructionValid;
                    if (reg1_output[31] == 1'b1 || reg1_output == `ZeroWord) begin
                        branch_address_output <= program_counter_plus_4 + imm_sll2_signedext;
                        is_branch_output <= `Branch;
                        next_instrcution_in_delay_slot_output <= `InDelaySlot;
                    end
                end
                `EXE_BNE: begin
                    write_reg_enable_output <= `WriteDisable;
                    aluop_output <= `EXE_BLEZ_OP;
                    alusel_output <= `EXE_RES_JUMP_BRANCH;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b1;
                    instruction_valid <= `InstructionValid;
                    if (reg1_output != reg2_output) begin
                        branch_address_output <= program_counter_plus_4 + imm_sll2_signedext;
                        is_branch_output <= `Branch;
                        next_instrcution_in_delay_slot_output <= `InDelaySlot;
                    end
                end
                `EXE_SPECIAL2_INST: begin
                    case(op3)
                        `EXE_CLZ: begin
                            write_reg_enable_output <= `WriteEnable;
                            aluop_output <= `EXE_CLZ_OP;
                            alusel_output <= `EXE_RES_ARITHMETIC;
                            reg1_read_output <= 1'b1;
                            reg2_read_output <= 1'b0;
                            instruction_valid <= `InstructionValid;
                        end
                        `EXE_CLO: begin
                            write_reg_enable_output <= `WriteEnable;
                            aluop_output <= `EXE_CLO_OP;
                            alusel_output <= `EXE_RES_ARITHMETIC;
                            reg1_read_output <= 1'b1;
                            reg2_read_output <= 1'b0;
                            instruction_valid <= `InstructionValid;
                        end
                        `EXE_MUL: begin
                            write_reg_enable_output <= `WriteEnable;
                            aluop_output <= `EXE_MUL_OP;
                            alusel_output <= `EXE_RES_MUL;
                            reg1_read_output <= 1'b1;
                            reg2_read_output <= 1'b1;
                            instruction_valid <= `InstructionValid;
                        end
                        `EXE_MADD: begin
                            write_reg_enable_output <= `WriteDisable;
                            aluop_output <= `EXE_MADD_OP;
                            alusel_output <= `EXE_RES_NOP;
                            reg1_read_output <= 1'b1;
                            reg2_read_output <= 1'b1;
                            instruction_valid <= `InstructionValid;
                        end
                        `EXE_MADDU: begin
                            aluop_output <= `EXE_MADDU_OP;
                            alusel_output <= `EXE_RES_NOP;
                            reg1_read_output <= 1'b1;
                            reg2_read_output <= 1'b1;
                            instruction_valid <= `InstructionValid;
                        end
                        `EXE_MSUB: begin
                            aluop_output <= `EXE_MSUB_OP;
                            alusel_output <= `EXE_RES_NOP;
                            reg1_read_output <= 1'b1;
                            reg2_read_output <= 1'b1;
                            instruction_valid <= `InstructionValid;
                        end
                        `EXE_MSUBU: begin
                            aluop_output <= `EXE_MSUBU_OP;
                            alusel_output <= `EXE_RES_NOP;
                            reg1_read_output <= 1'b1;
                            reg2_read_output <= 1'b1;
                            instruction_valid <= `InstructionValid;
                        end
                    endcase
                end
                `EXE_REGIMM_INST: begin
                    case (op4)
                        `EXE_BGEZ: begin
                            write_reg_enable_output <= `WriteDisable;
                            aluop_output <= `EXE_BGEZ_OP;
                            alusel_output <= `EXE_RES_JUMP_BRANCH;
                            reg1_read_output <= 1'b1;
                            reg2_read_output <= 1'b0;
                            instruction_valid <= `InstructionValid;
                            if (reg1_output[31] == 1'b0) begin
                                branch_address_output <= program_counter_plus_4 + imm_sll2_signedext;
                                is_branch_output <= `Branch;
                                next_instrcution_in_delay_slot_output <= `InDelaySlot;
                            end
                        end
                        `EXE_BGEZAL: begin
                            write_reg_enable_output <= `WriteEnable;
                            aluop_output <= `EXE_BGEZAL_OP;
                            alusel_output <= `EXE_RES_JUMP_BRANCH;
                            reg1_read_output <= 1'b1;
                            reg2_read_output <= 1'b0;
                            link_address_output <= program_counter_plus_8;
                            write_reg_address_output <= 5'b11111;
                            instruction_valid <= `InstructionValid;
                            if (reg1_output[31] == 1'b0) begin
                                branch_address_output <= program_counter_plus_4 + imm_sll2_signedext;
                                is_branch_output <= `Branch;
                                next_instrcution_in_delay_slot_output <= `InDelaySlot;
                            end
                        end
                        `EXE_BLTZ: begin
                            write_reg_enable_output <= `WriteDisable;
                            aluop_output <= `EXE_BGEZAL_OP;
                            alusel_output <= `EXE_RES_JUMP_BRANCH;
                            reg1_read_output <= 1'b1;
                            reg2_read_output <= 1'b0;
                            instruction_valid <= `InstructionValid;
                            if (reg1_output[31] == 1'b1) begin
                                branch_address_output <= program_counter_plus_4 + imm_sll2_signedext;
                                is_branch_output <= `Branch;
                                next_instrcution_in_delay_slot_output <= `InDelaySlot;
                            end
                        end
                        `EXE_BLTZAL: begin
                            write_reg_enable_output <= `WriteEnable;
                            aluop_output <= `EXE_BGEZAL_OP;
                            alusel_output <= `EXE_RES_JUMP_BRANCH;
                            reg1_read_output <= 1'b1;
                            reg2_read_output <= 1'b0;
                            link_address_output <= program_counter_plus_8;
                            write_reg_address_output <= 5'b11111;
                            instruction_valid <= `InstructionValid;
                            if (reg1_output[31] == 1'b1) begin
                                branch_address_output <= program_counter_plus_4 + imm_sll2_signedext;
                                is_branch_output <= `Branch;
                                next_instrcution_in_delay_slot_output <= `InDelaySlot;
                            end
                        end
                        default: begin
                        end
                    endcase
                end
                `EXE_LB: begin
                    write_reg_enable_output <= `WriteEnable;
                    aluop_output <= `EXE_LB_OP;
                    alusel_output <= `EXE_RES_LOAD_STORE;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b0;
                    write_reg_address_output <= instruction_input[20:16];
                    instruction_valid <= `InstructionValid;
                end
                `EXE_LBU: begin
                    write_reg_enable_output <= `WriteEnable;
                    aluop_output <= `EXE_LBU_OP;
                    alusel_output <= `EXE_RES_LOAD_STORE;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b0;
                    write_reg_address_output <= instruction_input[20:16];
                    instruction_valid <= `InstructionValid;
                end
                `EXE_LH: begin
                    write_reg_enable_output <= `WriteEnable;
                    aluop_output <= `EXE_LH_OP;
                    alusel_output <= `EXE_RES_LOAD_STORE;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b0;
                    write_reg_address_output <= instruction_input[20:16];
                    instruction_valid <= `InstructionValid;
                end
                `EXE_LHU: begin
                    write_reg_enable_output <= `WriteEnable;
                    aluop_output <= `EXE_LHU_OP;
                    alusel_output <= `EXE_RES_LOAD_STORE;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b0;
                    write_reg_address_output <= instruction_input[20:16];
                    instruction_valid <= `InstructionValid;
                end
                `EXE_LW: begin
                    write_reg_enable_output <= `WriteEnable;
                    aluop_output <= `EXE_LW_OP;
                    alusel_output <= `EXE_RES_LOAD_STORE;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b0;
                    write_reg_address_output <= instruction_input[20:16];
                    instruction_valid <= `InstructionValid;
                end
                `EXE_LWL: begin
                    write_reg_enable_output <= `WriteEnable;
                    aluop_output <= `EXE_LWL_OP;
                    alusel_output <= `EXE_RES_LOAD_STORE;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b1;
                    write_reg_address_output <= instruction_input[20:16];
                    instruction_valid <= `InstructionValid;
                end
                `EXE_LWR: begin
                    write_reg_enable_output <= `WriteEnable;
                    aluop_output <= `EXE_LWR_OP;
                    alusel_output <= `EXE_RES_LOAD_STORE;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b1;
                    write_reg_address_output <= instruction_input[20:16];
                    instruction_valid <= `InstructionValid;
                end
                `EXE_SB: begin
                    write_reg_enable_output <= `WriteDisable;
                    aluop_output <= `EXE_SB_OP;
                    alusel_output <= `EXE_RES_LOAD_STORE;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b1;
                    instruction_valid <= `InstructionValid;
                end
                `EXE_SH: begin
                    write_reg_enable_output <= `WriteDisable;
                    aluop_output <= `EXE_SH_OP;
                    alusel_output <= `EXE_RES_LOAD_STORE;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b1;
                    instruction_valid <= `InstructionValid;
                end
                `EXE_SW: begin
                    write_reg_enable_output <= `WriteDisable;
                    aluop_output <= `EXE_SW_OP;
                    alusel_output <= `EXE_RES_LOAD_STORE;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b1;
                    instruction_valid <= `InstructionValid;
                end
                `EXE_SWL: begin
                    write_reg_enable_output <= `WriteDisable;
                    aluop_output <= `EXE_SWL_OP;
                    alusel_output <= `EXE_RES_LOAD_STORE;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b1;
                    instruction_valid <= `InstructionValid;
                end
                `EXE_SWR: begin
                    write_reg_enable_output <= `WriteDisable;
                    aluop_output <= `EXE_SWR_OP;
                    alusel_output <= `EXE_RES_LOAD_STORE;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b1;
                    instruction_valid <= `InstructionValid;
                end
                `EXE_LL: begin
                    write_reg_enable_output <= `WriteEnable;
                    aluop_output <= `EXE_LL_OP;
                    alusel_output <= `EXE_RES_LOAD_STORE;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b0;
                    write_reg_address_output <= instruction_input[20:16];
                    instruction_valid <= `InstructionValid;
                end
                `EXE_SC: begin
                    write_reg_enable_output <= `WriteEnable;
                    aluop_output <= `EXE_SC_OP;
                    alusel_output <= `EXE_RES_LOAD_STORE;
                    reg1_read_output <= 1'b1;
                    reg2_read_output <= 1'b1;
                    write_reg_address_output <= instruction_input[20:16];
                    instruction_valid <= `InstructionValid;
                end
                default: begin
                end
            endcase

            if (instruction_input[31:21] == 11'b00000000000) begin
                if (op3 == `EXE_SLL) begin
                    write_reg_enable_output <= `WriteEnable;
                    aluop_output <= `EXE_SLL_OP;
                    alusel_output <= `EXE_RES_SHIFT;
                    reg1_read_output <= 1'b0;
                    reg2_read_output <= 1'b1;
                    imm[4:0] <= instruction_input[10:6];
                    write_reg_address_output <= instruction_input[15:11];
                    instruction_valid <= `InstructionValid;
                end else if (op3 == `EXE_SRL) begin
                    write_reg_enable_output <= `WriteEnable;
                    aluop_output <= `EXE_SRL_OP;
                    alusel_output <= `EXE_RES_SHIFT;
                    reg1_read_output <= 1'b0;
                    reg2_read_output <= 1'b1;
                    imm[4:0] <= instruction_input[10:6];
                    write_reg_address_output <= instruction_input[15:11];
                    instruction_valid <= `InstructionValid;
                end else if (op3 == `EXE_SRA) begin
                    write_reg_enable_output <= `WriteEnable;
                    aluop_output <= `EXE_SRA_OP;
                    alusel_output <= `EXE_RES_SHIFT;
                    reg1_read_output <= 1'b0;
                    reg2_read_output <= 1'b1;
                    imm[4:0] <= instruction_input[10:6];
                    write_reg_address_output <= instruction_input[15:11];
                    instruction_valid <= `InstructionValid;
                end
            end
            if (instruction_input[31:21] == 11'b01000000000 && 
                instruction_input[10:0] == 11'b00000000000) begin
                aluop_output <= `EXE_MFC0_OP;
                alusel_output <= `EXE_RES_MOVE;
                write_reg_address_output <= instruction_input[20:16];
                write_reg_enable_output <= `WriteEnable;
                instruction_valid <= `InstructionValid;
                reg1_read_output <= 1'b0;
                reg2_read_output <= 1'b0;
            end else if (instruction_input[31:21] == 11'b01000000100 && 
                instruction_input[10:0] == 11'b00000000000) begin
                aluop_output <= `EXE_MTC0_OP;
                alusel_output <= `EXE_RES_NOP;
                reg1_address_output <= instruction_input[20:16];
                write_reg_enable_output <= `WriteDisable;
                instruction_valid <= `InstructionValid;
                reg1_read_output <= 1'b1;
                reg2_read_output <= 1'b0;
            end
        end
    end

    always @ (*) begin
        stop_all_req_for_reg1_loadrelate <= `NoStop;
        if (reset == `ResetEnable) begin
            reg1_output <= `ZeroWord;
        end else if (pre_instruction_is_load == 1'b1 && 
                    ex_write_reg_address_intput == reg1_address_output &&
                    reg1_read_output == 1'b1) begin
            stop_all_req_for_reg1_loadrelate <= `Stop;
        end else if ((reg1_read_output == 1'b1) &&
                    (ex_write_reg_enable_intput == 1'b1) &&
                    (ex_write_reg_address_intput == reg1_address_output)) begin
            reg1_output <= ex_write_reg_data_input;
        end else if ((reg1_read_output == 1'b1) &&
                    (mem_write_reg_enable_input == 1'b1) &&
                    (mem_write_reg_address_input == reg1_address_output)) begin
            reg1_output <= mem_write_reg_data_input;
        end else if (reg1_read_output == 1'b1) begin
            reg1_output <= reg1_data_input;
        end else if (reg1_read_output == 1'b0) begin
            reg1_output <= imm;
        end else begin
            reg1_output <= `ZeroWord;
        end
    end

    always @ (*) begin
        stop_all_req_for_reg2_loadrelate <= `NoStop;
        if (reset == `ResetEnable) begin
            reg2_output <= `ZeroWord;
        end else if (pre_instruction_is_load == 1'b1 && 
                    ex_write_reg_address_intput == reg2_address_output &&
                    reg2_read_output == 1'b1) begin
            stop_all_req_for_reg2_loadrelate <= `Stop;
        end else if ((reg2_read_output == 1'b1) &&
                    (ex_write_reg_enable_intput == 1'b1) &&
                    (ex_write_reg_address_intput == reg2_address_output)) begin
            reg2_output <= ex_write_reg_data_input;
        end else if ((reg2_read_output == 1'b1) &&
                    (mem_write_reg_enable_input == 1'b1) &&
                    (mem_write_reg_address_input == reg2_address_output)) begin
            reg2_output <= mem_write_reg_data_input;
        end else if (reg2_read_output == 1'b1) begin
            reg2_output <= reg2_data_input;
        end else if (reg2_read_output == 1'b0) begin
            reg2_output <= imm;
        end else begin
            reg2_output <= `ZeroWord;
        end
    end
     
    always @ (*) begin
        if (reset == `ResetEnable) begin
            is_in_delay_slot_output <= `NotInDelaySlot;
        end else begin
            is_in_delay_slot_output <= is_in_delay_slot_input;
        end
    end

endmodule