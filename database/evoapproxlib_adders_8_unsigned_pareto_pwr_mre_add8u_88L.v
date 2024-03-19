/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 19.67 %
// MAE = 101 
// WCE% = 50.39 %
// WCE = 258 
// WCRE% = 6300.00 %
// EP% = 99.77 %
// MRE% = 49.16 %
// MSE = 14074 
// PDK45_PWR = 0.000 mW
// PDK45_AREA = 0.0 um2
// PDK45_DELAY = 0.00 ns


module add8u_88L(A, B, O);
  input [7:0] A, B;
  output [8:0] O;
  assign O[2] = 1'b0;
  assign O[6] = 1'b1;
  assign O[7] = B[7];
  assign O[0] = B[3];
  assign O[1] = B[7];
  assign O[3] = A[3];
  assign O[4] = B[4];
  assign O[5] = A[7];
  assign O[8] = A[6];
endmodule

