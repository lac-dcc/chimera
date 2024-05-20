// This program was cloned from: https://github.com/ahmd-kamel/Single-Cycle_MIPS
// License: The Unlicense

module DATA_PATH
#(
    parameter DATA_WIDTH = 32,
    parameter ALU_CTRL_DATA = 3,
    parameter ADD_WIDTH = 5
) (
    input clk, reset_n, jump_f,
    input mem_t_reg, mem_write,
    input branch_f, alu_src,
    input reg_dest, reg_write,
    input [ALU_CTRL_DATA - 1 : 0] alu_ctrl,
    input [DATA_WIDTH - 1 : 0] read_data,
    input [DATA_WIDTH - 1 : 0] instr,
    output [DATA_WIDTH - 1 : 0] alu_out,
    output [DATA_WIDTH - 1 : 0] pc,
    output [DATA_WIDTH - 1 : 0] write_data

);

    wire zero_f;
    wire pc_src;
    wire [27:0] shift_pc;
    wire [DATA_WIDTH - 1 : 0] adder_op;
    wire [DATA_WIDTH - 1 : 0]   pc_input;
    wire [DATA_WIDTH - 1 : 0]   pc_plus_4;
    wire [DATA_WIDTH - 1 : 0]   pc_branch, pc_branch_in;
    wire [DATA_WIDTH - 1 : 0]   pc_mux2_out;
    wire [DATA_WIDTH - 1 : 0]   mux_result;
    wire [DATA_WIDTH - 1 : 0]   sign_ext_out;
    wire [DATA_WIDTH - 1 : 0]   operand_b;
    wire [DATA_WIDTH - 1 : 0]   read_data_1;
    wire [DATA_WIDTH - 1 : 0]   read_data_2;
    wire [DATA_WIDTH - 1 : 0]   branch_shifter_out;
    wire [ADD_WIDTH  - 1 : 0]   write_reg;

    assign  adder_op = 'd4;
    assign  pc_src = zero_f && branch_f;
    assign  write_data = read_data_2;

    REGISTER_FILE #(.DATA_WIDTH(DATA_WIDTH), .ADD_WIDTH(ADD_WIDTH), .REG_DEPTH(DATA_WIDTH))
    DP_REG_FILE (
        .clk(clk),
        .reset_n(reset_n),
        .write_enable(reg_write),
        .read_address_1(instr[25 : 21]),
        .read_address_2(instr[20 : 16]),
        .write_address(write_reg),
        .write_data(mux_result),
        .read_data_1(read_data_1),
        .read_data_2(read_data_2)
    );

    MUX #(.DATA_WIDTH(DATA_WIDTH))
    DP_ALU_MUX (
        .sel(alu_src),
        .in1(read_data_2),
        .in2(sign_ext_out),
        .out(operand_b)
    );

    ALU #(.DATA_WIDTH(DATA_WIDTH), .OP_WIDTH(ALU_CTRL_DATA)) 
    DP_ALU (
        .operand_a(read_data_1),
        .operand_b(operand_b),
        .alu_ctrl(alu_ctrl),
        .alu_output(alu_out),
        .zero_flag(zero_f)
    );

    MUX #(.DATA_WIDTH('d5))
    DP_DEST_MUX (
        .sel(reg_dest),
        .in1(instr[20 : 16]),
        .in2(instr[15 : 11]),
        .out(write_reg)
    );

    SIGN_EXTEND #(.OUTPUT_WIDTH(DATA_WIDTH), .INPUT_WIDTH(DATA_WIDTH / 2))
    DP_SIGN_EXTEND (
        .data_in(instr[15 : 0]),
        .data_out(sign_ext_out)
    );

    SHIFT_LEFT #(.DATA_WIDTH(DATA_WIDTH))
    DP_SIGN_SL (
        .in(sign_ext_out),
        .out(pc_branch_in)
    );

    ADDER #(.DATA_WIDTH(DATA_WIDTH))
    DP_BRANCH_ADD (
        .in1(pc_branch_in),
        .in2(pc_plus_4),
        .out(pc_branch)
    );

    MUX #(.DATA_WIDTH(DATA_WIDTH))
    DP_BRANCH_MUX (
        .sel(pc_src),
        .in1(pc_plus_4),
        .in2(pc_branch),
        .out(pc_mux2_out)
    );

    MUX #(.DATA_WIDTH(DATA_WIDTH))
    DP_JUMP_MUX (
        .sel(jump_f),
        .in1(pc_mux2_out),
        .in2({pc_plus_4[31 : 28], shift_pc}),
        .out(pc_input)
    );

    PC #(.DATA_WIDTH(DATA_WIDTH))
    DP_PC (
        .clk(clk),
        .reset_n(reset_n),
        .pc_in(pc_input),
        .pc_out(pc)
    );

    ADDER #(.DATA_WIDTH(DATA_WIDTH))
    DP_PC_ADD_4 (
        .in1(pc),
        .in2(adder_op),
        .out(pc_plus_4)
    );

    MUX #(.DATA_WIDTH(DATA_WIDTH))
    DP_REG_FILE_MUX (
        .sel(mem_t_reg),
        .in1(alu_out),
        .in2(read_data),
        .out(mux_result)
    ); 

    SHIFT_PC DP_SHIFT_PC(
        .in(instr[25 : 0]),
        .out(shift_pc)
    );

endmodule