// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

// This is the most trivial example of a program block.
// It contains only an initial statement and final statement,
// and prints "PASSED" so the test bench knows that it works.

program main ();

   initial $display("Hello, World.");
   final $display("PASSED");

endprogram : main
