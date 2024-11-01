module issue_039(a, y);
  input [3:0] a;
  output [3:0] y;

  // -- Verilator 4a58e85 creates the following error:
  // %Error: Internal Error: ../V3Number.cpp:521: toUInt with 4-state 4'bxxxx
  assign y = a >>> 4'bx;
endmodule
