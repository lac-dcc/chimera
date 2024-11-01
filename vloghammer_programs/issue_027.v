module issue_027(a, b, c, y);
  input [0:0] a;
  input signed [2:0] b;
  input signed [3:0] c;
  output [5:0] y;

  // Yosys prior to git commit 9e99984 had a bug in sign extend for const_eval of this
  // expression, which showed up as a 'yosim' bug in vloghammer.
  assign y = a ? b : c;
endmodule
