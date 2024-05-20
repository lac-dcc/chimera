// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Structural Modelling for 1:2 DeMux

module deMux_1_to_2_str(I, S, Y0, Y1);
input I; input S; output Y0, Y1;
wire y1;
not(y1, S);
and(Y0, I, y1);
and(Y1, I, S);
endmodule