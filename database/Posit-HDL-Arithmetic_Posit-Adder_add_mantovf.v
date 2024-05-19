// This program was cloned from: https://github.com/manish-kj/Posit-HDL-Arithmetic
// License: BSD 3-Clause "New" or "Revised" License

module add_mantovf (a,mant_ovf,c);
parameter N=10;
input [N:0] a;
input mant_ovf;
output [N:0] c;
assign c = a + mant_ovf;
endmodule
