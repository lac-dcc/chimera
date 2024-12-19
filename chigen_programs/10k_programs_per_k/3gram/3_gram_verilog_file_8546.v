// Seed: 3014541523
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
    id_12
);
  input wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign module_1.id_7 = 0;
  tri1 id_13 = 1, id_14;
endmodule
module module_1 (
    input  tri0  id_0,
    input  wand  id_1,
    input  uwire id_2,
    output tri0  id_3,
    output wor   id_4,
    input  wand  id_5,
    input  tri0  id_6,
    input  wire  id_7,
    input  tri0  id_8
);
  wire id_10, id_11;
  or primCall (id_4, id_10, id_11, id_0, id_5, id_6, id_1, id_2);
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_10,
      id_11,
      id_10,
      id_10,
      id_10,
      id_10
  );
endmodule
