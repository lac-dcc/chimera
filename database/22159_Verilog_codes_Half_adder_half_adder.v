// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module half_adder(A,B,Sum,Carry);
input A,B;
output Sum,Carry;

xor U1(Sum,A,B);
and U2(Carry,A,B);

endmodule
