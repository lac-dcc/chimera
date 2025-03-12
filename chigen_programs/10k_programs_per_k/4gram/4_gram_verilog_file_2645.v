// Seed: 273887
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_1 = 32'd49,
    parameter id_4 = 32'd96,
    parameter id_5 = 32'd23
) (
    _id_1,
    id_2,
    id_3,
    _id_4
);
  input wire _id_4;
  inout wire id_3;
  output reg id_2;
  input wire _id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  logic [id_1 : -1] _id_5;
  always_latch @(1) id_2 = -1'h0;
  generate
    wire [id_4 : id_5] id_6, id_7;
  endgenerate
endmodule
