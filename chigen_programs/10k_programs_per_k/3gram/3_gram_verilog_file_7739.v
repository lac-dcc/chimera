// Seed: 854060406
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    output supply1 id_2,
    input supply1 id_3,
    input tri0 id_4,
    output tri id_5,
    input supply0 id_6,
    input wand id_7,
    input supply1 id_8,
    input wand id_9,
    output wor id_10,
    input uwire id_11,
    input wand id_12,
    input wand id_13,
    input wire id_14,
    input uwire id_15,
    input tri0 id_16,
    output tri id_17
);
  assign id_5 = id_14;
endmodule
module module_1 #(
    parameter id_2 = 32'd77
) (
    output supply0 id_0,
    input tri id_1,
    output wire _id_2,
    input wor id_3
);
  logic [id_2 : 1] id_5 = id_5, id_6;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_1,
      id_3,
      id_0,
      id_3,
      id_1,
      id_1,
      id_3,
      id_0,
      id_1,
      id_3,
      id_3,
      id_1,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_17 = 0;
endmodule
