// This program was cloned from: https://github.com/Meow-pilli/Testing-and-Testable-Design
// License: MIT License

/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Mon Apr 15 02:47:53 2024
/////////////////////////////////////////////////////////////


module circuit ( x, clk, z, test_si, test_so, test_se );
  input x, clk, test_si, test_se;
  output z, test_so;
  wire   y1, c3, y2, y3, c4, c5, c8, c9, Y3;
  assign test_so = y3;

  IVI G7 ( .A(c8), .Z(z) );
  AN2I G6 ( .A(c8), .B(c9), .Z(Y3) );
  AN2I G5 ( .A(c5), .B(y3), .Z(c9) );
  OR2I G4 ( .A(c5), .B(y2), .Z(c8) );
  AN2I G3 ( .A(c3), .B(c4), .Z(c5) );
  OR3 G2 ( .A(x), .B(y2), .C(y3), .Z(c4) );
  AN2I G1 ( .A(x), .B(y1), .Z(c3) );
  FD1S FF3 ( .D(Y3), .TI(y2), .TE(test_se), .CP(clk), .Q(y3) );
  FD1S FF2 ( .D(c8), .TI(y1), .TE(test_se), .CP(clk), .Q(y2) );
  FD1S FF1 ( .D(c5), .TI(test_si), .TE(test_se), .CP(clk), .Q(y1) );
endmodule

