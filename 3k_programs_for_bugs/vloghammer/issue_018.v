module issue_018(a, y);
  input [3:0] a;
  output [3:0] y;

  // in a localparam, like a wire, the width of the param should be
  // use to extend the expression. so this should be equal to ~4'b0001.
  // but isim 14.1 does not do this correctly.
  localparam [3:0] p = ~1'b1;
  assign y = p;
endmodule
