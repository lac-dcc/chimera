module issue_030(a, y);
  input [3:0] a;
  output [31:0] y;

  wire [3:0] y0;
  wire [3:0] y1;
  wire [3:0] y2;
  wire [3:0] y3;
  wire [3:0] y4;
  wire [3:0] y5;
  wire [3:0] y6;
  wire [3:0] y7;

  assign y = {y0,y1,y2,y3,y4,y5,y6,y7};

  assign y0 = 1'bx >> a;
  assign y1 = 1'bx << a;
  assign y2 = 1'bx >>> a;
  assign y3 = 1'bx <<< a;
  assign y4 = 1'sbx >> a;
  assign y5 = 1'sbx << a;
  assign y6 = 1'sbx >>> a;
  assign y7 = 1'sbx <<< a;
endmodule
