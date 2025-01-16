// Seed: 2036276681
module module_0 (
    input wand id_0,
    output wor id_1,
    input supply1 id_2,
    input uwire id_3,
    id_13,
    output uwire id_4,
    input tri id_5,
    output supply0 id_6,
    output tri0 id_7,
    input tri0 id_8,
    input supply0 id_9,
    input tri id_10,
    input wire id_11
);
  wire id_14;
  wire id_15;
endmodule
module module_1 (
    input  wor   id_0,
    output tri   id_1,
    input  wor   id_2,
    input  tri   id_3,
    input  tri   id_4,
    output tri1  id_5,
    id_14,
    input  uwire id_6,
    input  tri0  id_7,
    input  tri   id_8,
    input  tri1  id_9,
    output tri1  id_10,
    input  wire  id_11,
    input  wor   id_12
);
  and primCall (id_10, id_2, id_4, id_12, id_6, id_3, id_15, id_14, id_11, id_0, id_9, id_8);
  id_15(
      (-1'h0), 1, id_1, -1
  );
  module_0 modCall_1 (
      id_8,
      id_1,
      id_4,
      id_4,
      id_1,
      id_4,
      id_5,
      id_5,
      id_4,
      id_12,
      id_9,
      id_7
  );
  assign modCall_1.type_0 = 0;
endmodule
