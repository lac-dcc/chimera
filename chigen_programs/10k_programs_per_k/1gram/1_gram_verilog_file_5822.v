// Seed: 1324827201
module module_0 (
    input  uwire id_0,
    input  uwire id_1,
    output wire  id_2,
    output wand  id_3,
    input  wand  id_4,
    input  tri   id_5,
    input  uwire id_6,
    input  uwire id_7,
    input  tri1  id_8,
    input  wor   id_9,
    input  tri0  id_10,
    input  uwire id_11
);
  wire id_13;
  wire id_14, id_15;
  id_16(
      .id_0(1'b0 == 1),
      .id_1(1'b0),
      .id_2(1),
      .id_3((id_7)),
      .id_4(1),
      .id_5(1),
      .id_6(),
      .id_7(1 - 1),
      .id_8(1),
      .id_9(1)
  );
endmodule
module module_1 (
    output logic id_0,
    output tri0  id_1,
    output wire  id_2,
    input  tri0  id_3,
    input  uwire id_4,
    input  uwire id_5,
    input  tri0  id_6,
    output tri   id_7,
    output wire  id_8,
    input  tri   id_9,
    output tri0  id_10,
    input  wand  id_11,
    input  tri0  id_12,
    input  tri1  id_13,
    input  wand  id_14,
    input  tri0  id_15,
    output wire  id_16,
    output tri1  id_17,
    input  tri0  id_18,
    output uwire id_19,
    input  wire  id_20
);
  wire id_22;
  assign id_7 = 1;
  xor primCall (
      id_8, id_15, id_4, id_20, id_5, id_18, id_13, id_14, id_12, id_6, id_3, id_22, id_9, id_11
  );
  module_0 modCall_1 (
      id_9,
      id_6,
      id_2,
      id_19,
      id_9,
      id_11,
      id_4,
      id_11,
      id_18,
      id_13,
      id_9,
      id_15
  );
  assign modCall_1.type_2 = 0;
  assign id_17 = 1;
  always id_0 <= 1;
endmodule
