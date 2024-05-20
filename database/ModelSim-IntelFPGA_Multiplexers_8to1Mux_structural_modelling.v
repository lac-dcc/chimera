// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Structural Modelling for 8:1 Mux

module mux_8_to_1_str(Y, I, S2, S1, S0);
output Y; input [7:0]I; input S2, S1, S0;
wire y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11;
not g1(y1, S2); not g2(y2, S1); not g3(y3, S0);
and g4(y4, y1, y2, y3, I[0]);
and g5(y5, y1, y2, S0, I[1]);
and g6(y6, y1, S1, y3, I[2]);
and g7(y7, y1, S1, S0, I[3]);
and g8(y8, S2, y2, y3, I[4]);
and g9(y9, S2, y2, S0, I[5]);
and g10(y10, S2, S1, y3, I[6]);
and g11(y11, S2, S1, S0, I[7]);
or g12(Y, y4, y5, y6, y7, y8, y9, y10, y11);
endmodule