// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Structural Modelling for 1:4 DeMux

module deMux_1_to_4_str(I, S1, S0, Y);
input I; input S1, S0;
output [3:0]Y;
wire y1, y2;
not (y1, S1); not (y2, S0);
and(Y[0], I, y1, y2);
and(Y[1], I, y1, S0);
and(Y[2], I, S1, y2);
and(Y[3], I, S1, S0);
endmodule