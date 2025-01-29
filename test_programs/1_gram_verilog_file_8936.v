// Seed: 4216791736
module module_0 (
    input wand id_0,
    input tri1 id_1,
    input tri0 id_2,
    input tri0 id_3,
    input wand id_4,
    output wand id_5,
    output supply0 id_6,
    output wor id_7,
    input tri1 id_8,
    input wor id_9,
    input wand id_10,
    output supply0 id_11,
    input wor id_12,
    input wor id_13,
    input wire id_14,
    input tri1 id_15,
    output tri1 id_16,
    input tri id_17,
    output wor id_18,
    input tri0 id_19,
    id_24,
    output supply0 id_20,
    input tri id_21,
    input tri0 id_22
);
  assign module_1.type_8 = 0;
  assign id_6 = $realtime;
endmodule
program module_1 (
    input  tri0  id_0,
    input  tri   id_1,
    output tri1  id_2,
    input  tri0  id_3,
    output uwire id_4,
    input  tri1  id_5
);
  assign id_4 = 1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_1,
      id_0,
      id_2,
      id_4,
      id_4,
      id_3,
      id_5,
      id_5,
      id_2,
      id_1,
      id_3,
      id_3,
      id_0,
      id_4,
      id_3,
      id_2,
      id_3,
      id_4,
      id_3,
      id_0
  );
endmodule
