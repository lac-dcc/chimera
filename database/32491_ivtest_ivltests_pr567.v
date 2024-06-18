// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test;
  reg blah [63:0];
  initial blah = 0; // This should generate an error message.
endmodule
