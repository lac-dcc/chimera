// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

`timescale  100 ps / 10 ps

(* ivl_synthesis_cell *)
module LD (Q, D, G);

   output    Q;
   reg	     q_out;

   input     D, G;

   buf b1 (Q, q_out);

   always @(D or G) if (G) q_out <= D;

endmodule
