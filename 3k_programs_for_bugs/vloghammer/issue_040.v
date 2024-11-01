module issue_040(a, y);
  input [3:0] a;
  output [3:0] y;

  // -- Verilator 621c515 creates code that uses the undeclared function VL_POW_WWI()
  assign y = 65'd2 ** a;
endmodule
