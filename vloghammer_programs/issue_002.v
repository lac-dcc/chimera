module issue_002(a, b, y);
  input [1:0] a;
  input [2:0] b;
  output [0:0] y;
  // the width of $signed(a) is self-determined. so it must return a 2-bit
  // value that is then zero-extended to three bits because the comparison
  // with b is done in an unsigned context (b is unsigned).
  assign y = $signed(a) == b;
endmodule
