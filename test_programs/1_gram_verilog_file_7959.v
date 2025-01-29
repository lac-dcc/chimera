// Seed: 1094246234
module module_0 (
    input uwire id_0,
    input tri0 id_1,
    input tri id_2,
    output logic id_3,
    input supply1 id_4,
    input tri0 id_5,
    input tri1 id_6,
    input wand id_7,
    input supply0 id_8,
    input wand id_9,
    input wire id_10,
    input supply0 id_11,
    input uwire id_12
);
  always id_3 <= 1 & -1;
  wire id_14, id_15;
  wire id_16 = -1, id_17;
  wire id_18, id_19;
endmodule
module module_1 (
    output logic id_0,
    input  wire  id_1,
    output wor   id_2,
    input  wire  id_3,
    input  logic id_4,
    input  tri0  id_5
);
  initial
    if (1) @(posedge 1 or negedge -1) id_0 <= 1;
    else id_0 <= -1 !=? id_1;
  always id_0 <= id_4;
  wire id_7, id_8, id_9;
  nand primCall (id_0, id_1, id_9, id_3, id_7, id_4);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_0,
      id_5,
      id_3,
      id_5,
      id_1,
      id_3,
      id_5,
      id_1,
      id_5,
      id_5
  );
  assign modCall_1.type_23 = 0;
  wire id_10;
endmodule
