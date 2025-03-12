// Seed: 2680223538
module module_0 (
    output tri1 id_0,
    input uwire id_1,
    input supply1 id_2,
    output supply1 id_3,
    input wand id_4
    , id_13,
    input tri1 id_5,
    output uwire id_6,
    output tri0 id_7,
    input wand id_8,
    output tri id_9,
    output wor id_10,
    output wand id_11
);
  assign id_9 = id_8;
  wire id_14;
endmodule
module module_1 #(
    parameter id_10 = 32'd66,
    parameter id_8  = 32'd98
) (
    input supply0 id_0,
    output wire id_1,
    input tri0 id_2,
    input wor id_3,
    input uwire id_4,
    output wand id_5,
    input wor id_6,
    output tri1 id_7,
    output supply0 _id_8,
    input supply0 id_9,
    input wire _id_10,
    output wire id_11
);
  assign id_7 = id_2;
  assign id_1 = id_2;
  module_0 modCall_1 (
      id_11,
      id_0,
      id_4,
      id_1,
      id_4,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_11
  );
  assign modCall_1.id_2 = 0;
  logic [id_8 : id_10] id_13 = -1'b0;
endmodule
