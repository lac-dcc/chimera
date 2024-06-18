// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//to verify the Boolean Expression, Y = AB + BC + CA using Structural Modelling

module exp_str(Y, A, B, C);
input A, B, C; output Y;
wire w1, w2, w3;
and g1(w1, A, B);
and g2(w2, B, C);
and g3(w3, C, A);
or g4(Y, w1, w2, w3);
endmodule