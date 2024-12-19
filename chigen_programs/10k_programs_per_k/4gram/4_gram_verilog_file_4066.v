// Seed: 3994421417
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    input supply0 id_2,
    input wire id_3,
    output wor id_4,
    input tri1 id_5,
    input wand id_6,
    input uwire id_7,
    input tri1 id_8,
    input wor id_9,
    input wor id_10,
    input tri id_11,
    output tri0 id_12,
    output tri0 id_13,
    output uwire id_14,
    input wand id_15,
    input wand id_16,
    input tri id_17
);
endmodule
module module_1 (
    input tri0 id_0
    , id_18,
    output wand id_1,
    input wire id_2,
    input wor id_3,
    output wire id_4,
    input tri0 id_5,
    input tri0 id_6,
    input wor id_7,
    input tri1 id_8,
    output wor id_9,
    input supply1 id_10,
    input tri0 id_11,
    input wor id_12,
    input wire id_13,
    input wor id_14,
    input wire id_15,
    input tri0 id_16
);
  assign id_9 = id_8 | id_7;
  module_0 modCall_1 (
      id_15,
      id_9,
      id_6,
      id_2,
      id_4,
      id_13,
      id_6,
      id_10,
      id_11,
      id_10,
      id_5,
      id_15,
      id_1,
      id_1,
      id_4,
      id_11,
      id_3,
      id_10
  );
  assign modCall_1.type_6 = 0;
  generate
    id_19(
        .id_0(id_11),
        .id_1(1),
        .id_2(id_15),
        .id_3(1),
        .id_4((1'b0)),
        .id_5(),
        .id_6(id_3),
        .id_7(id_9),
        .id_8(id_15),
        .id_9(id_2),
        .id_10("")
    );
  endgenerate
endmodule
