// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//code to implement Half Adder using Dataflow Modelling

module exp_df(sum, carry, A, B);
input A, B; output sum, carry;
assign sum = A^B;
assign carry = A&B;
endmodule