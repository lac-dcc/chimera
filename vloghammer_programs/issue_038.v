module issue_038(a, y);
  input [3:0] a;
  output [4:0] y;

  // -- Verilator a985a1f returns 11001 instead of 01001, i.e. verilator
  // performs sign extension even though the result of { .. } is unsigned.
  assign y = { -4'sd7 };
endmodule
