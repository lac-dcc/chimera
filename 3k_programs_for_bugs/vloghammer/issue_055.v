module issue_055(a, b, y);
  input [1:0] a;
  input [3:0] b;
  output [3:0] y;

  // The self determined size of a division is max(SIZE(left), SIZE(right)).
  // (see IEEE Std. 1364-2005 table 5-22 or IEEE Std. 1800-2012 table 11-21)
  //
  // Because of this the following expression is constant 0: The division returns
  // a selft-determined expression that is 4 bits in size and has the two MSB set
  // to constant zero.
  //
  // It looks like Verific 35_463_32_140722 uses only SIZE(left), thus evaluating
  // a=2'b11 and b=2'b01 to y=4'b0001.

  assign y = &(a / b);
endmodule
