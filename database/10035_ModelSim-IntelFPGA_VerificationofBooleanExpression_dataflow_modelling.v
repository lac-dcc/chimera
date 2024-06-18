// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//to verify the Boolean Expression, Y = AB + BC + CA using Dataflow Modelling

module exp_df(Y, A, B, C);
input A, B, C; output Y;
assign Y = ((A&B) | (B&C) | (C&A));
endmodule