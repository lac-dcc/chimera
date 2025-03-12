// Seed: 907267310
module module_0 (
    output tri1 id_0,
    input supply1 id_1,
    output tri1 id_2,
    output uwire id_3,
    input supply1 id_4,
    output tri0 id_5,
    output supply0 id_6,
    input wire id_7,
    input supply0 id_8,
    output supply1 id_9,
    output supply0 id_10,
    input supply0 id_11,
    input uwire id_12,
    output tri id_13,
    input wor id_14,
    output wand id_15
);
  assign id_0 = id_12;
  logic [-1 'b0 : -1] id_17, id_18, id_19;
  logic id_20;
  ;
endmodule
module module_1 #(
    parameter id_3 = 32'd18
) (
    input  wire id_0,
    input  tri0 id_1,
    input  wor  id_2,
    output wire _id_3
    , id_6,
    output tri1 id_4
);
  logic [id_3 : -1] id_7;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_4,
      id_4,
      id_0,
      id_4,
      id_4,
      id_0,
      id_2,
      id_4,
      id_4,
      id_1,
      id_1,
      id_4,
      id_0,
      id_4
  );
  assign modCall_1.id_7 = 0;
endmodule
