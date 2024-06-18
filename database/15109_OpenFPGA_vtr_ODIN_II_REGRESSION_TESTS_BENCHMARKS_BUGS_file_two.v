// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module testmodule (a,b,c);

input [31:0] a;
input [31:0] b;
output [31:0] c;

assign c = a & b;

endmodule