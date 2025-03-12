// Seed: 114768845
module module_0 (
    output wand  id_0,
    input  tri1  id_1,
    output tri0  id_2,
    output uwire id_3,
    input  wand  id_4,
    input  uwire id_5,
    output tri   id_6,
    input  tri1  id_7
);
  logic id_9;
  assign id_3 = id_9;
endmodule
module module_1 #(
    parameter id_1 = 32'd14,
    parameter id_4 = 32'd59,
    parameter id_9 = 32'd22
) (
    input tri1 id_0[(  id_4  ) : 1],
    input tri0 _id_1,
    input supply0 id_2,
    output tri id_3[1 'd0 : id_9],
    input supply1 _id_4,
    output wire id_5,
    output wand id_6,
    input tri id_7,
    input wire id_8,
    input wor _id_9,
    output tri1 id_10[id_1 : id_9],
    output supply1 id_11,
    input wor id_12
);
  assign id_10 = -1 !=? 1;
  module_0 modCall_1 (
      id_11,
      id_0,
      id_3,
      id_10,
      id_8,
      id_0,
      id_6,
      id_8
  );
  assign modCall_1.id_0 = 0;
endmodule
