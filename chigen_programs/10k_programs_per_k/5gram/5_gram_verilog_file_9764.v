// Seed: 3953446252
module module_0 (
    input uwire id_0,
    output uwire id_1,
    input uwire id_2,
    input wor id_3,
    output wor id_4,
    input uwire id_5,
    input supply0 id_6,
    input tri id_7,
    input tri id_8,
    input supply1 id_9,
    input wire id_10,
    input wire id_11,
    input tri1 id_12,
    input supply1 id_13
    , id_17,
    output tri1 id_14,
    output tri id_15
);
  assign id_17[-1] = 1 ? 1'd0 : id_3 ? id_3 + -1 - 1 : -1'h0 != id_2;
  logic [1 : 1] id_18;
  uwire id_19 = -1;
  wire id_20;
  ;
endmodule
module module_1 #(
    parameter id_5 = 32'd12
) (
    input supply1 id_0,
    input supply1 id_1,
    input wand id_2,
    input wire id_3,
    output wor id_4
    , id_11,
    input wire _id_5,
    input supply1 id_6,
    output wand id_7,
    input wor id_8
    , id_12,
    output tri id_9
);
  wire id_13;
  assign id_9 = id_0;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_8,
      id_8,
      id_9,
      id_3,
      id_3,
      id_2,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_4,
      id_4
  );
  assign modCall_1.id_0 = 0;
  assign id_12[id_5] = -1;
endmodule
