module issue_029(a, y);
  input [3:0] a;
  output [7:0] y;
  wire [3:0] y1;
  wire [3:0] y2;

  assign y1 = 4'b1 << 33'h100000000;
  assign y2 = 1 >> {a, 64'b0};
  assign y = { y1, y2 };
endmodule
