module issue_042(a, y);
  input [3:0] a;
  output [3:0] y;
  localparam [3:0] p11 = 1'bx;

  // This should set y=1, but verilator 6ce2a52 sets y=0 instead.
  assign y = ~&p11;
endmodule
