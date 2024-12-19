// Seed: 1133038572
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    input wand id_2,
    input uwire id_3,
    input wand id_4,
    input uwire id_5,
    input supply1 id_6,
    input tri id_7
);
  uwire id_9;
  assign id_9 = id_0;
  initial id_9 = 1;
  logic [7:0] id_10;
  tri0 id_11;
  logic [7:0] id_12;
  id_13(
      id_2, id_11, 1, id_2
  );
  assign id_12[1] = 1;
  wire id_14;
  assign id_11 = 1;
  assign id_10 = id_12;
endmodule
module module_1 (
    input  tri0  id_0,
    output wire  id_1,
    output tri   id_2,
    input  wand  id_3,
    input  wand  id_4,
    output uwire id_5,
    input  tri0  id_6,
    input  wor   id_7,
    output wor   id_8,
    input  tri1  id_9,
    input  tri0  id_10
);
  assign id_2 = 1 ? 1 : 1;
  assign id_8 = 1;
  wire id_12;
  wire id_13;
  module_0 modCall_1 (
      id_0,
      id_7,
      id_6,
      id_3,
      id_10,
      id_9,
      id_7,
      id_10
  );
endmodule
