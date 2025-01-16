// Seed: 364401286
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  inout wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_16;
  assign id_15 = -1;
  assign id_9  = id_15;
  final id_8 = 1;
endmodule
module module_1 #(
    parameter id_8 = 32'd39
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_1 = id_6;
  xor primCall (id_2, id_7, id_4, id_1, id_5, id_6);
  wire id_7;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_7,
      id_5,
      id_7,
      id_3,
      id_7,
      id_2,
      id_3,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7
  );
  assign modCall_1.id_8 = 0;
  defparam id_8 = id_4;
  assign id_1 = id_4;
endmodule
