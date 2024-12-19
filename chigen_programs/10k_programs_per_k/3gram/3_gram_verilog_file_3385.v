// Seed: 4041061002
module module_0 (
    input  tri0  id_0,
    input  wand  id_1,
    input  wand  id_2,
    output tri   id_3,
    output wand  id_4,
    output wand  id_5,
    output wire  id_6,
    output wor   id_7,
    input  wand  id_8,
    input  tri   id_9,
    input  uwire id_10,
    input  wor   id_11,
    input  wand  id_12,
    input  uwire id_13
);
  wire id_15;
  assign id_6 = id_0 - 1;
  assign module_1.type_10 = 0;
  wire id_16;
  wire id_17;
  always @(posedge 1) assign id_7 = 1;
endmodule
module module_1 (
    output supply1 id_0,
    input supply0 id_1,
    input tri0 id_2,
    output wand id_3,
    input wire id_4,
    input tri id_5,
    input supply0 id_6,
    output wor id_7,
    output tri0 id_8
);
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_8,
      id_3,
      id_3,
      id_7,
      id_0,
      id_6,
      id_2,
      id_4,
      id_5,
      id_5,
      id_1
  );
endmodule
