module issue_015(a, y);
  // http://forums.xilinx.com/t5/Synthesis/Vivado-bug-in-undef-handling-for-relational-operators/td-p/403469
  input [3:0] a;
  output [23:0] y;

  wire [3:0] y0;
  wire [3:0] y1;
  wire [3:0] y2;
  wire [3:0] y3;
  wire [3:0] y4;
  wire [3:0] y5;

  assign y = {y0,y1,y2,y3,y4,y5};

  // All this cases should evaluate to 4'b000x (regardless of the value of 'a').
  // But Vivado 2013.4 returns 4'b0010 instead.
  assign y0 = a >  4'bx;
  assign y1 = a >= 4'bx;
  assign y2 = a <  4'bx;
  assign y3 = a <= 4'bx;
  assign y4 = a == 4'bx;
  assign y5 = a != 4'bx;
endmodule
