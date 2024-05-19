// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

/*
 * This is from iverilog issue # 1313453
 * This point is that it should compile.
 */
module test `protect (
a
);

// Input Declarations
input a;
`endprotect

initial $display("PASSED");

endmodule
