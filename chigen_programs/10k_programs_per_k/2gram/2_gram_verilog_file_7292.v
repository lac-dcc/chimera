// Seed: 918724028
module module_0 (
    output wor id_0
    , id_15, id_16,
    input tri0 id_1,
    input tri id_2,
    output supply0 id_3,
    output supply0 id_4,
    output wire id_5,
    output tri1 id_6,
    output supply0 id_7,
    input wand id_8,
    input supply0 id_9,
    output tri0 id_10,
    input wand id_11
    , id_17,
    output supply1 id_12,
    output supply1 id_13
);
endmodule
module module_1 #(
    parameter id_2 = 32'd99,
    parameter id_6 = 32'd24
) (
    input uwire id_0,
    output wor id_1,
    input uwire _id_2,
    input tri id_3,
    output tri1 id_4,
    input uwire id_5,
    input supply1 _id_6,
    output tri id_7
);
  logic [-1 : -1] id_9;
  ;
  wire id_10;
  bit  id_11;
  wire id_12;
  always id_11 = id_10;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_3,
      id_1,
      id_4,
      id_4,
      id_1,
      id_1,
      id_0,
      id_5,
      id_1,
      id_0,
      id_4,
      id_1
  );
  assign modCall_1.id_3 = 0;
  wire id_13;
  tri1 [id_6 : id_2] id_14;
  assign id_14 = id_12 <= 1 - id_3;
endmodule
