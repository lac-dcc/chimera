// Seed: 4068621558
module module_0 (
    output supply1 id_0,
    output wand id_1,
    output wire id_2,
    input wand id_3,
    input tri id_4,
    output tri1 id_5,
    input wor id_6,
    input tri id_7,
    input wand id_8
);
  assign id_5 = 1;
endmodule
module module_1 (
    input tri0 id_0,
    input uwire id_1,
    input tri id_2 id_11,
    output wor id_3,
    input tri0 id_4,
    input wand id_5,
    input supply0 id_6,
    input wor id_7,
    input tri0 id_8,
    output wand id_9
);
  assign id_9 = id_11;
  xnor primCall (id_3, id_0, id_11, id_4, id_5, id_1, id_8, id_6, id_7, id_2);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_11,
      id_7,
      id_7,
      id_3,
      id_11,
      id_8,
      id_0
  );
  assign modCall_1.type_4 = 0;
endmodule
