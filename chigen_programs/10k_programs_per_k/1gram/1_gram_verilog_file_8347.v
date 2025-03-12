// Seed: 2938809527
module module_0 #(
    parameter id_12 = 32'd93,
    parameter id_14 = 32'd58
) (
    output wand id_0,
    output tri id_1,
    input wand id_2,
    input tri id_3,
    input supply1 id_4,
    output supply0 id_5,
    input supply0 id_6,
    input wand id_7[-1 : 1],
    output wand id_8
    , id_11,
    input wand id_9
);
  assign #1 id_8 = (id_6);
  logic _id_12, id_13 = -1;
  wire [-1 : id_12  ?  -1 'b0 : 1 'd0] _id_14, id_15[id_14 : -1], id_16;
endmodule
module module_1 #(
    parameter id_5 = 32'd26,
    parameter id_7 = 32'd40
) (
    input  uwire id_0,
    input  wor   id_1,
    output wor   id_2,
    output uwire id_3,
    output uwire id_4,
    input  tri   _id_5,
    input  wand  id_6,
    input  wire  _id_7
);
  assign id_3 = id_5;
  localparam id_9 = 1 * -1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_6,
      id_0,
      id_6,
      id_3,
      id_1,
      id_1,
      id_2,
      id_6
  );
  assign modCall_1.id_7 = 0;
  wire id_10;
  wire [id_7 : id_5] id_11, id_12;
  wire id_13[id_7 : 1];
endmodule
