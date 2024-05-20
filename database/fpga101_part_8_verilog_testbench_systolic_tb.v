// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps

module systolic_tb();
    localparam T = 10;
    
    reg clk;
    reg rst_n;
    reg en;
    reg clr;
    reg signed [15:0] a0, a1, a2, a3;
    reg in_valid;
    reg signed [15:0] b00, b01, b02, b03;
    reg signed [15:0] b10, b11, b12, b13;
    reg signed [15:0] b20, b21, b22, b23;
    reg signed [15:0] b30, b31, b32, b33;
    wire signed [15:0] y0, y1, y2, y3;
    wire out_valid;

    systolic
    #(
        .WIDTH(16),
        .FRAC_BIT(0)
    )
    dut
    (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .clr(clr),
        .a0(a0), .a1(a1), .a2(a2), .a3(a3),
        .in_valid(in_valid),
        .b00(b00), .b01(b01), .b02(b02), .b03(b03),
        .b10(b10), .b11(b11), .b12(b12), .b13(b13),
        .b20(b20), .b21(b21), .b22(b22), .b23(b23),
        .b30(b30), .b31(b31), .b32(b32), .b33(b33),
        .y0(y0), .y1(y1), .y2(y2), .y3(y3),
        .out_valid(out_valid)
    );

    always
    begin
        clk = 0;
        #(T/2);
        clk = 1;
        #(T/2);
    end

    initial
    begin
        en = 1;
        clr = 0;
        a0 = 0; a1 = 0; a2 = 0; a3 = 0;
        in_valid = 0;
        b00 = 0; b01 = 0; b02 = 0; b03 = 0;
        b10 = 0; b11 = 0; b12 = 0; b13 = 0;
        b20 = 0; b21 = 0; b22 = 0; b23 = 0;
        b30 = 0; b31 = 0; b32 = 0; b33 = 0;
        
        rst_n = 0;
        #(T*5);
        rst_n = 1;
        #(T*5);
 
        // *** Testvector 1 ***
        /*
         a =  1     2     3     4
              5     6     7     8
              9    10    11    12
             13    14    15    16
        */
        /*
         b =  1     2     3     4
              5     6     7     8
              9    10    11    12
             13    14    15    16
        */
        /*
         a*b =  90   100   110   120
               202   228   254   280
               314   356   398   440
               426   484   542   600
        */
        b00 = 1;  b01 = 2;  b02 = 3;  b03 = 4;
        b10 = 5;  b11 = 6;  b12 = 7;  b13 = 8;
        b20 = 9;  b21 = 10; b22 = 11; b23 = 12;
        b30 = 13; b31 = 14; b32 = 15; b33 = 16;
        in_valid = 1;
        a0 = 1;  a1 = 2;  a2 = 3;  a3 = 4;
        #T;
        a0 = 5;  a1 = 6;  a2 = 7;  a3 = 8;
        #T;
        a0 = 9;  a1 = 10; a2 = 11; a3 = 12;
        #T;
        a0 = 13; a1 = 14; a2 = 15; a3 = 16;
        #T;
        in_valid = 0;
        a0 = 0; a1 = 0; a2 = 0; a3 = 0;
        #(T*7);
        b00 = 0; b01 = 0; b02 = 0; b03 = 0;
        b10 = 0; b11 = 0; b12 = 0; b13 = 0;
        b20 = 0; b21 = 0; b22 = 0; b23 = 0;
        b30 = 0; b31 = 0; b32 = 0; b33 = 0;
 
        // *** Testvector 2 ***
        /*
         a =  1     2     0     0
              5     6     0     0
              9    10     0     0
              0     0     0     0
        */
        /*
         b =  1     2     3     4
              5     6     7     8
              0     0     0     0
              0     0     0     0
        */
        /*
         a*b =  11    14    17    20
                35    46    57    68
                59    78    97   116
                 0     0     0     0
        */
        b00 = 1;  b01 = 2;  b02 = 3;  b03 = 4;
        b10 = 5;  b11 = 6;  b12 = 7;  b13 = 8;
        b20 = 0;  b21 = 0;  b22 = 0;  b23 = 0;
        b30 = 0;  b31 = 0;  b32 = 0;  b33 = 0;
        in_valid = 1;
        a0 = 1;  a1 = 2;  a2 = 0;  a3 = 0;
        #T;
        a0 = 5;  a1 = 6;  a2 = 0;  a3 = 0;
        #T;
        a0 = 9;  a1 = 10; a2 = 0;  a3 = 0;
        #T;
        a0 = 0;  a1 = 0;  a2 = 0;  a3 = 0;
        #T;
        in_valid = 0;
        a0 = 0; a1 = 0; a2 = 0; a3 = 0;
        #(T*7);
        b00 = 0; b01 = 0; b02 = 0; b03 = 0;
        b10 = 0; b11 = 0; b12 = 0; b13 = 0;
        b20 = 0; b21 = 0; b22 = 0; b23 = 0;
        b30 = 0; b31 = 0; b32 = 0; b33 = 0;
    end

endmodule
