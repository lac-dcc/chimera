// Seed: 2730314508
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  input wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  assign module_1.id_4 = 0;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout tri id_1;
  assign id_1 = id_17 | -1;
  assign id_8 = id_5;
  assign id_9 = id_17;
  assign id_3 = id_2;
endmodule
program module_1 (
    input  uwire id_0,
    input  tri0  id_1,
    output wor   id_2,
    input  tri0  id_3,
    input  wand  id_4
    , id_7 = 1,
    input  tri   id_5
);
  wire id_8, id_9;
  nand primCall (id_2, id_8, id_7, id_1, id_9, id_5, id_3, id_0, id_4);
  module_0 modCall_1 (
      id_8,
      id_9,
      id_8,
      id_9,
      id_9,
      id_9,
      id_7,
      id_7,
      id_8,
      id_7,
      id_9,
      id_9,
      id_8,
      id_7,
      id_8,
      id_7,
      id_8
  );
endprogram
