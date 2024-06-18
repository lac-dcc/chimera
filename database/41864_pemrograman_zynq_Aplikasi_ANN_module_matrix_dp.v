// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

// *** Author : Erwin Ouyang
// *** Date   : 10 May 2018
`timescale 1ns / 1ps

module matrix_dp
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
        output wire signed [15:0] z0, z1, z2, z3, z4, z5, z6, z7    
    );
    
    // *** x in ***
    wire signed [15:0] x00_in, x01_in, x02_in, x03_in, x04_in, x05_in, x06_in, x07_in,
                       x10_in, x11_in, x12_in, x13_in, x14_in, x15_in, x16_in, x17_in,
                       x20_in, x21_in, x22_in, x23_in, x24_in, x25_in, x26_in, x27_in,
                       x30_in, x31_in, x32_in, x33_in, x34_in, x35_in, x36_in, x37_in,
                       x40_in, x41_in, x42_in, x43_in, x44_in, x45_in, x46_in, x47_in,
                       x50_in, x51_in, x52_in, x53_in, x54_in, x55_in, x56_in, x57_in,
                       x60_in, x61_in, x62_in, x63_in, x64_in, x65_in, x66_in, x67_in,
                       x70_in, x71_in, x72_in, x73_in, x74_in, x75_in, x76_in, x77_in;
    // *** z in ***
    wire signed [15:0] z00_in, z01_in, z02_in, z03_in, z04_in, z05_in, z06_in, z07_in,
                       z10_in, z11_in, z12_in, z13_in, z14_in, z15_in, z16_in, z17_in,
                       z20_in, z21_in, z22_in, z23_in, z24_in, z25_in, z26_in, z27_in,
                       z30_in, z31_in, z32_in, z33_in, z34_in, z35_in, z36_in, z37_in,
                       z40_in, z41_in, z42_in, z43_in, z44_in, z45_in, z46_in, z47_in,
                       z50_in, z51_in, z52_in, z53_in, z54_in, z55_in, z56_in, z57_in,
                       z60_in, z61_in, z62_in, z63_in, z64_in, z65_in, z66_in, z67_in,
                       z70_in, z71_in, z72_in, z73_in, z74_in, z75_in, z76_in, z77_in;
    // *** x out ***
    wire signed [15:0] x00_out, x01_out, x02_out, x03_out, x04_out, x05_out, x06_out, x07_out,
                       x10_out, x11_out, x12_out, x13_out, x14_out, x15_out, x16_out, x17_out,
                       x20_out, x21_out, x22_out, x23_out, x24_out, x25_out, x26_out, x27_out,
                       x30_out, x31_out, x32_out, x33_out, x34_out, x35_out, x36_out, x37_out,
                       x40_out, x41_out, x42_out, x43_out, x44_out, x45_out, x46_out, x47_out,
                       x50_out, x51_out, x52_out, x53_out, x54_out, x55_out, x56_out, x57_out,
                       x60_out, x61_out, x62_out, x63_out, x64_out, x65_out, x66_out, x67_out,
                       x70_out, x71_out, x72_out, x73_out, x74_out, x75_out, x76_out, x77_out;
    // *** z out ***
    wire signed [15:0] z00_out, z01_out, z02_out, z03_out, z04_out, z05_out, z06_out, z07_out,
                       z10_out, z11_out, z12_out, z13_out, z14_out, z15_out, z16_out, z17_out,
                       z20_out, z21_out, z22_out, z23_out, z24_out, z25_out, z26_out, z27_out,
                       z30_out, z31_out, z32_out, z33_out, z34_out, z35_out, z36_out, z37_out,
                       z40_out, z41_out, z42_out, z43_out, z44_out, z45_out, z46_out, z47_out,
                       z50_out, z51_out, z52_out, z53_out, z54_out, z55_out, z56_out, z57_out,
                       z60_out, z61_out, z62_out, z63_out, z64_out, z65_out, z66_out, z67_out,
                       z70_out, z71_out, z72_out, z73_out, z74_out, z75_out, z76_out, z77_out;
    
    // *** First x input ***
    assign x00_in = x0;
    assign x10_in = x1;
    assign x20_in = x2;
    assign x30_in = x3;
    assign x40_in = x4;
    assign x50_in = x5;
    assign x60_in = x6;
    assign x70_in = x7;
    
    // *** First z input ***
    assign z00_in = 0;
    assign z01_in = 0;
    assign z02_in = 0;
    assign z03_in = 0;
    assign z04_in = 0;
    assign z05_in = 0;
    assign z06_in = 0;
    assign z07_in = 0;
    
    // *** 8x8 systolic array ***
    // *** Row 0 from bottom ***
    matrix_pe pe00(x00_in, z00_in, w00, x00_out, z00_out);
    matrix_pe pe01(x01_in, z01_in, w01, x01_out, z01_out);
    matrix_pe pe02(x02_in, z02_in, w02, x02_out, z02_out);
    matrix_pe pe03(x03_in, z03_in, w03, x03_out, z03_out);
    matrix_pe pe04(x04_in, z04_in, w04, x04_out, z04_out);
    matrix_pe pe05(x05_in, z05_in, w05, x05_out, z05_out);
    matrix_pe pe06(x06_in, z06_in, w06, x06_out, z06_out);
    matrix_pe pe07(x07_in, z07_in, w07, x07_out, z07_out);
    // *** Row 1 from bottom ***
    matrix_pe pe10(x10_in, z10_in, w10, x10_out, z10_out);
    matrix_pe pe11(x11_in, z11_in, w11, x11_out, z11_out);
    matrix_pe pe12(x12_in, z12_in, w12, x12_out, z12_out);
    matrix_pe pe13(x13_in, z13_in, w13, x13_out, z13_out);
    matrix_pe pe14(x14_in, z14_in, w14, x14_out, z14_out);
    matrix_pe pe15(x15_in, z15_in, w15, x15_out, z15_out);
    matrix_pe pe16(x16_in, z16_in, w16, x16_out, z16_out);
    matrix_pe pe17(x17_in, z17_in, w17, x17_out, z17_out);
    // *** Row 2 from bottom ***
    matrix_pe pe20(x20_in, z20_in, w20, x20_out, z20_out);
    matrix_pe pe21(x21_in, z21_in, w21, x21_out, z21_out);
    matrix_pe pe22(x22_in, z22_in, w22, x22_out, z22_out);
    matrix_pe pe23(x23_in, z23_in, w23, x23_out, z23_out);
    matrix_pe pe24(x24_in, z24_in, w24, x24_out, z24_out);
    matrix_pe pe25(x25_in, z25_in, w25, x25_out, z25_out);
    matrix_pe pe26(x26_in, z26_in, w26, x26_out, z26_out);
    matrix_pe pe27(x27_in, z27_in, w27, x27_out, z27_out);
    // *** Row 3 from bottom ***
    matrix_pe pe30(x30_in, z30_in, w30, x30_out, z30_out);
    matrix_pe pe31(x31_in, z31_in, w31, x31_out, z31_out);
    matrix_pe pe32(x32_in, z32_in, w32, x32_out, z32_out);
    matrix_pe pe33(x33_in, z33_in, w33, x33_out, z33_out);
    matrix_pe pe34(x34_in, z34_in, w34, x34_out, z34_out);
    matrix_pe pe35(x35_in, z35_in, w35, x35_out, z35_out);
    matrix_pe pe36(x36_in, z36_in, w36, x36_out, z36_out);
    matrix_pe pe37(x37_in, z37_in, w37, x37_out, z37_out);
    // *** Row 4 from bottom ***
    matrix_pe pe40(x40_in, z40_in, w40, x40_out, z40_out);
    matrix_pe pe41(x41_in, z41_in, w41, x41_out, z41_out);
    matrix_pe pe42(x42_in, z42_in, w42, x42_out, z42_out);
    matrix_pe pe43(x43_in, z43_in, w43, x43_out, z43_out);
    matrix_pe pe44(x44_in, z44_in, w44, x44_out, z44_out);
    matrix_pe pe45(x45_in, z45_in, w45, x45_out, z45_out);
    matrix_pe pe46(x46_in, z46_in, w46, x46_out, z46_out);
    matrix_pe pe47(x47_in, z47_in, w47, x47_out, z47_out);
    // *** Row 5 from bottom ***
    matrix_pe pe50(x50_in, z50_in, w50, x50_out, z50_out);
    matrix_pe pe51(x51_in, z51_in, w51, x51_out, z51_out);
    matrix_pe pe52(x52_in, z52_in, w52, x52_out, z52_out);
    matrix_pe pe53(x53_in, z53_in, w53, x53_out, z53_out);
    matrix_pe pe54(x54_in, z54_in, w54, x54_out, z54_out);
    matrix_pe pe55(x55_in, z55_in, w55, x55_out, z55_out);
    matrix_pe pe56(x56_in, z56_in, w56, x56_out, z56_out);
    matrix_pe pe57(x57_in, z57_in, w57, x57_out, z57_out);
    // *** Row 6 from bottom ***
    matrix_pe pe60(x60_in, z60_in, w60, x60_out, z60_out);
    matrix_pe pe61(x61_in, z61_in, w61, x61_out, z61_out);
    matrix_pe pe62(x62_in, z62_in, w62, x62_out, z62_out);
    matrix_pe pe63(x63_in, z63_in, w63, x63_out, z63_out);
    matrix_pe pe64(x64_in, z64_in, w64, x64_out, z64_out);
    matrix_pe pe65(x65_in, z65_in, w65, x65_out, z65_out);
    matrix_pe pe66(x66_in, z66_in, w66, x66_out, z66_out);
    matrix_pe pe67(x67_in, z67_in, w67, x67_out, z67_out);
    // *** Row 7 from bottom ***
    matrix_pe pe70(x70_in, z70_in, w70, x70_out, z70_out);
    matrix_pe pe71(x71_in, z71_in, w71, x71_out, z71_out);
    matrix_pe pe72(x72_in, z72_in, w72, x72_out, z72_out);
    matrix_pe pe73(x73_in, z73_in, w73, x73_out, z73_out);
    matrix_pe pe74(x74_in, z74_in, w74, x74_out, z74_out);
    matrix_pe pe75(x75_in, z75_in, w75, x75_out, z75_out);
    matrix_pe pe76(x76_in, z76_in, w76, x76_out, z76_out);
    matrix_pe pe77(x77_in, z77_in, w77, x77_out, z77_out);
    
    // *** Register ***
    // *** Row 0 from bottom ***
    register reg_x00(clk, rst_n, en, clr, x00_out, x01_in); 
    register reg_x01(clk, rst_n, en, clr, x01_out, x02_in);
    register reg_x02(clk, rst_n, en, clr, x02_out, x03_in);
    register reg_x03(clk, rst_n, en, clr, x03_out, x04_in);
    register reg_x04(clk, rst_n, en, clr, x04_out, x05_in);
    register reg_x05(clk, rst_n, en, clr, x05_out, x06_in);
    register reg_x06(clk, rst_n, en, clr, x06_out, x07_in);
    // *** Row 1 from bottom ***
    register reg_x10(clk, rst_n, en, clr, x10_out, x11_in); 
    register reg_x11(clk, rst_n, en, clr, x11_out, x12_in);
    register reg_x12(clk, rst_n, en, clr, x12_out, x13_in);
    register reg_x13(clk, rst_n, en, clr, x13_out, x14_in);
    register reg_x14(clk, rst_n, en, clr, x14_out, x15_in);
    register reg_x15(clk, rst_n, en, clr, x15_out, x16_in);
    register reg_x16(clk, rst_n, en, clr, x16_out, x17_in);
    // *** Row 2 from bottom ***
    register reg_x20(clk, rst_n, en, clr, x20_out, x21_in); 
    register reg_x21(clk, rst_n, en, clr, x21_out, x22_in);
    register reg_x22(clk, rst_n, en, clr, x22_out, x23_in);
    register reg_x23(clk, rst_n, en, clr, x23_out, x24_in);
    register reg_x24(clk, rst_n, en, clr, x24_out, x25_in);
    register reg_x25(clk, rst_n, en, clr, x25_out, x26_in);
    register reg_x26(clk, rst_n, en, clr, x26_out, x27_in);
    // *** Row 3 from bottom ***
    register reg_x30(clk, rst_n, en, clr, x30_out, x31_in); 
    register reg_x31(clk, rst_n, en, clr, x31_out, x32_in);
    register reg_x32(clk, rst_n, en, clr, x32_out, x33_in);
    register reg_x33(clk, rst_n, en, clr, x33_out, x34_in);
    register reg_x34(clk, rst_n, en, clr, x34_out, x35_in);
    register reg_x35(clk, rst_n, en, clr, x35_out, x36_in);
    register reg_x36(clk, rst_n, en, clr, x36_out, x37_in);
    // *** Row 4 from bottom ***
    register reg_x40(clk, rst_n, en, clr, x40_out, x41_in); 
    register reg_x41(clk, rst_n, en, clr, x41_out, x42_in);
    register reg_x42(clk, rst_n, en, clr, x42_out, x43_in);
    register reg_x43(clk, rst_n, en, clr, x43_out, x44_in);
    register reg_x44(clk, rst_n, en, clr, x44_out, x45_in);
    register reg_x45(clk, rst_n, en, clr, x45_out, x46_in);
    register reg_x46(clk, rst_n, en, clr, x46_out, x47_in);
    // *** Row 5 from bottom ***
    register reg_x50(clk, rst_n, en, clr, x50_out, x51_in); 
    register reg_x51(clk, rst_n, en, clr, x51_out, x52_in);
    register reg_x52(clk, rst_n, en, clr, x52_out, x53_in);
    register reg_x53(clk, rst_n, en, clr, x53_out, x54_in);
    register reg_x54(clk, rst_n, en, clr, x54_out, x55_in);
    register reg_x55(clk, rst_n, en, clr, x55_out, x56_in);
    register reg_x56(clk, rst_n, en, clr, x56_out, x57_in);
    // *** Row 6 from bottom ***
    register reg_x60(clk, rst_n, en, clr, x60_out, x61_in); 
    register reg_x61(clk, rst_n, en, clr, x61_out, x62_in);
    register reg_x62(clk, rst_n, en, clr, x62_out, x63_in);
    register reg_x63(clk, rst_n, en, clr, x63_out, x64_in);
    register reg_x64(clk, rst_n, en, clr, x64_out, x65_in);
    register reg_x65(clk, rst_n, en, clr, x65_out, x66_in);
    register reg_x66(clk, rst_n, en, clr, x66_out, x67_in);
    // *** Row 7 from bottom ***
    register reg_x70(clk, rst_n, en, clr, x70_out, x71_in); 
    register reg_x71(clk, rst_n, en, clr, x71_out, x72_in);
    register reg_x72(clk, rst_n, en, clr, x72_out, x73_in);
    register reg_x73(clk, rst_n, en, clr, x73_out, x74_in);
    register reg_x74(clk, rst_n, en, clr, x74_out, x75_in);
    register reg_x75(clk, rst_n, en, clr, x75_out, x76_in);
    register reg_x76(clk, rst_n, en, clr, x76_out, x77_in);
    // *** Column 0 from left ***
    register reg_z00(clk, rst_n, en, clr, z00_out, z10_in);
    register reg_z10(clk, rst_n, en, clr, z10_out, z20_in);
    register reg_z20(clk, rst_n, en, clr, z20_out, z30_in);
    register reg_z30(clk, rst_n, en, clr, z30_out, z40_in);
    register reg_z40(clk, rst_n, en, clr, z40_out, z50_in);
    register reg_z50(clk, rst_n, en, clr, z50_out, z60_in);
    register reg_z60(clk, rst_n, en, clr, z60_out, z70_in);
    register reg_z70(clk, rst_n, en, clr, z70_out, z0);
    // *** Column 1 from left ***
    register reg_z01(clk, rst_n, en, clr, z01_out, z11_in);
    register reg_z11(clk, rst_n, en, clr, z11_out, z21_in);
    register reg_z21(clk, rst_n, en, clr, z21_out, z31_in);
    register reg_z31(clk, rst_n, en, clr, z31_out, z41_in);
    register reg_z41(clk, rst_n, en, clr, z41_out, z51_in);
    register reg_z51(clk, rst_n, en, clr, z51_out, z61_in);
    register reg_z61(clk, rst_n, en, clr, z61_out, z71_in);
    register reg_z71(clk, rst_n, en, clr, z71_out, z1);
    // *** Column 2 from left ***
    register reg_z02(clk, rst_n, en, clr, z02_out, z12_in);
    register reg_z12(clk, rst_n, en, clr, z12_out, z22_in);
    register reg_z22(clk, rst_n, en, clr, z22_out, z32_in);
    register reg_z32(clk, rst_n, en, clr, z32_out, z42_in);
    register reg_z42(clk, rst_n, en, clr, z42_out, z52_in);
    register reg_z52(clk, rst_n, en, clr, z52_out, z62_in);
    register reg_z62(clk, rst_n, en, clr, z62_out, z72_in);
    register reg_z72(clk, rst_n, en, clr, z72_out, z2);
    // *** Column 3 from left ***
    register reg_z03(clk, rst_n, en, clr, z03_out, z13_in);
    register reg_z13(clk, rst_n, en, clr, z13_out, z23_in);
    register reg_z23(clk, rst_n, en, clr, z23_out, z33_in);
    register reg_z33(clk, rst_n, en, clr, z33_out, z43_in);
    register reg_z43(clk, rst_n, en, clr, z43_out, z53_in);
    register reg_z53(clk, rst_n, en, clr, z53_out, z63_in);
    register reg_z63(clk, rst_n, en, clr, z63_out, z73_in);
    register reg_z73(clk, rst_n, en, clr, z73_out, z3);
    // *** Column 4 from left ***
    register reg_z04(clk, rst_n, en, clr, z04_out, z14_in);
    register reg_z14(clk, rst_n, en, clr, z14_out, z24_in);
    register reg_z24(clk, rst_n, en, clr, z24_out, z34_in);
    register reg_z34(clk, rst_n, en, clr, z34_out, z44_in);
    register reg_z44(clk, rst_n, en, clr, z44_out, z54_in);
    register reg_z54(clk, rst_n, en, clr, z54_out, z64_in);
    register reg_z64(clk, rst_n, en, clr, z64_out, z74_in);
    register reg_z74(clk, rst_n, en, clr, z74_out, z4);
    // *** Column 5 from left ***
    register reg_z05(clk, rst_n, en, clr, z05_out, z15_in);
    register reg_z15(clk, rst_n, en, clr, z15_out, z25_in);
    register reg_z25(clk, rst_n, en, clr, z25_out, z35_in);
    register reg_z35(clk, rst_n, en, clr, z35_out, z45_in);
    register reg_z45(clk, rst_n, en, clr, z45_out, z55_in);
    register reg_z55(clk, rst_n, en, clr, z55_out, z65_in);
    register reg_z65(clk, rst_n, en, clr, z65_out, z75_in);
    register reg_z75(clk, rst_n, en, clr, z75_out, z5);
    // *** Column 6 from left ***
    register reg_z06(clk, rst_n, en, clr, z06_out, z16_in);
    register reg_z16(clk, rst_n, en, clr, z16_out, z26_in);
    register reg_z26(clk, rst_n, en, clr, z26_out, z36_in);
    register reg_z36(clk, rst_n, en, clr, z36_out, z46_in);
    register reg_z46(clk, rst_n, en, clr, z46_out, z56_in);
    register reg_z56(clk, rst_n, en, clr, z56_out, z66_in);
    register reg_z66(clk, rst_n, en, clr, z66_out, z76_in);
    register reg_z76(clk, rst_n, en, clr, z76_out, z6);
    // *** Column 7 from left ***
    register reg_z07(clk, rst_n, en, clr, z07_out, z17_in);
    register reg_z17(clk, rst_n, en, clr, z17_out, z27_in);
    register reg_z27(clk, rst_n, en, clr, z27_out, z37_in);
    register reg_z37(clk, rst_n, en, clr, z37_out, z47_in);
    register reg_z47(clk, rst_n, en, clr, z47_out, z57_in);
    register reg_z57(clk, rst_n, en, clr, z57_out, z67_in);
    register reg_z67(clk, rst_n, en, clr, z67_out, z77_in);
    register reg_z77(clk, rst_n, en, clr, z77_out, z7);

endmodule
