// Seed: 417399984
module module_0 (
    input  tri0  id_0,
    input  uwire id_1,
    output uwire id_2,
    output wor   id_3,
    output tri1  id_4,
    output uwire id_5,
    input  uwire id_6
);
  genvar id_8;
endmodule
macromodule module_1 (
    output tri0 id_0,
    output wor id_1,
    output tri0 id_2,
    input uwire id_3,
    input tri1 id_4,
    output supply0 id_5,
    input wire id_6,
    input wand id_7,
    output uwire id_8,
    input tri0 id_9,
    input wand id_10
);
  module_0 modCall_1 (
      id_3,
      id_7,
      id_1,
      id_2,
      id_8,
      id_1,
      id_10
  );
  assign modCall_1.id_0 = 0;
  assign id_8 = id_4;
endmodule
