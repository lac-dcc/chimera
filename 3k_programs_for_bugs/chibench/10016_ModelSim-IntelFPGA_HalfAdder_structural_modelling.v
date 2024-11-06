// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//code to implement Half Adder using Structural Modelling

module exp_str(sum, carry, A, B);
input A, B; output sum, carry;
xor g1(sum, A, B);
and g2(sum, A, B);
endmodule