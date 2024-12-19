// Seed: 2368638196
module module_0 (
    output supply0 id_0,
    input tri0 id_1,
    input wand id_2,
    input tri1 id_3,
    input wor id_4,
    input tri0 id_5
    , id_16,
    input supply1 id_6,
    input tri id_7,
    input wire id_8,
    input wire id_9,
    input tri0 id_10,
    input tri1 id_11,
    input uwire id_12,
    input tri0 id_13,
    output tri1 id_14
);
  assign id_14 = id_2 - id_16;
endmodule
module module_1 (
    input tri0 id_0,
    input tri id_1,
    input uwire id_2,
    input wor id_3,
    input tri1 id_4,
    output supply1 id_5,
    output tri id_6,
    input tri0 id_7,
    input wor id_8,
    output tri0 id_9,
    output tri0 id_10,
    output tri0 id_11,
    input wand id_12,
    output tri1 id_13,
    input tri0 id_14,
    output tri0 id_15,
    input wire id_16,
    input tri0 id_17,
    output wire id_18,
    output wor id_19,
    input wire id_20,
    input tri1 id_21,
    output supply0 id_22
);
  id_24(
      .id_0(id_14),
      .id_1(id_14),
      .id_2(id_8#(.id_3(1))),
      .id_4(id_12),
      .id_5(),
      .id_6(id_3),
      .id_7(id_2),
      .id_8(id_2),
      .min(1'b0)
  );
  module_0 modCall_1 (
      id_22,
      id_4,
      id_2,
      id_2,
      id_16,
      id_16,
      id_14,
      id_20,
      id_8,
      id_20,
      id_2,
      id_12,
      id_21,
      id_8,
      id_6
  );
  assign modCall_1.type_18 = 0;
endmodule
