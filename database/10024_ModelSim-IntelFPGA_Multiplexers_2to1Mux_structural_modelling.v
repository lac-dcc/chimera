// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Structural Modelling for 2:1 Mux

module mux_2_to_1_str(Y, I0, I1, S);
output Y; input I0, I1; input S;
wire y1, y2, y3;
not g1(y1, S);
and g2(y2, y1, I0);
and g3(y3, S, I1);
or g4(Y, y2, y3);
endmodule