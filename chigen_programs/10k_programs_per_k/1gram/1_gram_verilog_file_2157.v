// Seed: 4225959521
module module_0 (
    input  tri1  id_0,
    output tri   id_1,
    input  tri0  id_2,
    input  uwire id_3,
    input  tri1  id_4,
    input  tri0  id_5,
    output wire  id_6,
    output wire  id_7,
    output tri0  id_8
    , id_10
);
  logic id_11;
endmodule
module module_1 (
    inout  wand id_0,
    input  tri0 id_1,
    input  tri0 id_2,
    output tri1 id_3,
    output tri1 id_4,
    input  wor  id_5,
    input  wand id_6,
    input  wand id_7
);
  assign id_4 = id_1;
  wire [-1 : 1 'b0] id_9, id_10, id_11, id_12;
  assign id_10 = id_0;
  module_0 modCall_1 (
      id_7,
      id_3,
      id_7,
      id_7,
      id_5,
      id_6,
      id_4,
      id_0,
      id_4
  );
  assign modCall_1.id_7 = 0;
  assign id_3 = -1;
  assign id_0 = 1;
  assign id_12 = id_10;
endmodule
