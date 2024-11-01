module issue_045(a, y);
  input signed [15:0] a;
  output [15:0] y;

  // -- Verilator d7e4bc1 fails on this code:
  // %Error: Verilator internal fault, sorry.  Consider trying --debug --gdbbt
  assign y = (a >> 16) >>> 32'h7ffffff1;
endmodule
