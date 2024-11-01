module issue_013(a, y);
  // https://github.com/steveicarus/iverilog/issues/8
  input signed [3:0] a;
  output [1:0] y;
  // icarus verilog (git d1c9dd5) evaluates bit-wise operations of signed values
  // to unsigned values when the arguments are constant. Thus "a = 0" yields
  // "y[0] = 0" in icarus verilog, even though it should be "y[1] = 1 (see
  // sec. 5.5.1 of IEEE Std 1365-2005). bitwise operations of variables or
  // variables with constants are implemented correctly. So y[1] always shows
  // the right value.
  assign y[0] = a > (4'sb1010 | 4'sd0);
  assign y[1] = (a | 4'sd0) > 4'sb1010;
endmodule
