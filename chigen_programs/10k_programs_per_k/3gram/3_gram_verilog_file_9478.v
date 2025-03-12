// Seed: 159908446
module module_0 (
    input wor id_0,
    output tri0 id_1,
    output tri1 id_2,
    input wor id_3,
    input supply1 id_4
    , id_18,
    output tri0 id_5,
    input uwire id_6,
    input wire id_7,
    input tri id_8,
    output wor id_9,
    input tri1 id_10,
    input tri0 id_11,
    input uwire id_12,
    input tri1 id_13,
    input wand id_14,
    input supply1 id_15,
    output tri1 id_16
);
endmodule
module module_1 #(
    parameter id_2 = 32'd77
) (
    output supply1 id_0,
    input tri0 id_1,
    input supply0 _id_2,
    output wor id_3,
    output supply1 id_4,
    output supply1 id_5,
    output tri1 id_6
);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_3,
      id_1,
      id_1,
      id_4,
      id_1,
      id_1,
      id_1,
      id_6,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_4 = 0;
  wire [id_2 : id_2] id_8;
  parameter id_9 = 1, id_10 = -1, id_11 = 1, id_12 = -1, id_13 = !id_12, id_14 = 1;
endmodule
