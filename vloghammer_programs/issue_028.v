module issue_028(a, y);
  input [3:0] a;
  output [3:0] y;

  // icarus verilog (git a3450bf) returns 4'b0000 instead of 4'bxxxx.
  assign y = 4'b0 * 4'bx;
endmodule
