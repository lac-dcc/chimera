module issue_034(a, y);
  input [3:0] a;
  output [3:0] y;

  // This should return 4'b0000 or 4'b0001 but Verilator fb4928b returns
  // 4'b1111 or 4'b1110 instead.
  assign y = ~|a;
endmodule
