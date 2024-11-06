// This program was cloned from: https://github.com/manish-kj/Posit-HDL-Arithmetic
// License: BSD 3-Clause "New" or "Revised" License

module sub_N (a,b,c);
parameter N=10;
input [N-1:0] a,b;
output [N:0] c;
assign c = {1'b0,a} - {1'b0,b};
endmodule


