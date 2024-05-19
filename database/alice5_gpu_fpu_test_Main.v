// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0


module Main(
    input wire clock,
    input wire [1:0] rmode,
    input wire [2:0] fpu_op,
    input wire [31:0] opa,
    input wire [31:0] opb,
    output wire [31:0] out,
    output wire inf, snan, qnan,
    output wire ine,
    output wire overflow, underflow,
    output wire zero,
    output wire div_by_zero,

    input wire [31:0] cmp_opa, cmp_opb,
    output wire cmp_unordered,
    output wire cmp_altb, cmp_blta, cmp_aeqb,
    output wire cmp_inf, cmp_zero,

    input wire [31:0] float_to_int_op,
    input wire [1:0] float_to_int_rmode,
    output wire [31:0] float_to_int_res,

    input wire [31:0] int_to_float_op,
    output wire [31:0] int_to_float_res
);

fpu fpu(
    .clk(clock),
    .rmode(rmode),
    .fpu_op(fpu_op),
    .opa(opa),
    .opb(opb),
    .out(out),
    .inf(inf),
    .snan(snan),
    .qnan(qnan),
    .ine(ine),
    .overflow(overflow),
    .underflow(underflow),
    .zero(zero),
    .div_by_zero(div_by_zero));

fcmp fcmp(
    .opa(cmp_opa),
    .opb(cmp_opb),
    .unordered(cmp_unordered),
    .altb(cmp_altb),
    .blta(cmp_blta),
    .aeqb(cmp_aeqb),
    .inf(cmp_inf),
    .zero(cmp_zero));

float_to_int float_to_int(
    .op(float_to_int_op),
    .rmode(float_to_int_rmode),
    .res(float_to_int_res));

int_to_float int_to_float(
    .op(int_to_float_op),
    .res(int_to_float_res));

endmodule
