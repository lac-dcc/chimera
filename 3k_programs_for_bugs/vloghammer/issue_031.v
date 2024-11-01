module issue_031(a, y);
  input [2:0] a;
  output [2:0] y;
  assign y = { &{a,1'bx}, |{a,1'bx}, ^{a,1'bx} };
endmodule
