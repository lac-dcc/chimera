// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Dataflow Modelling for 1:8 DeMux

module deMux_1_to_8_df(I, S2, S1, S0, Y);
input I; input S2, S1, S0; output [7:0]Y;
assign Y[0] = I&~S2&~S1&~S0;
assign Y[1] = I&~S2&~S1&S0;
assign Y[2] = I&~S2&S1&~S0;
assign Y[3] = I&~S2&S1&S0;
assign Y[4] = I&S2&~S1&~S0;
assign Y[5] = I&S2&~S1&S0;
assign Y[6] = I&S2&S1&~S0;
assign Y[7] = I&S2&S1&S0;
endmodule