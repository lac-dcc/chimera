// Seed: 2019445703
module module_0 (
    output supply1 id_0,
    input tri id_1,
    input wire id_2,
    input tri id_3,
    output tri id_4,
    input uwire id_5,
    input supply1 id_6,
    input supply1 id_7,
    output wand id_8,
    input tri0 id_9,
    input uwire id_10,
    input uwire id_11,
    output supply1 id_12,
    output wand id_13,
    input uwire id_14,
    input wand id_15,
    input wand id_16,
    input tri1 id_17,
    inout tri id_18,
    input supply0 id_19,
    output wor id_20,
    output wire id_21
);
  assign #id_23 id_20 = id_19 ? id_14 : id_6 ? id_2 : 1 ? 1 : 1;
endmodule
module module_1 (
    input  wand  id_0,
    input  uwire id_1,
    output tri0  id_2,
    input  tri0  id_3,
    input  tri   id_4,
    input  wor   id_5,
    input  wor   id_6,
    output wand  id_7
);
  tri id_9 = 1 - id_6;
  module_0(
      id_7,
      id_1,
      id_1,
      id_9,
      id_9,
      id_3,
      id_6,
      id_1,
      id_7,
      id_0,
      id_9,
      id_0,
      id_7,
      id_7,
      id_3,
      id_0,
      id_6,
      id_4,
      id_9,
      id_5,
      id_2,
      id_2
  );
  assign id_9 = id_5 ? id_0 : 1;
  assign id_2 = id_5;
endmodule
