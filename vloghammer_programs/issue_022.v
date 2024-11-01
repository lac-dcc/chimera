module issue_022(a, y);
  input [1:0] a;
  output [1:0] y;

  // icarus verilog (git 68f8de2) fails with the following internal error:
  //     internal error: lval-rval width mismatch: rval->vector_width()==1, lval->vector_width()==2
  //     assert: elaborate.cc:150: failed assertion rval->vector_width() >= lval->vector_width()
  assign y = 'bx ? 2'b0 : a;
endmodule
