// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Dataflow Modelling for 1:4 DeMux

module deMux_1_to_4_df(I, S1, S0, Y);
input I; input S1, S0;
output [3:0]Y;
assign Y[0] = I&~S1&~S0;
assign Y[1] = I&~S1&S0;
assign Y[2] = I&S1&~S0;
assign Y[3] = I&S1&S0;
endmodule