// Seed: 4279631531
module module_0 (
    output tri id_0,
    output supply1 id_1,
    output supply0 id_2,
    input tri1 id_3,
    output tri id_4,
    output wand id_5,
    output supply1 id_6,
    input wand id_7,
    output wor id_8,
    output supply1 id_9,
    output wand id_10,
    input supply1 id_11,
    input supply0 id_12,
    output wor id_13,
    output wire id_14,
    input wand id_15,
    output tri id_16,
    output uwire id_17,
    input wire id_18,
    input wand id_19
);
endmodule
module module_1 (
    input wand id_0,
    output tri id_1,
    output tri0 id_2,
    input tri0 id_3,
    input wor id_4,
    output uwire id_5,
    input tri0 id_6,
    output wire id_7,
    output supply0 id_8,
    input uwire id_9
);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_5,
      id_9,
      id_5,
      id_8,
      id_7,
      id_6,
      id_2,
      id_1,
      id_1,
      id_3,
      id_3,
      id_1,
      id_2,
      id_4,
      id_8,
      id_2,
      id_4,
      id_3
  );
  assign modCall_1.type_0 = 0;
  always_comb id_2 = id_0;
  wire id_11;
  id_12(
      .id_0((id_4)),
      .id_1(id_9),
      .id_2(1),
      .id_3(id_4),
      .id_4(1),
      .id_5(id_8),
      .id_6(id_11),
      .id_7(id_11),
      .id_8(id_5)
  );
endmodule
