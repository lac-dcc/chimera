// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

`include "../zvn_unit/zvn_unit.v"
`include "../cla_adder/carry_lookahead_adder.v"

module adder_sub #(
  parameter WIDTH = 16
) (
  input [WIDTH-1:0] a,
  input [WIDTH-1:0] b,
  input alufn,
  output z_out,
  output v_out,
  output n_out,
  output [WIDTH-1:0] result,
  output w_cout
);

carry_lookahead_adder #(.WIDTH(WIDTH)) cla (
  .cin(alufn),
  .i_add1(a),
  .i_add2(b^{WIDTH{alufn}}),
  .o_result(result),
  .cout(w_cout)
);

zvn #(.WIDTH(WIDTH)) zvn_inst (
  .a(a),
  .b(b),
  .s(result),
  .alufn_sig(alufn),
  .z(z_out),
  .v(v_out),
  .n(n_out)
);

endmodule
