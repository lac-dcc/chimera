// Seed: 1025581952
module module_0 #(
    parameter id_3 = 32'd46
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5
);
  input logic [7:0] id_5;
  input wire id_4;
  inout wire _id_3;
  output wire id_2;
  output supply1 id_1;
  assign id_1 = 1 - id_5[id_3];
  wire id_6;
  localparam id_7 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd77,
    parameter id_6 = 32'd99
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6
);
  input wire _id_6;
  inout wire id_5;
  input wire id_4;
  inout logic [7:0] id_3;
  inout wire id_2;
  inout wire _id_1;
  assign id_3[id_1] = id_2;
  assign id_1 = id_2;
  logic [id_6 : -1] id_7;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_1,
      id_2,
      id_3
  );
endmodule
