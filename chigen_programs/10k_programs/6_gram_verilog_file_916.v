// Seed: 3772731190
module module_0 (
    input wor id_0,
    output tri0 id_1,
    input uwire id_2,
    input wand id_3,
    output supply0 id_4,
    input tri1 id_5,
    output wor id_6,
    output supply0 id_7,
    input wand id_8,
    output wor id_9
);
endmodule
module module_1 (
    input wor id_0,
    input wor id_1,
    output supply1 id_2,
    output wire id_3,
    input tri id_4,
    output wor id_5,
    input wor id_6,
    output tri1 id_7
);
  assign id_3 = id_0;
  nand (id_3, id_0, id_6, id_1, id_4);
  module_0(
      id_1, id_5, id_4, id_0, id_3, id_4, id_5, id_5, id_6, id_3
  );
endmodule
