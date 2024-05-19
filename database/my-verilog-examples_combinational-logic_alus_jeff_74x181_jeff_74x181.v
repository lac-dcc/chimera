// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// 4-bit alu (arithmetic logic unit) and function generator.
// Provides 16 binary logic operations and 16 arithmetic operations on two 4-bit words.
// Based on the 7400-series integrated circuits used in my
// programable-8-bit-microprocessor

// MUST PUT includes IN TESTBENCH SINCE MY 8-bit PROCESSOR IS CALLING THESE FILES
//`include "sections/input-section.v"
//`include "sections/invert-m.v"
//`include "sections/out-section-f3.v"
//`include "sections/out-section-f2.v"
//`include "sections/out-section-f1.v"
//`include "sections/out-section-f0.v"
//`include "sections/g-p-carry-section.v"
//`include "sections/aeqb-section.v"

module jeff_74x181(
    input                a0,                  // WORD 1
    input                a1,                  // 
    input                a2,                  // 
    input                a3,                  // 
    input                b0,                  // WORD 2
    input                b1,                  // 
    input                b2,                  // 
    input                b3,                  // 
    input                s0,                  // FUNCTION SELECT
    input                s1,                  // 
    input                s2,                  // 
    input                s3,                  //
    input                m,                   // MODE: 0 is arithmetic, 1 is logic
    input                ci_bar,              // CARRY IN
    output               f0,                  // OUTPUT
    output               f1,                  // 
    output               f2,                  // 
    output               f3,                  // 
    output               co_bar,              // CARRY OUT
    output               aeqb,                // WHEN A = B
    output               x,                   // ALSO PROPAGATE
    output               y                    // ALSO GENERATE
);

    // I DESIGNED THIS FRO THE 1972 TI SPEC SHEET
    wire input3_out1, input3_out2;
    wire input2_out1, input2_out2;
    wire input1_out1, input1_out2;
    wire input0_out1, input0_out2;
    wire m_bar;

    input_section INPUT3(
        .a(a3),
        .b(b3),
        .s3(s3),
        .s2(s2),
        .s1(s1),
        .s0(s0),    
        .out1(input3_out1),
        .out2(input3_out2)
    );

    input_section INPUT2(
        .a(a2),
        .b(b2),
        .s3(s3),
        .s2(s2),
        .s1(s1),
        .s0(s0),   
        .out1(input2_out1),
        .out2(input2_out2)
    );

    input_section INPUT1(
        .a(a1),
        .b(b1),
        .s3(s3),
        .s2(s2),
        .s1(s1),
        .s0(s0),   
        .out1(input1_out1),
        .out2(input1_out2)
    );

    input_section INPUT0(
        .a(a0),
        .b(b0),
        .s3(s3),
        .s2(s2),
        .s1(s1),
        .s0(s0),
        .out1(input0_out1),
        .out2(input0_out2)
    );

    invert_m M_BAR(
        .a(m),
        .y(m_bar)
    );

    out_section_f3 OUT_F3(
        .m_bar(m_bar),
        .ci_bar(ci_bar),
        .input3_out1(input3_out1),
        .input3_out2(input3_out2),
        .input2_out1(input2_out1),
        .input2_out2(input2_out2),
        .input1_out1(input1_out1),
        .input1_out2(input1_out2),
        .input0_out1(input0_out1),
        .input0_out2(input0_out2),
        .f3(f3)
    );

    out_section_f2 OUT_F2(
        .m_bar(m_bar),
        .ci_bar(ci_bar),
        .input2_out1(input2_out1),
        .input2_out2(input2_out2),
        .input1_out1(input1_out1),
        .input1_out2(input1_out2),
        .input0_out1(input0_out1),
        .input0_out2(input0_out2),
        .f2(f2)
    );

    out_section_f1 OUT_F1(
        .m_bar(m_bar),
        .ci_bar(ci_bar),
        .input1_out1(input1_out1),
        .input1_out2(input1_out2),
        .input0_out1(input0_out1),
        .input0_out2(input0_out2),
        .f1(f1)
    );

    out_section_f0 OUT_F0(
        .m_bar(m_bar),
        .ci_bar(ci_bar),
        .input0_out1(input0_out1),
        .input0_out2(input0_out2),
        .f0(f0)
    );

    g_p_carry_section GPC (
        .input3_out1(input3_out1),
        .input3_out2(input3_out2),
        .input2_out1(input2_out1),
        .input2_out2(input2_out2),
        .input1_out1(input1_out1),
        .input1_out2(input1_out2),
        .input0_out1(input0_out1),
        .input0_out2(input0_out2),
        .ci_bar(ci_bar),
        .co_bar(co_bar),
        .x(x),
        .y(y)
    );

    aeqb AEQB (
        .f3(f3),
        .f2(f2),
        .f1(f1),
        .f0(f0),
        .aeqb(aeqb)
    );

endmodule
