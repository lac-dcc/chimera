// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

/* PR#445 */
module foo ();

initial
 if (!(1'b0))
  $display("PASSED");
 else
  $display("FAILED");

endmodule
