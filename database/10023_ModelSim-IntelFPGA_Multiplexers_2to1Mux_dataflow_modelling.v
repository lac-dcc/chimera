// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Dataflow Modelling for 2:1 Mux

module mux_2_to_1_df(Y, I0, I1, S);
output Y; input I0, I1; input S;
assign Y = (((~S)&I0) | (S&I1));
endmodule