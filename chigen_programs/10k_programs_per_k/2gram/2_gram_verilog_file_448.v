// Seed: 1029066434
module module_0 (
    output wand id_0
    , id_18,
    input tri id_1,
    output uwire id_2,
    input uwire id_3,
    output supply0 id_4
    , id_19,
    output supply0 id_5,
    output supply0 id_6,
    input tri id_7,
    output tri1 id_8,
    output wor id_9,
    input wire id_10,
    output wire id_11,
    output tri id_12,
    input supply1 id_13,
    output wire id_14
    , id_20,
    input tri id_15,
    input supply1 id_16
);
  logic [ 1 : 1] id_21 = ~id_19;
  logic [-1 : 1] id_22;
endmodule
module module_1 #(
    parameter id_6 = 32'd28
) (
    output wand  id_0,
    output uwire id_1,
    output tri1  id_2,
    output uwire id_3,
    output wor   id_4,
    output uwire id_5,
    input  wand  _id_6,
    output tri0  id_7,
    input  wor   id_8
);
  wire [1 : id_6  &  1 'b0] id_10 = id_8;
  module_0 modCall_1 (
      id_2,
      id_8,
      id_1,
      id_8,
      id_4,
      id_2,
      id_5,
      id_8,
      id_2,
      id_0,
      id_8,
      id_0,
      id_4,
      id_8,
      id_2,
      id_8,
      id_8
  );
  assign modCall_1.id_5 = 0;
endmodule
