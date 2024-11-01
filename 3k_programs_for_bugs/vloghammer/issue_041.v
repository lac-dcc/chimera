module issue_041(a, y);
  input [2:0] a;
  output [3:0] y;

  // This should effectively be y=0, but verilator 1f56312 evaluates y=a instead.
  assign y = (a >> 2'b11) >> 1;
endmodule
