`timescale 1ns / 1ps

// Collection of 32, 16, 4 and single bit Ripple
// carry adders

module Rip32(sum_o, cout, a_i, b_i, cin);
    //main module of 16 bit Ripple carry adder
    input [31:0]a_i;
    input [31:0]b_i;
    input cin;
    output cout;
    output [31:0]sum_o;
    
    wire c16, cout;
    Rip16 m1(sum_o[15:0], c16, a_i[15:0], b_i[15:0], cin);
    Rip16 m2(sum_o[31:16], cout, a_i[31:16], b_i[31:16], c16);
endmodule

module Rip16(sum_o, cout, a_i, b_i, cin);
    //main module of 16 bit Ripple carry adder
    input [15:0]a_i;
    input [15:0]b_i;
    input cin;
    output cout;
    output [15:0]sum_o;
    wire c4, c8, c12, cout;
    Rip4 m1(sum_o[3:0], c4, a_i[3:0], b_i[3:0], cin);
    Rip4 m2(sum_o[7:4], c8, a_i[7:4], b_i[7:4], c4);
    Rip4 m3(sum_o[11:8], c12, a_i[11:8], b_i[11:8], c8);
    Rip4 m4(sum_o[15:12], cout, a_i[15:12], b_i[15:12], c12);
endmodule

module Rip4(sum_o, cout, a_i, b_i, cin);
 //sub module for 4 bit Ripple carry adder
    input [3:0]a_i;
    input [3:0]b_i;
    input cin;
    output cout;
    output [3:0]sum_o;
    wire c2, c3, c4, cout;
    Fa m1(sum_o[0], c2, a_i[0], b_i[0], cin);
    Fa m2(sum_o[1], c3, a_i[1], b_i[1], c2);
    Fa m3(sum_o[2], c4, a_i[2], b_i[2], c3);
    Fa m4(sum_o[3], cout, a_i[3], b_i[3], c4);
endmodule

module Fa(sum_o, cout, a_i, b_i, cin);
    //sub module for Full adder
    input a_i, b_i, cin;
    output sum_o, cout;
    wire w1, w2, w3;
    Ha m1(w1, w2, a_i, b_i);
    Ha m2(sum_o, w3, w1, cin);
    or m3(cout, w2, w3);
endmodule

module Ha(sum_o,cout,a_i,b_i);
 //sub module for Half adder
    input a_i,b_i;
    output sum_o,cout;
    xor m1(sum_o,a_i,b_i);
    and m2(cout,a_i,b_i);
endmodule
