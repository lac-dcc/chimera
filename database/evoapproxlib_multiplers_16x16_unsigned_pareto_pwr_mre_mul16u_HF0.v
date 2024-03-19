/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek, L. Sekanina, H. Jiang and J. Han, "Scalable Construction of Approximate Multipliers With Formally Guaranteed Worst Case Error" in IEEE Transactions on Very Large Scale Integration (VLSI) Systems, vol. 26, no. 11, pp. 2572-2576, Nov. 2018. doi: 10.1109/TVLSI.2018.2856362 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 18.75 %
// MAE = 805273600 
// WCE% = 75.00 %
// WCE = 3221094401 
// WCRE% = 100.00 %
// EP% = 100.00 %
// MRE% = 87.99 %
// MSE = 10407.645e14 
// PDK45_PWR = 0.0003 mW
// PDK45_AREA = 2.3 um2
// PDK45_DELAY = 0.04 ns


module mul16u_HF0 ( A, B, O );
  input [15:0] A;
  input [15:0] B;
  output [31:0] O;

  wire S_15_15,S_16_14;

  assign S_15_15 = (A[15] & B[15]);
  assign S_16_14 = S_15_15;
  assign O = {1'b0,S_16_14,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};

endmodule

