// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Structural Modelling on Full Adder

module exp_str(sum, carry, A, B, Cin);
input A, B, Cin; output sum, carry;
xor g1(sum, A, B, Cin);
wire y1, y2, y3;
and g2(y1, A, Cin);
and g3(y2, B, Cin);
and g4(y3, A, B);
or g5(carry, y1, y2, y3);
endmodule