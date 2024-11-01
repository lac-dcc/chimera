module issue_026(a, b, y);
  input [1:0] a;
  input [1:0] b;
  output [3:0] y;
  wire [1:0] y1;
  wire [1:0] y2;
  wire u = 1'bx;

  // Yosys prior to git commit ae5032a used to output 2'bxx instead of 2'b0x when a is active.
  assign y1 = a ? 1'bx : b;
  assign y2 = a ? u : b;
  assign y = { y1, y2 };
endmodule
