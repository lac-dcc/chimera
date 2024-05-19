// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

`define world World
`define test Hello `world

module test;
   initial $display("The `test definition is: `define %s", ``test);
endmodule
