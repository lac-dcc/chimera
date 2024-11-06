// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Structural Modelling for 4:1 Mux

module mux_4_to_1_str(Y, I0, I1, I2, I3, S1, S0);
output Y; input I0, I1, I2, I3; input S1, S0;
wire y1, y2, y3, y4, y5, y6;
not g1(y1, S1); not g2(y2, S0);
and g3(y3, y1, y2, I0);
and g4(y4, y1, S0, I1);
and g5(y5, S1, y2, I2);
and g6(y6, S1, S0, I3);
or g7(Y, y3, y4, y5, y6);
endmodule