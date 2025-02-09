// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0


module cmpN
  #(parameter WID = 4)
   (input wire [WID-1:0] A,
    input wire [WID-1:0] B,
    output wire QE, QN, QGT, QGE
    /* */);

   assign QE = A == B;
   assign QN = A != B;
   assign QGT = A > B;
   assign QGE = A >= B;

endmodule // add
