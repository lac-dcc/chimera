// Seed: 1551385837
module module_0 (
    input wor id_0,
    output wor id_1,
    output tri id_2,
    input uwire id_3,
    input tri0 id_4,
    input wor id_5,
    input tri1 id_6,
    output supply1 id_7,
    output uwire id_8,
    output wire id_9,
    input tri id_10,
    output tri id_11,
    output wand id_12,
    output wire id_13,
    input tri1 id_14,
    input tri0 id_15,
    input wire id_16,
    output tri id_17
);
  uwire id_19;
  time  id_20;
  assign module_1.id_4 = 0;
  assign id_7 = id_19 !=? id_5;
  initial assume (1);
endmodule
module module_1 (
    output tri   id_0,
    input  uwire id_1,
    output uwire id_2,
    output wand  id_3,
    input  wire  id_4
);
  wire id_6, id_7, id_8;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_3,
      id_1,
      id_4,
      id_4,
      id_1,
      id_2,
      id_3,
      id_3,
      id_4,
      id_0,
      id_3,
      id_3,
      id_1,
      id_4,
      id_1,
      id_3
  );
endmodule
