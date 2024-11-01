module issue_053(a, y);
  input [3:0] a;
  output [3:0] y;

  // This should always return y=4'b1111, but Verilator f705f9b only does this for a=0.
  assign y = (a >> a) ^~ (a >> a);
endmodule
