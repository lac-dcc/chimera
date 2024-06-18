// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//dataflow modelling for Full Adder

module exp_df(sum, carry, A, B, Cin);
input A, B, Cin; output sum, carry;
assign sum = A^B^Cin;
assign carry = (B&Cin)|(A&B)|(A&Cin);
endmodule