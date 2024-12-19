// Seed: 1683893819
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
    id_10
);
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_11;
  tri1 id_12;
  assign id_8 = 1;
  wire id_13, id_14, id_15;
  specify
    specparam id_16 = id_3 == id_6 * 0 * id_12 + id_5;
  endspecify
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_5 = 0;
endmodule
