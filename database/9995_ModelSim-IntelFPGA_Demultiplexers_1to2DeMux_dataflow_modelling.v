// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Dataflow Modelling for 1:2 DeMux

module deMux_1_to_2_df(I, S, Y0, Y1);
input I; input S; output Y0, Y1;
assign Y0 = I&~S;
assign Y1 = I&S;
endmodule