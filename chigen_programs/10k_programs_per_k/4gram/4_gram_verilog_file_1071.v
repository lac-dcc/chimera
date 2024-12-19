// Seed: 721274844
module module_0 (
    input supply1 id_0,
    output wand id_1,
    input tri1 id_2,
    input uwire id_3,
    output wand id_4,
    input tri1 id_5,
    output wor id_6,
    input uwire id_7,
    output wor id_8
);
  supply0 id_10 = 1'b0;
  assign id_10 = id_0;
endmodule
module module_1 (
    input supply1 id_0,
    input uwire id_1,
    output wand id_2,
    input tri id_3,
    output supply1 id_4,
    output tri id_5,
    input supply0 id_6,
    output uwire id_7,
    output tri0 id_8,
    input tri0 id_9,
    input supply0 id_10,
    input wor id_11,
    input tri0 id_12
);
  generate
    tri id_14 = 1;
  endgenerate
  module_0 modCall_1 (
      id_3,
      id_4,
      id_6,
      id_9,
      id_5,
      id_9,
      id_4,
      id_9,
      id_4
  );
  assign modCall_1.id_3 = 0;
endmodule
