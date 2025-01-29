// Seed: 409658569
program module_0 (
    output tri1 id_0,
    input supply1 id_1,
    input tri0 id_2,
    input uwire id_3,
    id_20,
    input tri id_4,
    input tri0 id_5,
    output tri id_6,
    input wire id_7,
    output wor id_8,
    input wire id_9,
    input wand id_10,
    input tri0 id_11,
    input wand id_12,
    input tri0 id_13,
    input uwire id_14,
    input tri id_15,
    input wor id_16,
    input supply1 id_17,
    output tri0 id_18
);
  wire id_21;
  assign module_1.type_8 = 0;
endmodule
module module_1 (
    output uwire id_0,
    output wand  id_1,
    output tri0  id_2,
    input  uwire id_3,
    input  wor   id_4,
    input  tri   id_5
);
  always id_0 = -1;
  nand primCall (id_2, id_5, id_4, id_3);
  module_0 modCall_1 (
      id_2,
      id_5,
      id_3,
      id_3,
      id_5,
      id_3,
      id_1,
      id_4,
      id_2,
      id_5,
      id_5,
      id_3,
      id_3,
      id_3,
      id_3,
      id_4,
      id_5,
      id_4,
      id_2
  );
endmodule
