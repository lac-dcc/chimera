// Seed: 3571013368
module module_0 (
    output wor id_0,
    input tri0 id_1,
    input wor id_2,
    input wor id_3,
    input supply0 id_4,
    output wand id_5,
    input tri0 id_6,
    input wor id_7,
    output tri1 id_8,
    input uwire id_9,
    output uwire id_10,
    input wire id_11,
    output uwire id_12,
    output tri0 id_13,
    output tri1 id_14,
    input tri0 id_15,
    input uwire id_16,
    output wire id_17,
    output uwire id_18,
    input tri0 id_19,
    input uwire id_20,
    input tri id_21,
    input tri0 id_22
    , id_24
);
endmodule
module module_1 (
    input  wire  id_0,
    input  wor   id_1,
    output tri1  id_2,
    input  uwire id_3,
    input  wand  id_4,
    output wand  id_5
);
  uwire id_7 = id_0 - id_3;
  wire  id_8;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_0,
      id_3,
      id_5,
      id_1,
      id_3,
      id_2,
      id_3,
      id_2,
      id_0,
      id_5,
      id_5,
      id_2,
      id_4,
      id_0,
      id_2,
      id_5,
      id_3,
      id_4,
      id_3,
      id_1
  );
  assign modCall_1.type_3 = 0;
endmodule
