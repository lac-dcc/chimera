// Seed: 4258148116
module module_0 (
    input tri0 id_0,
    output wor id_1,
    output tri0 id_2,
    output tri1 id_3,
    input supply0 id_4,
    output wire id_5,
    output wand id_6,
    output supply0 id_7,
    output uwire id_8,
    output uwire id_9,
    output tri0 id_10,
    input wand id_11,
    output tri id_12,
    input tri0 id_13,
    output wire id_14,
    input supply0 id_15,
    output uwire id_16
);
  wire id_18;
endmodule
module module_1 (
    input  uwire id_0,
    input  wire  id_1,
    input  tri   id_2,
    input  tri0  id_3,
    input  tri0  id_4,
    output tri0  id_5,
    input  wor   id_6,
    output wand  id_7,
    output wand  id_8,
    output wor   id_9,
    input  tri1  id_10
);
  wire id_12;
  module_0 modCall_1 (
      id_10,
      id_5,
      id_8,
      id_5,
      id_6,
      id_5,
      id_5,
      id_7,
      id_5,
      id_8,
      id_9,
      id_1,
      id_5,
      id_0,
      id_5,
      id_0,
      id_5
  );
  assign modCall_1.id_4 = 0;
endmodule
