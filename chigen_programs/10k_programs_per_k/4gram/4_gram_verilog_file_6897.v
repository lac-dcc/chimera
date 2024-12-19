// Seed: 3126248208
module module_0 (
    input  wor   id_0,
    output wor   id_1,
    output uwire id_2,
    input  tri   id_3
    , id_19,
    output uwire id_4,
    input  tri0  id_5,
    input  wor   id_6,
    output tri1  id_7,
    output wire  id_8,
    input  tri   id_9,
    input  tri   id_10,
    input  wand  id_11,
    output wire  id_12,
    input  tri1  id_13,
    output tri0  id_14,
    input  wire  id_15,
    output tri   id_16,
    output tri0  id_17
);
  wire id_20;
  wire id_21;
endmodule
module module_1 (
    input wor id_0,
    input supply1 id_1,
    input wand id_2,
    input supply1 id_3,
    input wor id_4,
    output wor id_5
);
  assign id_5 = 1'b0;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_1,
      id_5,
      id_3,
      id_4,
      id_5,
      id_5,
      id_1,
      id_4,
      id_1,
      id_5,
      id_3,
      id_5,
      id_4,
      id_5,
      id_5
  );
  assign modCall_1.id_3 = 0;
  tri0 id_7, id_8, id_9;
  wor id_11 = 1'd0;
  assign id_9 = 1;
endmodule
