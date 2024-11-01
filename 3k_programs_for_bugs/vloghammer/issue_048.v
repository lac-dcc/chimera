module issue_048(a, b, y);
  input [1:0] a;
  input [2:0] b;
  output [3:0] y;

  // For "b != 0" this should return "y[3:2] == 0". But iverilog 020e280 returns "y[3:2] == y[1:0]" instead.
  assign y = {a >> {22{b}}, a << (0 <<< b)};
endmodule
