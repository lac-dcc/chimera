// This program was cloned from: https://github.com/ahmd-kamel/Single-Cycle_MIPS
// License: The Unlicense

module MIPS
#(
    parameter DATA_WIDTH = 32,
    parameter ALU_CTRL = 3
) (
    input clk, reset_n,
    input [DATA_WIDTH - 1 : 0] instr,
    input [DATA_WIDTH - 1 : 0] read_data,
    output mem_write,
    output [DATA_WIDTH - 1 : 0] pc,
    output [DATA_WIDTH - 1 : 0] write_data,
    output [DATA_WIDTH - 1 : 0] alu_out
);

    wire [ALU_CTRL - 1 : 0] alu_ctrl;
    wire alu_src;
    wire jump_f;
    wire branch_f;
    wire mem_t_reg;
    wire reg_dest;
    wire reg_write;

    DATA_PATH MIPS_DATA_PATH(
        .clk(clk),
        .reset_n(reset_n),
        .jump_f(jump_f),
        .mem_t_reg(mem_t_reg),
        .mem_write(mem_write),
        .branch_f(branch_f),
        .alu_src(alu_src),
        .reg_dest(reg_dest),
        .reg_write(reg_write),
        .alu_ctrl(alu_ctrl),
        .read_data(read_data),
        .instr(instr),
        .alu_out(alu_out),
        .pc(pc),
        .write_data(write_data)
    );

    CONTROL_UNIT MIPS_CTRL(
        .op(instr[31 : 26]),
        .funct(instr[5 : 0]),
        .mem_t_reg(mem_t_reg),
        .mem_write(mem_write),
        .jump_f(jump_f),
        .branch_f(branch_f),
        .alu_src(alu_src),
        .reg_dest(reg_dest),
        .reg_write(reg_write),
        .alu_ctrl(alu_ctrl)
    );

endmodule
