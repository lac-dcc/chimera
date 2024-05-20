// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Dataflow Modelling for 4:1 Mux

module mux_4_to_1_df(Y, I0, I1, I2, I3, S1, S0);
output Y; input I0, I1, I2, I3; input S1, S0;
assign Y = (((~S1)&(~S0)&(I0)) | ((~S1)&(S0)&(I1)) | ((S1)&(~S0)&(I2)) | ((S1)&(S0)&(I3)));
endmodule