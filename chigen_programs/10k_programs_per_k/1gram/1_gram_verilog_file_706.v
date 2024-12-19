// Seed: 105892276
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_4;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3#(
        .id_4(1'b0),
        .id_5(id_6),
        .id_7(1),
        .id_8(1)
    ),
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  output wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  reg id_14, id_15 = id_14;
  initial id_15 <= {!id_14};
  module_0 modCall_1 (
      id_2,
      id_11,
      id_13
  );
  always id_15 <= 1;
  wire id_16;
  integer id_17 = id_14 == 1;
endmodule
