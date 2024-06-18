// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test(input b);
  a ua(.BISTEA(b), .BISTEB(b));
endmodule // test

module a (input BISTEA, input BISTEB);
endmodule // a
