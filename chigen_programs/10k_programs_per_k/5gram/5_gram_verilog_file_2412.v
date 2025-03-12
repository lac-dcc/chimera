// Seed: 1728193930
module module_0 (
    output tri1 id_0,
    output supply1 id_1,
    output wand id_2,
    input uwire id_3,
    output wand id_4,
    output tri1 id_5,
    input wor id_6,
    input uwire id_7,
    output wor id_8,
    output supply0 id_9,
    input wand id_10,
    output wor id_11
);
  assign id_9 = id_10 > id_7;
  wire id_13;
endmodule
module module_1 #(
    parameter id_0 = 32'd5
) (
    input supply0 _id_0
    , id_12,
    input tri1 id_1,
    input wire id_2,
    output wire id_3,
    input tri0 id_4
    , id_13,
    output wire id_5,
    input tri0 id_6,
    input wor id_7,
    input tri0 id_8,
    output supply1 id_9,
    input wor id_10
);
  wire id_14 = id_2 - -1;
  logic [-1 : id_0] id_15;
  assign id_13 = 1;
  assign id_9  = id_6;
  module_0 modCall_1 (
      id_3,
      id_9,
      id_5,
      id_7,
      id_5,
      id_9,
      id_6,
      id_8,
      id_9,
      id_3,
      id_1,
      id_3
  );
  assign modCall_1.id_5 = 0;
  wand id_16 = id_7;
  assign id_16 = 1 == 1'b0;
endmodule
