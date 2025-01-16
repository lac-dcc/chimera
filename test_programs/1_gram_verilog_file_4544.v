// Seed: 1481857914
module module_0 (
    output supply1 id_0,
    input supply1 id_1,
    input tri0 id_2,
    input supply0 id_3,
    id_13,
    output tri0 id_4,
    output tri1 void id_5,
    input tri0 id_6,
    output tri0 id_7,
    input wire id_8,
    output wire id_9,
    input wor id_10,
    input wand id_11
);
  assign id_9 = id_11;
  always @(id_1) id_4 = -1 | id_3;
endmodule
module module_1 (
    input  wire  id_0,
    input  tri   id_1,
    input  tri   id_2,
    output wand  id_3,
    output tri0  id_4,
    input  tri0  id_5,
    output tri1  id_6,
    output tri0  id_7,
    input  uwire id_8,
    input  tri0  id_9
);
  wire id_11, id_12;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_8,
      id_5,
      id_6,
      id_7,
      id_5,
      id_7,
      id_1,
      id_7,
      id_0,
      id_1
  );
  assign modCall_1.type_17 = 0;
  assign id_11 = 1'b0;
  assign id_6 = id_9;
  localparam id_13 = 1;
  assign id_3 = id_9;
endmodule
