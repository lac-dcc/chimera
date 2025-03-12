// Seed: 1328202585
module module_0 (
    output tri id_0,
    output supply1 id_1,
    output supply0 id_2,
    input uwire id_3,
    input tri1 id_4,
    output wor id_5,
    output supply1 id_6,
    input uwire id_7,
    input uwire id_8,
    input tri id_9,
    input supply0 id_10,
    input supply1 id_11,
    output tri0 id_12,
    input wand id_13,
    input tri id_14,
    input tri1 id_15
);
  assign id_6 = id_11 & id_10;
endmodule
module module_1 #(
    parameter id_0 = 32'd7,
    parameter id_9 = 32'd59
) (
    input supply0 _id_0,
    input supply1 id_1,
    input tri0 id_2,
    input wand id_3,
    input wire id_4,
    input tri0 id_5,
    input wor id_6,
    output tri1 id_7,
    input wor id_8,
    output wand _id_9,
    output tri1 id_10
);
  logic [id_9 : id_0] id_12;
  module_0 modCall_1 (
      id_10,
      id_7,
      id_10,
      id_8,
      id_4,
      id_7,
      id_10,
      id_4,
      id_1,
      id_8,
      id_3,
      id_2,
      id_10,
      id_2,
      id_8,
      id_3
  );
  assign modCall_1.id_14 = 0;
endmodule
