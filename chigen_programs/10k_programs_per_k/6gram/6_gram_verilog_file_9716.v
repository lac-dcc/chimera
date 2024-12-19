// Seed: 1073825503
module module_0 (
    input  wand  id_0,
    output wire  id_1,
    input  tri0  id_2,
    output tri   id_3,
    input  uwire id_4,
    output tri0  id_5,
    output wor   id_6,
    input  tri0  id_7,
    input  uwire id_8,
    input  tri1  id_9
);
  assign id_3 = 1'b0;
  assign id_1 = 1;
endmodule
module module_1 (
    input tri0 id_0,
    input supply1 id_1,
    input wand id_2,
    input tri0 id_3,
    output wire id_4
);
  module_0 modCall_1 (
      id_3,
      id_4,
      id_2,
      id_4,
      id_3,
      id_4,
      id_4,
      id_0,
      id_3,
      id_2
  );
  assign modCall_1.id_8 = 0;
  wire  id_6;
  uwire id_7;
  assign id_7 = 1;
endmodule
