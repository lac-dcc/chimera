module issue_037(a, b, y);
  input signed [4:0] a;
  input [2:0] b;
  output [3:0] y;

  // -- Verilator b631b59 returns 1 instead of 0 for a=-1 and b=7.
  assign y = |0 != (a >>> b);
endmodule
