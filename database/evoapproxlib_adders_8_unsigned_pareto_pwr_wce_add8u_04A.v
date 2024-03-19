/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s):  
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 14.06 %
// MAE = 72 
// WCE% = 42.38 %
// WCE = 217 
// WCRE% = 1300.00 %
// EP% = 99.61 %
// MRE% = 35.29 %
// MSE = 7477 
// PDK45_PWR = 0.000 mW
// PDK45_AREA = 0.0 um2
// PDK45_DELAY = 0.00 ns


module add8u_04A(A, B, O);
  input [7:0] A, B;
  output [8:0] O;
  assign O[3] = 1'b1;
  assign O[2] = 1'b1;
  assign O[6] = 1'b0;
  assign O[0] = A[7];
  assign O[1] = A[0];
  assign O[4] = A[5];
  assign O[5] = A[3];
  assign O[7] = B[7];
  assign O[8] = O[0];
endmodule

