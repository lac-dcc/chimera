// Seed: 216057826
module module_0 (
    input wor id_0,
    input wor id_1,
    input wire id_2,
    input tri1 id_3,
    input tri0 id_4,
    input supply1 id_5,
    input wand id_6,
    output tri1 id_7,
    input tri0 id_8,
    input tri id_9,
    output wand id_10,
    input wand id_11,
    output uwire id_12,
    input tri0 id_13,
    input supply1 id_14,
    input wand id_15,
    output wand id_16,
    input supply0 id_17
);
  tri id_19 = id_1 ? 'h0 : id_17;
endmodule
module module_1 (
    input  wor   id_0,
    input  tri0  id_1,
    input  tri0  id_2,
    input  wand  id_3,
    input  tri0  id_4,
    input  wire  id_5,
    output wor   id_6,
    output wor   id_7,
    input  tri0  id_8,
    output wand  id_9,
    input  uwire id_10,
    output wire  id_11,
    input  tri   id_12,
    output wor   id_13
);
  assign id_13 = id_5;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_12,
      id_12,
      id_5,
      id_8,
      id_4,
      id_13,
      id_4,
      id_2,
      id_13,
      id_3,
      id_9,
      id_3,
      id_0,
      id_4,
      id_6,
      id_3
  );
  assign modCall_1.type_4 = 0;
endmodule
