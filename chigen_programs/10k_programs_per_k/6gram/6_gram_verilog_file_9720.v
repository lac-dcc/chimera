// Seed: 2814880299
module module_0 (
    input  wire id_0,
    input  tri1 id_1,
    input  tri0 id_2,
    output tri1 id_3,
    output tri0 id_4
);
endmodule
module module_1 (
    input  uwire id_0,
    input  uwire id_1,
    input  wor   id_2,
    output logic id_3,
    input  wor   id_4,
    input  uwire id_5,
    input  uwire id_6,
    input  tri   id_7,
    output wand  id_8
);
  assign id_3 = id_6 & id_7;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_8,
      id_8
  );
  assign id_8 = id_7;
  always @(posedge id_0) if (1) id_3 = id_1 >= 1;
endmodule
