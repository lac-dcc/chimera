// Seed: 306969343
module module_0 (
    input  wand  id_0,
    output tri1  id_1,
    input  tri1  id_2,
    input  uwire id_3,
    output tri0  id_4,
    input  wor   id_5
);
  integer id_7;
endmodule
module module_1 (
    input tri1 id_0,
    input supply0 id_1,
    input wor id_2,
    output wire id_3,
    output wand id_4,
    input wand id_5,
    input wand id_6,
    input tri0 id_7,
    output wor id_8,
    input uwire id_9,
    output wor id_10,
    input wor id_11,
    input supply0 id_12,
    output supply1 id_13
);
  assign id_10 = 1 + id_6;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_6,
      id_9,
      id_8,
      id_9
  );
  assign modCall_1.id_3 = 0;
  supply0 id_15 = 1 ? -1'b0 : -1, id_16, id_17;
endmodule
