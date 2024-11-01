module issue_033(a, y);
  input [1:0] a;
  output [1:0] y;

  // This should return 2'b00 when a[1] is 1. But Verific 35_463_32_140306
  // sets y to constant 2'b0x instead.
  assign y = a == 1'bx;
endmodule
