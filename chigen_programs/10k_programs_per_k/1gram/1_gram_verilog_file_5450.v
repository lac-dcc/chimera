// Seed: 3614377235
module module_0 (
    input wand id_0,
    input uwire id_1,
    output tri id_2,
    input uwire id_3,
    input wand id_4,
    output tri1 id_5,
    input tri0 id_6,
    input supply1 id_7,
    output tri1 id_8,
    output wand id_9,
    input supply1 id_10,
    output tri0 id_11,
    output tri1 id_12,
    input wor id_13,
    input wor id_14,
    input wire id_15,
    input tri0 id_16,
    input tri id_17,
    output tri id_18,
    output uwire id_19,
    input tri0 id_20
);
  wire id_22;
  assign id_5 = id_13;
endmodule
module module_1 (
    input wand id_0,
    output supply0 id_1,
    output supply1 id_2,
    input wor id_3
);
  supply1 id_5;
  supply0 id_6;
  id_7(
      .id_0(id_1 != id_5),
      .id_1(id_2 - id_6),
      .id_2(1),
      .id_3(id_0),
      .id_4(id_0 << 1),
      .id_5(id_5),
      .id_6(id_6),
      .id_7(),
      .id_8(id_0)
  );
  assign id_5 = 1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_1,
      id_0,
      id_3,
      id_2,
      id_0,
      id_0,
      id_2,
      id_2,
      id_3,
      id_2,
      id_2,
      id_0,
      id_3,
      id_3,
      id_3,
      id_3,
      id_2,
      id_2,
      id_3
  );
  assign modCall_1.id_2 = 0;
endmodule
