// Seed: 496325103
module module_0 (
    input wand id_0,
    input tri1 id_1,
    output wor id_2,
    input tri0 id_3,
    output supply0 id_4,
    output tri0 id_5,
    input wand id_6,
    input tri1 id_7,
    output uwire id_8,
    output wire id_9,
    input tri1 id_10,
    output supply1 id_11
    , id_19, id_20,
    output tri1 id_12,
    output supply0 id_13,
    output wor id_14,
    input wor id_15,
    input tri id_16,
    output tri0 id_17
);
endmodule
module module_1 #(
    parameter id_3 = 32'd42
) (
    input  tri   id_0,
    output uwire id_1,
    input  wand  id_2,
    input  wand  _id_3
);
  assign id_1 = $signed(5);
  ;
  wire id_5, id_6;
  logic [id_3 : id_3] id_7 = id_0;
  assign id_6 = id_3;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_2,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_6 = 0;
endmodule
