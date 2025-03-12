// Seed: 2826781634
module module_0 (
    input supply1 id_0,
    output supply1 id_1,
    input wand module_0,
    output uwire id_3,
    output tri id_4,
    output tri0 id_5,
    output supply0 id_6,
    input tri id_7,
    input tri1 id_8,
    input tri id_9,
    output wor id_10,
    input supply1 id_11,
    output wand id_12,
    output supply0 id_13,
    output tri id_14
);
  pmos (id_3, -1);
endmodule
module module_1 #(
    parameter id_5 = 32'd35
) (
    output tri0 id_0,
    output wire id_1,
    output tri1 id_2,
    output tri1 id_3,
    input tri0 id_4,
    input supply0 _id_5,
    input tri1 id_6,
    input wand id_7,
    input supply1 id_8
);
  logic [7:0] id_10;
  module_0 modCall_1 (
      id_7,
      id_1,
      id_4,
      id_0,
      id_2,
      id_2,
      id_0,
      id_6,
      id_7,
      id_6,
      id_3,
      id_4,
      id_0,
      id_1,
      id_2
  );
  assign modCall_1.id_0 = 0;
  logic id_11 = 1 * id_11++ - -1;
  assign id_10[id_5-1] = 1;
endmodule
