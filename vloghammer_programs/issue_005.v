module issue_005(a, y);
  input signed [2:0] a;
  wire [2:0] y0;
  wire [2:0] y1;
  wire [2:0] y2;
  wire [2:0] y3;
  wire [2:0] y4;
  wire [2:0] y5;
  wire [2:0] y6;
  wire [2:0] y7;
  output [23:0] y;
  assign y = {y0,y1,y2,y3,y4,y5,y6,y7};
  // a couple of test cases for width-extending when $signed() and $unsigned() is used. 
  // the tricky part is to know when the result is 3'bxxx and when it is 3'b00x for a=0.
  assign y0 = $signed(|a);
  assign y1 = $unsigned(|a);
  assign y2 = $signed(|(a/a));
  assign y3 = $unsigned(|(a/a));
  assign y4 = $signed((|a)/(|a));
  assign y5 = $unsigned((|a)/(|a));
  assign y6 = |(a/a);
  assign y7 = (|a)/(|a);
endmodule
