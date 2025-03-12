// Seed: 1288553242
module module_0 (
    input supply0 id_0,
    input wor id_1,
    output supply0 id_2,
    output tri1 id_3,
    output wor id_4,
    input tri1 id_5,
    output tri0 id_6,
    output tri1 id_7,
    output wor id_8,
    input supply1 id_9,
    input wor id_10
);
  rpmos #(id_1) (id_3, -1);
  wire id_12;
endmodule
module module_1 #(
    parameter id_3 = 32'd60
) (
    output uwire id_0,
    output tri   id_1,
    output wor   id_2,
    input  wand  _id_3,
    output uwire id_4,
    input  wire  id_5
);
  wire [(  id_3  )  +  1 : -1] id_7, id_8, id_9, id_10;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_1,
      id_0,
      id_2,
      id_5,
      id_0,
      id_1,
      id_2,
      id_5,
      id_5
  );
  assign modCall_1.id_8 = 0;
endmodule
