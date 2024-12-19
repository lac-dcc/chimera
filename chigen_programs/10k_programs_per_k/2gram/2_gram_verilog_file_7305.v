// Seed: 624343690
module module_0 (
    input  tri1 id_0,
    input  wand id_1,
    output tri  id_2,
    input  tri1 id_3
);
endmodule
module module_1 (
    input supply1 id_0,
    output tri0 id_1,
    input wor id_2,
    input tri0 id_3,
    output supply0 id_4,
    input uwire id_5,
    input supply1 id_6,
    input supply0 id_7,
    input wor id_8,
    output wire id_9,
    input tri1 id_10,
    output wand id_11,
    output uwire id_12,
    input tri0 id_13,
    input wor id_14,
    output tri1 id_15,
    output wand id_16,
    input tri0 id_17,
    input supply1 id_18
);
  xnor primCall (id_9, id_17, id_2, id_6, id_3, id_7, id_10, id_18, id_13, id_0, id_8, id_14);
  assign id_16 = id_3;
  module_0 modCall_1 (
      id_0,
      id_10,
      id_12,
      id_5
  );
  assign modCall_1.id_2 = 0;
endmodule
