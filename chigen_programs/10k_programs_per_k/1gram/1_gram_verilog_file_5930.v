// Seed: 3408167135
module module_0 (
    input wand id_0,
    input supply1 id_1,
    input supply0 id_2,
    input supply1 id_3,
    input supply0 id_4,
    input wor id_5,
    input wire id_6,
    input wand id_7,
    output supply1 id_8,
    input tri id_9
);
  wire id_11, id_12;
  logic id_13 = id_6;
  int   id_14;
endmodule
module module_1 (
    input  uwire id_0,
    input  wand  id_1,
    output wand  id_2,
    input  wire  id_3,
    input  wand  id_4,
    output tri0  id_5
);
  logic id_7;
  ;
  wire id_8, id_9;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_0,
      id_3,
      id_3,
      id_0,
      id_1,
      id_2,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
