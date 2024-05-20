// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module full_adder( 
    input A, B, Cin,
    output reg Sout, Cout
    );
    
    always@(*) begin
        Sout = A ^ B ^ Cin;
        Cout = (A&B) | (B&Cin) | (Cin&A);
    end
endmodule


module mux(
    input a,b,sel,
    output reg y
    );
    always@(*)  y = (~sel&a) | (sel&b);
endmodule


module carry_select (
    input [3:0]a,b,
    input carry,
    output [3:0]sum,
    output cout
    );

    wire [16:1]w;

    full_adder fa1 (a[0], b[0], 1'b0, w[1], w[2]);
    full_adder fa2 (a[1], b[1], w[2], w[3], w[4]);
    full_adder fa3 (a[2], b[2], w[4], w[5], w[6]);
    full_adder fa4 (a[3], b[3], w[6], w[7], w[8]);

    full_adder fa5 (a[0], b[0], 1'b1, w[9], w[10]);
    full_adder fa6 (a[1], b[1], w[10], w[11], w[12]);
    full_adder fa7 (a[2], b[2], w[12], w[13], w[14]);
    full_adder fa8 (a[3], b[3], w[14], w[15], w[16]);

    mux m1(w[1], w[9], carry, sum[0]);
    mux m2(w[3], w[11], carry, sum[1]);
    mux m3(w[5], w[13], carry, sum[2]);
    mux m4(w[7], w[15], carry, sum[3]);
    mux m5(w[8], w[16], carry, cout);

endmodule
