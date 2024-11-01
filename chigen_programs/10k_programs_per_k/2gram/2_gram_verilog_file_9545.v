// Seed: 3803389725
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    input wire id_2,
    output supply1 id_3,
    output uwire id_4,
    input wire id_5,
    input uwire id_6,
    input uwire id_7,
    input tri1 id_8,
    input wire id_9,
    input tri id_10,
    output supply1 id_11,
    input supply0 id_12,
    input supply0 id_13,
    output supply0 id_14
);
endmodule
module module_1 (
    output supply1 id_0,
    input tri id_1,
    input wor id_2,
    input supply0 id_3,
    input supply1 id_4,
    output wand id_5,
    input supply1 id_6,
    output supply0 id_7,
    input tri1 id_8,
    input tri id_9,
    input wand id_10,
    input supply1 id_11
);
  wand id_13 = 1 & 1;
  nor (id_5, id_4, id_2, id_6, id_9, id_10, id_13, id_1, id_3, id_11);
  module_0(
      id_11, id_5, id_8, id_5, id_7, id_9, id_9, id_10, id_10, id_8, id_1, id_0, id_6, id_8, id_5
  );
endmodule
