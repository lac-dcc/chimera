// Seed: 78258336
module module_0 (
    output wor id_0,
    input supply1 id_1,
    input tri0 id_2,
    input supply1 id_3,
    output wire id_4,
    output tri1 id_5,
    output uwire id_6,
    input supply1 id_7,
    input wor id_8,
    input wor id_9
);
endmodule
module module_1 (
    output tri id_0,
    output wand id_1,
    output tri id_2,
    output supply0 id_3,
    output wor id_4,
    input tri id_5,
    output wor id_6,
    input uwire id_7,
    input wand id_8,
    output supply1 id_9
);
  wire id_11;
  assign id_0 = id_7;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_7,
      id_7,
      id_9,
      id_1,
      id_6,
      id_8,
      id_5,
      id_8
  );
  assign modCall_1.id_3 = 0;
  xor primCall (id_6, id_8, id_5, id_7);
endmodule
