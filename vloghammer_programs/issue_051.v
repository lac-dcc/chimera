module issue_051(a, b, y);
  // PATTERN: 10'h163
  input [3:0] a;
  input [5:0] b;
  output [3:0] y;

  // For a=5, b=35 this should return y=0, but Verilator f705f9b returns y=8 instead
  assign y = 64'd0 | (a << b);
endmodule
