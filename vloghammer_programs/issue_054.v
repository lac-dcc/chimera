module issue_054(a, y);
  input signed [1:0] a;
  output [63:0] y;

  wire [7:0] y0;
  wire [7:0] y1;
  wire [7:0] y2;
  wire [7:0] y3;
  wire [7:0] y4;
  wire [7:0] y5;
  wire [7:0] y6;
  wire [7:0] y7;
  assign y = {y0,y1,y2,y3,y4,y5,y6,y7};

  // This is an extended version of issue_000.
  // Verific 35_463_32_140722 passes issue_000 but not this version.

  assign y0 = {1'sb1};
  assign y1 = {1{1'sb1}};
  assign y2 = {1'sb1, 1'sb1};
  assign y3 = {2{1'sb1}};
  assign y4 = {a};
  assign y5 = {1{a}};
  assign y6 = {a, a};
  assign y7 = {2{a}};
endmodule
