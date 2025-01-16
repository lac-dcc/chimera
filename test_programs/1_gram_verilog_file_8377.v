// Seed: 2873721884
module module_0 (
    output tri1 id_0,
    input tri1 id_1,
    input tri1 id_2,
    output supply1 id_3,
    output supply0 id_4,
    input supply1 id_5,
    input supply0 id_6
);
  assign id_4 = -1;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    input  tri0  id_0,
    input  wand  id_1,
    input  wire  id_2,
    output tri1  id_3,
    input  tri1  id_4,
    input  wand  id_5,
    input  tri0  id_6,
    output wand  id_7,
    input  uwire id_8,
    output wand  id_9
);
  wire id_11;
  parameter id_12 = 1'b0;
  assign id_9 = id_6;
  xnor primCall (id_3, id_12, id_8, id_2, id_11, id_0, id_1, id_6);
  module_0 modCall_1 (
      id_9,
      id_4,
      id_8,
      id_9,
      id_9,
      id_5,
      id_5
  );
endmodule
