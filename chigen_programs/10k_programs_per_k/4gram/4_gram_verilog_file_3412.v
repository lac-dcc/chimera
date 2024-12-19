// Seed: 2896944274
module module_0 (
    output wand id_0
    , id_14,
    input tri0 id_1,
    input uwire id_2,
    input supply0 id_3,
    input supply0 id_4,
    output supply0 id_5,
    input wor id_6,
    input tri0 id_7,
    output uwire id_8,
    input wire id_9,
    input wor id_10,
    output supply1 id_11,
    output wand id_12
);
  rpmos (id_0, 1, id_12 == id_6, 1'h0 == 1, id_6, 1);
  wire id_15, id_16;
endmodule
module module_1 (
    output wor id_0,
    input tri id_1,
    input supply1 id_2,
    output tri0 id_3,
    output tri id_4
    , id_12,
    input tri1 id_5,
    output supply0 id_6,
    input wire id_7,
    output wor id_8,
    input wand id_9,
    output supply1 id_10
);
  id_13(
      .id_0(1)
  );
  module_0 modCall_1 (
      id_0,
      id_5,
      id_1,
      id_5,
      id_2,
      id_8,
      id_7,
      id_9,
      id_10,
      id_5,
      id_1,
      id_0,
      id_6
  );
  assign modCall_1.type_18 = 0;
endmodule
