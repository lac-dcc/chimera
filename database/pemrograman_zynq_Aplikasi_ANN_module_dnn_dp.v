// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

// *** Author : Erwin Ouyang
// *** Date   : 10 May 2018
`timescale 1ns / 1ps

module dnn_dp
    (
        input wire                clk,
        input wire                rst_n,
        input wire                en,
        input wire                clr,
        input wire signed [15:0]  x0, x1, x2, x3, x4, x5, x6, x7,
        input wire signed [15:0]  w00, w01, w02, w03, w04, w05, w06, w07,
        input wire signed [15:0]  w10, w11, w12, w13, w14, w15, w16, w17,
        input wire signed [15:0]  w20, w21, w22, w23, w24, w25, w26, w27,
        input wire signed [15:0]  w30, w31, w32, w33, w34, w35, w36, w37,
        input wire signed [15:0]  w40, w41, w42, w43, w44, w45, w46, w47,
        input wire signed [15:0]  w50, w51, w52, w53, w54, w55, w56, w57,
        input wire signed [15:0]  w60, w61, w62, w63, w64, w65, w66, w67,
        input wire signed [15:0]  w70, w71, w72, w73, w74, w75, w76, w77,
        output wire signed [15:0] a0, a1, a2, a3, a4, a5, a6, a7    
    );
    
    wire signed [15:0] z0_w, z1_w, z2_w, z3_w, z4_w, z5_w, z6_w, z7_w;
    wire signed [15:0] a0_w, a1_w, a2_w, a3_w, a4_w, a5_w, a6_w, a7_w;
    
    // *** Matrix multiplication datapath ***
    matrix_dp matrix_dp_0
    (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .clr(clr),
        .x0(x0), .x1(x1), .x2(x2), .x3(x3), .x4(x4), .x5(x5), .x6(x6), .x7(x7),
        .w00(w00), .w01(w01), .w02(w02), .w03(w03), .w04(w04), .w05(w05), .w06(w06), .w07(w07),
        .w10(w10), .w11(w11), .w12(w12), .w13(w13), .w14(w14), .w15(w15), .w16(w16), .w17(w17),
        .w20(w20), .w21(w21), .w22(w22), .w23(w23), .w24(w24), .w25(w25), .w26(w26), .w27(w27),
        .w30(w30), .w31(w31), .w32(w32), .w33(w33), .w34(w34), .w35(w35), .w36(w36), .w37(w37),
        .w40(w40), .w41(w41), .w42(w42), .w43(w43), .w44(w44), .w45(w45), .w46(w46), .w47(w47),
        .w50(w50), .w51(w51), .w52(w52), .w53(w53), .w54(w54), .w55(w55), .w56(w56), .w57(w57),
        .w60(w60), .w61(w61), .w62(w62), .w63(w63), .w64(w64), .w65(w65), .w66(w66), .w67(w67),
        .w70(w70), .w71(w71), .w72(w72), .w73(w73), .w74(w74), .w75(w75), .w76(w76), .w77(w77),
        .z0(z0_w), .z1(z1_w), .z2(z2_w), .z3(z3_w), .z4(z4_w), .z5(z5_w), .z6(z6_w), .z7(z7_w)
    );

    // *** Sigmoid LUT ***
    sig_lut sig_lut_0(z0_w[13:6], a0_w);
    sig_lut sig_lut_1(z1_w[13:6], a1_w);
    sig_lut sig_lut_2(z2_w[13:6], a2_w);
    sig_lut sig_lut_3(z3_w[13:6], a3_w);
    sig_lut sig_lut_4(z4_w[13:6], a4_w);
    sig_lut sig_lut_5(z5_w[13:6], a5_w);
    sig_lut sig_lut_6(z6_w[13:6], a6_w);
    sig_lut sig_lut_7(z7_w[13:6], a7_w);
    
    // *** Output register ***
    register reg_a0(clk, rst_n, en, clr, a0_w, a0);
    register reg_a1(clk, rst_n, en, clr, a1_w, a1);
    register reg_a2(clk, rst_n, en, clr, a2_w, a2);
    register reg_a3(clk, rst_n, en, clr, a3_w, a3);
    register reg_a4(clk, rst_n, en, clr, a4_w, a4);
    register reg_a5(clk, rst_n, en, clr, a5_w, a5);
    register reg_a6(clk, rst_n, en, clr, a6_w, a6);
    register reg_a7(clk, rst_n, en, clr, a7_w, a7);
    
endmodule
