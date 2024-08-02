// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Structural Modelling for 2 to 4 Decoder

module decoder_2_to_4_str(A, B, Y0, Y1, Y2, Y3);
input A, B; output Y0, Y1, Y2, Y3;
wire y1, y2;
not (y1, A); not(y2, B);
and(Y0, y1, y2);
and(Y1, y1, B);
and(Y2, A, y2);
and(Y3, A, B);
endmodule