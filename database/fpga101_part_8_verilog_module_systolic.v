// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps

module systolic
    #( 
        parameter WIDTH = 16,
        parameter FRAC_BIT = 10
    )
    (
        input wire                     clk,
        input wire                     rst_n,
        input wire                     en,
        input wire                     clr,
        input wire signed [WIDTH-1:0]  a0, a1, a2, a3,
        input wire                     in_valid,
        input wire signed [WIDTH-1:0]  b00, b01, b02, b03,
        input wire signed [WIDTH-1:0]  b10, b11, b12, b13,
        input wire signed [WIDTH-1:0]  b20, b21, b22, b23,
        input wire signed [WIDTH-1:0]  b30, b31, b32, b33,
        output wire signed [WIDTH-1:0] y0, y1, y2, y3,  
        output wire                    out_valid  
    );
    
    // *** Input registers ***
    wire signed [WIDTH-1:0] a0_reg0;
    wire signed [WIDTH-1:0] a1_reg0, a1_reg1;
    wire signed [WIDTH-1:0] a2_reg0, a2_reg1, a2_reg2; 
    wire signed [WIDTH-1:0] a3_reg0, a3_reg1, a3_reg2, a3_reg3;
    
    // *** a in ***
    wire signed [WIDTH-1:0] a00_in, a01_in, a02_in, a03_in,
                            a10_in, a11_in, a12_in, a13_in,
                            a20_in, a21_in, a22_in, a23_in,
                            a30_in, a31_in, a32_in, a33_in;
    // *** y in ***
    wire signed [WIDTH-1:0] y00_in, y01_in, y02_in, y03_in,
                            y10_in, y11_in, y12_in, y13_in,
                            y20_in, y21_in, y22_in, y23_in,
                            y30_in, y31_in, y32_in, y33_in;
    // *** a out ***
    wire signed [WIDTH-1:0] a00_out, a01_out, a02_out, a03_out,
                            a10_out, a11_out, a12_out, a13_out,
                            a20_out, a21_out, a22_out, a23_out,
                            a30_out, a31_out, a32_out, a33_out;
    // *** y out ***
    wire signed [WIDTH-1:0] y00_out, y01_out, y02_out, y03_out,
                            y10_out, y11_out, y12_out, y13_out,
                            y20_out, y21_out, y22_out, y23_out,
                            y30_out, y31_out, y32_out, y33_out;
    
    // *** Output registers ***
    wire signed [WIDTH-1:0] y0_tmp, y1_tmp, y2_tmp, y3_tmp; 
    wire signed [WIDTH-1:0] y0_reg0, y0_reg1, y0_reg2, y0_reg3;
    wire signed [WIDTH-1:0] y1_reg0, y1_reg1, y1_reg2;
    wire signed [WIDTH-1:0] y2_reg0, y2_reg1; 
    wire signed [WIDTH-1:0] y3_reg0;
    
    // *** Valid registers ***
    wire in_valid_reg0, in_valid_reg1, in_valid_reg2, in_valid_reg3, in_valid_reg4, in_valid_reg5, in_valid_reg6, in_valid_reg7, in_valid_reg8;
    
    // *** Input registers for systolic data setup ***
    register #(WIDTH) reg_a0_0(clk, rst_n, en, clr, a0,      a0_reg0); 
    register #(WIDTH) reg_a1_0(clk, rst_n, en, clr, a1,      a1_reg0); 
    register #(WIDTH) reg_a1_1(clk, rst_n, en, clr, a1_reg0, a1_reg1); 
    register #(WIDTH) reg_a2_0(clk, rst_n, en, clr, a2,      a2_reg0);
    register #(WIDTH) reg_a2_1(clk, rst_n, en, clr, a2_reg0, a2_reg1);
    register #(WIDTH) reg_a2_2(clk, rst_n, en, clr, a2_reg1, a2_reg2);
    register #(WIDTH) reg_a3_0(clk, rst_n, en, clr, a3,      a3_reg0);
    register #(WIDTH) reg_a3_1(clk, rst_n, en, clr, a3_reg0, a3_reg1);
    register #(WIDTH) reg_a3_2(clk, rst_n, en, clr, a3_reg1, a3_reg2);
    register #(WIDTH) reg_a3_3(clk, rst_n, en, clr, a3_reg2, a3_reg3);
    
    // *** First x inputs ***
    assign a00_in = a0_reg0;
    assign a10_in = a1_reg1;
    assign a20_in = a2_reg2;
    assign a30_in = a3_reg3;
    
    // *** First z inputs ***
    assign y00_in = 0;
    assign y01_in = 0;
    assign y02_in = 0;
    assign y03_in = 0;
    
    // *** 4x4 systolic array ***
    // *** Row 0 from bottom ***
    pe #(WIDTH, FRAC_BIT) pe00(a00_in, y00_in, b00, a00_out, y00_out);
    pe #(WIDTH, FRAC_BIT) pe01(a01_in, y01_in, b01, a01_out, y01_out);
    pe #(WIDTH, FRAC_BIT) pe02(a02_in, y02_in, b02, a02_out, y02_out);
    pe #(WIDTH, FRAC_BIT) pe03(a03_in, y03_in, b03, a03_out, y03_out);
    // *** Row 1 from bottom ***
    pe #(WIDTH, FRAC_BIT) pe10(a10_in, y10_in, b10, a10_out, y10_out);
    pe #(WIDTH, FRAC_BIT) pe11(a11_in, y11_in, b11, a11_out, y11_out);
    pe #(WIDTH, FRAC_BIT) pe12(a12_in, y12_in, b12, a12_out, y12_out);
    pe #(WIDTH, FRAC_BIT) pe13(a13_in, y13_in, b13, a13_out, y13_out);
    // *** Row 2 from bottom ***
    pe #(WIDTH, FRAC_BIT) pe20(a20_in, y20_in, b20, a20_out, y20_out);
    pe #(WIDTH, FRAC_BIT) pe21(a21_in, y21_in, b21, a21_out, y21_out);
    pe #(WIDTH, FRAC_BIT) pe22(a22_in, y22_in, b22, a22_out, y22_out);
    pe #(WIDTH, FRAC_BIT) pe23(a23_in, y23_in, b23, a23_out, y23_out);
    // *** Row 3 from bottom ***
    pe #(WIDTH, FRAC_BIT) pe30(a30_in, y30_in, b30, a30_out, y30_out);
    pe #(WIDTH, FRAC_BIT) pe31(a31_in, y31_in, b31, a31_out, y31_out);
    pe #(WIDTH, FRAC_BIT) pe32(a32_in, y32_in, b32, a32_out, y32_out);
    pe #(WIDTH, FRAC_BIT) pe33(a33_in, y33_in, b33, a33_out, y33_out);
    
    // *** Internal registers ***
    // *** Row 0 from bottom ***
    register #(WIDTH) reg_a00(clk, rst_n, en, clr, a00_out, a01_in); 
    register #(WIDTH) reg_a01(clk, rst_n, en, clr, a01_out, a02_in);
    register #(WIDTH) reg_a02(clk, rst_n, en, clr, a02_out, a03_in);
    // *** Row 1 from bottom ***
    register #(WIDTH) reg_a10(clk, rst_n, en, clr, a10_out, a11_in); 
    register #(WIDTH) reg_a11(clk, rst_n, en, clr, a11_out, a12_in);
    register #(WIDTH) reg_a12(clk, rst_n, en, clr, a12_out, a13_in);
    // *** Row 2 from bottom ***
    register #(WIDTH) reg_a20(clk, rst_n, en, clr, a20_out, a21_in); 
    register #(WIDTH) reg_a21(clk, rst_n, en, clr, a21_out, a22_in);
    register #(WIDTH) reg_a22(clk, rst_n, en, clr, a22_out, a23_in);
    // *** Row 3 from bottom ***
    register #(WIDTH) reg_a30(clk, rst_n, en, clr, a30_out, a31_in); 
    register #(WIDTH) reg_a31(clk, rst_n, en, clr, a31_out, a32_in);
    register #(WIDTH) reg_a32(clk, rst_n, en, clr, a32_out, a33_in);
    // *** Column 0 from left ***
    register #(WIDTH) reg_y00(clk, rst_n, en, clr, y00_out, y10_in);
    register #(WIDTH) reg_y10(clk, rst_n, en, clr, y10_out, y20_in);
    register #(WIDTH) reg_y20(clk, rst_n, en, clr, y20_out, y30_in);
    register #(WIDTH) reg_y30(clk, rst_n, en, clr, y30_out, y0_tmp);
    // *** Column 1 from left ***
    register #(WIDTH) reg_y01(clk, rst_n, en, clr, y01_out, y11_in);
    register #(WIDTH) reg_y11(clk, rst_n, en, clr, y11_out, y21_in);
    register #(WIDTH) reg_y21(clk, rst_n, en, clr, y21_out, y31_in);
    register #(WIDTH) reg_y31(clk, rst_n, en, clr, y31_out, y1_tmp);
    // *** Column 2 from left ***
    register #(WIDTH) reg_y02(clk, rst_n, en, clr, y02_out, y12_in);
    register #(WIDTH) reg_y12(clk, rst_n, en, clr, y12_out, y22_in);
    register #(WIDTH) reg_y22(clk, rst_n, en, clr, y22_out, y32_in);
    register #(WIDTH) reg_y32(clk, rst_n, en, clr, y32_out, y2_tmp);
    // *** Column 3 from left ***
    register #(WIDTH) reg_y03(clk, rst_n, en, clr, y03_out, y13_in);
    register #(WIDTH) reg_y13(clk, rst_n, en, clr, y13_out, y23_in);
    register #(WIDTH) reg_y23(clk, rst_n, en, clr, y23_out, y33_in);
    register #(WIDTH) reg_y33(clk, rst_n, en, clr, y33_out, y3_tmp);

    // *** Output registers ***
    register #(WIDTH) reg_y0_0(clk, rst_n, en, clr, y0_tmp,  y0_reg0); 
    register #(WIDTH) reg_y0_1(clk, rst_n, en, clr, y0_reg0, y0_reg1); 
    register #(WIDTH) reg_y0_2(clk, rst_n, en, clr, y0_reg1, y0_reg2); 
    register #(WIDTH) reg_y0_3(clk, rst_n, en, clr, y0_reg2, y0_reg3);
    register #(WIDTH) reg_y1_0(clk, rst_n, en, clr, y1_tmp,  y1_reg0);
    register #(WIDTH) reg_y1_1(clk, rst_n, en, clr, y1_reg0, y1_reg1);
    register #(WIDTH) reg_y1_2(clk, rst_n, en, clr, y1_reg1, y1_reg2);
    register #(WIDTH) reg_y2_0(clk, rst_n, en, clr, y2_tmp,  y2_reg0);
    register #(WIDTH) reg_y2_1(clk, rst_n, en, clr, y2_reg0, y2_reg1);
    register #(WIDTH) reg_y3_0(clk, rst_n, en, clr, y3_tmp,  y3_reg0);

    // *** Valid registers ***
    register #(1) reg_valid_0(clk, rst_n, en, clr, in_valid,      in_valid_reg0); 
    register #(1) reg_valid_1(clk, rst_n, en, clr, in_valid_reg0, in_valid_reg1);
    register #(1) reg_valid_2(clk, rst_n, en, clr, in_valid_reg1, in_valid_reg2);
    register #(1) reg_valid_3(clk, rst_n, en, clr, in_valid_reg2, in_valid_reg3);
    register #(1) reg_valid_4(clk, rst_n, en, clr, in_valid_reg3, in_valid_reg4);
    register #(1) reg_valid_5(clk, rst_n, en, clr, in_valid_reg4, in_valid_reg5);
    register #(1) reg_valid_6(clk, rst_n, en, clr, in_valid_reg5, in_valid_reg6);
    register #(1) reg_valid_7(clk, rst_n, en, clr, in_valid_reg6, in_valid_reg7);
    register #(1) reg_valid_8(clk, rst_n, en, clr, in_valid_reg7, in_valid_reg8);

    // *** Outputs ***
    assign y0 = y0_reg3;
    assign y1 = y1_reg2;
    assign y2 = y2_reg1;
    assign y3 = y3_reg0;
    assign out_valid = in_valid_reg8;

endmodule
