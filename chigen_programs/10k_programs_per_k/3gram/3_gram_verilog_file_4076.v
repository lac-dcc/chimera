// Seed: 2783910762
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
    id_13
);
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
endmodule
module module_1 (
    input  uwire id_0,
    output uwire id_1,
    output wor   id_2,
    input  wand  id_3
);
  assign id_2 = id_0;
  wire id_5, id_6, id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15;
  nand primCall (id_2, id_8, id_6, id_14, id_12, id_13, id_5, id_11, id_0, id_3, id_15, id_9);
  module_0 modCall_1 (
      id_8,
      id_11,
      id_11,
      id_13,
      id_9,
      id_15,
      id_7,
      id_5,
      id_11,
      id_12,
      id_9,
      id_7,
      id_7
  );
endmodule
