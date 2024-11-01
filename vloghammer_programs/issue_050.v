module issue_050(a, y);
  input [4:0] a;
  output [4:0] y;

  // This should return y=0 for a=31, but Verilator 06744b6 returns y=31 instead
  assign y = a >> ((a ? 1 : 2) << a);
endmodule
