// Seed: 2474655473
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
    id_11
);
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  assign module_1.id_1 = 0;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_12, id_13;
  logic id_14;
endmodule
module module_1 (
    output wand  id_0,
    output tri1  id_1,
    input  tri   id_2,
    output wor   id_3,
    input  tri0  id_4,
    input  uwire id_5
);
  wire id_7, id_8;
  xnor primCall (id_0, id_4, id_2, id_7, id_8, id_5);
  module_0 modCall_1 (
      id_8,
      id_7,
      id_7,
      id_8,
      id_7,
      id_7,
      id_8,
      id_7,
      id_7,
      id_7,
      id_7
  );
endmodule
