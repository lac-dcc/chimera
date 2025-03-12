// Seed: 1471366370
module module_0 (
    output supply1 id_0,
    input supply1 id_1,
    input supply0 id_2,
    input tri0 id_3,
    output tri1 id_4,
    input wor id_5,
    output supply0 id_6,
    input supply0 id_7,
    output supply0 id_8,
    input supply0 id_9,
    input wor id_10
    , id_12, id_13
);
  assign id_6 = id_12;
endmodule
module module_1 #(
    parameter id_0 = 32'd2
) (
    output wor  _id_0,
    output tri  id_1,
    input  tri  id_2,
    input  tri1 id_3,
    output wand id_4
);
  assign id_0 = id_2;
  logic [-1 : id_0] id_6;
  ;
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_3,
      id_2,
      id_1,
      id_3,
      id_1,
      id_3,
      id_1,
      id_2,
      id_3
  );
  assign modCall_1.id_10 = 0;
  assign id_6 = -1'b0;
endmodule
