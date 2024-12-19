// Seed: 2785503221
module module_0 (
    input uwire id_0,
    input uwire id_1,
    output wor id_2
    , id_32,
    output uwire id_3,
    output uwire id_4,
    output uwire id_5,
    input tri sample,
    output supply0 id_7,
    input tri id_8,
    input tri id_9,
    input supply1 id_10,
    input wire id_11,
    input wire id_12,
    input tri1 id_13,
    output wor id_14,
    output supply1 id_15,
    input tri1 id_16,
    output wand id_17,
    input wire id_18,
    output wor id_19,
    output supply0 id_20,
    output supply1 id_21,
    output wand id_22,
    input supply1 id_23,
    output supply0 id_24,
    input supply1 id_25,
    input tri id_26,
    input wor module_0,
    input tri1 id_28,
    input tri id_29,
    output wand id_30
);
  assign id_19 = id_29;
  assign id_4  = {id_16, 1'b0};
endmodule
module module_1 (
    input wor id_0,
    input wor id_1,
    input uwire id_2,
    input supply1 id_3,
    input wand id_4,
    input tri id_5,
    input supply1 id_6,
    output wor id_7,
    output tri id_8,
    input supply1 id_9
);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_8,
      id_7,
      id_8,
      id_8,
      id_1,
      id_8,
      id_2,
      id_1,
      id_1,
      id_3,
      id_3,
      id_1,
      id_8,
      id_7,
      id_6,
      id_8,
      id_4,
      id_7,
      id_7,
      id_8,
      id_8,
      id_0,
      id_7,
      id_9,
      id_0,
      id_1,
      id_3,
      id_6,
      id_8
  );
  assign modCall_1.type_7 = 0;
  id_11(
      .id_0(id_0 + {1{id_0}}),
      .id_1(id_9),
      .id_2(1),
      .id_3(),
      .id_4(1),
      .id_5(1 & id_8++),
      .id_6(id_5)
  );
endmodule
