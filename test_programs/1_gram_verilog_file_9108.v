// Seed: 1046381858
module module_0 (
    output wand id_0,
    output supply0 id_1,
    output tri1 id_2,
    input supply1 id_3,
    output tri0 id_4,
    input uwire id_5,
    output wand id_6,
    output wand id_7,
    input wand id_8,
    input wire id_9,
    id_19,
    input wor id_10,
    input wire id_11,
    output tri0 id_12,
    input wire id_13,
    input tri0 id_14,
    input tri1 id_15,
    output wor id_16,
    output tri0 id_17
);
  wire id_20;
  assign module_1.type_2 = 0;
  wire id_21;
endmodule
module module_1 (
    output wand  id_0,
    input  wand  id_1,
    input  wire  id_2,
    output tri   id_3,
    output uwire id_4,
    input  uwire id_5,
    input  wire  id_6,
    input  uwire id_7
);
  logic [7:0] id_9, id_10, id_11;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_0,
      id_6,
      id_3,
      id_1,
      id_3,
      id_0,
      id_2,
      id_5,
      id_2,
      id_7,
      id_3,
      id_2,
      id_7,
      id_2,
      id_4,
      id_0
  );
  assign id_0 = id_6;
  assign id_9[1'b0] = 1;
endmodule
