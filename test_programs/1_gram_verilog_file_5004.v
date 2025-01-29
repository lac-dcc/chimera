// Seed: 1191454266
module module_0 (
    output wor id_0,
    input tri1 id_1,
    input supply1 id_2,
    output supply1 id_3,
    id_14,
    output supply0 id_4,
    input tri0 id_5,
    input supply1 id_6,
    input wand id_7,
    input tri1 id_8,
    input supply0 id_9,
    output wire id_10,
    input tri0 id_11#(
        .id_15  (1 == id_2),
        .product(-1)
    ),
    input tri1 id_12
);
  wire id_16;
  assign id_3 = id_11;
endmodule
module module_1 (
    output wand id_0,
    input supply1 id_1
);
  wire id_3;
  and primCall (id_0, id_1, id_3);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.id_7 = 0;
endmodule
