// Seed: 220841899
module module_0 (
    input tri0 id_0,
    input wand id_1,
    output wor id_2,
    input wand id_3,
    input supply1 id_4,
    output uwire id_5,
    input supply0 id_6,
    input uwire id_7,
    input supply0 id_8,
    input wire id_9,
    input wand id_10,
    input tri1 id_11,
    output uwire id_12,
    input tri0 id_13,
    output uwire id_14,
    input tri id_15,
    input supply0 id_16,
    input tri0 id_17,
    input wand id_18,
    output tri0 id_19,
    input tri1 id_20,
    output tri1 id_21,
    output wand id_22,
    output tri0 id_23
);
  wire id_25 = !1;
endmodule
module module_1 (
    output supply1 id_0,
    input tri1 id_1,
    input wand id_2,
    output wand id_3,
    input wire id_4,
    input supply0 id_5,
    input supply0 id_6
);
  id_8(
      .id_0(1),
      .id_1(1),
      .id_2(),
      .id_3(id_4),
      .id_4(id_3),
      .id_5((id_5)),
      .id_6(id_3),
      .id_7(id_3),
      .id_8(1)
  );
  module_0 modCall_1 (
      id_2,
      id_5,
      id_3,
      id_1,
      id_6,
      id_3,
      id_5,
      id_6,
      id_6,
      id_5,
      id_4,
      id_5,
      id_3,
      id_6,
      id_3,
      id_2,
      id_5,
      id_2,
      id_5,
      id_3,
      id_4,
      id_3,
      id_0,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
