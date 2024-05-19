// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module define_tester (a,b, c);

input [31:0] a;

input [31:0] b;
output [31:0] c;
testmodule mymod (a,b,c);

endmodule

