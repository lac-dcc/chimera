// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

`include "../boolean_unit/boolean_unit.v"
`include "../shifter/shifter.v"
`include "../compare_unit/riscv_compare_unit.v"
`include "../wallace_tree/wallace_tree.v"
`include "../muxes/x_bit_mux_2.v"
`include "../muxes/x_bit_mux_4.v"
`include "../muxes/x_bit_mux_8.v"
`include "../addersub/adder_sub.v"
`include "../shifter/x_bit_shifter.v"
`include "../shifter/x_bit_shr.v"
`include "../subtraction_logic/subtraction_logic.v"
`include "../bit_sel_logic/bit_sel_logic.v"

module alu_32 #(
  parameter WIDTH = 32
)
(
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    input [WIDTH-1:0] inst,
    output [WIDTH-1:0] out,
    output z,
    output n,
    output v,
    output cmp_out
);

wire [WIDTH-1:0] add_sub_mul;
wire slt;
wire [WIDTH-1:0] sltu_mulhu;
wire [WIDTH-1:0] xor_;
wire [WIDTH-1:0] or_;
wire [WIDTH-1:0] and_;

wire [6:0] funct7;
wire [2:0] funct3;
wire [11:0] imm;
wire [WIDTH-1:0] imm_fr;
wire imm_sel;
wire cmp;

wire [WIDTH-1:0] adder_sub_result;
wire [63:0] mu_mul;
wire [WIDTH-1:0] shft_out;
wire [4:0] shft_in;

wire [WIDTH-1:0] b_imm;
wire [4:0] b_imm_shift;

wire sub_bit;
wire sub_select;
wire add_mul_selector;

wire z_out;
wire v_out;
wire n_out;

assign cmp_out = slt;
assign z = z_out;
assign v = v_out;
assign n = n_out;
assign funct7 = inst[31:25];
assign funct3 = inst[14:12];
assign imm = inst[31:20];
assign b_imm_shift = inst[24:20];
assign and_ = b_imm & a;
assign xor_ = b_imm ^ a;
assign or_ = b_imm | a;

// sign extended immediate
x_bit_mux_2 #(.WIDTH(WIDTH)) seimm_sel (.a({{20{1'b0}}, imm}), .b({{20{1'b1}}, imm}), 
    .s(imm[11]), .out(imm_fr));
// select the shift amount between imm and b
x_bit_mux_2 #(.WIDTH(5)) shamt_sel (.a(b_imm_shift), .b(b[4:0]), .s(inst[5]), .out(shft_in));
// Select between multiplier and adder subtractor
x_bit_mux_2 #(.WIDTH(WIDTH)) add_mul_sel (.a(adder_sub_result), .b(mu_mul[31:0]),
     .s(add_mul_selector), .out(add_sub_mul));
// select between b or imm[11:0]
x_bit_mux_2 #(.WIDTH(WIDTH)) b_imm_sel (.a(b), .b(imm_fr), 
    .s(imm_sel), .out(b_imm));
// select between sltu / mulhu
x_bit_mux_2 #(.WIDTH(WIDTH)) sltu_mulhu_sel (.a({{31{1'b0}},slt}), .b(mu_mul[63:32]), .s(inst[25]), .out(sltu_mulhu));
// select ALU output
x_bit_mux_8 #(.WIDTH(WIDTH)) out_sel (.a(add_sub_mul), .b(shft_out),
.c({{31{1'b0}},slt}), .d(sltu_mulhu), .e(xor_), .f(shft_out), .g(or_), .h(and_), .s0(funct3[0]),
.s1(funct3[1]), .s2(funct3[2]), .out(out));
// select the selection bit between adder subtractor and multiplier
mux_2 addormul (.a(1'b0), .b(inst[25]), .s(inst[5]), .out(add_mul_selector));

// subtraction logic
subtraction_logic s_logic (.opcode(inst[6:0]), .funct3(funct3), .funct7(funct7), .out(sub_select));
// imm sel logic
bit_sel_logic bit_selector (.opcode(inst[6:0]), .out(imm_sel));

// shifter SLL/SRL/SRA
shifter #(.BITS(WIDTH)) shft(.a(a), .b(shft_in), .alufn({inst[30], funct3[2]}), .out(shft_out));
// compare unit
riscv_compare_unit c_u(.z(z_out), .v(v_out), .n(n_out), .bit31(adder_sub_result[31]), 
    .funct3(funct3), .b_o(slt));
// Multiplier
WallaceTreeMul mu(.A(a), .B(b), .C(mu_mul));
// Adder subtractor
adder_sub #(.WIDTH(WIDTH)) adder(.a(a), .b(b_imm), .z_out(z_out), .n_out(n_out), 
  .v_out(v_out), .alufn(sub_select), .result(adder_sub_result));

endmodule
