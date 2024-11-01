module issue_020(a, y);
  input [3:0] a;
  output [3:0] y;

  // xsim 2013.4 fails to recognize this as a signed expression and returns 4'b0110 instead of 4'b1110.
  localparam [3:0] p15 = 3'sb100 >>> 2'b01;
  assign y = p15;
endmodule
