// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module T_using_SR_JK_D(
    input clk, reset, T,
    output Q_sr, Q_jk, Q_d
    );
    wire w1, w2, w3;
    
    assign w1= T & (~Q_sr);
    assign w2= T & Q_sr;
    SR_flipflop SR(clk, reset, w1, w2, Q_sr);
    
    JK_flipflop JK(T, T, clk, reset, Q_jk);
    
    assign w3= T ^ Q_d;
    D_flipflop D(w3, clk, reset, Q_d);
    
endmodule
