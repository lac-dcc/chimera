// Seed: 579055272
module module_0 (
    output supply1 id_0,
    input tri0 id_1,
    input supply0 id_2,
    input uwire id_3,
    input tri1 id_4,
    input supply1 id_5,
    output tri1 id_6,
    input supply0 id_7,
    input wire id_8,
    output tri1 id_9,
    input wand id_10,
    input uwire id_11,
    output wor id_12
);
  tri0 id_14 = id_4;
  tri1 id_15 = id_4;
endmodule
module module_1 (
    input tri1 id_0,
    input wor id_1,
    input tri id_2,
    input tri id_3,
    input wand id_4,
    input supply1 id_5,
    output wand id_6,
    input wire id_7,
    output supply1 id_8,
    output supply0 id_9,
    input supply1 id_10,
    input wand id_11,
    output supply1 id_12,
    output supply0 id_13,
    output wor id_14,
    input wire id_15,
    output wand id_16,
    input tri id_17
);
  wand id_19 = 1'd0;
  nor (id_13, id_19, id_10, id_15, id_5, id_4, id_7, id_0, id_1, id_2, id_3, id_17, id_11);
  module_0(
      id_9, id_10, id_1, id_5, id_1, id_3, id_6, id_11, id_2, id_8, id_4, id_17, id_13
  );
endmodule
