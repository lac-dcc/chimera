// Seed: 1316475383
module module_0 (
    output tri   id_0,
    output wire  id_1,
    input  uwire id_2,
    input  tri   id_3,
    input  wand  id_4
    , id_15,
    output wire  id_5,
    output tri1  id_6,
    input  tri0  id_7,
    input  wor   id_8,
    output wor   id_9,
    input  tri   id_10,
    input  uwire id_11,
    input  tri0  id_12,
    input  wor   id_13
);
  wire id_16;
  wire id_17;
  assign id_15[1 : 1] = id_7;
  wire id_18, id_19;
endmodule
module module_1 (
    input wire id_0,
    input wand id_1,
    output wor id_2,
    input tri0 id_3,
    output supply1 id_4
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_3,
      id_3,
      id_3,
      id_2,
      id_2,
      id_0,
      id_3,
      id_4,
      id_1,
      id_1,
      id_3,
      id_0
  );
  assign modCall_1.id_11 = 0;
  wire id_6;
  assign id_2 = {1'h0, id_3} + id_0 ^ 1;
endmodule
