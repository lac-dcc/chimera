// Seed: 1538551428
module module_0 (
    input supply1 id_0,
    input wire id_1,
    input tri1 id_2,
    input tri0 id_3,
    input supply0 id_4,
    input tri id_5,
    output supply1 id_6,
    output wire id_7,
    input wand id_8,
    input tri id_9,
    input wire id_10,
    input wor id_11,
    input tri1 id_12,
    output supply1 id_13,
    input wor id_14
);
  assign id_13 = -1;
endmodule
module module_1 #(
    parameter id_8 = 32'd63
) (
    output tri id_0,
    input wand id_1,
    input uwire id_2,
    output uwire id_3,
    output wor id_4,
    input wor id_5,
    input uwire id_6,
    input wire id_7,
    input wor _id_8,
    output supply0 id_9
);
  logic [-1 : id_8] id_11;
  initial id_11 = id_6;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_1,
      id_1,
      id_5,
      id_5,
      id_0,
      id_4,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_0,
      id_5
  );
  assign modCall_1.id_3 = 0;
endmodule
