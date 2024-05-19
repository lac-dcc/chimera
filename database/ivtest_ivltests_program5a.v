// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

program main;

   reg foo;

// It is NOT legal to nest modules in program blocks.
module test;
   initial $display("FAILED");
endmodule // test

endprogram // main
