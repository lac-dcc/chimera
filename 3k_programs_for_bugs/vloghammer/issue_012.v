module issue_012(a, y);
  // https://github.com/steveicarus/iverilog/issues/7
  input [3:0] a;
  output [3:0] y;
  // icarus verilog (git d1c9dd5) does not correctly propagate undef thru power
  // operator (y should be 4'bx when a is zero, but iverilog returns 4'd1).
  assign y = 4'd2 ** (4'd1/a);
endmodule
