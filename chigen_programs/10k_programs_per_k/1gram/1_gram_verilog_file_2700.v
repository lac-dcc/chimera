// Seed: 1804849700
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  generate
    wire id_6;
  endgenerate
  wire id_7, id_8;
  specify
    (id_9 => id_10) = 1;
    specparam id_11 = id_9;
    (id_12 *> id_13) = 1;
    (id_14 => id_15) = 1;
  endspecify
  always id_15 <= 1;
  wire id_16;
  wire id_17;
endmodule
module module_1 (
    id_1
);
  output wire id_1;
  wire id_3;
  integer id_4;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4
  );
  assign modCall_1.id_14 = 0;
endmodule
