// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//structural modelling for Half Subtractor

module exp_str(diff, borr, A, B);
input A, B; output diff, borr;
xor g1(diff, A, B);
wire y1; not g2(y1, A);
and g3(borr, y1, B);
endmodule