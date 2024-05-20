// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Structural Modelling for 3 to 8 Decoder

module decoder_3_to_8_str(A, B, C, Y);
input A, B, C; output [7:0]Y;
wire y1, y2, y3;
not (y1, A); not (y2, B); not (y3, C);
and(Y[0], y1, y2, y3);
and(Y[1], y1, y2, C);
and(Y[2], y1, B, y3);
and(Y[3], y1, B, C);
and(Y[4], A, y2, y3);
and(Y[5], A, y2, C);
and(Y[6], A, B, y3);
and(Y[7], A, B, C);
endmodule