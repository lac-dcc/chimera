module issue_049(a, y);
  input [3:0] a;
  output [3:0] y;

  // -- Verilator 06744b6 creates the following error:
  // %Error: Internal Error: ../V3Number.cpp:521: toUInt with 4-state 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  assign y = a << 1 <<< 0/0;
endmodule
