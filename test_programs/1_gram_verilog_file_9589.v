// Seed: 1846680170
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_6;
  wire id_7;
endmodule
module module_1 (
    input  wor   id_0,
    input  uwire id_1,
    input  tri   id_2,
    output uwire id_3,
    input  wire  id_4,
    input  uwire id_5,
    input  tri1  id_6,
    input  wand  id_7,
    input  wand  id_8,
    input  wor   id_9,
    input  wire  id_10,
    output tri0  id_11,
    input  wand  id_12,
    input  wand  id_13,
    input  tri   id_14
);
  wand id_16, id_17;
  nand primCall (id_11, id_9, id_2, id_0, id_7, id_17, id_5, id_12, id_6, id_10, id_8, id_14);
  module_0 modCall_1 (
      id_17,
      id_17,
      id_17,
      id_17,
      id_16
  );
  assign id_16 = id_1 != id_0;
endmodule
