module issue_016(a, y);
  input [1:0] a;
  output [7:0] y;

  wire [3:0] y0;
  wire [3:0] y1;
  assign y = {y0,y1};

  // this should return zero (see table 5-5 of IEEE Std 1364-2005)
  // but it returns different values in quartus 13.1
  assign y0  = -4'd1 ** -4'sd2;
  assign y1  = -4'd1 ** -4'sd3;
endmodule
