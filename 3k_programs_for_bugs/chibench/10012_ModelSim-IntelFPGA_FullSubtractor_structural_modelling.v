// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//structural modelling for Full Subtractor

module exp_str(diff, borr, A, B, C);
input A, B, C; output diff, borr;
xor g1(diff, A, B, C);
wire A_bar, y1, y2, y3;
not g2(A_bar, A);
or g3(y1, B, C);
and g4(y2, B, C);
and g5(y3, A_bar, y1);
or g6(borr, y3, y2);
endmodule