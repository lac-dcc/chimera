// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test;
   initial
     $write("expected x; got %0b\n", 1'b0 ^ 1'bz);
endmodule
