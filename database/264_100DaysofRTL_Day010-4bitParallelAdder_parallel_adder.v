// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module full_adder(
    input a, b, cin,
    output sout, cout
    );
    assign sout = a^b^cin;
    assign cout = (a&b) | (b&cin) | (a&cin);
endmodule

module parallel_adder(
    input [3:0] A, B,
    input carry_in,
    output [3:0] sum,
    output carry
    );
    wire [2:0] c;
    full_adder fa1(A[0], B[0], carry_in, sum[0], c[0]);
    full_adder fa2(A[1], B[1], c[0], sum[1], c[1]);
    full_adder fa3(A[2], B[2], c[1], sum[2], c[2]);
    full_adder fa4(A[3], B[3], c[2], sum[3], carry);
    
endmodule

    
