// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License


/*

Odin will crash if a declared, but not assigned, wire or register is used in logical statements


*/

module foobar (clk,d_in, d_out);

input clk;
input  d_in;
output  d_out;



assign d_out = a;
wire  a;
wire  b;

/*
assign wire2= 1'b1;
*/



assign a = (b & d_in);




endmodule