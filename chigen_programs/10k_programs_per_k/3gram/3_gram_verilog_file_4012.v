// Seed: 1739381638
program module_0 (
    input wor id_0,
    input tri0 id_1,
    input tri1 id_2,
    output wire id_3,
    input wand id_4,
    output wor id_5,
    input wor id_6,
    input tri1 id_7,
    input supply1 id_8,
    input tri id_9,
    output supply1 id_10,
    input tri0 id_11
);
  logic id_13;
  ;
  assign id_10 = id_9;
endprogram
module module_1 (
    output tri1  id_0,
    inout  wor   id_1,
    input  wire  id_2,
    output wand  id_3,
    input  uwire id_4,
    input  tri0  id_5,
    input  wor   id_6,
    output tri1  id_7,
    input  wor   id_8
);
  logic id_10;
  ;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_1,
      id_4,
      id_0,
      id_6,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_6 = 0;
  assign id_10[-1] = id_2;
endmodule
