// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test();

`define MACRO 1
`define MACRO 1
`define MACRO 2
`undef MACRO
`define MACRO 1

endmodule
