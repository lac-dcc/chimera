// Seed: 2807469438
module module_0 (
    output uwire id_0,
    input uwire id_1,
    output wor id_2,
    input tri0 id_3,
    output wor id_4,
    input supply1 id_5,
    output tri0 id_6,
    input wand id_7,
    input wand id_8,
    input tri id_9,
    output wor id_10
);
  wire id_12;
endmodule
module module_1 #(
    parameter id_14 = 32'd4,
    parameter id_4  = 32'd5,
    parameter id_8  = 32'd4
) (
    output wor id_0
    , _id_14,
    input tri0 id_1,
    output supply0 id_2,
    input tri0 id_3,
    input wire _id_4,
    output supply1 id_5,
    output tri0 id_6,
    output wand id_7,
    input wand _id_8,
    input wire id_9
    , id_15,
    input uwire id_10,
    output supply0 id_11,
    output wand id_12
);
  wire [id_8 : -1 'd0] id_16;
  wire id_17;
  logic [-  id_4 : 1  /  id_14] id_18;
  module_0 modCall_1 (
      id_7,
      id_9,
      id_2,
      id_3,
      id_2,
      id_3,
      id_6,
      id_3,
      id_1,
      id_3,
      id_2
  );
  assign modCall_1.id_7 = 0;
endmodule
