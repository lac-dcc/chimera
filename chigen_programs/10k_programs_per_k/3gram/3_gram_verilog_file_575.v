// Seed: 1648313742
module module_0 (
    input wor id_0,
    input tri1 id_1,
    input tri0 id_2,
    input supply1 id_3,
    input wor id_4,
    input wand id_5,
    input wire id_6,
    input tri0 id_7,
    input tri id_8
);
  wand id_10;
  wand id_11, id_12, id_13, id_14, id_15, id_16, id_17;
  id_18(
      .id_0(id_11),
      .id_1(1),
      .id_2(id_10 - 1),
      .id_3(id_11),
      .id_4(1),
      .id_5(1'b0),
      .id_6(id_7),
      .id_7(id_17 + id_15)
  );
  integer id_19;
  wire id_20;
endmodule
module module_1 (
    input supply1 id_0
    , id_2
);
  assign id_2 = id_0;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_7 = 0;
endmodule
