// Seed: 4144963008
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    output uwire id_2,
    input wand id_3,
    input supply1 id_4,
    input tri1 id_5,
    output wand id_6,
    output supply0 id_7
    , id_12,
    input tri1 id_8,
    input wire id_9,
    output tri0 id_10
);
  wire [1 : -1] id_13 = id_9;
  logic id_14;
endmodule
module module_1 #(
    parameter id_2 = 32'd72,
    parameter id_3 = 32'd73,
    parameter id_6 = 32'd57
) (
    output tri1  id_0,
    input  tri1  id_1,
    input  uwire _id_2,
    input  wor   _id_3,
    output tri1  id_4
);
  wire [id_2 : -1] _id_6;
  localparam id_7 = 1;
  parameter id_8 = id_7[1 : ~(-1==?-1)];
  module_0 modCall_1 (
      id_1,
      id_1,
      id_4,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_4
  );
  assign modCall_1.id_3 = 0;
  tri [id_6  ==  1  +  id_3 : id_2] id_9;
  assign id_9 = id_8 ? id_2 : id_9 & -1 == -1'b0;
endmodule
