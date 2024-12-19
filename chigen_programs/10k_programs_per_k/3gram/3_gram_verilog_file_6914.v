// Seed: 1014517433
module module_0 (
    input supply1 id_0,
    input supply1 id_1,
    input supply1 id_2,
    output uwire id_3,
    input supply0 id_4,
    input tri0 id_5,
    output wor id_6,
    input supply0 id_7,
    input tri0 id_8,
    output uwire id_9,
    input wire id_10,
    input wor id_11,
    input supply0 id_12,
    output wand id_13
);
  wire id_15;
endmodule
module module_1 (
    input  tri1 id_0,
    input  tri1 id_1,
    output tri0 id_2,
    output tri  id_3,
    output tri  id_4,
    output wire id_5,
    input  wire id_6,
    output tri0 id_7,
    output wand id_8
);
  assign id_2 = 1;
  assign id_5 = 1;
  assign id_8 = {id_0, id_0};
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_8,
      id_6,
      id_1,
      id_5,
      id_1,
      id_0,
      id_2,
      id_1,
      id_0,
      id_0,
      id_4
  );
  assign modCall_1.type_1 = 0;
  wire id_10;
  wire id_11;
endmodule
