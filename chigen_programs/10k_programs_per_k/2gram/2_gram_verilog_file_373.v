// Seed: 4246517839
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    input tri1 id_2,
    input tri0 id_3,
    output tri id_4,
    output tri0 id_5,
    input wand id_6,
    input wor id_7,
    output tri1 id_8,
    input wire id_9,
    output tri1 id_10
);
  wire id_12;
endmodule
module module_1 (
    output wand id_0,
    input tri0 id_1,
    input supply1 id_2,
    input wor id_3,
    input tri0 id_4,
    output wire id_5,
    input supply0 id_6,
    output tri id_7,
    input tri1 id_8,
    output tri0 id_9,
    input tri1 id_10,
    output wor id_11,
    output tri0 id_12
);
  wire id_14;
  xor (id_12, id_14, id_8, id_1, id_6, id_2, id_3, id_4);
  module_0(
      id_8, id_10, id_6, id_3, id_5, id_9, id_6, id_8, id_11, id_2, id_12
  );
  assign id_0 = id_2;
endmodule
