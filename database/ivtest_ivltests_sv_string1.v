// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

/*
 * This is the most basic test of string variables.
 */
module main;

   string foo = "PASSED";

   initial begin
      $display(foo);
      $finish;
   end
endmodule // main
