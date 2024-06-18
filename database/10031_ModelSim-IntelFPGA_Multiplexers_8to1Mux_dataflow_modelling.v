// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Dataflow Modelling for 8:1 Mux

module mux_8_to_1_df(Y, I, S2, S1, S0);
output Y; input S2, S1, S0;
input [7:0]I;
assign Y = ~S2&~S1&~S0&I[0] | ~S2&~S1&S0&I[1] | ~S2&S1&~S0&I[2] | ~S2&S1&S0&I[3] | S2&~S1&~S0&I[4] | S2&~S1&S0&I[5] | S2&S1&~S0&I[6] | S2&S1&S0&I[7];
endmodule