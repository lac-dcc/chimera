module issue_003(a, y);
  input signed [3:0] a;
  output [4:0] y;
  // the right hand side of a shift operation must always be treated as an unsigned number
  assign y = a << -2'sd1;
endmodule
