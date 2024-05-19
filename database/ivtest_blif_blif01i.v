// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0


module ivtest
  (
   input [3:0]	x,
   input [3:0]	y,
   output [3:0]	z
   );

   assign z = x ^ y;

endmodule // ivtest

