// Seed: 341156272
module module_0 (
    input uwire id_0,
    output wire id_1,
    output tri id_2,
    input tri0 id_3,
    output tri0 id_4,
    input tri0 id_5,
    input wor id_6,
    output wand id_7,
    output wand id_8,
    input wor id_9,
    input tri1 id_10,
    output supply0 id_11
);
  wire id_13;
endmodule
macromodule module_1 (
    output wor id_0,
    input tri id_1,
    input supply0 id_2,
    input wire id_3
);
  assign id_0 = (1) - id_1 || 1;
  wire id_5, id_6, id_7;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_2,
      id_0,
      id_3,
      id_1,
      id_0,
      id_0,
      id_2,
      id_3,
      id_0
  );
  assign modCall_1.id_3 = 0;
endmodule
