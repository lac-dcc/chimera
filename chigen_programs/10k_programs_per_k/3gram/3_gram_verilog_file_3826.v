// Seed: 1152829213
module module_0 (
    input wand id_0,
    output uwire id_1,
    output wor id_2,
    output tri1 id_3,
    output supply0 id_4,
    input wire id_5,
    output wor id_6,
    input supply0 id_7
    , id_13,
    output tri id_8
    , id_14,
    input tri1 id_9,
    input supply1 id_10,
    input supply1 id_11
);
  id_15(
      .id_0(""),
      .id_1(id_1),
      .id_2(1),
      .id_3(id_1),
      .id_4(id_10),
      .id_5(1),
      .id_6(id_11 << 1),
      .id_7((~id_14)),
      .id_8(1),
      .id_9(id_7),
      .id_10(1),
      .id_11(id_0),
      .id_12(id_9),
      .id_13(id_3),
      .id_14(id_10)
  );
  wire id_16;
endmodule
module module_1 (
    input supply1 id_0,
    output uwire id_1,
    input wor id_2,
    output wand id_3,
    input supply0 id_4,
    input wor id_5,
    input tri id_6,
    input wire id_7,
    output tri id_8,
    output wor id_9
);
  wire id_11, id_12;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_8,
      id_8,
      id_1,
      id_5,
      id_3,
      id_7,
      id_1,
      id_0,
      id_0,
      id_6
  );
  assign modCall_1.type_4 = 0;
endmodule
