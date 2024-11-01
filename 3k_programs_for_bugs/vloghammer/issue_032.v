module issue_032(a, b, y);
  input signed [3:0] a;
  input signed [3:0] b;
  output [3:0] y;

  // This expression is unsigned because of the 4'b0.
  // But icarus verilog (git 3e41a93) handles the expression as signed.
  assign y = (1 ? a : 4'b0) < (1 ? b : b);
endmodule
