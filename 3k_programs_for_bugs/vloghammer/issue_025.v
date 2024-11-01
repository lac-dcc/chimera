module issue_025(a, y);
  input [1:0] a;
  output [7:0] y;

  wire [3:0] y1;
  wire [3:0] y2;

  // icarus verilog (git 5a06602) returns 4'bxx00 instead of 4'bxxxx for the first expression.
  assign y1 = 4'bxx00 + 2'b00;
  assign y2 = 4'bxx00 + a;
  assign y = { y1, y2 };
endmodule
