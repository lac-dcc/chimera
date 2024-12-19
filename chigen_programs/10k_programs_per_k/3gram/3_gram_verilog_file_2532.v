// Seed: 1437872327
module module_0 (
    output tri1 id_0,
    output supply1 id_1,
    output tri0 id_2,
    output tri0 id_3,
    input tri1 id_4,
    output wor id_5
);
endmodule
module module_1 (
    output wand id_0,
    output tri0 id_1,
    input uwire id_2,
    output wor id_3,
    input supply1 id_4,
    input tri0 id_5,
    output tri0 id_6,
    input tri0 id_7,
    output wor id_8,
    input uwire id_9,
    output supply0 id_10,
    input uwire id_11
);
  generate
    assign id_10 = id_2;
  endgenerate
  module_0 modCall_1 (
      id_10,
      id_10,
      id_8,
      id_8,
      id_2,
      id_10
  );
  assign modCall_1.type_8 = 0;
endmodule
