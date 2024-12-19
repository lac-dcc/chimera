// Seed: 1511837193
module module_0 (
    output tri0 id_0,
    output tri0 id_1,
    output wand id_2,
    input tri1 id_3,
    input tri1 id_4,
    output wor id_5,
    output wand id_6,
    input supply0 id_7,
    output wand id_8
);
  wire id_10;
endmodule
module module_1 (
    input supply0 id_0,
    output supply1 id_1,
    output wand id_2,
    input supply1 id_3,
    output supply0 id_4,
    output supply1 id_5
    , id_12, id_13,
    input tri id_6,
    input wor id_7,
    output tri1 id_8,
    input tri id_9,
    output wand id_10
);
  module_0 modCall_1 (
      id_8,
      id_5,
      id_8,
      id_3,
      id_9,
      id_8,
      id_10,
      id_9,
      id_10
  );
  assign modCall_1.type_13 = 0;
  wire id_14;
  id_15(
      .id_0(1),
      .id_1(1'h0 || 1),
      .id_2(1'b0),
      .id_3(1),
      .id_4(1'h0 * id_9),
      .id_5(1),
      .id_6(),
      .id_7(1),
      .id_8(id_14),
      .id_9(1),
      .id_10(id_7),
      .id_11(id_6),
      .id_12(id_4)
  );
endmodule
