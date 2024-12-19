// Seed: 411396217
module module_0 (
    output wor   id_0,
    input  tri0  id_1,
    input  wire  id_2,
    output wand  id_3,
    output tri0  id_4,
    input  wand  id_5,
    input  tri0  id_6,
    output uwire id_7
);
  assign id_3 = 1;
endmodule
module module_1 (
    output tri0 id_0,
    input wire id_1,
    input wire id_2,
    input wand id_3,
    output tri0 id_4,
    output supply0 id_5,
    input tri1 id_6,
    output wor id_7,
    output tri1 id_8,
    output uwire id_9,
    input tri0 id_10,
    input tri1 id_11,
    output tri id_12
);
  nor primCall (id_12, id_10, id_6, id_1, id_2, id_11, id_3);
  assign id_7 = 1;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_1,
      id_5,
      id_8,
      id_2,
      id_10,
      id_12
  );
  assign modCall_1.type_9 = 0;
  assign id_9 = 1;
  wire id_14;
endmodule
