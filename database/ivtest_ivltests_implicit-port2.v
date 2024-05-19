// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

// test that if the signal doesn't exist, an error is thrown
module m(input a, output b);
assign b = a;
endmodule

module top;
reg a;
// wire b;
m foo(.a, .b);
endmodule
