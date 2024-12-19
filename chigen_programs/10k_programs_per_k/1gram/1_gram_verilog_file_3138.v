// Seed: 1913243129
module module_0 (
    input  tri   id_0,
    output tri   id_1
    , id_11,
    input  wand  id_2,
    output wire  id_3,
    input  tri1  id_4,
    input  tri0  id_5,
    input  wire  id_6,
    input  wire  id_7,
    input  uwire id_8,
    output wor   id_9
);
  assign id_3 = id_7;
  assign module_1.type_5 = 0;
  assign id_11 = 1'd0;
endmodule
module module_1 (
    output tri0  id_0,
    output logic id_1,
    input  wire  id_2,
    input  wor   id_3,
    input  wand  id_4,
    input  logic id_5,
    output tri   id_6,
    input  wand  id_7,
    output wand  id_8
    , id_11,
    input  tri   id_9
);
  always @(negedge 1) id_1 <= id_5;
  assign id_6 = (1);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_7,
      id_8,
      id_7,
      id_2,
      id_4,
      id_9,
      id_3,
      id_6
  );
endmodule
