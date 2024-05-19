// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    FourBitAdder ins(x,y,sum);
endmodule

module FullAdder(
    input a, b, cin,
    output sum, cout
);
    assign {cout, sum} = a + b + cin;
endmodule

module FourBitAdder(
    input [3:0] x,
    input [3:0] y,
    output [4:0] sum
);
    wire [2:0] cout1;
    FullAdder ins0(x[0],y[0],0,sum[0],cout1[0]);
    FullAdder ins1(x[1],y[1],cout1[0],sum[1],cout1[1]);
    FullAdder ins2(x[2],y[2],cout1[1],sum[2],cout1[2]);
    FullAdder ins3(x[3],y[3],cout1[2],sum[3],sum[4]);
endmodule

