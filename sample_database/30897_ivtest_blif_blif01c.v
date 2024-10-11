// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0


module addN
  #(parameter WID = 4)
   (input wire [WID-1:0] A,
    input wire [WID-1:0] B,
    output wire [WID:0]  Q
    /* */);

   assign Q = A + B;

endmodule // add
