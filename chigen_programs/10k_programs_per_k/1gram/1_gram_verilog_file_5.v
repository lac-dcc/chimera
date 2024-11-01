// Seed: 159005268
module module_0 (
    output tri0 id_0,
    output supply0 id_1,
    input tri id_2,
    input wor id_3,
    input supply0 id_4,
    output wand id_5,
    output wand id_6,
    output tri0 id_7,
    input wor id_8,
    output tri0 id_9,
    input supply0 id_10,
    input supply1 void id_11
);
endmodule
module module_1 (
    input uwire id_0,
    output wand id_1,
    input wand id_2,
    output wand id_3,
    output tri0 id_4,
    input supply1 id_5,
    input wor id_6,
    output tri0 id_7
);
  xor (id_7, id_5, id_0, id_6, id_2);
  module_0(
      id_7, id_4, id_5, id_0, id_6, id_4, id_1, id_3, id_6, id_3, id_0, id_5
  );
  assign id_7 = 1;
endmodule
