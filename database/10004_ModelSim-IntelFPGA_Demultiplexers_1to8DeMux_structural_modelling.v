// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Structural Modelling for 1:8 DeMux

module deMux_1_to_8_str(I, S2, S1, S0, Y);
input I; input S2, S1, S0; output [7:0]Y;
wire y1, y2, y3;
not (y1, S2); not (y2, S1); not (y3, S0);
and(Y[0], I, y1, y2, y3);
and(Y[1], I, y1, y2, S0);
and(Y[2], I, y1, S1, y3);
and(Y[3], I, y1, S1, S0);
and(Y[4], I, S2, y2, y3);
and(Y[5], I, S2, y2, S0);
and(Y[6], I, S2, S1, y3);
and(Y[7], I, S2, S1, S0);
endmodule