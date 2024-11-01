module issue_043(a, y);
  input signed [7:0] a;
  output [15:0] y;

  // -- Verilator 5f5a3db creates C code that segfaults for a=128.
  assign y = {3{{~22'd0}}} <<< {4{a}};
endmodule
