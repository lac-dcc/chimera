// Seed: 2855998090
module module_0 (
    output supply1 id_0,
    input tri id_1
);
endmodule
module module_0 #(
    parameter id_17 = 32'd41
) (
    input tri0 id_0,
    input tri1 id_1,
    output wor id_2,
    input supply0 id_3,
    input wire id_4,
    input wor id_5,
    input supply0 id_6,
    input supply1 id_7,
    input tri0 id_8,
    input wire id_9,
    input supply0 id_10,
    input tri1 id_11,
    input wand id_12,
    output supply1 id_13,
    output tri1 module_1,
    input wor id_15,
    output supply1 id_16,
    input supply0 _id_17,
    output tri id_18,
    input supply1 id_19,
    input wor id_20
);
  logic [-1 : id_17] id_22;
  nand primCall (id_2, id_5, id_10, id_8, id_20, id_12, id_3, id_19, id_0, id_6, id_9, id_4);
  module_0 modCall_1 (
      id_16,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
