module issue_035(a, y);
  input [3:0] a;
  output [5:0] y;

  // The term (p1 + p2) below is part of an unsigned expression and thus should
  // be zero-extended. Verilator fb4928b however performs signed bit extension
  // and thus returns an incorrect result.
  localparam signed [3:0] p1 = 4'b1000;
  localparam signed [3:0] p2 = 0;
  assign y = a + (p1 + p2);
endmodule
