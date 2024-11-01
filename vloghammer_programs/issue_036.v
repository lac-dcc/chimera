module issue_036(a, b, c, d, y);
  input [3:0] a;
  input [3:0] b;
  input [3:0] c;
  input [3:0] d;
  output [11:0] y;
  wire [3:0] y1;
  wire [3:0] y2;
  wire [3:0] y3;

  // This should return y=15 for a=15, b=15, c=15, d=15.
  // But Design Compiler G-2012.06-SP4 returns y=7 instead.
  assign y1 = a >>> ((b == c) >>> d);

  // This should return 1 but DC G-2012.06-SP4 returns 0 instead.
  assign y2 = (|1 >>> 1) == |0;

  // This should return 0 but DC G-2012.06-SP4 returns 1 instead.
  assign y3 = {|1 >>> 1};

  assign y = { y1, y2, y3 };
endmodule
