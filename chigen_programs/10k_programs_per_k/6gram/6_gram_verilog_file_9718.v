// Seed: 3675519346
module module_0 (
    output tri0 id_0,
    input supply0 id_1,
    output supply1 id_2,
    input tri id_3,
    input supply0 id_4,
    output tri0 id_5,
    output wor id_6,
    output wor id_7,
    input supply0 id_8,
    input supply0 id_9,
    input wand id_10
    , id_12
);
  always @(posedge id_9) id_7 = 1'b0;
endmodule
module module_1 (
    input  tri1  id_0,
    input  wor   id_1,
    input  uwire id_2,
    input  tri   id_3,
    input  tri   id_4,
    output wor   id_5
);
  assign id_5 = id_1 + {1, 1};
  module_0(
      id_5, id_0, id_5, id_1, id_0, id_5, id_5, id_5, id_2, id_1, id_4
  );
  tri0 id_7 = id_0;
endmodule
