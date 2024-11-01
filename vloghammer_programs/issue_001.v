module issue_001(a, b, y);
  // http://forums.xilinx.com/t5/Synthesis/Bug-in-XST-handling-of-constant-first-argument-in-Verilog/td-p/401407
  // Altera Service Request # 11021734
  input [2:0] a;
  input [3:0] b;
  output [0:0] y;
  // the ?: must evaluate to the max width of both cases,
  // even if we can be sure that always the smaller case gets selected
  assign y = &( 1 ? a : b );
endmodule
