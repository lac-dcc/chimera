// Seed: 3841117642
module module_0 (
    input tri0 id_0,
    output wor id_1,
    input tri0 id_2,
    input wand id_3,
    input supply0 id_4,
    input wor id_5,
    output tri1 id_6,
    input uwire id_7,
    input uwire id_8,
    input tri id_9,
    input tri0 id_10,
    input wand id_11
);
  generate
    assign id_1 = id_8;
  endgenerate
endmodule
module module_1 (
    input  tri1 id_0,
    input  wor  id_1,
    input  wor  id_2,
    output tri0 id_3
);
  module_0 modCall_1 (
      id_2,
      id_3,
      id_0,
      id_2,
      id_2,
      id_1,
      id_3,
      id_1,
      id_2,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
