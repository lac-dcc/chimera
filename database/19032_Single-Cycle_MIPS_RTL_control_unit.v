// This program was cloned from: https://github.com/ahmd-kamel/Single-Cycle_MIPS
// License: The Unlicense

module CONTROL_UNIT (
    input wire [5: 0] op, funct,
    output wire mem_t_reg, mem_write,
    output wire jump_f, branch_f,
    output wire alu_src, reg_dest,
    output wire reg_write,
    output wire [2 : 0] alu_ctrl
);

    wire [1 : 0] alu_op_ctrl;

    ALU_DECODER CU_ALU_DECODER(
        .alu_op(alu_op_ctrl),
        .intsr(funct),
        .alu_ctrl(alu_ctrl)
    );

    MAIN_DECODER CU_MAIN_DECODER(
        .dec_input(op),
        .mem_t_reg(mem_t_reg),
        .mem_write(mem_write),
        .branch_f(branch_f),
        .alu_src(alu_src),
        .reg_dest(reg_dest),
        .reg_write(reg_write),
        .jump_f(jump_f),
        .alu_op(alu_op_ctrl)
    );

endmodule