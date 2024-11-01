module issue_014(a, b, y);
  // http://forums.xilinx.com/t5/Synthesis/Vivado-GDpGen-implementDivMod-DFNode-bool-Assertion-TBD-failed/td-p/401721
  input [1:0] a;
  input [2:0] b;
  output [3:0] y;
  // Vivado 2013.4 asserts on this test case:
  // vivado: /.../gencore/dp/GDpGenDivMod.cc:324: void GDpGen::implementDivMod(DFNode*, bool): Assertion `TBD' failed.
  assign y = $signed(a / b);
endmodule
