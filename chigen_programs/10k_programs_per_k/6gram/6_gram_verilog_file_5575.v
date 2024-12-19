// Seed: 4288600842
module module_0 (
    input  tri0 id_0,
    output wand id_1
);
  wire id_3;
endmodule
module module_1 (
    output uwire id_0,
    input wand id_1,
    input tri0 id_2,
    input supply1 id_3,
    output tri id_4,
    output supply1 id_5,
    input tri id_6,
    input supply0 id_7,
    input tri0 id_8,
    output supply0 id_9,
    output wor id_10,
    input tri0 id_11,
    output tri id_12,
    input supply1 id_13
);
  assign id_12 = 1'h0 ? 1'b0 : id_7;
  nand primCall (id_10, id_8, id_13, id_7, id_1, id_6, id_3, id_2, id_11);
  module_0 modCall_1 (
      id_8,
      id_10
  );
  assign modCall_1.id_1 = 0;
endmodule
