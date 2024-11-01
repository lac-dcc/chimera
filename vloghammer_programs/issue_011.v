module issue_011(a, y);
  // https://github.com/steveicarus/iverilog/issues/6
  input [0:0] a;
  output [0:0] y;
  // icarus verilog vpp (fixed in git d1c9dd5) asserts on this expression
  //   Internal error: Input vector expected width=1, got bit=2'b00, base=0, vwid=2
  assign y  = |(-a);
endmodule
