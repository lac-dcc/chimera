module issue_059(a, y);
  input [2:0] a;
  output [3:0] y;

  // This seems to hang Vivado 2018.3 forever.

  assign y = a % 1'bx;
endmodule
