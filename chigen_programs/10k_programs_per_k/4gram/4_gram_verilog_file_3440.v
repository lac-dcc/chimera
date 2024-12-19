// Seed: 615358657
module module_0 (
    output uwire id_0,
    output wand id_1,
    input tri0 id_2,
    input supply1 id_3,
    output tri id_4,
    input supply1 id_5,
    output tri id_6,
    output supply0 id_7,
    input tri0 id_8,
    output supply0 id_9,
    input wor id_10,
    input tri0 id_11
);
  assign id_4 = id_3;
endmodule
module module_1 (
    output tri0 id_0,
    output uwire id_1,
    input tri id_2,
    input supply0 id_3
);
  generate
    wand id_5 = 1;
  endgenerate
  module_0 modCall_1 (
      id_0,
      id_0,
      id_2,
      id_3,
      id_0,
      id_3,
      id_0,
      id_0,
      id_3,
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.id_5 = 0;
endmodule
