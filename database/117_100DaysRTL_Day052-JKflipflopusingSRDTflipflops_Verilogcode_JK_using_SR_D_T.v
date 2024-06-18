// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module JK_using_SR_D_T(
    input J, K, clk, reset,
    output Q_sr, Q_d, Q_t
    );
    wire w1, w2, w3, w4, w5, w6, w7, w8;
    
    assign w1= J & (~Q_sr);
    assign w2= K & Q_sr;
    SR_flipflop SR(clk, reset, w1, w2, Q_sr);
    
    assign w3= J & (~Q_d);
    assign w4= (~K) & Q_d;
    assign w5= w3 | w4;
    D_flipflop D(w5, clk, reset, Q_d);
    
    assign w6= J & (~Q_t);
    assign w7= K & Q_t;
    assign w8= w6 | w7;
    T_flipflop T(w8, clk, reset, Q_t);
    
endmodule
