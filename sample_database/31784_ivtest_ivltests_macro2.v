// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

`define TBMESS(str) $display("PAS%s", str );

 // 1364-2001 S19.3 "The text macro facility is not affected by the compiler
 // directive `resetall."
`resetall

module main;

initial `TBMESS("SED")

endmodule
