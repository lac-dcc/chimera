// Seed: 2668364489
macromodule module_0 (
    input tri1  id_0,
    input wor   id_1,
    input uwire id_2,
    input wand  id_3
);
  always @(1, ~id_0) fork join
endmodule
module module_1 (
    input uwire id_0,
    output supply0 id_1,
    input supply0 id_2,
    input wor id_3,
    input wand id_4,
    output supply0 id_5,
    input wor id_6,
    input wand id_7,
    output tri id_8,
    output supply1 id_9,
    output supply0 id_10,
    input tri1 id_11
);
  assign id_9 = id_11;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_11
  );
  assign modCall_1.id_1 = 0;
endmodule
