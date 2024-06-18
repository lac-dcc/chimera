// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// RISC-V IMF decoder
module RISCVDecode
    #(parameter INSN_WIDTH=32) 
(
    input wire [INSN_WIDTH-1:0] inst,

    output wire opcode_is_branch,
    output wire opcode_is_ALU_reg_imm,
    output wire opcode_add_is_add,
    output wire opcode_shift_is_logical,
    output wire opcode_is_ALU_reg_reg,
    output wire opcode_is_jal,
    output wire opcode_is_jalr,
    output wire opcode_is_lui,
    output wire opcode_is_auipc,
    output wire opcode_is_load,
    output wire opcode_is_store,
    output wire opcode_is_system,
    output wire opcode_is_fadd,
    output wire opcode_is_fsub,
    output wire opcode_is_fmul,
    output wire opcode_is_fdiv,
    output wire opcode_is_fsgnj,
    output wire opcode_is_fminmax,
    output wire opcode_is_fsqrt,
    output wire opcode_is_fcmp,
    output wire opcode_is_fcvt_f2i,
    output wire opcode_is_fmv_f2i,
    output wire opcode_is_fcvt_i2f,
    output wire opcode_is_fmv_i2f,
    output wire opcode_is_flw,
    output wire opcode_is_fsw,
    output wire opcode_is_fmadd,
    output wire opcode_is_fmsub,
    output wire opcode_is_fnmsub,
    output wire opcode_is_fnmadd,

    output wire [4:0] rs1,
    output wire [4:0] rs2,
    output wire [4:0] rs3,
    output wire [4:0] rd,
    output wire [1:0] fmt,
    output wire [2:0] funct3_rm,
    output wire [6:0] funct7,
    output wire [4:0] funct5,
    output wire [4:0] shamt_ftype,

    output wire signed [11:0] imm_alu_load,
    output wire signed [11:0] imm_store,
    output wire signed [12:0] imm_branch,
    output wire signed [31:0] imm_upper,
    output wire signed [20:0] imm_jump
);

    wire [6:0] opcode;
    wire [4:0] ffunct;

    assign opcode = {inst[6:2],inst[1:0]};
    assign ffunct = {inst[31:27]};

    assign opcode_is_branch = opcode == {5'h18,2'h3};
    assign opcode_is_jal = opcode == {5'h1b,2'h3};
    assign opcode_is_jalr = opcode == {5'h19,2'h3};
    assign opcode_is_lui = opcode == {5'h0d,2'h3};
    assign opcode_is_auipc = opcode == {5'h05,2'h3};
    assign opcode_is_ALU_reg_imm = opcode == {5'h04,2'h3};
    assign opcode_is_ALU_reg_reg = opcode == {5'h0c,2'h3};
    assign opcode_is_load = opcode == {5'h00,2'h3};
    assign opcode_is_store = opcode == {5'h08,2'h3};
    assign opcode_is_system = opcode == {5'h1c,2'h3};

    assign opcode_add_is_add = ~inst[30];
    assign opcode_shift_is_logical = ~inst[30];

    assign rs1 = inst[19:15];
    assign rs2 = inst[24:20];
    assign rs3 = inst[31:27];
    assign rd = inst[11:7];
    assign fmt = inst[26:25];
    assign funct3_rm = inst[14:12];
    assign funct7 = inst[31:25];
    assign funct5 = inst[31:27];
    assign shamt_ftype = inst[24:20];

    assign opcode_is_fadd = ((opcode == {5'h14,2'h3}) && (ffunct == {5'h0}));
    assign opcode_is_fsub = ((opcode == {5'h14,2'h3}) && (ffunct == {5'h1}));
    assign opcode_is_fmul = ((opcode == {5'h14,2'h3}) && (ffunct == {5'h2}));
    assign opcode_is_fdiv = ((opcode == {5'h14,2'h3}) && (ffunct == {5'h3}));
    assign opcode_is_fsgnj = ((opcode == {5'h14,2'h3}) && (ffunct == {5'h4}));
    assign opcode_is_fminmax = ((opcode == {5'h14,2'h3}) && (ffunct == {5'h5}));
    assign opcode_is_fsqrt = ((opcode == {5'h14,2'h3}) && (ffunct == {5'hb}));
    assign opcode_is_fcmp = ((opcode == {5'h14,2'h3}) && (ffunct == {5'h14}));
    assign opcode_is_fcvt_f2i = ((opcode == {5'h14,2'h3}) && (ffunct == {5'h18}));
    assign opcode_is_fmv_f2i = ((opcode == {5'h14,2'h3}) && (ffunct == {5'h1c}));
    assign opcode_is_fcvt_i2f = ((opcode == {5'h14,2'h3}) && (ffunct == {5'h1a}));
    assign opcode_is_fmv_i2f = ((opcode == {5'h14,2'h3}) && (ffunct == {5'h1e}));
    assign opcode_is_flw = opcode == {5'h01,2'h3};
    assign opcode_is_fsw = opcode == {5'h09,2'h3};
    assign opcode_is_fmadd = opcode == {5'h10,2'h3};
    assign opcode_is_fmsub = opcode == {5'h11,2'h3};
    assign opcode_is_fnmsub = opcode == {5'h12,2'h3};
    assign opcode_is_fnmadd = opcode == {5'h13,2'h3};

    assign imm_alu_load = inst[31:20];
    assign imm_store = {inst[31:25], inst[11:7]};
    assign imm_branch = {inst[31], inst[7], inst[30:25], inst[11:8], 1'b0};
    assign imm_upper = {inst[31:12], 12'b0};
    assign imm_jump = {inst[31], inst[19:12], inst[20], inst[30:21], 1'b0};

endmodule
