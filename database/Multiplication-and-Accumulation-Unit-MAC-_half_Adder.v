// This program was cloned from: https://github.com/Nilesh002/Multiplication-and-Accumulation-Unit-MAC-
// License: MIT License

module ha(a,b,s,cout);
input a,b;
output s,cout;

xor b1(s,a,b);
and(cout,a,b);

endmodule
