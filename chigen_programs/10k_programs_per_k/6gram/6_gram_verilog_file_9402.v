// Seed: 4046320266
module module_0 (
    input  uwire id_0,
    input  uwire id_1,
    input  tri   id_2,
    input  wor   id_3,
    input  wor   id_4,
    input  uwire id_5,
    input  uwire id_6,
    input  uwire id_7,
    output wand  id_8,
    output wire  id_9
);
  assign id_8 = 1;
  assign module_1.id_11 = 0;
endmodule
module module_1 (
    output wor id_0,
    input tri0 id_1,
    input tri id_2,
    output tri0 id_3,
    output tri0 id_4,
    input wand id_5,
    output uwire id_6,
    output supply1 id_7,
    input supply0 id_8,
    input supply1 id_9,
    output tri0 id_10,
    input wor id_11,
    input tri1 id_12,
    input supply0 id_13,
    input tri0 id_14,
    input wand id_15,
    input wire id_16,
    input wire id_17
);
  always @(*) release id_0;
  nor primCall (id_10, id_5, id_16, id_2, id_13, id_1, id_8, id_11, id_15, id_9, id_14, id_12);
  module_0 modCall_1 (
      id_15,
      id_16,
      id_17,
      id_2,
      id_2,
      id_13,
      id_17,
      id_5,
      id_6,
      id_10
  );
endmodule
