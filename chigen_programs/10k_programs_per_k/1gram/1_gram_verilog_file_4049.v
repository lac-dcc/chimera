// Seed: 1790199093
module module_0 (
    input  tri   id_0,
    input  wand  id_1,
    input  wor   id_2,
    input  uwire id_3,
    output wor   id_4,
    input  wand  id_5
    , id_9,
    output uwire id_6
    , id_10 = 1,
    input  wire  id_7
);
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd40,
    parameter id_8 = 32'd26
) (
    output tri   id_0,
    input  uwire id_1,
    input  wor   id_2,
    input  wor   id_3,
    input  uwire _id_4
);
  parameter id_6 = 1;
  assign id_0 = id_2;
  wand [1 : 1] id_7;
  wire _id_8;
  logic [7:0] id_9, id_10;
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_1,
      id_0,
      id_3,
      id_0,
      id_1
  );
  assign id_9[id_4 :-1][id_8] = -1;
  parameter id_12 = 1'b0;
  assign id_7 = 1;
endmodule
