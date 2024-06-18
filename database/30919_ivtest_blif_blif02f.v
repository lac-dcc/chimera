// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0


module muxN
  #(parameter WID = 4, parameter SWID = 2)
   (input wire [WID-1:0]  D,
    input wire [SWID-1:0] S,
    output reg		  Q
    /* */);

   always @* Q = D[S];

endmodule // add
