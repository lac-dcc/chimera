module issue_004(a, b, y);
  // http://forums.xilinx.com/t5/Synthesis/Strange-output-const-zero-bug-with-Vivado-gt-gt-gt-signedness/td-p/401411
  input [0:0] a;
  input [0:0] b;
  output signed [3:0] y;
  // for some reason vivado thinks this is constant 0.
  // this is obviously not true for a=1 and b=0.
  assign y = $signed(a >>> b);
endmodule
