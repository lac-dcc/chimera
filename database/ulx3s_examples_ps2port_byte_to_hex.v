module byte_to_hex (
  input [3:0] b,
  output [7:0] h);

  assign h = (b < 10 ? "0" + b : "A" + (b-10));

endmodule
