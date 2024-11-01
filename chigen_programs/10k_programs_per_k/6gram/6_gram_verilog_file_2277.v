// Seed: 2137939405
module module_0 (
    output tri1 id_0,
    input supply1 id_1,
    output wand id_2,
    input uwire id_3,
    input wand id_4,
    output tri1 id_5,
    input wor id_6,
    output uwire id_7,
    input wor id_8,
    output supply0 id_9,
    input wand id_10,
    output wor id_11
);
  assign id_9 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    output tri0 id_1,
    output supply0 id_2,
    output tri id_3,
    input tri1 id_4,
    input tri0 id_5,
    output uwire id_6,
    input tri1 id_7,
    input supply1 id_8,
    input wor id_9,
    output tri1 id_10,
    input supply1 id_11,
    input wand id_12
);
  wire id_14;
  tri0 id_15 = 1;
  xor (id_10, id_4, id_12, id_15, id_14, id_11, id_0, id_5, id_9, id_8);
  module_0(
      id_6, id_11, id_3, id_4, id_9, id_2, id_7, id_2, id_4, id_10, id_9, id_10
  );
endmodule
