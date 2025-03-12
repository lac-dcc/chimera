// Seed: 3854478282
module module_0 (
    output tri   id_0,
    input  wand  id_1,
    input  wor   id_2,
    output wand  id_3,
    input  wand  id_4,
    output tri1  id_5,
    output wire  id_6,
    output wire  id_7,
    output uwire id_8,
    output wor   id_9
);
  wire id_11;
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    input supply0 id_2,
    input supply0 id_3,
    input wor id_4,
    input wire id_5,
    output wand id_6,
    output tri id_7,
    input supply1 id_8,
    input supply1 id_9,
    input tri id_10,
    input wor id_11,
    input tri1 id_12
);
  wire id_14 = id_10;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_12,
      id_7,
      id_5,
      id_6,
      id_6,
      id_7,
      id_6,
      id_6
  );
  assign modCall_1.id_2 = 0;
endmodule
