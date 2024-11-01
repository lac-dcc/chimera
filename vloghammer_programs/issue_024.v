module issue_024(a, y);
  input [0:0] a;
  output [0:0] y;

  // icarus verilog (git b1ef099) returns 1'b1 for this expression. it should be 1'bx.
  assign y = 1'b1 >= |1'bx;
endmodule
