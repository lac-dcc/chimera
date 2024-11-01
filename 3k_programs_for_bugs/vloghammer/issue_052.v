module issue_052(a, y);
  input [0:0] a;
  output [3:0] y;

  // -- Verilator f705f9b prints "%Error: rtl.v:4: Unsupported: 4-state numbers in this context"
  // for the following line. But for example "(0/0) % 0" is accepted.
  assign y = ((0/0) ? 1 : 2) % 0;
endmodule
