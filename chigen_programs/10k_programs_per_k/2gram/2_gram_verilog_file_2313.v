// Seed: 4171741845
macromodule module_0 (
    input tri1 id_0,
    input wor id_1,
    output uwire id_2,
    input wand id_3,
    output supply0 id_4,
    input wor id_5,
    input wire id_6,
    input wand id_7,
    output wor id_8,
    output wor id_9,
    input supply0 id_10,
    output supply1 id_11
);
endmodule
module module_1 (
    output tri0 id_0,
    output wire id_1,
    input tri id_2,
    input supply1 id_3,
    input wand id_4,
    input uwire id_5,
    input supply0 id_6,
    output tri0 id_7,
    output tri id_8,
    input wor id_9,
    output supply1 id_10
);
  assign id_1 = {id_2 - id_3{id_6}};
  module_0 modCall_1 (
      id_2,
      id_3,
      id_1,
      id_9,
      id_7,
      id_2,
      id_6,
      id_6,
      id_0,
      id_10,
      id_3,
      id_8
  );
  assign modCall_1.id_9 = 0;
endmodule
