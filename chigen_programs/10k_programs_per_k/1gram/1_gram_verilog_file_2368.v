// Seed: 1761336918
module module_0 (
    output uwire id_0,
    output tri0 id_1,
    input wand id_2,
    input uwire id_3,
    input wand id_4
    , id_17,
    input wand id_5,
    input supply1 id_6,
    input tri1 id_7,
    output uwire id_8,
    input supply1 id_9,
    output uwire id_10,
    input wor id_11,
    output tri id_12,
    output supply1 id_13,
    output tri1 id_14,
    input wire id_15
);
endmodule
module module_1 #(
    parameter id_4 = 32'd71
) (
    input wor id_0,
    input tri0 id_1,
    input tri id_2,
    input tri id_3,
    input supply1 _id_4,
    input supply0 id_5[id_4 : 1],
    input wire id_6,
    output tri1 id_7,
    output uwire id_8,
    output wand id_9,
    input tri1 id_10,
    input tri1 id_11,
    output wor id_12,
    output wor id_13,
    output supply1 id_14,
    output tri id_15,
    input wire id_16,
    input uwire id_17
);
  always $unsigned(80);
  ;
  nand primCall (id_12, id_17, id_16, id_0, id_6, id_1, id_5, id_2, id_3, id_10, id_11);
  module_0 modCall_1 (
      id_13,
      id_8,
      id_2,
      id_5,
      id_1,
      id_5,
      id_0,
      id_1,
      id_8,
      id_16,
      id_9,
      id_17,
      id_12,
      id_12,
      id_14,
      id_17
  );
  assign modCall_1.id_12 = 0;
endmodule
