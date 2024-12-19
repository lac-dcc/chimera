// Seed: 2728548202
module module_0 (
    input supply0 id_0,
    output wand id_1,
    output wire id_2,
    input tri1 id_3,
    input wor id_4,
    output wire id_5,
    input tri0 id_6,
    output wire id_7
);
  wire id_9;
  wire id_10;
  always $display(id_0 ? 1 : ~1);
  assign id_5 = 1;
endmodule
module module_1 (
    output wand  id_0,
    input  wire  id_1,
    input  wor   id_2,
    input  tri   id_3,
    input  uwire id_4,
    input  uwire id_5,
    input  wor   id_6,
    input  wor   id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_3,
      id_5,
      id_0,
      id_6,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
