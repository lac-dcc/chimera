// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module sign_extender #(
  parameter WIDTH = 32,
  parameter EXTENSION = 20
) (
  input [WIDTH-EXTENSION-1:0] imm,
  output [WIDTH-1:0] se_out
);

wire extension_select;

assign extension_select = imm[WIDTH-EXTENSION-1];

x_bit_mux_2 #(.WIDTH(WIDTH)) sel0 (
  .a({{EXTENSION{1'b0}}, imm}), .b({{EXTENSION{1'b1}}, imm}), .s(extension_select),
  .out(se_out)
);

endmodule
