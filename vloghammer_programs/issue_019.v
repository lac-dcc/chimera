module issue_019(a, y);
  input [0:0] a;
  output [15:0] y;

  wire [7:0] y0;
  wire [7:0] y1;
  assign y = {y0,y1};

  // according to table 5-6 of IEEE Std 1364-2005, the following expressions
  // should return 8'bx, but instead with ISIM 14.7 and XSIM 2013.4 they return 8'b0 instead.
  assign y0  = 8'sd0 ** -8'sd1;
  assign y1  = 8'd 0 ** -8'sd1;
endmodule
