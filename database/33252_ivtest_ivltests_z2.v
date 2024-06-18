// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module baz;
  parameter Q = 10;
endmodule

module bar;
  parameter P = 1;
  baz #(P+1) baz1();
endmodule

module foo;
  bar #3 bar1();
  initial
    $display("PASSED");
endmodule
