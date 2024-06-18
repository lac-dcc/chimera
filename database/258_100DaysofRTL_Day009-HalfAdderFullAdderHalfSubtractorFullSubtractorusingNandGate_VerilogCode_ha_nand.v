// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module ha_nand(
  input a, b,
  output sout, cout
    );
    wire [2:0]w;
    nand n0(w[0], a, b);
    nand n1(w[1], a, w[0]);
    nand n2(w[2], b, w[0]);
    nand n3(sout, w[1], w[2]);
    nand n4(cout, w[0], w[0]);
endmodule
