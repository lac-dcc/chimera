module issue_044(a, y);
  input [3:0] a;
  output [3:0] y;

  // Yosys f69b580 returns y=1 instead of y=0 for a=15.
  assign y = &(0 ? 0 : (&a));
endmodule
