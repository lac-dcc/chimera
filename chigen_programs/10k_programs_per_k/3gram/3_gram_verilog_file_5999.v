// Seed: 3279539242
module module_0 (
    output supply1 id_0,
    output tri1 id_1,
    output uwire id_2,
    output tri1 id_3,
    input wor id_4,
    input tri id_5,
    input tri1 id_6,
    output supply0 id_7,
    input supply1 id_8,
    input tri1 id_9,
    output tri1 id_10,
    output tri id_11,
    output supply0 id_12,
    input tri0 id_13
);
  assign id_10 = id_4;
endmodule
macromodule module_1 #(
    parameter id_0 = 32'd40
) (
    input  tri0  _id_0,
    output uwire id_1,
    output wor   id_2,
    input  tri0  id_3,
    output uwire id_4
    , id_6
);
  wire [1 : id_0] id_7;
  wire id_8;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_1,
      id_1,
      id_3,
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_4,
      id_2,
      id_1,
      id_3
  );
  assign modCall_1.id_13 = 0;
endmodule
