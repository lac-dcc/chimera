// This program was cloned from: https://github.com/Helazhary/Riscv-Verilog-Pipelined
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps

module FullAdder #(parameter N=32)(
    input [N-1:0] a, b, 
    input addsub, c_in,
    output [N-1:0]sum,
    output  c_out
);

wire [N-1:0]bcomp;
//1=sub   
assign bcomp= (addsub==0)? b:(~b + 1'b1);

assign {c_out,sum}= a+bcomp+c_in;

endmodule
 