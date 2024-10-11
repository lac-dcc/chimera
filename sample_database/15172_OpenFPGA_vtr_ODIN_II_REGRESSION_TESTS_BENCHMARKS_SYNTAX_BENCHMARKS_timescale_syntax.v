// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License


`timescale 1ns/10ps

module timescale_syntax (a,b,c);

input a;
input b;
output c;

assign c = a ^ b;

endmodule