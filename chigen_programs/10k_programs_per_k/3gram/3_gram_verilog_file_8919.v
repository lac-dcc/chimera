// Seed: 4227258781
module module_0 (
    output tri1  id_0,
    input  wand  id_1,
    input  tri0  id_2,
    input  wor   id_3,
    input  uwire id_4,
    input  wand  id_5,
    output tri1  id_6,
    input  wire  id_7,
    output tri0  id_8,
    input  tri0  id_9,
    output tri0  id_10,
    output wor   id_11,
    output tri   id_12
);
  wire id_14;
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    input wire id_0,
    input supply1 id_1,
    output tri1 id_2,
    output wand id_3,
    inout tri id_4,
    input wire id_5,
    input wor id_6,
    input tri1 id_7
);
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_6,
      id_4,
      id_3,
      id_6,
      id_3,
      id_0,
      id_3,
      id_4,
      id_3
  );
  nor primCall (id_3, id_1, id_0, id_4, id_7);
endmodule
