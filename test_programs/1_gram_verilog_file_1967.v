// Seed: 818407161
module module_0 (
    output tri1 id_0,
    input uwire id_1,
    input wand id_2,
    input wire id_3,
    id_20,
    output tri1 id_4,
    input supply1 id_5,
    input tri id_6,
    input wor id_7,
    output tri1 id_8,
    output wand id_9,
    input wor id_10,
    output tri1 id_11,
    input supply1 id_12,
    input supply0 id_13,
    output tri0 id_14,
    input wand id_15,
    output wire id_16,
    input tri0 id_17,
    input tri1 id_18
);
  wire id_21;
  assign module_1.id_12 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    input  uwire id_1,
    input  tri1  id_2,
    input  wor   id_3,
    output logic id_4,
    id_11,
    input  tri0  id_5,
    input  uwire id_6,
    output tri   id_7,
    input  wand  id_8,
    input  wire  id_9
);
  always id_4 = 1 & id_1;
  module_0 modCall_1 (
      id_7,
      id_3,
      id_1,
      id_9,
      id_7,
      id_1,
      id_8,
      id_8,
      id_7,
      id_7,
      id_3,
      id_7,
      id_6,
      id_3,
      id_7,
      id_9,
      id_7,
      id_3,
      id_0
  );
  uwire id_12 = id_8;
  always id_4 <= -1 - id_12;
  wire id_13, id_14;
endmodule
