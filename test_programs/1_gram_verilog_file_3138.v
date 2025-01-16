// Seed: 73407377
module module_0 (
    output uwire id_0,
    input tri0 id_1,
    input wor id_2,
    output wor id_3,
    input wor id_4,
    output uwire id_5,
    input wire id_6,
    output tri id_7,
    input tri id_8,
    id_12,
    input tri1 id_9,
    input supply1 id_10
);
  wire id_13;
  wire id_14;
endmodule
module module_1 (
    output wand  id_0,
    input  uwire id_1,
    input  tri0  id_2,
    input  wand  id_3,
    input  wor   id_4,
    input  wire  id_5,
    output wor   id_6,
    input  wor   id_7,
    input  tri1  id_8
);
  assign id_0 = 1 * id_4;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_5,
      id_6,
      id_5,
      id_6,
      id_3,
      id_2,
      id_8
  );
  assign modCall_1.type_7 = 0;
endmodule
