// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

`include "../../define/bus.v"
`include "../../define/segpos.v"
`include "../../define/opcode.v"
`include "../../define/regimm.v"
`include "../../define/funct.v"
`include "../../define/cp0.v"
`include "../../define/exception.v"

module ID(
    input rst,
    // from IF stage (PC)
    input [`ADDR_BUS] addr,
    input [`INST_BUS] inst,
    // load related signals
    input load_related_1,
    input load_related_2,
    // delayslot signal
    input delayslot_flag_in,
    // from/to regfile
    input [`DATA_BUS] reg_data_1,
    input [`DATA_BUS] reg_data_2,
    output reg reg_read_en_1,
    output reg reg_read_en_2,
    output reg[`REG_ADDR_BUS] reg_addr_1,
    output reg[`REG_ADDR_BUS] reg_addr_2,
    // stall request
    output stall_request,
    // to IF stage
    output reg branch_flag,
    output reg[`ADDR_BUS] branch_addr,
    // to EX stage
    output reg next_delayslot_flag_out,
    output delayslot_flag_out,
    output [`FUNCT_BUS] funct,
    output [`SHAMT_BUS] shamt,
    output reg[`DATA_BUS] operand_1,
    output reg[`DATA_BUS] operand_2,
    // to MEM stage
    output reg mem_read_flag,
    output reg mem_write_flag,
    output reg mem_sign_ext_flag,
    output reg[3:0] mem_sel,
    output reg[`DATA_BUS] mem_write_data,
    // to WB stage (write back to regfile)
    output reg write_reg_en,
    output reg[`REG_ADDR_BUS] write_reg_addr,
    // coprocessor 0
    output reg cp0_write_flag,
    output reg cp0_read_flag,
    output reg[`CP0_ADDR_BUS] cp0_addr,
    output reg[`DATA_BUS] cp0_write_data,
    // exception signals
    output [`EXC_TYPE_BUS] exception_type,
    output [`ADDR_BUS] current_pc_addr
);

    // extract information from instruction
    wire[`INST_OP_BUS] inst_op = inst[`SEG_OPCODE];
    wire[`REG_ADDR_BUS] inst_rs = inst[`SEG_RS];
    wire[`REG_ADDR_BUS] inst_rt = inst[`SEG_RT];
    wire[`REG_ADDR_BUS] inst_rd = inst[`SEG_RD];
    wire[`SHAMT_BUS] inst_shamt = inst[`SEG_SHAMT];
    wire[`FUNCT_BUS] inst_funct = inst[`SEG_FUNCT];

    assign shamt = inst_shamt;

    // extract immediate from instruction
    wire[`HALF_DATA_BUS] inst_imm = inst[`SEG_IMM];
    wire[`DATA_BUS] zero_extended_imm = {16'b0, inst_imm};
    wire[`DATA_BUS] zero_extended_imm_hi = {inst_imm, 16'b0};
    wire[`DATA_BUS] sign_extended_imm = {{16{inst_imm[15]}}, inst_imm};

    // generate the stall request signal
    assign stall_request = rst ? load_related_1 || load_related_2 : 0;

    // generate address of registers to be read
    always @(*) begin
        if (!rst) begin
            reg_read_en_1 <= 0;
            reg_read_en_2 <= 0;
            reg_addr_1 <= 0;
            reg_addr_2 <= 0;
        end
        else begin
            case (inst_op)
                // arithmetic & logic (immediate)
                `OP_ADDI, `OP_ADDIU, `OP_SLTI, `OP_SLTIU,
                `OP_ANDI, `OP_ORI, `OP_XORI,
                // memory accessing
                `OP_LB, `OP_LH, `OP_LW, `OP_LBU, `OP_LHU: begin
                    reg_read_en_1 <= 1;
                    reg_read_en_2 <= 0;
                    reg_addr_1 <= inst_rs;
                    reg_addr_2 <= 0;
                end
                // branch
                `OP_BEQ, `OP_BNE, `OP_BLEZ, `OP_BGTZ,
                // memory accessing
                `OP_SB, `OP_SH, `OP_SW,
                // r-type
                `OP_SPECIAL, `OP_SPECIAL2: begin
                    reg_read_en_1 <= 1;
                    reg_read_en_2 <= 1;
                    reg_addr_1 <= inst_rs;
                    reg_addr_2 <= inst_rt;
                end
                // reg-imm
                `OP_REGIMM: begin
                    case (inst_rt)
                        `REGIMM_BLTZ, `REGIMM_BLTZAL,
                        `REGIMM_BGEZ, `REGIMM_BGEZAL: begin
                            reg_read_en_1 <= 1;
                            reg_read_en_2 <= 0;
                            reg_addr_1 <= inst_rs;
                            reg_addr_2 <= 0;
                        end
                        default: begin
                            reg_read_en_1 <= 0;
                            reg_read_en_2 <= 0;
                            reg_addr_1 <= 0;
                            reg_addr_2 <= 0;
                        end
                    endcase
                end
                // coprocessor
                `OP_CP0: begin
                    reg_read_en_1 <= 1;
                    reg_read_en_2 <= 1;
                    reg_addr_1 <= inst_rt;
                    reg_addr_2 <= 0;
                end
                default: begin   // OP_J, OP_JAL, OP_LUI
                    reg_read_en_1 <= 0;
                    reg_read_en_2 <= 0;
                    reg_addr_1 <= 0;
                    reg_addr_2 <= 0;
                end
            endcase
        end
    end

    // generate FUNCT signal
    FunctGen funct_gen(inst_op, inst_funct, inst_rt, funct);

    // calculate link address
    wire[`ADDR_BUS] link_addr = addr + 8;

    // generate operand_1
    always @(*) begin
        if (!rst) begin
            operand_1 <= 0;
        end
        else begin
            case (inst_op)
                // immediate
                `OP_ADDI, `OP_ADDIU, `OP_SLTI, `OP_SLTIU,
                `OP_ANDI, `OP_ORI, `OP_XORI, `OP_LUI,
                // memory accessing
                `OP_LB, `OP_LH, `OP_LW, `OP_LBU,
                `OP_LHU, `OP_SB, `OP_SH, `OP_SW,
                `OP_SPECIAL2: begin
                    operand_1 <= reg_data_1;
                end
                `OP_SPECIAL: begin
                    operand_1 <= funct == `FUNCT_JALR ? link_addr : reg_data_1;
                end
                `OP_REGIMM: begin
                    operand_1 <= inst_rt == `REGIMM_BLTZAL
                        || inst_rt == `REGIMM_BGEZAL ? link_addr : 0;
                end
                `OP_JAL: begin
                    operand_1 <= link_addr;
                end
                default: begin
                    operand_1 <= 0;
                end
            endcase
        end
    end

    // generate operand_2
    always @(*) begin
        if (!rst) begin
            operand_2 <= 0;
        end
        else begin
            case (inst_op)
                `OP_ORI, `OP_ANDI, `OP_XORI: begin
                    operand_2 <= zero_extended_imm;
                end 
                `OP_LUI: begin
                    operand_2 <= zero_extended_imm_hi;
                end
                // arithmetic & logic (immediate)
                `OP_ADDI, `OP_ADDIU, `OP_SLTI, `OP_SLTIU,
                // memory accessing
                `OP_LB, `OP_LH, `OP_LW, `OP_LBU,
                `OP_LHU, `OP_SB, `OP_SH, `OP_SW: begin
                    operand_2 <= sign_extended_imm;
                end
                `OP_SPECIAL, `OP_SPECIAL2: begin
                    operand_2 <= reg_data_2;
                end
                default: begin
                    operand_2 <= 0;
                end
            endcase
        end
    end

    // generate write address of registers
    always @(*) begin
        if (!rst) begin
            write_reg_en <= 0;
            write_reg_addr <= 0;
        end
        else begin
            case (inst_op)
                // immediate
                `OP_ADDI, `OP_ADDIU, `OP_SLTI, `OP_SLTIU,
                `OP_ANDI, `OP_ORI, `OP_XORI, `OP_LUI: begin
                    write_reg_en <= 1;
                    write_reg_addr <= inst_rt;
                end
                `OP_SPECIAL, `OP_SPECIAL2: begin
                    write_reg_en <= 1;
                    write_reg_addr <= inst_rd;
                end
                `OP_JAL: begin
                    write_reg_en <= 1;
                    write_reg_addr <= 31;   // $ra (return address)
                end
                `OP_REGIMM: begin
                    case (inst_rt)
                        `REGIMM_BGEZAL, `REGIMM_BLTZAL: begin
                            write_reg_en <= 1;
                            write_reg_addr <= 31;   // $ra
                        end
                        default: begin
                            write_reg_en <= 0;
                            write_reg_addr <= 0;
                        end
                    endcase
                end
                `OP_LB, `OP_LBU, `OP_LH, `OP_LHU, `OP_LW: begin
                    write_reg_en <= 1;
                    write_reg_addr <= inst_rt;
                end
                `OP_CP0: begin
                    if (inst_rs == `CP0_MFC0 && !inst[`SEG_EMPTY]) begin
                        write_reg_en <= 1;
                        write_reg_addr <= inst_rt;
                    end
                    else begin
                        write_reg_en <= 0;
                        write_reg_addr <= 0;
                    end
                end
                default: begin
                    write_reg_en <= 0;
                    write_reg_addr <= 0;
                end
            endcase
        end
    end

    // generate branch address
    wire[`ADDR_BUS] addr_plus_4 = addr + 4;
    wire[25:0] jump_addr = inst[25:0];
    wire[`DATA_BUS] sign_extended_imm_sll2 = {{14{inst[15]}}, inst[15:0], 2'b00};

    assign delayslot_flag_out = rst ? delayslot_flag_in : 0;

    always @(*) begin
        if (!rst) begin
            branch_flag <= 0;
            branch_addr <= 0;
            next_delayslot_flag_out <= 0;
        end
        else begin
            case (inst_op)
                `OP_J, `OP_JAL: begin
                    branch_flag <= 1;
                    branch_addr <= {addr_plus_4[31:28], jump_addr, 2'b00};
                    next_delayslot_flag_out <= 1;
                end
                `OP_SPECIAL, `OP_SPECIAL2: begin
                    if (inst_funct == `FUNCT_JR || inst_funct == `FUNCT_JALR) begin
                        branch_flag <= 1;
                        branch_addr <= reg_data_1;
                        next_delayslot_flag_out <= 1;
                    end
                    else begin
                        branch_flag <= 0;
                        branch_addr <= 0;
                        next_delayslot_flag_out <= 0;
                    end
                end
                `OP_BEQ: begin
                    if (reg_data_1 == reg_data_2) begin
                        branch_flag <= 1;
                        branch_addr <= addr_plus_4 + sign_extended_imm_sll2;
                    end
                    else begin
                        branch_flag <= 0;
                        branch_addr <= 0;
                    end
                    next_delayslot_flag_out <= 1;
                end
                `OP_BGTZ: begin
                    if (!reg_data_1[31] && reg_data_1) begin
                        branch_flag <= 1;
                        branch_addr <= addr_plus_4 + sign_extended_imm_sll2;
                    end
                    else begin
                        branch_flag <= 0;
                        branch_addr <= 0;
                    end
                    next_delayslot_flag_out <= 1;
                end
                `OP_BLEZ: begin
                    if (reg_data_1[31] || !reg_data_1) begin
                        branch_flag <= 1;
                        branch_addr <= addr_plus_4 + sign_extended_imm_sll2;
                    end
                    else begin
                        branch_flag <= 0;
                        branch_addr <= 0;
                    end
                    next_delayslot_flag_out <= 1;
                end
                `OP_BNE: begin
                    if (reg_data_1 != reg_data_2) begin
                        branch_flag <= 1;
                        branch_addr <= addr_plus_4 + sign_extended_imm_sll2;
                    end
                    else begin
                        branch_flag <= 0;
                        branch_addr <= 0;
                    end
                    next_delayslot_flag_out <= 1;
                end
                `OP_REGIMM: begin
                    case (inst_rt)
                        `REGIMM_BLTZ, `REGIMM_BLTZAL: begin
                            if (reg_data_1[31]) begin
                                branch_flag <= 1;
                                branch_addr <= addr_plus_4 + sign_extended_imm_sll2;
                            end
                            else begin
                                branch_flag <= 0;
                                branch_addr <= 0;
                            end
                            next_delayslot_flag_out <= 1;
                        end
                        `REGIMM_BGEZ, `REGIMM_BGEZAL: begin
                            if (!reg_data_1[31]) begin
                                branch_flag <= 1;
                                branch_addr <= addr_plus_4 + sign_extended_imm_sll2;
                            end
                            else begin
                                branch_flag <= 0;
                                branch_addr <= 0;
                            end
                            next_delayslot_flag_out <= 1;
                        end
                        default: begin
                            branch_flag <= 0;
                            branch_addr <= 0;
                            next_delayslot_flag_out <= 0;
                        end
                    endcase
                end
                default: begin
                    branch_flag <= 0;
                    branch_addr <= 0;
                    next_delayslot_flag_out <= 0;
                end
            endcase
        end
    end

    // generate control signal of memory accessing
    always @(*) begin
        if (!rst) begin
            mem_write_flag <= 0;
        end
        else begin
            case (inst_op)
                `OP_SB, `OP_SH, `OP_SW: mem_write_flag <= 1;
                default: mem_write_flag <= 0;
            endcase
        end
    end
    
    always @(*) begin
        if (!rst) begin
            mem_read_flag <= 0;
        end
        else begin
            case (inst_op)
                `OP_LB, `OP_LBU, `OP_LH, `OP_LHU, `OP_LW: mem_read_flag <= 1;
                default: mem_read_flag <= 0;
            endcase
        end
    end
    
    always @(*) begin
        if (!rst) begin
            mem_sign_ext_flag <= 0;
        end
        else begin
            case (inst_op)
                `OP_LB, `OP_LH, `OP_LW: mem_sign_ext_flag <= 1;
                default: mem_sign_ext_flag <= 0;
            endcase
        end
    end

    // mem_sel: lb & sb -> 1, lh & sh -> 11, lw & sw -> 1111
    always @(*) begin
        if (!rst) begin
            mem_sel <= 4'b0000;
        end
        else begin
            case (inst_op)
                `OP_LB, `OP_LBU, `OP_SB: mem_sel <= 4'b0001;
                `OP_LH, `OP_LHU, `OP_SH: mem_sel <= 4'b0011;
                `OP_LW, `OP_SW: mem_sel <= 4'b1111;
                default: mem_sel <= 4'b0000;
            endcase
        end
    end

    // generate data to be written to memory
    always @(*) begin
        if (!rst) begin
            mem_write_data <= 0;
        end
        else begin
            case (inst_op)
                `OP_SB, `OP_SH, `OP_SW: mem_write_data <= reg_data_2;
                default: mem_write_data <= 0;
            endcase
        end
    end

    // generate coprocessor 0 register address
    always @(*) begin
        if (!rst) begin
            cp0_write_flag <= 0;
            cp0_read_flag <= 0;
            cp0_addr <= 0;
        end
        else begin
            case (inst_op)
                `OP_CP0: begin
                    if (inst_rs == `CP0_MTC0 && !inst[`SEG_EMPTY]) begin
                        cp0_write_flag <= 1;
                        cp0_read_flag <= 0;
                        cp0_addr <= {inst_rd, inst[`SEG_SEL]};
                    end
                    else if (inst_rs == `CP0_MFC0 && !inst[`SEG_EMPTY]) begin
                        cp0_write_flag <= 0;
                        cp0_read_flag <= 1;
                        cp0_addr <= {inst_rd, inst[`SEG_SEL]};
                    end
                    else begin
                        cp0_write_flag <= 0;
                        cp0_read_flag <= 0;
                        cp0_addr <= 0;
                    end
                end
                default: begin
                    cp0_write_flag <= 0;
                    cp0_read_flag <= 0;
                    cp0_addr <= 0;
                end
            endcase
        end
    end

    // generate coprocessor register write data
    always @(*) begin
        if (!rst) begin
            cp0_write_data <= 0;
        end
        else begin
            case (inst_op)
                `OP_CP0: begin
                    if (inst_rs == `CP0_MTC0 && !inst[`SEG_EMPTY]) begin
                        cp0_write_data <= reg_data_1;
                    end
                    else begin
                        cp0_write_data <= 0;
                    end
                end
                default: begin
                    cp0_write_data <= 0;
                end
            endcase
        end
    end

    // generate exception signals
    reg invalid_inst_flag, overflow_inst_flag;
    reg syscall_flag, break_flag, eret_flag;
    assign exception_type = rst ? {
        eret_flag, /* ADE */ 1'b0,
        syscall_flag, break_flag, /* TP */ 1'b0,
        overflow_inst_flag, invalid_inst_flag, /* IF */ 1'b0
    } : 0;
    assign current_pc_addr = rst ? addr : 0;

    always @(*) begin
        if (!rst) begin
            invalid_inst_flag <= 0;
            overflow_inst_flag <= 0;
            syscall_flag <= 0;
            break_flag <= 0;
            eret_flag <= 0;
        end
        else begin
            if (inst == `CP0_ERET_FULL) begin
                invalid_inst_flag <= 0;
                overflow_inst_flag <= 0;
                syscall_flag <= 0;
                break_flag <= 0;
                eret_flag <= 1;
            end
            else begin
                case (inst_op)
                    `OP_SPECIAL: begin
                        case (funct)
                            `FUNCT_SLL, `FUNCT_SRL, `FUNCT_SRA, `FUNCT_SLLV,
                            `FUNCT_SRLV, `FUNCT_SRAV, `FUNCT_JR, `FUNCT_JALR,
                            `FUNCT_MOVN, `FUNCT_MOVZ,
                            `FUNCT_MFHI, `FUNCT_MTHI, `FUNCT_MFLO, `FUNCT_MTLO,
                            `FUNCT_MULT, `FUNCT_MULTU, `FUNCT_DIV, `FUNCT_DIVU,
                            `FUNCT_ADDU, `FUNCT_SUBU, `FUNCT_AND, `FUNCT_OR,
                            `FUNCT_XOR, `FUNCT_NOR, `FUNCT_SLT, `FUNCT_SLTU: begin
                                invalid_inst_flag <= 0;
                                overflow_inst_flag <= 0;
                                syscall_flag <= 0;
                                break_flag <= 0;
                                eret_flag <= 0;
                            end
                            `FUNCT_ADD, `FUNCT_SUB: begin
                                invalid_inst_flag <= 0;
                                overflow_inst_flag <= 1;
                                syscall_flag <= 0;
                                break_flag <= 0;
                                eret_flag <= 0;
                            end
                            `FUNCT_SYSCALL: begin
                                invalid_inst_flag <= 0;
                                overflow_inst_flag <= 0;
                                syscall_flag <= 1;
                                break_flag <= 0;
                                eret_flag <= 0;
                            end
                            `FUNCT_BREAK: begin
                                invalid_inst_flag <= 0;
                                overflow_inst_flag <= 0;
                                syscall_flag <= 0;
                                break_flag <= 1;
                                eret_flag <= 0;
                            end
                            default: begin
                                invalid_inst_flag <= 1;
                                overflow_inst_flag <= 0;
                                syscall_flag <= 0;
                                break_flag <= 0;
                                eret_flag <= 0;
                            end
                        endcase
                    end
                    `OP_SPECIAL2: begin
                        case (funct)
                            `FUNCT2_CLZ, `FUNCT2_CLO,
                            `FUNCT2_MUL,
                            `FUNCT2_MADD, `FUNCT2_MADDU,
                            `FUNCT2_MSUB, `FUNCT2_MSUBU: begin
                                invalid_inst_flag <= 0;
                                overflow_inst_flag <= 0;
                                syscall_flag <= 0;
                                break_flag <= 0;
                                eret_flag <= 0;
                            end
                            default: begin
                                invalid_inst_flag <= 1;
                                overflow_inst_flag <= 0;
                                syscall_flag <= 0;
                                break_flag <= 0;
                                eret_flag <= 0;
                            end
                        endcase
                    end
                    `OP_REGIMM: begin
                        case (inst_rt)
                            `REGIMM_BLTZ, `REGIMM_BLTZAL, `REGIMM_BGEZ,
                            `REGIMM_BGEZAL: begin
                                invalid_inst_flag <= 0;
                                overflow_inst_flag <= 0;
                                syscall_flag <= 0;
                                break_flag <= 0;
                                eret_flag <= 0;
                            end
                            default: begin
                                invalid_inst_flag <= 1;
                                overflow_inst_flag <= 0;
                                syscall_flag <= 0;
                                break_flag <= 0;
                                eret_flag <= 0;
                            end
                        endcase
                    end
                    `OP_CP0: begin
                        case (inst_rs)
                            `CP0_MFC0, `CP0_MTC0: begin
                                invalid_inst_flag <= 0;
                                overflow_inst_flag <= 0;
                                syscall_flag <= 0;
                                break_flag <= 0;
                                eret_flag <= 0;
                            end
                            default: begin
                                invalid_inst_flag <= 1;
                                overflow_inst_flag <= 0;
                                syscall_flag <= 0;
                                break_flag <= 0;
                                eret_flag <= 0;
                            end
                        endcase
                    end
                    `OP_J, `OP_JAL, `OP_BEQ, `OP_BNE, `OP_BLEZ, `OP_BGTZ,
                    `OP_ADDIU, `OP_SLTI, `OP_SLTIU, `OP_ANDI, `OP_ORI,
                    `OP_XORI, `OP_LUI, `OP_LB, `OP_LH, `OP_LW, `OP_LBU,
                    `OP_LHU, `OP_SB, `OP_SH, `OP_SW: begin
                        invalid_inst_flag <= 0;
                        overflow_inst_flag <= 0;
                        syscall_flag <= 0;
                        break_flag <= 0;
                        eret_flag <= 0;
                    end
                    `OP_ADDI: begin
                        invalid_inst_flag <= 0;
                        overflow_inst_flag <= 1;
                        syscall_flag <= 0;
                        break_flag <= 0;
                        eret_flag <= 0;
                    end
                    default: begin
                        invalid_inst_flag <= 1;
                        overflow_inst_flag <= 0;
                        syscall_flag <= 0;
                        break_flag <= 0;
                        eret_flag <= 0;
                    end
                endcase
            end
        end
    end

endmodule // ID
