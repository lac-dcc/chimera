module issue_009(a, y);
  input [2:0] a;
  output [75:0] y;

  wire [3:0] y0;
  wire [3:0] y1;
  wire [3:0] y2;
  wire [3:0] y3;
  wire [3:0] y4;
  wire [3:0] y5;
  wire [3:0] y6;
  wire [3:0] y7;
  wire [3:0] y8;
  wire [3:0] y9;
  wire [3:0] y10;
  wire [3:0] y11;
  wire [3:0] y12;
  wire [3:0] y13;
  wire [3:0] y14;
  wire [3:0] y15;
  wire [3:0] y16;
  wire [3:0] y17;
  wire [3:0] y18;

  assign y = {y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16,y17,y18};

  // various tests for handling bit-extension of and operations with undef values
  // e.g. bitwise operations must 0-extend their arguments (even with undef msb)
  assign y0  = a +  1'bx;
  assign y1  = a -  1'bx;
  assign y2  = a *  1'bx;
  assign y3  = a /  1'bx;
  assign y4  = a %  1'bx;
  assign y5  = a >  1'bx;
  assign y6  = a >= 1'bx;
  assign y7  = a <  1'bx;
  assign y8  = a <= 1'bx;
  assign y9  = a && 1'bx;
  assign y10 = a || 1'bx;
  assign y11 = a == 1'bx;
  assign y12 = a != 1'bx;
  assign y13 = a &  1'bx;
  assign y14 = a |  1'bx;
  assign y15 = a ^  1'bx;
  assign y16 = a ^~ 1'bx;
  assign y17 = + 1'bx;
  assign y18 = - 1'bx;
endmodule
