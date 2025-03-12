// Seed: 28595215
module module_0 (
    output supply0 id_0,
    output tri0 id_1,
    input wor id_2,
    output uwire id_3,
    input tri1 id_4,
    output wand id_5,
    output tri id_6,
    output supply1 id_7,
    input tri1 id_8,
    input supply0 id_9,
    input wand id_10,
    input wor id_11,
    input supply1 id_12,
    input uwire id_13,
    input supply1 id_14,
    input tri0 id_15,
    input tri0 module_0
);
  logic id_18 = id_2;
endmodule
module module_1 (
    input  tri0  id_0,
    output wand  id_1,
    input  wor   id_2,
    output uwire id_3,
    input  wor   id_4
);
  assign id_3 = 1'b0 & -1;
  and primCall (id_3, id_4, id_0, id_2);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_0,
      id_1,
      id_3,
      id_1,
      id_0,
      id_4,
      id_2,
      id_4,
      id_4,
      id_0,
      id_0,
      id_4,
      id_4
  );
  assign modCall_1.id_10 = 0;
endmodule
