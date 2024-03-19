/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 8.28 %
// MAE = 42 
// WCE% = 25.59 %
// WCE = 131 
// WCRE% = 10000.00 %
// EP% = 99.24 %
// MRE% = 25.01 %
// MSE = 2692 
// PDK45_PWR = 0.0015 mW
// PDK45_AREA = 8.0 um2
// PDK45_DELAY = 0.11 ns


module add8u_8ES(A, B, O);
  input [7:0] A, B;
  output [8:0] O;
  assign O[6] = 1'b1;
  assign O[1] = B[4];
  assign O[8] = A[7] & B[7];
  assign O[5] = 1'b1;
  assign O[0] = 1'b1;
  assign O[7] = A[7] ^ B[7];
  assign O[2] = O[0];
  assign O[3] = B[2];
  assign O[4] = A[5];
endmodule

