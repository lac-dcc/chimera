// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//dataflow modelling for Full Subtractor

module exp_df(diff, borr, A, B);
input A, B; output diff, borr;
assign diff = A^B;
assign Borr = ((~A)&B);
endmodule