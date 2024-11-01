// Seed: 1446075591
module module_0 (
    input uwire id_0,
    output wand id_1,
    input tri1 id_2,
    input wor id_3,
    input tri1 id_4,
    input wand id_5,
    output tri0 id_6,
    output supply1 id_7,
    input tri0 id_8,
    input wire id_9,
    output wor id_10
);
  initial $display(id_8);
endmodule
module module_1 (
    input wire id_0,
    output tri0 id_1,
    input wire id_2,
    input uwire id_3,
    input wor id_4,
    input tri0 id_5,
    output wand id_6,
    input wire id_7,
    input tri id_8,
    input uwire id_9,
    output tri0 id_10,
    input wire id_11,
    input tri0 id_12,
    input uwire id_13,
    output supply0 id_14,
    input wor id_15
);
  assign id_14 = 1;
  nor (id_14, id_2, id_8, id_0, id_5, id_7, id_11, id_4, id_13, id_9);
  module_0(
      id_15, id_10, id_2, id_5, id_5, id_3, id_14, id_6, id_0, id_15, id_14
  );
  always force id_14 = 1;
endmodule
