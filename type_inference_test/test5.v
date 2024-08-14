module mod5 (
  input a, b, c,
  input [1:0] sel,
  output reg out
);
  real d;
  always @(a, b, c, sel, out) begin
    case (sel)
      2'b00: out = a;
      2'b01: out = b;
      2'b10: out = d;
      default: out = 0;
    endcase
  end
endmodule
