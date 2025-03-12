// Seed: 149909710
module module_0 (
    output wand id_0,
    input wand id_1,
    output wire id_2,
    output wand id_3,
    output supply0 id_4,
    input supply1 id_5,
    output wand id_6,
    output wand id_7,
    input wire id_8,
    output tri id_9,
    input tri id_10,
    output tri0 id_11,
    output tri1 id_12,
    output tri1 id_13,
    input tri0 id_14
);
  wire id_16;
  assign id_3 = 1;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input  tri id_0,
    output wor id_1
);
  assign id_1 = -1'b0 ? id_0 : 1 & id_0 & {id_0, -1};
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0
  );
endmodule
