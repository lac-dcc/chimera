// Seed: 2835260555
module module_0 (
    output supply1 id_0,
    output tri1 id_1,
    input supply0 id_2,
    input supply0 id_3,
    input tri id_4,
    input tri1 id_5,
    input tri1 id_6,
    input supply1 id_7,
    input tri0 id_8,
    output wor id_9,
    output wor id_10
);
endmodule
macromodule module_1 (
    input wor id_0,
    input wand id_1,
    input tri0 id_2,
    output tri0 id_3,
    input wire id_4,
    input wor id_5,
    input wor id_6,
    input supply0 id_7,
    output tri0 id_8,
    output tri0 id_9,
    input wand id_10,
    input uwire id_11,
    output wire id_12,
    input tri id_13
);
  assign id_8 = 1;
  module_0 modCall_1 (
      id_8,
      id_12,
      id_6,
      id_7,
      id_5,
      id_11,
      id_6,
      id_13,
      id_4,
      id_3,
      id_12
  );
  assign modCall_1.id_10 = 0;
endmodule
