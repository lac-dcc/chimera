// Seed: 2252569800
module module_0 (
    output wand  id_0,
    output tri0  id_1
    , id_18,
    output wand  id_2,
    output tri   id_3,
    output wand  id_4,
    input  wand  id_5,
    output wire  id_6,
    output wor   id_7,
    input  wand  id_8,
    output tri   id_9,
    output uwire id_10,
    input  wor   id_11,
    input  wand  id_12,
    input  uwire id_13,
    output wire  id_14,
    output uwire id_15,
    input  wire  id_16
);
  assign id_9 = id_12;
  assign id_7 = id_5;
  always @(1)
    if (id_18) begin : LABEL_0
      id_0  = id_12;
      id_15 = id_16 & 1;
    end
  assign id_1 = id_12;
  wire id_19;
  wire id_20;
endmodule
module module_1 (
    input  wor   id_0,
    input  wor   id_1,
    output tri0  id_2,
    input  tri1  id_3,
    output wand  id_4,
    input  uwire id_5,
    input  tri0  id_6,
    input  wor   id_7,
    input  wire  id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_4,
      id_4,
      id_4,
      id_5,
      id_2,
      id_4,
      id_1,
      id_2,
      id_4,
      id_0,
      id_5,
      id_1,
      id_4,
      id_2,
      id_7
  );
  assign modCall_1.id_9 = 0;
endmodule
