// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module SR_using_JK_D_T(
    input S, R, clk, rst,
    output Q_jk, Q_d, Q_t
    );
    wire w1, w2, w3, w4, w5;

    JK_flipflop JK(S, R, clk, rst, Q_jk);
    
    assign w1= ~R & Q_d;
    assign w2= S | w1;
    D_flipflop D(w2, clk, rst, Q_d);
   
    assign w3= S & ~Q_t;
    assign w4= R & Q_t;
    assign w5= w3 | w4;
    T_flipflop T(w5, clk, rst, Q_t);

endmodule
