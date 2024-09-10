// Seed: 2446032988
`timescale 1 ps / 1ps
module module_0 #(
    parameter id_1 = 32'd14,
    parameter id_2 = 32'd67,
    parameter id_3 = 32'd34
) (
    _id_1,
    _id_2,
    _id_3,
    id_4
);
  input id_4;
  input _id_3;
  output _id_2;
  input _id_1;
  assign id_3 = id_4[id_1[id_2] : id_3];
endmodule
module module_1 #(
    parameter id_1 = 32'd12,
    parameter id_3 = 32'd26
) (
    _id_1,
    id_2
);
  input id_2;
  output _id_1;
  integer _id_3 = id_1;
  assign id_2 = 1;
  assign id_3 = {1'b0, id_3};
  assign id_1[id_1] = 1'b0 + id_3;
  logic id_4;
  logic id_5;
  always @(negedge 1 or id_1) begin
    id_1[id_3&1'b0] = 1;
  end
  assign id_5 = id_4 - 1;
  logic id_6 = 1, id_7;
  assign id_7 = id_7 == 1;
endmodule
`resetall
