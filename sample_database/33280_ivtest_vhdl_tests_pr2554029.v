// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test();
  a a (.pi(pi));
endmodule // test

module a(input pi);
  assign Pi = pi;
  b b(.Pi(Pi));
endmodule // a

module b(input Pi);
endmodule
