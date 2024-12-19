// Seed: 979557524
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input uwire id_2,
    input tri1 id_3,
    input supply1 id_4,
    output tri0 id_5,
    input supply0 id_6,
    input supply1 id_7,
    input supply0 id_8,
    input supply0 id_9,
    input uwire id_10,
    input tri id_11,
    input wor id_12,
    input wand id_13,
    input supply0 id_14
    , id_19,
    input wor id_15,
    input supply0 id_16,
    output wire id_17
);
  wire id_20;
  id_21(
      .id_0(id_9 == id_13),
      .id_1(id_15),
      .id_2({1, id_10}),
      .id_3(id_15),
      .id_4(1 - ""),
      .id_5(id_17)
  );
  tri1 id_22 = id_14;
endmodule
module module_1 (
    output wire id_0,
    input wor id_1,
    input wand id_2,
    output tri id_3,
    input uwire id_4,
    input uwire id_5,
    input wor id_6,
    output wor id_7,
    output supply0 id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_1,
      id_4,
      id_0,
      id_6,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_4,
      id_2,
      id_5,
      id_3
  );
  assign modCall_1.id_6 = 0;
endmodule
